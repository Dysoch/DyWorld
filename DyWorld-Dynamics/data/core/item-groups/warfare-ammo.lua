require "data/core/functions/prefix"

local Data_Table_Item_Group = {
	{
		Name = "warfare-ammo",
		Type = "main",
		Icon = "warfare.png"
	},
	{
		Name = "ammo-basic",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-sniper",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-bullet-basic",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-bullet-piercing",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-bullet-explosive",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-shotgun-basic",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-shotgun-piercing",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-shotgun-explosive",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-laser",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-shotgun",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-rocket",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-cannon",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-artillery",
		Type = "sub",
		Main = "warfare-ammo"
	},
	{
		Name = "ammo-flame",
		Type = "sub",
		Main = "warfare-ammo"
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