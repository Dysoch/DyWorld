require "data/prefix"

Data_Table_Item_Group = {
	{
		Name = "items",
		Type = "main",
		Icon = "items.png"
	},
	{
		Name = "lab-tool",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "intermediates",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "filters",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "seeds",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "food-raw",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "food-cooked",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "hydration",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "oxygen",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "debug",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "metal-1-ore",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "metal-2-plate",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "metal-3-alloy-1",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "metal-3-alloy-2",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "metal-3-alloy-3",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "metal-3-alloy-4",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "module-speed",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "module-productivity",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "module-effectivity",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "fluid-recipes",
		Type = "sub",
		Main = "items"
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