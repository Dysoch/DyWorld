

local Data_Table_Item_Group = {
	{
		Name = "machine-production",
		Type = "main",
		Icon = "machines.png"
	},
	{
		Name = "burner-machines",
		Type = "sub",
		Main = "machine-production"
	},
	{
		Name = "assemblers",
		Type = "sub",
		Main = "machine-production"
	},
	{
		Name = "greenhouse",
		Type = "sub",
		Main = "machine-production"
	},
	{
		Name = "air-filter",
		Type = "sub",
		Main = "machine-production"
	},
	{
		Name = "miners",
		Type = "sub",
		Main = "machine-production"
	},
	{
		Name = "furnaces",
		Type = "sub",
		Main = "machine-production"
	},
	{
		Name = "centrifuge",
		Type = "sub",
		Main = "machine-production"
	},
	{
		Name = "oil-machines",
		Type = "sub",
		Main = "machine-production"
	},
	{
		Name = "rocket-silo",
		Type = "sub",
		Main = "machine-production"
	},
	-- Unused --
	{
		Name = "oil-pumps",
		Type = "sub",
		Main = "machine-production"
	},
	{
		Name = "chemical-plants",
		Type = "sub",
		Main = "machine-production"
	},
	{
		Name = "oil-refinery",
		Type = "sub",
		Main = "machine-production"
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