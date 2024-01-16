---@class CraftSim
local CraftSim = select(2, ...)

CraftSim.RECIPE_SCAN = {}

CraftSim.RECIPE_SCAN.scanInterval = 0
CraftSim.RECIPE_SCAN.frame = nil
CraftSim.RECIPE_SCAN.isScanning = false

---@enum CraftSim.RecipeScanModes
CraftSim.RECIPE_SCAN.SCAN_MODES = {
    Q1 = "Q1",
    Q2 = "Q2",
    Q3 = "Q3",
    OPTIMIZE = "OPTIMIZE",
}
---@type table<CraftSim.RecipeScanModes, CraftSim.LOCALIZATION_IDS>
CraftSim.RECIPE_SCAN.SCAN_MODES_TRANSLATION_MAP = {
    Q1 = CraftSim.CONST.TEXT.RECIPE_SCAN_MODE_Q1,
    Q2 = CraftSim.CONST.TEXT.RECIPE_SCAN_MODE_Q2,
    Q3 = CraftSim.CONST.TEXT.RECIPE_SCAN_MODE_Q3,
    OPTIMIZE = CraftSim.CONST.TEXT.RECIPE_SCAN_MODE_OPTIMIZE,
}

---@type CraftSim.RecipeData[]
CraftSim.RECIPE_SCAN.currentResults = {}

local print = CraftSim.UTIL:SetDebugPrint(CraftSim.CONST.DEBUG_IDS.RECIPE_SCAN)

function CraftSim.RECIPE_SCAN:ToggleScanButton(value)
    local frame = CraftSim.RECIPE_SCAN.frame
    local recipeScanTab = frame.content.recipeScanTab
    local content = recipeScanTab.content --[[@as CraftSim.RECIPE_SCAN.RECIPE_SCAN_TAB.CONTENT]]
    content.scanButton:SetEnabled(value)
    content.cancelScanButton:SetVisible(not value)
    if not value then
        content.scanButton:SetText(CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.RECIPE_SCAN_SCANNING) .. " 0%")
    else
        content.scanButton:SetText(CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.RECIPE_SCAN_SCAN_RECIPIES))
    end
end

function CraftSim.RECIPE_SCAN:UpdateScanPercent(currentProgress, maxProgress)
    local currentPercentage = CraftSim.GUTIL:Round(currentProgress / (maxProgress / 100))

    if currentPercentage % 1 == 0 then
        local frame = CraftSim.RECIPE_SCAN.frame
        local recipeScanTab = frame.content.recipeScanTab
        local content = recipeScanTab.content --[[@as CraftSim.RECIPE_SCAN.RECIPE_SCAN_TAB.CONTENT]]
        content.scanButton:SetText(CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.RECIPE_SCAN_SCANNING) ..
            " " .. currentPercentage .. "%")
    end
end

function CraftSim.RECIPE_SCAN:EndScan()
    print("scan finished")
    collectgarbage("collect") -- By Option?
    CraftSim.RECIPE_SCAN:ToggleScanButton(true)
    CraftSim.RECIPE_SCAN.isScanning = false

    CraftSim.CRAFTQ.FRAMES:UpdateQueueDisplay() -- TODO: maybe only the button...
end

---@param recipeID number
---@return Enum.Profession? profession
function CraftSim.RECIPE_SCAN:GetProfessionByRecipeID(recipeID)
    for professionID, recipeIDs in pairs(CraftSimRecipeIDs.data) do
        if tContains(recipeIDs, recipeID) then
            return professionID
        end
    end

    return nil
end

function CraftSim.RECIPE_SCAN:GetAllRecipeIDsFromCacheByProfessionID(professionID)
    return CraftSimRecipeIDs.data[professionID]
end

