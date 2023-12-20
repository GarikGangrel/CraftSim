---@class CraftSim
local CraftSim = select(2, ...)

CraftSim.REAGENT_DATA = {
[191476] = { name = "Draconic Vial", weight = 11},
[191475] = { name = "Draconic Vial", weight = 11},
[191474] = { name = "Draconic Vial", weight = 11},
[191462] = { name = "Hochenblume", weight = 3},
[191460] = { name = "Hochenblume", weight = 3},
[191461] = { name = "Hochenblume", weight = 3},
[191464] = { name = "Saxifrage", weight = 6},
[191465] = { name = "Saxifrage", weight = 6},
[191466] = { name = "Saxifrage", weight = 6},
[191468] = { name = "Bubble Poppy", weight = 6},
[191467] = { name = "Bubble Poppy", weight = 6},
[191469] = { name = "Bubble Poppy", weight = 6},
[191496] = { name = "Omnium Draconis", weight = 12},
[191498] = { name = "Omnium Draconis", weight = 12},
[191497] = { name = "Omnium Draconis", weight = 12},
[191387] = { name = "Elemental Potion of Power", weight = 22},
[191389] = { name = "Elemental Potion of Power", weight = 22},
[191388] = { name = "Elemental Potion of Power", weight = 22},
[191363] = { name = "Potion of Frozen Focus", weight = 21},
[191365] = { name = "Potion of Frozen Focus", weight = 21},
[191364] = { name = "Potion of Frozen Focus", weight = 21},
[191495] = { name = "Primal Convergent", weight = 39},
[191493] = { name = "Primal Convergent", weight = 39},
[191494] = { name = "Primal Convergent", weight = 39},
[191470] = { name = "Writhebark", weight = 6},
[191472] = { name = "Writhebark", weight = 6},
[191471] = { name = "Writhebark", weight = 6},
[188658] = { name = "Draconium Ore", weight = 10},
[189143] = { name = "Draconium Ore", weight = 10},
[190311] = { name = "Draconium Ore", weight = 10},
[191339] = { name = "Phial of Tepid Versatility", weight = 32},
[191341] = { name = "Phial of Tepid Versatility", weight = 32},
[191340] = { name = "Phial of Tepid Versatility", weight = 32},
[191359] = { name = "Phial of Elemental Chaos", weight = 35},
[191357] = { name = "Phial of Elemental Chaos", weight = 35},
[191358] = { name = "Phial of Elemental Chaos", weight = 35},
[190533] = { name = "Obsidian Seared Alloy", weight = 78},
[190534] = { name = "Obsidian Seared Alloy", weight = 78},
[190535] = { name = "Obsidian Seared Alloy", weight = 78},
[189542] = { name = "Primal Molten Alloy", weight = 48},
[189541] = { name = "Primal Molten Alloy", weight = 48},
[189543] = { name = "Primal Molten Alloy", weight = 48},
[190530] = { name = "Frostfire Alloy", weight = 48},
[190531] = { name = "Frostfire Alloy", weight = 48},
[190532] = { name = "Frostfire Alloy", weight = 48},
[190536] = { name = "Infurious Alloy", weight = 33},
[190537] = { name = "Infurious Alloy", weight = 33},
[190538] = { name = "Infurious Alloy", weight = 33},
[190396] = { name = "Serevite Ore", weight = 3},
[190395] = { name = "Serevite Ore", weight = 3},
[190394] = { name = "Serevite Ore", weight = 3},
[190312] = { name = "Khaz'gorite Ore", weight = 14},
[190313] = { name = "Khaz'gorite Ore", weight = 14},
[190314] = { name = "Khaz'gorite Ore", weight = 14},
[192883] = { name = "Glossy Stone", weight = 21},
[192884] = { name = "Glossy Stone", weight = 21},
[192885] = { name = "Glossy Stone", weight = 21},
[193368] = { name = "Silken Gemdust", weight = 20},
[193369] = { name = "Silken Gemdust", weight = 20},
[193370] = { name = "Silken Gemdust", weight = 20},
[194862] = { name = "Runed Writhebark", weight = 46},
[194864] = { name = "Runed Writhebark", weight = 46},
[194863] = { name = "Runed Writhebark", weight = 46},
[198186] = { name = "Shock-Spring Coil", weight = 9},
[198188] = { name = "Shock-Spring Coil", weight = 9},
[198187] = { name = "Shock-Spring Coil", weight = 9},
[198192] = { name = "Greased-Up Gears", weight = 26},
[198193] = { name = "Greased-Up Gears", weight = 26},
[198194] = { name = "Greased-Up Gears", weight = 26},
[198183] = { name = "Handful of Serevite Bolts", weight = 7},
[198185] = { name = "Handful of Serevite Bolts", weight = 7},
[198184] = { name = "Handful of Serevite Bolts", weight = 7},
[192876] = { name = "Frameless Lens", weight = 26},
[192877] = { name = "Frameless Lens", weight = 26},
[192878] = { name = "Frameless Lens", weight = 26},
[198195] = { name = "Arclight Capacitor", weight = 51},
[198197] = { name = "Arclight Capacitor", weight = 51},
[198196] = { name = "Arclight Capacitor", weight = 51},
[198198] = { name = "Reinforced Machine Chassis", weight = 75},
[198200] = { name = "Reinforced Machine Chassis", weight = 75},
[198199] = { name = "Reinforced Machine Chassis", weight = 75},
[198189] = { name = "Everburning Blasting Powder", weight = 13},
[198191] = { name = "Everburning Blasting Powder", weight = 13},
[198190] = { name = "Everburning Blasting Powder", weight = 13},
[193229] = { name = "Mireslush Hide", weight = 45},
[193230] = { name = "Mireslush Hide", weight = 45},
[193231] = { name = "Mireslush Hide", weight = 45},
[192849] = { name = "Eternity Amber", weight = 15},
[192850] = { name = "Eternity Amber", weight = 15},
[192851] = { name = "Eternity Amber", weight = 15},
[193226] = { name = "Stonecrust Hide", weight = 45},
[193228] = { name = "Stonecrust Hide", weight = 45},
[193227] = { name = "Stonecrust Hide", weight = 45},
[192887] = { name = "Elemental Harmony", weight = 291},
[193379] = { name = "Elemental Harmony", weight = 291},
[193378] = { name = "Elemental Harmony", weight = 291},
[193222] = { name = "Lustrous Scaled Hide", weight = 31},
[193224] = { name = "Lustrous Scaled Hide", weight = 31},
[193223] = { name = "Lustrous Scaled Hide", weight = 31},
[198278] = { name = "Primal Deconstruction Charge", weight = 22},
[198280] = { name = "Primal Deconstruction Charge", weight = 22},
[198279] = { name = "Primal Deconstruction Charge", weight = 22},
[193208] = { name = "Resilient Leather", weight = 2},
[193210] = { name = "Resilient Leather", weight = 2},
[193211] = { name = "Resilient Leather", weight = 2},
[198230] = { name = "Gravitational Displacer", weight = 20},
[198228] = { name = "Gravitational Displacer", weight = 20},
[198229] = { name = "Gravitational Displacer", weight = 20},
[198201] = { name = "Assorted Safety Fuses", weight = 19},
[198202] = { name = "Assorted Safety Fuses", weight = 19},
[198203] = { name = "Assorted Safety Fuses", weight = 19},
[191396] = { name = "Potion of Gusts", weight = 20},
[191398] = { name = "Potion of Gusts", weight = 20},
[191397] = { name = "Potion of Gusts", weight = 20},
[192863] = { name = "Neltharite", weight = 108},
[192862] = { name = "Neltharite", weight = 108},
[192865] = { name = "Neltharite", weight = 108},
[193213] = { name = "Adamant Scales", weight = 2},
[193214] = { name = "Adamant Scales", weight = 2},
[193215] = { name = "Adamant Scales", weight = 2},
[193929] = { name = "Vibrant Wildercloth Bolt", weight = 54},
[193931] = { name = "Vibrant Wildercloth Bolt", weight = 54},
[193930] = { name = "Vibrant Wildercloth Bolt", weight = 54},
[191378] = { name = "Refreshing Healing Potion", weight = 11},
[191380] = { name = "Refreshing Healing Potion", weight = 11},
[191379] = { name = "Refreshing Healing Potion", weight = 11},
[192848] = { name = "Sundered Onyx", weight = 25},
[192847] = { name = "Sundered Onyx", weight = 25},
[192846] = { name = "Sundered Onyx", weight = 25},
[193216] = { name = "Dense Hide", weight = 31},
[193217] = { name = "Dense Hide", weight = 31},
[193218] = { name = "Dense Hide", weight = 31},
[192840] = { name = "Mystic Sapphire", weight = 25},
[192841] = { name = "Mystic Sapphire", weight = 25},
[192842] = { name = "Mystic Sapphire", weight = 25},
[193245] = { name = "Frostbite Scales", weight = 45},
[193246] = { name = "Frostbite Scales", weight = 45},
[193247] = { name = "Frostbite Scales", weight = 45},
[192856] = { name = "Malygite", weight = 108},
[192857] = { name = "Malygite", weight = 108},
[192858] = { name = "Malygite", weight = 108},
[192843] = { name = "Vibrant Emerald", weight = 25},
[192844] = { name = "Vibrant Emerald", weight = 25},
[192845] = { name = "Vibrant Emerald", weight = 25},
[192838] = { name = "Queen's Ruby", weight = 25},
[192837] = { name = "Queen's Ruby", weight = 25},
[192839] = { name = "Queen's Ruby", weight = 25},
[191393] = { name = "Potion of the Hushed Zephyr", weight = 21},
[191395] = { name = "Potion of the Hushed Zephyr", weight = 21},
[191394] = { name = "Potion of the Hushed Zephyr", weight = 21},
[194856] = { name = "Serene Ink", weight = 14},
[194857] = { name = "Serene Ink", weight = 14},
[194858] = { name = "Serene Ink", weight = 14},
[194760] = { name = "Burnished Ink", weight = 24},
[194761] = { name = "Burnished Ink", weight = 24},
[194855] = { name = "Burnished Ink", weight = 24},
[198421] = { name = "Shimmering Pigment", weight = 6},
[198423] = { name = "Shimmering Pigment", weight = 6},
[198422] = { name = "Shimmering Pigment", weight = 6},
[198418] = { name = "Blazing Pigment", weight = 16},
[198420] = { name = "Blazing Pigment", weight = 16},
[198419] = { name = "Blazing Pigment", weight = 16},
[194751] = { name = "Blazing Ink", weight = 14},
[194752] = { name = "Blazing Ink", weight = 14},
[194846] = { name = "Blazing Ink", weight = 14},
[194850] = { name = "Flourishing Ink", weight = 14},
[194758] = { name = "Flourishing Ink", weight = 14},
[194852] = { name = "Flourishing Ink", weight = 14},
[194859] = { name = "Chilled Rune", weight = 34},
[194767] = { name = "Chilled Rune", weight = 34},
[194768] = { name = "Chilled Rune", weight = 34},
[194754] = { name = "Cosmic Ink", weight = 42},
[194756] = { name = "Cosmic Ink", weight = 42},
[194755] = { name = "Cosmic Ink", weight = 42},
[198415] = { name = "Flourishing Pigment", weight = 16},
[198416] = { name = "Flourishing Pigment", weight = 16},
[198417] = { name = "Flourishing Pigment", weight = 16},
[198412] = { name = "Serene Pigment", weight = 16},
[198413] = { name = "Serene Pigment", weight = 16},
[198414] = { name = "Serene Pigment", weight = 16},
[192859] = { name = "Ysemerald", weight = 108},
[192860] = { name = "Ysemerald", weight = 108},
[192861] = { name = "Ysemerald", weight = 108},
[192869] = { name = "Illimited Diamond", weight = 254},
[192871] = { name = "Illimited Diamond", weight = 254},
[192870] = { name = "Illimited Diamond", weight = 254},
[192834] = { name = "Shimmering Clasp", weight = 20},
[192835] = { name = "Shimmering Clasp", weight = 20},
[192836] = { name = "Shimmering Clasp", weight = 20},
[192852] = { name = "Alexstraszite", weight = 108},
[192855] = { name = "Alexstraszite", weight = 108},
[192853] = { name = "Alexstraszite", weight = 108},
[193029] = { name = "Projection Prism", weight = 31},
[193031] = { name = "Projection Prism", weight = 31},
[193030] = { name = "Projection Prism", weight = 31},
[192867] = { name = "Nozdorite", weight = 88},
[192866] = { name = "Nozdorite", weight = 88},
[192868] = { name = "Nozdorite", weight = 88},
[193242] = { name = "Earthshine Scales", weight = 45},
[193244] = { name = "Earthshine Scales", weight = 45},
[193243] = { name = "Earthshine Scales", weight = 45},
[193248] = { name = "Infurious Scales", weight = 42},
[193249] = { name = "Infurious Scales", weight = 42},
[193250] = { name = "Infurious Scales", weight = 42},
[193236] = { name = "Infurious Hide", weight = 42},
[193237] = { name = "Infurious Hide", weight = 42},
[193238] = { name = "Infurious Hide", weight = 42},
[193926] = { name = "Wildercloth Bolt", weight = 9},
[193927] = { name = "Wildercloth Bolt", weight = 9},
[193928] = { name = "Wildercloth Bolt", weight = 9},
[194014] = { name = "Temporal Spellthread", weight = 218},
[194016] = { name = "Temporal Spellthread", weight = 218},
[194015] = { name = "Temporal Spellthread", weight = 218},
[193936] = { name = "Chronocloth Bolt", weight = 117},
[193935] = { name = "Chronocloth Bolt", weight = 117},
[193937] = { name = "Chronocloth Bolt", weight = 117},
[194011] = { name = "Frozen Spellthread", weight = 218},
[194013] = { name = "Frozen Spellthread", weight = 218},
[194012] = { name = "Frozen Spellthread", weight = 218},
[193938] = { name = "Azureweave Bolt", weight = 117},
[193939] = { name = "Azureweave Bolt", weight = 117},
[193940] = { name = "Azureweave Bolt", weight = 117},
[192096] = { name = "Spool of Wilderthread", weight = 4},
[192095] = { name = "Spool of Wilderthread", weight = 4},
[192097] = { name = "Spool of Wilderthread", weight = 4},
[193932] = { name = "Infurious Wildercloth Bolt", weight = 29},
[193933] = { name = "Infurious Wildercloth Bolt", weight = 29},
[193934] = { name = "Infurious Wildercloth Bolt", weight = 29},
[194008] = { name = "Vibrant Spellthread", weight = 123},
[194010] = { name = "Vibrant Spellthread", weight = 123},
[194009] = { name = "Vibrant Spellthread", weight = 123}
}