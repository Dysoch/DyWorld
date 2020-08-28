
local dy = "dyworld-"
local dyworld_path_item_group = "__DyWorld__/graphics/item-group/"

Data_Table_Item_Group = {
	{
		Name = "metallurgy",
		Type = "main",
		Icon = "metallurgy.png"
	},
	{
		Name = "melting-recipes",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "melting-recipes-alloy",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "melting-recipes-alloy-2",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "melting-recipes-alloy-3",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "melting-recipes-alloy-4",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "casting-recipes",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "cleaning-recipes",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "sub-recipes",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "metal-machines",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "zzz-void-recipes",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "metal-0-ore",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "metal-0-ore-recipes",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "metal-1-ore",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "metal-1-ore-clean",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "metal-1-pebble",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "metal-2-plate",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "metal-3-alloy-1",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "metal-3-alloy-2",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "metal-3-alloy-3",
		Type = "sub",
		Main = "metallurgy"
	},
	{
		Name = "metal-3-alloy-4",
		Type = "sub",
		Main = "metallurgy"
	},
}

function DyWorld_Item_Main_Group(NAME, ICON)
  local result =
  {
    type = "item-group",
    name = dy..NAME,
    icon = dyworld_path_item_group..ICON,
    icon_size = 64,
    order = "z-"..dy..NAME,
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
				DyWorld_Item_Main_Group(v.Name, v.Icon)
			})
	elseif v.Type == "sub" then
		data:extend(
			{
				DyWorld_Item_Sub_Group(v.Name, v.Main)
			})
	end
end