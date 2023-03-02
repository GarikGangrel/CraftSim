_, CraftSim = ...

local print = CraftSim.UTIL:SetDebugPrint(CraftSim.CONST.DEBUG_IDS.CRAFT_DATA)

---@type CraftSim.CraftData.Serialized[]
CraftSimCraftData = CraftSimCraftData or {}

CraftSim.CRAFTDATA = {}

function CraftSim.CRAFTDATA:UpdateCraftData(item)
    local recipeData = CraftSim.MAIN.currentRecipeData

    if recipeData then
        local qualityID = recipeData:GetResultQuality(item)
        if qualityID then -- could be nil if item does not belong to recipe, may happen with bugs
            local chance = recipeData.resultData.chanceByQuality[qualityID]
            print("chance: " .. tostring(chance))
            local expectedCrafts = math.ceil(1 / chance) --  cause we cannot craft something 1.3 times lol

            ---@type CraftSim.Reagent[]
            local requiredReagents = CraftSim.GUTIL:Map(recipeData.reagentData.requiredReagents, function (reagent)
                return reagent:Copy()
            end)

            for _, reagent in pairs(requiredReagents) do
                if not reagent.hasQuality then
                    reagent.items[1].quantity = reagent.requiredQuantity
                else
                    local totalQuantity = reagent.items[1].quantity + reagent.items[2].quantity + reagent.items[3].quantity
                    
                    if totalQuantity < reagent.requiredQuantity then
                        if totalQuantity == 0 then
                            -- use q2
                            reagent.items[2].quantity = reagent.requiredQuantity
                        else
                            -- use the one thats showing
                            local reagentItem = CraftSim.GUTIL:Find(reagent.items, function (reagentItem)
                                return reagentItem.quantity > 0
                            end)

                            reagentItem.quantity = reagent.requiredQuantity
                        end
                    end
                end
            end
            local optionalReagents = recipeData.reagentData:GetActiveOptionalReagents()

            local crafterName = UnitName("player")
            local crafterClass = select(2, UnitClass("player"))

            local craftData = CraftSim.CraftData(expectedCrafts, chance, requiredReagents, optionalReagents, crafterName, crafterClass)

            --- use itemString for key to enable saving data for gear
            local itemString = CraftSim.GUTIL:GetItemStringFromLink(item:GetItemLink())
            print("Saving: " .. tostring(itemString))
            if itemString then
                CraftSimCraftData[recipeData.recipeID] = CraftSimCraftData[recipeData.recipeID] or {}
                CraftSimCraftData[recipeData.recipeID][itemString] = craftData:Serialize()
            end
        end
    end
end

function CraftSim.CRAFTDATA:DeleteForRecipe()
    local recipeData = CraftSim.MAIN.currentRecipeData

    if recipeData then
        CraftSimCraftData[recipeData.recipeID] = nil
    end
end
function CraftSim.CRAFTDATA:DeleteForItem(item)
    local recipeData = CraftSim.MAIN.currentRecipeData

    if recipeData and recipeData:IsResult(item) then
        if CraftSimCraftData[recipeData.recipeID] then
            local itemString = CraftSim.GUTIL:GetItemStringFromLink(item:GetItemLink()) or ""
            CraftSimCraftData[recipeData.recipeID][itemString] = nil
        end
    end
end
function CraftSim.CRAFTDATA:DeleteAll()
    CraftSimCraftData = {}
end