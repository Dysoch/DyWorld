require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
	if v.DyWorld and v.DyWorld.Metallurgy and v.DyWorld.Metallurgy.Tech_Processing then
		if not data.raw.technology[v.DyWorld.Name.."-processing"] then
data:extend(
{
  {
    type = "technology",
   	name = v.DyWorld.Name.."-processing",
	localised_name = {"looped-name.tech-processing", {"looped-name."..v.DyWorld.Name}},
    effects = { },
    prerequisites = {},
    unit =
    {
      count = 65 * v.DyWorld.Tier,
      ingredients = {},
      time = 5 * v.DyWorld.Tier
    },
    order = v.DyWorld.Name.."-processing",
	upgrade = true,
  },
})
	if v.DyWorld.Tier == 1 then
		local results = {{"automation-science-pack", v.DyWorld.Tier}}
		data.raw.technology[v.DyWorld.Name.."-processing"].unit.ingredients = results
	elseif v.DyWorld.Tier == 2 then
		local results = {{"automation-science-pack", v.DyWorld.Tier}}
		data.raw.technology[v.DyWorld.Name.."-processing"].unit.ingredients = results
	elseif v.DyWorld.Tier == 3 then
		local results = {{"automation-science-pack", v.DyWorld.Tier},{"logistic-science-pack", v.DyWorld.Tier}}
		data.raw.technology[v.DyWorld.Name.."-processing"].unit.ingredients = results
	elseif v.DyWorld.Tier == 4 then
		local results = {{"automation-science-pack", v.DyWorld.Tier},{"logistic-science-pack", v.DyWorld.Tier},{"chemical-science-pack", v.DyWorld.Tier}}
		data.raw.technology[v.DyWorld.Name.."-processing"].unit.ingredients = results
	elseif v.DyWorld.Tier == 5 then
		local results = {{"automation-science-pack", v.DyWorld.Tier},{"logistic-science-pack", v.DyWorld.Tier},{"chemical-science-pack", v.DyWorld.Tier}}
		data.raw.technology[v.DyWorld.Name.."-processing"].unit.ingredients = results
	elseif v.DyWorld.Tier == 6 then
		local results = {{"automation-science-pack", v.DyWorld.Tier},{"logistic-science-pack", v.DyWorld.Tier},{"chemical-science-pack", v.DyWorld.Tier},{"production-science-pack", v.DyWorld.Tier}}
		data.raw.technology[v.DyWorld.Name.."-processing"].unit.ingredients = results
	elseif v.DyWorld.Tier == 7 then
		local results = {{"automation-science-pack", v.DyWorld.Tier},{"logistic-science-pack", v.DyWorld.Tier},{"chemical-science-pack", v.DyWorld.Tier},{"production-science-pack", v.DyWorld.Tier}}
		data.raw.technology[v.DyWorld.Name.."-processing"].unit.ingredients = results
	elseif v.DyWorld.Tier == 8 then
		local results = {{"automation-science-pack", v.DyWorld.Tier},{"logistic-science-pack", v.DyWorld.Tier},{"chemical-science-pack", v.DyWorld.Tier},{"production-science-pack", v.DyWorld.Tier},{"utility-science-pack", v.DyWorld.Tier}}
		data.raw.technology[v.DyWorld.Name.."-processing"].unit.ingredients = results
	elseif v.DyWorld.Tier == 9 then
		local results = {{"automation-science-pack", v.DyWorld.Tier},{"logistic-science-pack", v.DyWorld.Tier},{"chemical-science-pack", v.DyWorld.Tier},{"production-science-pack", v.DyWorld.Tier},{"utility-science-pack", v.DyWorld.Tier}}
		data.raw.technology[v.DyWorld.Name.."-processing"].unit.ingredients = results
	elseif v.DyWorld.Tier == 10 then
		local results = {{"automation-science-pack", v.DyWorld.Tier},{"logistic-science-pack", v.DyWorld.Tier},{"chemical-science-pack", v.DyWorld.Tier},{"production-science-pack", v.DyWorld.Tier},{"utility-science-pack", v.DyWorld.Tier},{"space-science-pack", v.DyWorld.Tier}}
		data.raw.technology[v.DyWorld.Name.."-processing"].unit.ingredients = results
	end
	if data.raw.item[v.DyWorld.Name.."-plate"].icons then
		data.raw.technology[v.DyWorld.Name.."-processing"].icons = data.raw.item[v.DyWorld.Name.."-plate"].icons
		data.raw.technology[v.DyWorld.Name.."-processing"].icon_size = 32
	else
		data.raw.technology[v.DyWorld.Name.."-processing"].icon = data.raw.item[v.DyWorld.Name.."-plate"].icon
		data.raw.technology[v.DyWorld.Name.."-processing"].icon_size = 32		
	end
		end
	end
end
