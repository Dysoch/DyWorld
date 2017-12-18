
local dy = "dyworld-"
local dyworld_path_item_group = "__DyWorld__/graphics/item-group/"

Data_Table_Item_Group = {
	{
		Name = "logistics-2",
		Type = "main",
		Icon = "logistics.png"
	},
	{
		Name = "chest-storage",
		Type = "sub",
		Main = "logistics-2"
	},
	{
		Name = "chests",
		Type = "sub",
		Main = "logistics-2"
	},
	{
		Name = "chests-warehouse",
		Type = "sub",
		Main = "logistics-2"
	},
	{
		Name = "roboport",
		Type = "sub",
		Main = "logistics-2"
	},
	{
		Name = "robot-construction",
		Type = "sub",
		Main = "logistics-2"
	},
	{
		Name = "robot-logistic",
		Type = "sub",
		Main = "logistics-2"
	},
	{
		Name = "railway-1",
		Type = "sub",
		Main = "logistics-2"
	},
	{
		Name = "railway-2",
		Type = "sub",
		Main = "logistics-2"
	},
	{
		Name = "railway-3",
		Type = "sub",
		Main = "logistics-2"
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