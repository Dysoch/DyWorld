

local Data_Table_Item_Group = {
	{
		Name = "personal",
		Type = "main",
		Icon = "personal.png"
	},
	{
		Name = "med-pack",
		Type = "sub",
		Main = "personal"
	},
	{
		Name = "labs",
		Type = "sub",
		Main = "personal"
	},
	{
		Name = "science-fluids",
		Type = "sub",
		Main = "personal"
	},
	{
		Name = "science-packs",
		Type = "sub",
		Main = "personal"
	},
	{
		Name = "repair-packs",
		Type = "sub",
		Main = "personal"
	},
	{
		Name = "mod-nanobots",
		Type = "sub",
		Main = "personal"
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