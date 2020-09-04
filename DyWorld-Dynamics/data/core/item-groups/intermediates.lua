

local Data_Table_Item_Group = {
	{
		Name = "intermediates",
		Type = "main",
		Icon = "items.png"
	},
	{
		Name = "intermediates-tier-0", -- 1
		Type = "sub",
		Main = "intermediates"
	},
	{
		Name = "intermediates-tier-1", -- 2
		Type = "sub",
		Main = "intermediates"
	},
	{
		Name = "intermediates-tier-2", -- 3
		Type = "sub",
		Main = "intermediates"
	},
	{
		Name = "intermediates-tier-3", -- 4
		Type = "sub",
		Main = "intermediates"
	},
	{
		Name = "intermediates-tier-4", -- 5
		Type = "sub",
		Main = "intermediates"
	},
	{
		Name = "intermediates-tier-5", -- 6
		Type = "sub",
		Main = "intermediates"
	},
	{
		Name = "intermediates-tier-6", -- 7
		Type = "sub",
		Main = "intermediates"
	},
	{
		Name = "intermediates-tier-7", -- 8
		Type = "sub",
		Main = "intermediates"
	},
	{
		Name = "intermediates-tier-8", -- 9
		Type = "sub",
		Main = "intermediates"
	},
	{
		Name = "intermediates-tier-9", -- 10
		Type = "sub",
		Main = "intermediates"
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