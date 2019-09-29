require "data/core/functions/prefix"
require "data/core/functions/colors"

local Data_Table = {
	["dyworld-enemies-tier-1"] = {1, "a"},
	["dyworld-enemies-tier-2"] = {2, "b"},
	["dyworld-enemies-tier-3"] = {3, "c"},
	["dyworld-enemies-tier-4"] = {4, "d"},
	["dyworld-enemies-tier-5"] = {5, "e"},
	["dyworld-enemies-tier-6"] = {6, "f"},
	["dyworld-enemies-tier-7"] = {7, "g"},
	["dyworld-enemies-tier-8"] = {8, "h"},
	["dyworld-enemies-tier-9"] = {9, "i"},
	["dyworld-enemies-tier-10"] = {10, "j"},
	["dyworld-enemies-tier-11"] = {11, "k"},
	["dyworld-enemies-tier-12"] = {12, "l"},
	["dyworld-enemies-tier-13"] = {13, "m"},
	["dyworld-enemies-tier-14"] = {14, "n"},
	["dyworld-enemies-tier-15"] = {15, "o"},
	["dyworld-enemies-tier-16"] = {16, "p"},
	["dyworld-enemies-tier-17"] = {17, "q"},
	["dyworld-enemies-tier-18"] = {18, "r"},
	["dyworld-enemies-tier-19"] = {19, "s"},
	["dyworld-enemies-tier-20"] = {20, "t"},
}

for k,v in pairs(Data_Table) do
data:extend(
{
  {
    type = "autoplace-control",
    name = k,
	localised_name = {"looped-name.enemy-autoplace", (v[1])},
    richness = false,
    order = v[2],
    category = "enemy",
  }
})
end