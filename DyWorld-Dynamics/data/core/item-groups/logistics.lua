

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
		Name = "pipe-storage",
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
	{
		Name = "transport-drones",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "chests",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "chests-aai-1",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "satellites-2a",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "chests-aai-2",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "chests-aai-3",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "chests-storehouse",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "chests-warehouse",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "robot-construction",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "robot-logistic",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "roboport",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "vehicles",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "locomotive",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "tank",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "cargo-wagon",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "fluid-wagon",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "artillery-wagon",
		Type = "sub",
		Main = "logistics"
	},
}

function DyWorld_Item_Main_Group(NAME, ICON)
  local result =
  {
    type = "item-group",
    name = DyDs..NAME,
    icon = DyDs_path_item_group..ICON,
    icon_size = 64,
    order = "z-"..DyDs..NAME,
  }
  return result
end

function DyWorld_Item_Sub_Group(NAME, MAIN)
  local result =
  {
    type = "item-subgroup",
    name = DyDs..NAME,
    group = DyDs..MAIN,
    order = DyDs..NAME
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
