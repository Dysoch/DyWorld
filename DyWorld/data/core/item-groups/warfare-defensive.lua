require "data/core/functions/prefix"

local Data_Table_Item_Group = {
	{
		Name = "warfare-defensive",
		Type = "main",
		Icon = "warfare.png"
	},
	{
		Name = "radar",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-gun",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-shotgun",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-cannon",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-rocket",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-laser",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-beam",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-flame",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-artillery",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "wall",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "wall-gate",
		Type = "sub",
		Main = "warfare-defensive"
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