require "data/prefix"

Data_Table_Item_Group = {
	{
		Name = "warfare",
		Type = "main",
		Icon = "warfare.png"
	},
	{
		Name = "ammo-basic",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "ammo-basic-piercing",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "ammo-shotgun",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "ammo-shotgun-piercing",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "armor",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "gun",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "radar",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "turret-gun",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "turret-shotgun",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "turret-laser",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "turret-shotgun-laser",
		Type = "sub",
		Main = "warfare"
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