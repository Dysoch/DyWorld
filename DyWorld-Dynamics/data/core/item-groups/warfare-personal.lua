

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
		Name = "equipment-energy",
		Type = "sub",
		Main = "warfare-personal"
	},
	{
		Name = "equipment-defense",
		Type = "sub",
		Main = "warfare-personal"
	},
	{
		Name = "equipment-qol",
		Type = "sub",
		Main = "warfare-personal"
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

data.raw["item-group"][DyDs.."warfare-personal"].icon = nil
data.raw["item-group"][DyDs.."warfare-personal"].icons = {
	  {
		icon = DyDs_path_item_group.."warfare.png",
	  },
	  {
		icon = DyDs_path_item_group.."personal.png",
	  },
	}