---@param recipeInfo TradeSkillRecipeInfo
function CraftSim.RECIPE_SCAN.FilterRecipes(recipeInfo)
    if tContains(CraftSim.CONST.ALCHEMICAL_EXPERIMENTATION_RECIPE_IDS, recipeInfo.recipeID) then
        return false
    end
    if recipeInfo.isDummyRecipe then
        return false
    end
    if tContains(CraftSim.CONST.BLIZZARD_DUMMY_RECIPES, recipeInfo.recipeID) then
        return false
    end
    if not CraftSimOptions.recipeScanIncludeNotLearned and not recipeInfo.learned then
        return false
    end
    if tContains(CraftSim.CONST.QUEST_PLAN_CATEGORY_IDS, recipeInfo.categoryID) then
        return false
    end
    if CraftSimOptions.recipeScanOnlyFavorites and not recipeInfo.favorite then
        return false
    end

    ---@diagnostic disable-next-line: missing-parameter
    -- local isExpansionIncluded = CraftSim.UTIL:IsDragonflightRecipe(recipeInfo.recipeID)
    local professionInfo = C_TradeSkillUI.GetProfessionInfoByRecipeID(recipeInfo.recipeID)
    local includedExpansions = {}
    for expansionID, included in pairs(CraftSimOptions.recipeScanFilteredExpansions) do
        if included then
            table.insert(includedExpansions, expansionID)
        end
    end
    local recipeExpansionIncluded = CraftSim.GUTIL:Some(includedExpansions, function(expansionID)
        local skillLineID = CraftSim.CONST.TRADESKILLLINEIDS[professionInfo.profession][expansionID]
        return professionInfo.professionID == skillLineID
    end)
    if professionInfo.professionID == CraftSim.CONST.TRADESKILLLINEIDS[1][8] then
        print(recipeInfo.name)
        print("- recipeExpansionIncluded: " .. tostring(recipeExpansionIncluded))
    end
    if recipeExpansionIncluded and recipeInfo.isEnchantingRecipe then
        return true
    end
    if recipeExpansionIncluded then
        -- if recipeInfo and recipeInfo.supportsCraftingStats and not recipeInfo.isGatheringRecipe and not recipeInfo.isSalvageRecipe and not recipeInfo.isRecraft then
        if recipeInfo and not recipeInfo.isGatheringRecipe and not recipeInfo.isSalvageRecipe and not recipeInfo.isRecraft then
            if recipeInfo.hyperlink then
                local isGear = recipeInfo.hasSingleItemOutput and recipeInfo.qualityIlvlBonuses ~= nil
                local isSoulbound = CraftSim.GUTIL:isItemSoulbound(CraftSim.GUTIL:GetItemIDByLink(recipeInfo.hyperlink))
                if not CraftSimOptions.recipeScanIncludeSoulbound then
                    if isGear and isSoulbound then
                        return false
                    end
                    if not CraftSimOptions.recipeScanIncludeGear and isGear then
                        return false
                    end

                    if isSoulbound then
                        return false
                    end
                end

                if not CraftSimOptions.recipeScanIncludeGear and isGear then
                    return false
                end

                return true
            end
            return false
        end
    end
    return false
end

