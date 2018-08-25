require "data/prefix"

data:extend(
{
  {
    type = "item",
    name = dy.."dtx-001-spaceship",
    icon = dyworld_path_icon_temp,
	icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = dy.."intermediates-2",
    order = dy.."dtx-001-spaceship",
    stack_size = 1
  },
  {
    type = "recipe",
    name = dy.."dtx-001-spaceship",
    energy_required = 500,
	enabled = false,
    ingredients =
    {
    },
    result =dy.."dtx-001-spaceship",
	result_count = 1,
    subgroup = dy.."intermediates-2",
    order = dy.."dtx-001-spaceship",
  },
})
  
  
local Data_Table = {
	{
		Name = "shield-component",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 75,
		Subgroup = "intermediates-2",
	},
	{
		Name = "storage-component",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 25,
		Subgroup = "intermediates-2",
	},
	{
		Name = "electrical-wiring",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 600,
		Subgroup = "intermediates-2",
	},
	{
		Name = "sensor-component",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 5,
		Subgroup = "intermediates-2",
	},
	{
		Name = "rcs-component",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 60,
		Subgroup = "intermediates-2",
	},
	{
		Name = "thruster-component",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 25,
		Subgroup = "intermediates-2",
	},
	{
		Name = "ftl-drive",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 1,
		Subgroup = "intermediates-2",
	},
	{
		Name = "gravity-gen-component",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 3,
		Subgroup = "intermediates-2",
	},
	{
		Name = "refinery-component",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 3,
		Subgroup = "intermediates-2",
	},
	{
		Name = "armor-plate",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 100,
		Subgroup = "intermediates-2",
	},
	{
		Name = "outer-hull-bracing",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 250,
		Subgroup = "intermediates-2",
	},
	{
		Name = "inner-hull-bracing",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 125,
		Subgroup = "intermediates-2",
	},
	{
		Name = "reactor-shielding",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 50,
		Subgroup = "intermediates-2",
	},
	{
		Name = "communication-component",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 4,
		Subgroup = "intermediates-2",
	},
	{
		Name = "cooling-system",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 5,
		Subgroup = "intermediates-2",
	},
	{
		Name = "reactor-component",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 4,
		Subgroup = "intermediates-2",
	},
	{
		Name = "ammo-storage",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 160,
		Subgroup = "intermediates-2",
	},
	{
		Name = "weapon-system",
		Icon = dyworld_path_icon_temp,
		Stack = 100,
		Amount_Added = 40,
		Subgroup = "intermediates-2",
	},
	{
		Name = "dtx-001-spaceship",
		Icon = dyworld_path_icon_temp,
		Stack = 1,
		Subgroup = "intermediates-2",
	},
	--[[{
		Name = "diamond",
		Icon = dyworld_path_icon.."diamond.png",
		Stack = 25,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 150,
		Recipe_Category = dy.."compressor",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{dy.."sand", 250},{"stone", 25},{"coal", 2}},
		Tech_Name = "advanced-electronics-2",
	},]]--
}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Item(v),
	})
	if v.Recipe then
		data:extend(
		{
			DyWorld_Recipe(v),
		})
		if not v.Recipe_Without_Tech then
			local result = {type = "unlock-recipe", recipe = dy..v.Name}
			table.insert(data.raw.technology[v.Tech_Name].effects,result)
		end
		--table.insert(DyWorld_TD.Module_List, dy..v.Name)
	end
	if v.Amount_Added then
		local recipe_insert = {dy..v.Name, v.Amount_Added}
		table.insert(data.raw.recipe[dy.."dtx-001-spaceship"].ingredients, recipe_insert)
	end
end
