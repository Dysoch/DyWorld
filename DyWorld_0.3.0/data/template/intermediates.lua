require "data/prefix"

Data_Table_Intermediates = {
	{
		Name = dyworld_prefix_intermediate.."chitin",
		Icon = dyworld_path_icon.."chitin.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."frame",
		Icon = dyworld_path_icon.."frame.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."heater",
		Icon = dyworld_path_icon.."heater.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."blade",
		Icon = dyworld_path_icon.."blade.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."gearbox",
		Icon = dyworld_path_icon.."gearbox.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."processing-logic",
		Icon = dyworld_path_icon.."processing-logic.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."processing-advanced",
		Icon = dyworld_path_icon.."processing-advanced.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."glass",
		Icon = dyworld_path_icon.."glass.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."rotor",
		Icon = dyworld_path_icon.."rotor.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."crystal",
		Icon = dyworld_path_icon.."crystal.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."crystai",
		Icon = dyworld_path_icon.."crystai.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."stone-gear",
		Icon = dyworld_path_icon.."stone-gear.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."steel-gear",
		Icon = dyworld_path_icon.."steel-gear.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
	{
		Name = dyworld_prefix_intermediate.."solar-cell",
		Icon = dyworld_path_icon.."solar-cell.png",
		Stack = 200,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
	},
}

function DyWorld_Intermediates_Recipe(DATA)
  local result =
  {
    type = "recipe",
    name = DATA.Name,
    energy_required = DATA.Recipe_Craft_Time,
	enabled = DATA.Recipe_Without_Tech,
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
		DyWorld_Intermediates_Recipe(v),
	})
	if v.Tech then
	local result = {type = "unlock-recipe", recipe = v.Name}
		table.insert(data.raw.technology[v.Tech_Name].effects,result)
	end
end