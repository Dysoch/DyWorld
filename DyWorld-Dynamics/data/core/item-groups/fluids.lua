

local Data_Table_Item_Group = {
	{
		Name = "fluids",
		Type = "main",
		Icon = "empty.png"
	},
	{
		Name = "f-molten-1",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "f-molten-2",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "f-molten-3",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "f-molten-4",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "f-molten-5",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "f-acidic",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "f-basic",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "f-gases",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "f-oil",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "f-science-1",
		Type = "sub",
		Main = "fluids"
	},
	{
		Name = "f-science-2",
		Type = "sub",
		Main = "fluids"
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