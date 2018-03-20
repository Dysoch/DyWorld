
local dy = "dyworld-"
local dyworld_path_item_group = "__DyWorld__/graphics/item-group/"

Data_Table_Item_Group = {
	{
		Name = "machines",
		Type = "main",
		Icon = "machines.png"
	},
	{
		Name = "assembling-burner",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "assembling-electric",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "assembling-special",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "assembling-special-recycler",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "assembling-special-circuit",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "assembling-special-chemistry",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "furnace-burner",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "furnace-electric",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "extraction-burner",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "drills-electric",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "drills-burner",
		Type = "sub",
		Main = "machines"
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