require "data/core/functions/prefix"

local Data_Table_Item_Group = {
	{
		Name = "logistics",
		Type = "main",
		Icon = "logistics.png"
	},
	{
		Name = "transport-belt",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "transport-belt-underground",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "transport-splitter",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "transport-loader",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "pipe",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "pipe-underground",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "pump",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "pump-offshore",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "rail",
		Type = "sub",
		Main = "logistics"
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