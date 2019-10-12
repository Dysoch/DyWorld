require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

local function Check_PreReq(TIER)
	if TIER >= 3 then
		return {"military-"..math.ceil(TIER/2)}
	else
		return {"military"}
	end
end


for k,v in pairs(Damages) do
data:extend(
{
  {
    type = "technology",
    name = k.."-ammo",
	localised_name = {"looped-name.ammo-tech", {"damage-type-name."..k}},
    icon_size = 128,
    icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
    effects = {},
    prerequisites = Check_PreReq(v.Tier),
    unit =
    {
      count = 25 * v.Tier,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 5 * v.Tier,
    },
    order = "c-c-a",
	upgrade = true,
  },
})
	if math.ceil(v.Tier/2) == 1 then
		local results = {{"automation-science-pack", 1}}
		data.raw.technology[k.."-ammo"].unit.ingredients = results
	elseif math.ceil(v.Tier/2) == 2 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1}}
		data.raw.technology[k.."-ammo"].unit.ingredients = results
	elseif math.ceil(v.Tier/2) == 3 then
		local results = {{"automation-science-pack", 2},{"logistic-science-pack", 2},{"military-science-pack", v.Tier}}
		data.raw.technology[k.."-ammo"].unit.ingredients = results
	elseif math.ceil(v.Tier/2) == 4 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"military-science-pack", v.Tier}}
		data.raw.technology[k.."-ammo"].unit.ingredients = results
	elseif math.ceil(v.Tier/2) == 5 then
		local results = {{"automation-science-pack", 3},{"logistic-science-pack", 3},{"chemical-science-pack", 3},{"military-science-pack", v.Tier}}
		data.raw.technology[k.."-ammo"].unit.ingredients = results
	elseif math.ceil(v.Tier/2) == 6 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1},{"military-science-pack", v.Tier}}
		data.raw.technology[k.."-ammo"].unit.ingredients = results
	elseif math.ceil(v.Tier/2) == 7 then
		local results = {{"automation-science-pack", 4},{"logistic-science-pack", 4},{"chemical-science-pack", 4},{"production-science-pack", 4},{"military-science-pack", v.Tier}}
		data.raw.technology[k.."-ammo"].unit.ingredients = results
	elseif math.ceil(v.Tier/2) == 8 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1},{"utility-science-pack", 1},{"military-science-pack", v.Tier}}
		data.raw.technology[k.."-ammo"].unit.ingredients = results
	elseif math.ceil(v.Tier/2) == 9 then
		local results = {{"automation-science-pack", 5},{"logistic-science-pack", 5},{"chemical-science-pack", 5},{"production-science-pack", 5},{"utility-science-pack", 5},{"military-science-pack", v.Tier}}
		data.raw.technology[k.."-ammo"].unit.ingredients = results
	elseif math.ceil(v.Tier/2) == 10 then
		local results = {{"automation-science-pack", 5},{"logistic-science-pack", 5},{"chemical-science-pack", 5},{"production-science-pack", 5},{"utility-science-pack", 5},{"military-science-pack", v.Tier},{"space-science-pack", 10}}
		data.raw.technology[k.."-ammo"].unit.ingredients = results
	end
end