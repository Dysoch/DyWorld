require "data/core/functions/prefix"

local Data_Table_Item_Group = {
	{
		Name = "metals",
		Type = "main",
		Icon = "metals.png"
	},
	{
		Name = "0-resource",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "material-0",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "material-1",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "material-2",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "material-3",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "material-4",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "material-5",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "material-6",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "material-7",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "material-8",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "material-9",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "zzz-void-recipes",
		Type = "sub",
		Main = "metals"
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