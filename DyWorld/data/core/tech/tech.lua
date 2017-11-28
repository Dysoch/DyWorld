require "data/prefix"

local Data_Table = {
	{
		Name = dy.."mining-tools-1",
		Icon = {{icon = dyworld_path_tech.."tools.png", scale = 0.5}},
		Tech_Ingredients = 1,
		Count = 50,
		Military = false,
	},
	{
		Name = dy.."mining-tools-2",
		Icon = {{icon = dyworld_path_tech.."tools.png", scale = 0.5}},
		Pre_Req = {dy.."mining-tools-1"},
		Tech_Ingredients = 2,
		Count = 150,
		Military = false,
	},
	{
		Name = dy.."mining-tools-3",
		Icon = {{icon = dyworld_path_tech.."tools.png", scale = 0.5}},
		Pre_Req = {dy.."mining-tools-2"},
		Tech_Ingredients = 3,
		Count = 350,
		Military = false,
	},
	{
		Name = dy.."mining-tools-4",
		Icon = {{icon = dyworld_path_tech.."tools.png", scale = 0.5}},
		Pre_Req = {dy.."mining-tools-3"},
		Tech_Ingredients = 5,
		Count = 750,
		Military = false,
	},
	{
		Name = dy.."mining-tools-5",
		Icon = {{icon = dyworld_path_tech.."tools.png", scale = 0.5}},
		Pre_Req = {dy.."mining-tools-4"},
		Tech_Ingredients = 6,
		Count = 1750,
		Military = false,
	},
	{
		Name = dy.."repair-tools-1",
		Icon = {{icon = dyworld_path_tech.."repair.png", scale = 0.5}},
		Pre_Req = {"automation"},
		Tech_Ingredients = 2,
		Count = 150,
		Military = false,
	},
	{
		Name = dy.."repair-tools-2",
		Icon = {{icon = dyworld_path_tech.."repair.png", scale = 0.5}},
		Pre_Req = {dy.."repair-tools-1"},
		Tech_Ingredients = 3,
		Count = 450,
		Military = false,
	},
	{
		Name = dy.."repair-tools-3",
		Icon = {{icon = dyworld_path_tech.."repair.png", scale = 0.5}},
		Pre_Req = {dy.."repair-tools-2"},
		Tech_Ingredients = 4,
		Count = 850,
		Military = false,
	},
	{
		Name = dy.."repair-tools-4",
		Icon = {{icon = dyworld_path_tech.."repair.png", scale = 0.5}},
		Pre_Req = {dy.."repair-tools-3"},
		Tech_Ingredients = 5,
		Count = 1450,
		Military = false,
	},
	{
		Name = dy.."repair-tools-5",
		Icon = {{icon = dyworld_path_tech.."repair.png", scale = 0.5}},
		Pre_Req = {dy.."repair-tools-4"},
		Tech_Ingredients = 6,
		Count = 2500,
		Military = false,
	},
	{
		Name = "electric-energy-distribution-3",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-distribution.png"}},
		Pre_Req = {"electric-energy-distribution-2"},
		Tech_Ingredients = 4,
		Count = 250,
		Military = false,
	},
	{
		Name = "electric-energy-distribution-4",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-distribution.png"}},
		Pre_Req = {"electric-energy-distribution-3"},
		Tech_Ingredients = 5,
		Count = 450,
		Military = false,
	},
	{
		Name = "electric-energy-distribution-5",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-distribution.png"}},
		Pre_Req = {"electric-energy-distribution-4"},
		Tech_Ingredients = 6,
		Count = 850,
		Military = false,
	},
	{
		Name = "electric-energy-distribution-6",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-distribution.png"}},
		Pre_Req = {"electric-energy-distribution-5"},
		Tech_Ingredients = 6,
		Count = 1750,
		Military = false,
	},
	{
		Name = "solar-energy-2",
		Icon = {{icon = "__base__/graphics/technology/solar-energy.png"}},
		Pre_Req = {"solar-energy"},
		Tech_Ingredients = 3,
		Count = 250,
		Military = false,
	},
	{
		Name = "solar-energy-3",
		Icon = {{icon = "__base__/graphics/technology/solar-energy.png"}},
		Pre_Req = {"solar-energy-2"},
		Tech_Ingredients = 4,
		Count = 250,
		Military = false,
	},
	{
		Name = "solar-energy-4",
		Icon = {{icon = "__base__/graphics/technology/solar-energy.png"}},
		Pre_Req = {"solar-energy-3"},
		Tech_Ingredients = 5,
		Count = 250,
		Military = false,
	},
	{
		Name = "solar-energy-5",
		Icon = {{icon = "__base__/graphics/technology/solar-energy.png"}},
		Pre_Req = {"solar-energy-4"},
		Tech_Ingredients = 6,
		Count = 250,
		Military = false,
	},
	{
		Name = "solar-energy-6",
		Icon = {{icon = "__base__/graphics/technology/solar-energy.png"}},
		Pre_Req = {"solar-energy-5"},
		Tech_Ingredients = 6,
		Count = 250,
		Military = false,
	},
	{
		Name = "electric-energy-accumulators-2",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-acumulators.png"}},
		Pre_Req = {"electric-energy-accumulators-1"},
		Tech_Ingredients = 3,
		Count = 250,
		Military = false,
	},
	{
		Name = "electric-energy-accumulators-3",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-acumulators.png"}},
		Pre_Req = {"electric-energy-accumulators-2"},
		Tech_Ingredients = 5,
		Count = 350,
		Military = false,
	},
	{
		Name = "electric-energy-accumulators-4",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-acumulators.png"}},
		Pre_Req = {"electric-energy-accumulators-3"},
		Tech_Ingredients = 5,
		Count = 550,
		Military = false,
	},
	{
		Name = "electric-energy-accumulators-5",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-acumulators.png"}},
		Pre_Req = {"electric-energy-accumulators-4"},
		Tech_Ingredients = 5,
		Count = 850,
		Military = false,
	},
	{
		Name = "electric-energy-accumulators-6",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-acumulators.png"}},
		Pre_Req = {"electric-energy-accumulators-5"},
		Tech_Ingredients = 6,
		Count = 2000,
		Military = false,
	},
	{
		Name = "military-5",
		Icon = {{icon = "__base__/graphics/technology/military.png"}},
		Pre_Req = {"military-4"},
		Tech_Ingredients = 5,
		Count = 500,
		Military = true,
	},
	{
		Name = "military-6",
		Icon = {{icon = "__base__/graphics/technology/military.png"}},
		Pre_Req = {"military-5"},
		Tech_Ingredients = 6,
		Count = 2500,
		Military = true,
	},
	{
		Name = "military-7",
		Icon = {{icon = "__base__/graphics/technology/military.png"}},
		Pre_Req = {"military-6"},
		Tech_Ingredients = 6,
		Count = 7500,
		Military = true,
	},
	{
		Name = "turrets-2",
		Icon = {{icon = "__base__/graphics/technology/turrets.png"}},
		Pre_Req = {"turrets"},
		Tech_Ingredients = 2,
		Count = 150,
		Military = true,
	},
	{
		Name = "turrets-3",
		Icon = {{icon = "__base__/graphics/technology/turrets.png"}},
		Pre_Req = {"turrets-2"},
		Tech_Ingredients = 3,
		Count = 350,
		Military = true,
	},
	{
		Name = "turrets-4",
		Icon = {{icon = "__base__/graphics/technology/turrets.png"}},
		Pre_Req = {"turrets-3"},
		Tech_Ingredients = 4,
		Count = 750,
		Military = true,
	},
	{
		Name = "turrets-5",
		Icon = {{icon = "__base__/graphics/technology/turrets.png"}},
		Pre_Req = {"turrets-4"},
		Tech_Ingredients = 5,
		Count = 1500,
		Military = true,
	},
	{
		Name = "turrets-6",
		Icon = {{icon = "__base__/graphics/technology/turrets.png"}},
		Pre_Req = {"turrets-5"},
		Tech_Ingredients = 6,
		Count = 2500,
		Military = true,
	},
	{
		Name = "laser-turrets-2",
		Icon = {{icon = "__base__/graphics/technology/laser-turrets.png"}},
		Pre_Req = {"laser-turrets"},
		Tech_Ingredients = 3,
		Count = 500,
		Military = true,
	},
	{
		Name = "laser-turrets-3",
		Icon = {{icon = "__base__/graphics/technology/laser-turrets.png"}},
		Pre_Req = {"laser-turrets-2"},
		Tech_Ingredients = 4,
		Count = 750,
		Military = true,
	},
	{
		Name = "laser-turrets-4",
		Icon = {{icon = "__base__/graphics/technology/laser-turrets.png"}},
		Pre_Req = {"laser-turrets-3"},
		Tech_Ingredients = 5,
		Count = 1000,
		Military = true,
	},
	{
		Name = "laser-turrets-5",
		Icon = {{icon = "__base__/graphics/technology/laser-turrets.png"}},
		Pre_Req = {"laser-turrets-4"},
		Tech_Ingredients = 5,
		Count = 2500,
		Military = true,
	},
	{
		Name = "laser-turrets-6",
		Icon = {{icon = "__base__/graphics/technology/laser-turrets.png"}},
		Pre_Req = {"laser-turrets-5"},
		Tech_Ingredients = 6,
		Count = 5000,
		Military = true,
	},
	{
		Name = "laser-turrets-7",
		Icon = {{icon = "__base__/graphics/technology/laser-turrets.png"}},
		Pre_Req = {"laser-turrets-6"},
		Tech_Ingredients = 6,
		Count = 15000,
		Military = true,
	},
	{
		Name = dy.."electric-miners-1",
		Icon = {{icon = "__base__/graphics/technology/mining-productivity.png"}},
		Pre_Req = {"automation"},
		Tech_Ingredients = 2,
		Count = 250,
		Military = false,
	},
	{
		Name = "automation-4",
		Icon = {{icon = "__base__/graphics/technology/automation.png"}},
		Pre_Req = {"automation-3"},
		Tech_Ingredients = 5,
		Count = 250,
		Military = false,
	},
	{
		Name = "automation-5",
		Icon = {{icon = "__base__/graphics/technology/automation.png"}},
		Pre_Req = {"automation-4"},
		Tech_Ingredients = 6,
		Count = 750,
		Military = false,
	},
	{
		Name = "automation-6",
		Icon = {{icon = "__base__/graphics/technology/automation.png"}},
		Pre_Req = {"automation-5"},
		Tech_Ingredients = 6,
		Count = 2000,
		Military = false,
	},
	{
		Name = dy.."electric-miners-2",
		Icon = {{icon = "__base__/graphics/technology/mining-productivity.png"}},
		Pre_Req = {dy.."electric-miners-1"},
		Tech_Ingredients = 3,
		Count = 550,
		Military = false,
	},
	{
		Name = dy.."electric-miners-3",
		Icon = {{icon = "__base__/graphics/technology/mining-productivity.png"}},
		Pre_Req = {dy.."electric-miners-2"},
		Tech_Ingredients = 4,
		Count = 750,
		Military = false,
	},
	{
		Name = dy.."electric-miners-4",
		Icon = {{icon = "__base__/graphics/technology/mining-productivity.png"}},
		Pre_Req = {dy.."electric-miners-3"},
		Tech_Ingredients = 5,
		Count = 1550,
		Military = false,
	},
	{
		Name = dy.."electric-miners-5",
		Icon = {{icon = "__base__/graphics/technology/mining-productivity.png"}},
		Pre_Req = {dy.."electric-miners-4"},
		Tech_Ingredients = 6,
		Count = 5000,
		Military = false,
	},
	{
		Name = dy.."ore-smelting",
		Icon = {{icon = dyworld_path_icon.."blast-furnace.png", scale = 2}},
		Pre_Req = {"steel-processing", "automation"},
		Tech_Ingredients = 2,
		Count = 250,
		Military = false,
	},
	{
		Name = dy.."ore-smelting-2",
		Icon = {{icon = dyworld_path_icon.."blast-furnace.png", scale = 2}},
		Pre_Req = {dy.."ore-smelting"},
		Tech_Ingredients = 3,
		Count = 500,
		Military = false,
	},
	{
		Name = dy.."ore-smelting-3",
		Icon = {{icon = dyworld_path_icon.."blast-furnace.png", scale = 2}},
		Pre_Req = {dy.."ore-smelting-2"},
		Tech_Ingredients = 4,
		Count = 750,
		Military = false,
	},
	{
		Name = dy.."ore-smelting-4",
		Icon = {{icon = dyworld_path_icon.."blast-furnace.png", scale = 2}},
		Pre_Req = {dy.."ore-smelting-3"},
		Tech_Ingredients = 5,
		Count = 1000,
		Military = false,
	},
	{
		Name = dy.."ore-smelting-5",
		Icon = {{icon = dyworld_path_icon.."blast-furnace.png", scale = 2}},
		Pre_Req = {dy.."ore-smelting-4"},
		Tech_Ingredients = 6,
		Count = 2500,
		Military = false,
	},
	{
		Name = dy.."steam-energy-1",
		Icon = {{icon = "__base__/graphics/technology/fluid-handling.png"}},
		Pre_Req = {"automation", "logistics"},
		Tech_Ingredients = 1,
		Count = 50,
		Military = false,
	},
	{
		Name = dy.."labs-1",
		Icon = {{icon = "__base__/graphics/technology/research-speed.png"}},
		Pre_Req = {"automation", "logistics", "steel-processing"},
		Tech_Ingredients = 1,
		Count = 250,
		Military = false,
	},
	{
		Name = dy.."labs-2",
		Icon = {{icon = "__base__/graphics/technology/research-speed.png"}},
		Pre_Req = {dy.."labs-1"},
		Tech_Ingredients = 2,
		Count = 250,
		Military = false,
	},
	{
		Name = dy.."labs-3",
		Icon = {{icon = "__base__/graphics/technology/research-speed.png"}},
		Pre_Req = {dy.."labs-2", "military-2"},
		Tech_Ingredients = 2,
		Count = 250,
		Military = true,
	},
	{
		Name = dy.."labs-4",
		Icon = {{icon = "__base__/graphics/technology/research-speed.png"}},
		Pre_Req = {dy.."labs-3", "advanced-electronics"},
		Tech_Ingredients = 3,
		Count = 250,
		Military = true,
	},
	{
		Name = dy.."labs-5",
		Icon = {{icon = "__base__/graphics/technology/research-speed.png"}},
		Pre_Req = {dy.."labs-4", "advanced-material-processing-2"},
		Tech_Ingredients = 4,
		Count = 250,
		Military = true,
	},
	{
		Name = dy.."labs-6",
		Icon = {{icon = "__base__/graphics/technology/research-speed.png"}},
		Pre_Req = {dy.."labs-5", "advanced-electronics-2"},
		Tech_Ingredients = 5,
		Count = 250,
		Military = true,
	},
	{
		Name = "logistic-robotics-2",
		Icon = {{icon = "__base__/graphics/technology/logistic-robotics.png"}},
		Pre_Req = {"logistic-robotics"},
		Tech_Ingredients = 3,
		Count = 350,
		Military = false,
	},
	{
		Name = "logistic-robotics-3",
		Icon = {{icon = "__base__/graphics/technology/logistic-robotics.png"}},
		Pre_Req = {"logistic-robotics-2"},
		Tech_Ingredients = 4,
		Count = 750,
		Military = false,
	},
	{
		Name = "logistic-robotics-4",
		Icon = {{icon = "__base__/graphics/technology/logistic-robotics.png"}},
		Pre_Req = {"logistic-robotics-3"},
		Tech_Ingredients = 5,
		Count = 1450,
		Military = false,
	},
	{
		Name = "logistic-robotics-5",
		Icon = {{icon = "__base__/graphics/technology/logistic-robotics.png"}},
		Pre_Req = {"logistic-robotics-4"},
		Tech_Ingredients = 5,
		Count = 2750,
		Military = false,
	},
	{
		Name = "logistic-robotics-6",
		Icon = {{icon = "__base__/graphics/technology/logistic-robotics.png"}},
		Pre_Req = {"logistic-robotics-5"},
		Tech_Ingredients = 6,
		Count = 5750,
		Military = false,
	},
	{
		Name = "construction-robotics-2",
		Icon = {{icon = "__base__/graphics/technology/construction-robotics.png"}},
		Pre_Req = {"construction-robotics"},
		Tech_Ingredients = 3,
		Count = 350,
		Military = false,
	},
	{
		Name = "construction-robotics-3",
		Icon = {{icon = "__base__/graphics/technology/construction-robotics.png"}},
		Pre_Req = {"construction-robotics-2"},
		Tech_Ingredients = 4,
		Count = 750,
		Military = false,
	},
	{
		Name = "construction-robotics-4",
		Icon = {{icon = "__base__/graphics/technology/construction-robotics.png"}},
		Pre_Req = {"construction-robotics-3"},
		Tech_Ingredients = 5,
		Count = 1450,
		Military = false,
	},
	{
		Name = "construction-robotics-5",
		Icon = {{icon = "__base__/graphics/technology/construction-robotics.png"}},
		Pre_Req = {"construction-robotics-4"},
		Tech_Ingredients = 5,
		Count = 2750,
		Military = false,
	},
	{
		Name = "construction-robotics-6",
		Icon = {{icon = "__base__/graphics/technology/construction-robotics.png"}},
		Pre_Req = {"construction-robotics-5"},
		Tech_Ingredients = 6,
		Count = 5750,
		Military = false,
	},
	{
		Name = "logistics-4",
		Icon = {{icon = "__base__/graphics/technology/logistics.png"}},
		Pre_Req = {"logistics-3"},
		Tech_Ingredients = 5,
		Count = 750,
		Military = false,
	},
	{
		Name = "logistics-5",
		Icon = {{icon = "__base__/graphics/technology/logistics.png"}},
		Pre_Req = {"logistics-4"},
		Tech_Ingredients = 6,
		Count = 2750,
		Military = false,
	},
	{
		Name = "logistics-6",
		Icon = {{icon = "__base__/graphics/technology/logistics.png"}},
		Pre_Req = {"logistics-5"},
		Tech_Ingredients = 6,
		Count = 7500,
		Military = false,
	},
	{
		Name = "logistics-7",
		Icon = {{icon = "__base__/graphics/technology/logistics.png"}},
		Pre_Req = {"logistics-6"},
		Tech_Ingredients = 6,
		Count = 25000,
		Military = false,
	},
	{
		Name = "fluid-handling-2",
		Icon = {{icon = "__base__/graphics/technology/fluid-handling.png"}},
		Pre_Req = {"fluid-handling"},
		Tech_Ingredients = 2,
		Count = 250,
		Military = false,
	},
	{
		Name = "fluid-handling-3",
		Icon = {{icon = "__base__/graphics/technology/fluid-handling.png"}},
		Pre_Req = {"fluid-handling-2"},
		Tech_Ingredients = 3,
		Count = 500,
		Military = false,
	},
	{
		Name = "fluid-handling-4",
		Icon = {{icon = "__base__/graphics/technology/fluid-handling.png"}},
		Pre_Req = {"fluid-handling-3"},
		Tech_Ingredients = 4,
		Count = 750,
		Military = false,
	},
	{
		Name = "fluid-handling-5",
		Icon = {{icon = "__base__/graphics/technology/fluid-handling.png"}},
		Pre_Req = {"fluid-handling-4"},
		Tech_Ingredients = 5,
		Count = 1250,
		Military = false,
	},
	{
		Name = "stone-walls-1",
		Icon = {{icon = "__base__/graphics/technology/stone-walls.png"}},
		Pre_Req = {"stone-walls"},
		Tech_Ingredients = 2,
		Count = 75,
		Military = false,
	},
	{
		Name = "stone-walls-2",
		Icon = {{icon = "__base__/graphics/technology/stone-walls.png"}},
		Pre_Req = {"stone-walls-1"},
		Tech_Ingredients = 2,
		Count = 150,
		Military = true,
	},
	{
		Name = "stone-walls-3",
		Icon = {{icon = "__base__/graphics/technology/stone-walls.png"}},
		Pre_Req = {"stone-walls-2"},
		Tech_Ingredients = 3,
		Count = 250,
		Military = true,
	},
	{
		Name = "stone-walls-4",
		Icon = {{icon = "__base__/graphics/technology/stone-walls.png"}},
		Pre_Req = {"stone-walls-3"},
		Tech_Ingredients = 4,
		Count = 600,
		Military = true,
	},
	{
		Name = "stone-walls-5",
		Icon = {{icon = "__base__/graphics/technology/stone-walls.png"}},
		Pre_Req = {"stone-walls-4"},
		Tech_Ingredients = 5,
		Count = 1500,
		Military = true,
	},
	{
		Name = "stone-walls-6",
		Icon = {{icon = "__base__/graphics/technology/stone-walls.png"}},
		Pre_Req = {"stone-walls-5"},
		Tech_Ingredients = 6,
		Count = 5000,
		Military = true,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
{
  {
    type = "technology",
   	name = v.Name,
    icons = v.Icon,
    effects = { },
    prerequisites = {},
    unit =
    {
      count = v.Count,
      ingredients = {},
      time = v.Time or 30
    },
    order = v.Name,
	upgrade = true,
  },
})
	if v.Tech_Ingredients == 1 then
		local results = {{"science-pack-1", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 2 then
		local results = {{"science-pack-1", 1},{"science-pack-2", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 3 then
		local results = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 4 then
		local results = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1},{"production-science-pack", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 5 then
		local results = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1},{"production-science-pack", 1},{"high-tech-science-pack", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 6 then
		local results = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1},{"production-science-pack", 1},{"high-tech-science-pack", 1},{"space-science-pack", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	end
	if v.Military then
		local results = {"military-science-pack", 1}
		table.insert(data.raw.technology[v.Name].unit.ingredients,results)
	end
	if v.Pre_Req then
		data.raw.technology[v.Name].prerequisites = v.Pre_Req
	end
end