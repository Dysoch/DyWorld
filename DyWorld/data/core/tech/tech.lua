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
		Count = 250,
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
		Tech_Ingredients = 4,
		Count = 450,
		Military = false,
	},
	{
		Name = "electric-energy-distribution-3",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-distribution.png"}},
		Pre_Req = {"electric-energy-distribution-2"},
		Tech_Ingredients = 5,
		Count = 250,
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
		Tech_Ingredients = 5,
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
		Count = 250,
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
		Name = dy.."electric-miners-2",
		Icon = {{icon = "__base__/graphics/technology/mining-productivity.png"}},
		Pre_Req = {dy.."electric-miners-1"},
		Tech_Ingredients = 5,
		Count = 550,
		Military = false,
	},
	{
		Name = dy.."ore-smelting",
		Icon = {{icon = dyworld_path_icon.."blast-furnace.png", scale = 2}},
		Pre_Req = {"steel-processing", "automation"},
		Tech_Ingredients = 2,
		Count = 100,
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
