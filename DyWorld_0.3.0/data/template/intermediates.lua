require "data/prefix"

Data_Table_Intermediates = {
	{
		Name = dyworld_prefix_intermediate.."chitin",
		Icon = dyworld_path_icon.."chitin.png",
		Stack = 200,
	},
	{
		Name = dyworld_prefix_intermediate.."frame",
		Icon = dyworld_path_icon.."frame.png",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 3,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"iron-plate", 15},{"iron-stick", 4},{"copper-cable", 12}},
	},
	{
		Name = dyworld_prefix_intermediate.."heater",
		Icon = dyworld_path_icon.."heater.png",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 4.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{dyworld_prefix_intermediate.."frame", 1},{"electronic-circuit", 4},{"copper-cable", 9}},
	},
	{
		Name = dyworld_prefix_intermediate.."blade",
		Icon = dyworld_path_icon.."blade.png",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 1,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"iron-plate",2},{"iron-stick",1},{"stone",2}},
	},
	{
		Name = dyworld_prefix_intermediate.."gearbox",
		Icon = dyworld_path_icon.."gearbox.png",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 2.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"iron-plate",15},{"iron-stick",4},{"copper-cable",12}},
	},
	{
		Name = dyworld_prefix_intermediate.."processing-logic",
		Icon = dyworld_path_icon.."processing-logic.png",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 15,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{dyworld_prefix_intermediate.."processing-advanced", 4},{"copper-cable", 25},{dyworld_prefix_intermediate.."crystal", 1}},
	},
	{
		Name = dyworld_prefix_intermediate.."processing-advanced",
		Icon = dyworld_path_icon.."processing-advanced.png",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 10,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"processing-unit", 3},{"advanced-circuit", 1},{dyworld_prefix_intermediate.."steel-stick", 4},{dyworld_prefix_intermediate.."binding-steel", 1}},
	},
	{
		Name = dyworld_prefix_intermediate.."glass",
		Icon = dyworld_path_icon.."glass.png",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 2,
		Recipe_Category = "smelting",
		Recipe_Result_Count = 5,
		Recipe_Ingredients = {{dyworld_prefix_intermediate.."sand", 3}},
	},
	{
		Name = dyworld_prefix_intermediate.."rotor",
		Icon = dyworld_path_icon.."rotor.png",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 1.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{dyworld_prefix_intermediate.."blade", 4},{"iron-stick", 2},{"copper-cable",3},{dyworld_prefix_intermediate.."frame", 1}},
	},
	{
		Name = dyworld_prefix_intermediate.."crystal",
		Icon = dyworld_path_icon.."crystal.png",
		Stack = 200,
	},
	{
		Name = dyworld_prefix_intermediate.."crystai",
		Icon = dyworld_path_icon.."crystai.png",
		Stack = 200,
	},
	{
		Name = dyworld_prefix_intermediate.."stone-gear",
		Icon = dyworld_path_icon.."stone-gear.png",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"stone", 2}},
	},
	{
		Name = dyworld_prefix_intermediate.."steel-gear",
		Icon = dyworld_path_icon.."steel-gear.png",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"steel-plate", 2}},
	},
	{
		Name = dyworld_prefix_intermediate.."solar-cell",
		Icon = dyworld_path_icon.."solar-cell.png",
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 2.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"copper-plate", 8},{dyworld_prefix_intermediate.."binding-copper", 2},{dyworld_prefix_intermediate.."steel-stick", 5}},
	},
	{
		Name = dyworld_prefix_intermediate.."steel-stick",
		Icon = dyworld_path_icon_temp,
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{"steel-plate", 1}},
	},
	{
		Name = dyworld_prefix_intermediate.."stone-stick",
		Icon = dyworld_path_icon_temp,
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{"stone", 1}},
	},
	{
		Name = dyworld_prefix_intermediate.."binding-copper",
		Icon = dyworld_path_icon_temp,
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 4,
		Recipe_Ingredients = {{"copper-plate", 1},{"copper-cable", 3}},
	},
	{
		Name = dyworld_prefix_intermediate.."binding-iron",
		Icon = dyworld_path_icon_temp,
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 4,
		Recipe_Ingredients = {{"iron-plate", 1},{"copper-cable", 3}},
	},
	{
		Name = dyworld_prefix_intermediate.."binding-steel",
		Icon = dyworld_path_icon_temp,
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 4,
		Recipe_Ingredients = {{"steel-plate", 1},{"copper-cable", 3}},
	},
	{
		Name = dyworld_prefix_intermediate.."binding-chitin",
		Icon = dyworld_path_icon_temp,
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 4,
		Recipe_Ingredients = {{dyworld_prefix_intermediate.."chitin", 2}},
	},
	{
		Name = dyworld_prefix_intermediate.."logistic-unit",
		Icon = dyworld_path_icon_temp,
		Stack = 200,
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Category = "crafting",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"processing-unit", 3},{"copper-cable", 7},{"iron-plate", 4}},
	},
	{
		Name = dyworld_prefix_intermediate.."obsidian",
		Icon = dyworld_path_icon_temp,
		Stack = 200,
	},
	{
		Name = dyworld_prefix_intermediate.."sand",
		Icon = dyworld_path_icon_temp,
		Stack = 200,
	},
}

function DyWorld_Intermediates_Recipe(DATA)
  local result =
  {
    type = "recipe",
    name = DATA.Name,
    energy_required = DATA.Recipe_Craft_Time,
	enabled = DATA.Recipe_Without_Tech,
	category = DATA.Recipe_Category,
    ingredients = {},
    result = DATA.Name,
    result_count = DATA.Recipe_Result_Count,
  }
  return result
end

function DyWorld_Intermediates_Item(DATA)
  local result =
  {
    type = "item",
    name = DATA.Name,
    icon = DATA.Icon,
    flags = {"goes-to-main-inventory"},
    subgroup = dyworld_prefix.."intermediates",
    order = DATA.Name,
    stack_size = DATA.Stack,
  }
  return result
end

for k,v in pairs(Data_Table_Intermediates) do
data:extend(
	{
		DyWorld_Intermediates_Item(v),
	})
	if v.Recipe then
		data:extend(
		{
			DyWorld_Intermediates_Recipe(v),
		})
		for _,z in pairs(v.Recipe_Ingredients) do
			table.insert(data.raw.recipe[v.Name].ingredients,z)
		end
	end
	if v.Tech then
	local result = {type = "unlock-recipe", recipe = v.Name}
		table.insert(data.raw.technology[v.Tech_Name].effects,result)
	end
end