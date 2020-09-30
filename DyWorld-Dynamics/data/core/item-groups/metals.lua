

local Data_Table_Item_Group = {
	{
		Name = "metals",
		Type = "main",
		Icon = "items.png"
	},
	{
		Name = "0-resource-1",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "0-resource-2",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "0-resource-3",
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
		Name = "metal-1",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "metal-2",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "metal-3",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "z-fluids",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "z-canisters",
		Type = "sub",
		Main = "metals"
	},
	{
		Name = "z-loot",
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