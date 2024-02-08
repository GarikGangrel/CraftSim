---@class CraftSim
local CraftSim = select(2, ...)

CraftSim.LOCAL_FR = {}

function CraftSim.LOCAL_FR:GetData()
	local f = CraftSim.GUTIL:GetFormatter()
	return {
		-- REQUIRED:
		[CraftSim.CONST.TEXT.STAT_INSPIRATION] = "Inspiration",
		[CraftSim.CONST.TEXT.STAT_MULTICRAFT] = "Fabrication multiple",
		[CraftSim.CONST.TEXT.STAT_RESOURCEFULNESS] = "Ingéniosité",
		[CraftSim.CONST.TEXT.STAT_CRAFTINGSPEED] = "Vitesse de fabrication",
		[CraftSim.CONST.TEXT.EQUIP_MATCH_STRING] = "Équipé",
		[CraftSim.CONST.TEXT.ENCHANTED_MATCH_STRING] = "Enchanté",

		-- OPTIONAL (Defaulting to EN if not available):
	}
end
