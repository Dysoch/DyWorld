require "data/core/functions/prefix"

local Data_Table_Item_Group = {
	{
		Name = "warfare-personal",
		Type = "main",
		Icon = "modules.png"
	},
	{
		Name = "guns",
		Type = "sub",
		Main = "warfare-personal"
	},
	{
		Name = "armor",
		Type = "sub",
		Main = "warfare-personal"
	},
	{
		Name = "equipment-solar",
		Type = "sub",
		Main = "warfare-personal"
	},
	{
		Name = "equipment-reactor",
		Type = "sub",
		Main = "warfare-personal"
	},
	{
		Name = "equipment-shield",
		Type = "sub",
		Main = "warfare-personal"
	},
	{
		Name = "equipment-battery",
		Type = "sub",
		Main = "warfare-personal"
	},
	{
		Name = "equipment-defense",
		Type = "sub",
		Main = "warfare-personal"
	},
	{
		Name = "equipment-exoskeleton",
		Type = "sub",
		Main = "warfare-personal"
	},
	{
		Name = "equipment-roboport",
		Type = "sub",
		Main = "warfare-personal"
	},
	{
		Name = "equipment-vision",
		Type = "sub",
		Main = "warfare-personal"
	},
	{
		Name = "equipment-immunity",
		Type = "sub",
		Main = "warfare-personal"
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

data.raw["item-group"][dy.."warfare-personal"].icon = nil
data.raw["item-group"][dy.."warfare-personal"].icons = {
	  {
		icon = dyworld_path_item_group.."warfare.png",
	  },
	  {
		icon = dyworld_path_item_group.."personal.png",
	  },
	}