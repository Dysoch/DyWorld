
local dy = "dyworld-"
local dyworld_path_item_group = "__DyWorld__/graphics/item-group/"

Data_Table_Item_Group = {
	{
		Name = "Mat-Sys-1",
		Type = "main",
		Icon = "machines.png",
		Tier = "primitive.png"
	},
	{
		Name = "Mat-Sys-2",
		Type = "main",
		Icon = "machines.png",
		Tier = "primitive.png"
	},
	{
		Name = "Mat-Sys-3",
		Type = "main",
		Icon = "machines.png",
		Tier = "primitive.png"
	},
	{
		Name = "Mat-Sys-4",
		Type = "main",
		Icon = "machines.png",
		Tier = "primitive.png"
	},
	{
		Name = "Mat-Sys-5",
		Type = "main",
		Icon = "machines.png",
		Tier = "primitive.png"
	},
	{
		Name = "Mat-Sys-6",
		Type = "main",
		Icon = "machines.png",
		Tier = "primitive.png"
	},
	{
		Name = "Mat-Sys-1-warfare",
		Type = "main",
		Icon = "warfare.png",
		Tier = "primitive.png"
	},
	{
		Name = "Mat-Sys-2-warfare",
		Type = "main",
		Icon = "warfare.png",
		Tier = "primitive.png"
	},
	{
		Name = "Mat-Sys-3-warfare",
		Type = "main",
		Icon = "warfare.png",
		Tier = "primitive.png"
	},
	{
		Name = "Mat-Sys-4-warfare",
		Type = "main",
		Icon = "warfare.png",
		Tier = "primitive.png"
	},
	{
		Name = "Mat-Sys-5-warfare",
		Type = "main",
		Icon = "warfare.png",
		Tier = "primitive.png"
	},
	{
		Name = "Mat-Sys-6-warfare",
		Type = "main",
		Icon = "warfare.png",
		Tier = "primitive.png"
	},
}

function DyWorld_Item_Main_Group(NAME, ICON, TIER)
  local result =
  {
    type = "item-group",
    name = dy..NAME,
    icons = 
	{
	  {
		icon = dyworld_path_item_group..ICON,
	  },
	  {
		icon = dyworld_path_tech.."tier/"..TIER,
		scale = 0.5,
	  },
	},
    icon_size = 64,
    order = "zz-"..dy..NAME,
  }
  return result
end

function DyWorld_Item_Sub_Group(NAME, MAIN)
  local result =
  {
    type = "item-subgroup",
    name = dy..NAME,
    group = dy..MAIN,
    order = dy..NAME
  }
  return result
end

for k,v in pairs(Data_Table_Item_Group) do
	if v.Type == "main" then
		data:extend(
			{
				DyWorld_Item_Main_Group(v.Name, v.Icon, v.Tier)
			})
	elseif v.Type == "sub" then
		data:extend(
			{
				DyWorld_Item_Sub_Group(v.Name, v.Main)
			})
	end
end