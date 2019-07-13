
local dy = "dyworld-"
local dyworld_path_item_group = "__DyWorld__/graphics/item-group/"

Data_Table_Item_Group = {
	{
		Name = "warfare-2",
		Type = "main",
		Icon = "warfare.png"
	},
	{
		Name = "armor",
		Type = "sub",
		Main = "warfare-2"
	},
	{
		Name = "grenade",
		Type = "sub",
		Main = "warfare-2"
	},
	{
		Name = "grenade-cluster",
		Type = "sub",
		Main = "warfare-2"
	},
	{
		Name = "mine",
		Type = "sub",
		Main = "warfare-2"
	},
	{
		Name = "gun",
		Type = "sub",
		Main = "warfare-2"
	},
	{
		Name = "equipment-solar",
		Type = "sub",
		Main = "warfare-2"
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