function CraftSim.RECIPE_SCAN:StartScan()
    wipe(CraftSim.RECIPE_SCAN.currentResults)
    CraftSim.RECIPE_SCAN.isScanning = true

    print("Scan Mode: " .. tostring(CraftSimOptions.recipeScanScanMode))
    local recipeIDs = C_TradeSkillUI.GetAllRecipeIDs()
    local recipeInfos = CraftSim.GUTIL:Map(recipeIDs, function(recipeID)
        return C_TradeSkillUI.GetRecipeInfo(recipeID)
    end)
    recipeInfos = CraftSim.GUTIL:Filter(recipeInfos, CraftSim.RECIPE_SCAN.FilterRecipes)
    local currentIndex = 1

    local function scanRecipesByInterval()
        -- check if scan was ended
        if not CraftSim.RECIPE_SCAN.isScanning then
            return
        end

        CraftSim.UTIL:StartProfiling("Single Recipe Scan")
        local recipeInfo = recipeInfos[currentIndex]
        if not recipeInfo then
            CraftSim.RECIPE_SCAN:EndScan()
            return
        end

        CraftSim.RECIPE_SCAN:UpdateScanPercent(currentIndex, #recipeInfos)

        print("recipeID: " .. tostring(recipeInfo.recipeID), false, true)
        print("recipeName: " .. tostring(recipeInfo.name))
        print("isEnchant: " .. tostring(recipeInfo.isEnchantingRecipe))

        --- @type CraftSim.RecipeData
        local recipeData = CraftSim.RecipeData(recipeInfo.recipeID);

        if recipeData.reagentData:HasOptionalReagents() and CraftSimOptions.recipeScanUseInsight then
            recipeData:SetOptionalReagent(CraftSim.CONST.ITEM_IDS.OPTIONAL_REAGENTS.ILLUSTRIOUS_INSIGHT)
            recipeData:SetOptionalReagent(CraftSim.CONST.ITEM_IDS.OPTIONAL_REAGENTS.LESSER_ILLUSTRIOUS_INSIGHT)
        end

        recipeData.professionGearSet:LoadCurrentEquippedSet()
        recipeData:Update()
        if not recipeData then
            CraftSim.RECIPE_SCAN:EndScan()
            return
        end

        --optimize top gear first cause optimized reagents might change depending on the gear
        if CraftSimOptions.recipeScanOptimizeProfessionTools then
            print("Optimizing Gear...")
            CraftSim.UTIL:StartProfiling("Optimize ALL: SCAN")
            if CraftSimOptions.recipeScanScanMode == CraftSim.RECIPE_SCAN.SCAN_MODES.OPTIMIZE then
                recipeData:OptimizeProfit()
            else
                CraftSim.RECIPE_SCAN:SetReagentsByScanMode(recipeData)
                recipeData:OptimizeGear(CraftSim.TOPGEAR:GetSimMode(CraftSim.TOPGEAR.SIM_MODES.PROFIT))
            end
            CraftSim.UTIL:StopProfiling("Optimize ALL: SCAN")
        else
            CraftSim.RECIPE_SCAN:SetReagentsByScanMode(recipeData)
        end

        local function continueScan()
            CraftSim.UTIL:StopProfiling("Single Recipe Scan")
            CraftSim.RECIPE_SCAN.FRAMES:AddRecipe(recipeData)

            table.insert(CraftSim.RECIPE_SCAN.currentResults, recipeData)

            currentIndex = currentIndex + 1
            C_Timer.After(CraftSim.RECIPE_SCAN.scanInterval, scanRecipesByInterval)
        end
        -- so we can display them smoothly
        -- TODO: should we also wait for the reagents to load?
        CraftSim.GUTIL:ContinueOnAllItemsLoaded(recipeData.resultData.itemsByQuality, continueScan)
    end

    print("End Scan")
    CraftSim.RECIPE_SCAN:ToggleScanButton(false)
    CraftSim.RECIPE_SCAN:ResetResults()
    scanRecipesByInterval()
end

---@param recipeData CraftSim.RecipeData
function CraftSim.RECIPE_SCAN:SetReagentsByScanMode(recipeData)
    if CraftSimOptions.recipeScanScanMode == CraftSim.RECIPE_SCAN.SCAN_MODES.Q1 then
        recipeData.reagentData:SetReagentsMaxByQuality(1)
    elseif CraftSimOptions.recipeScanScanMode == CraftSim.RECIPE_SCAN.SCAN_MODES.Q2 then
        recipeData.reagentData:SetReagentsMaxByQuality(2)
    elseif CraftSimOptions.recipeScanScanMode == CraftSim.RECIPE_SCAN.SCAN_MODES.Q3 then
        recipeData.reagentData:SetReagentsMaxByQuality(3)
    elseif CraftSimOptions.recipeScanScanMode == CraftSim.RECIPE_SCAN.SCAN_MODES.OPTIMIZE then
        recipeData:OptimizeReagents()
    end
end
