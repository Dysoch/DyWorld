require "data/prefix"

Data_Table_Item_Group = {
	{
		Name = "machines",
		Type = "main",
		Icon = "machines.png"
	},
	{
		Name = "energy",
		Type = "main",
		Icon = "energy.png"
	},
	{
		Name = "warfare",
		Type = "main",
		Icon = "warfare.png"
	},
	{
		Name = "items",
		Type = "main",
		Icon = "items.png"
	},
	{
		Name = "logistics",
		Type = "main",
		Icon = "logistics.png"
	},
	{
		Name = "personal",
		Type = "main",
		Icon = "personal.png"
	},
	{
		Name = "accumulator",
		Type = "sub",
		Main = "energy"
	},
	{
		Name = "ammo-basic",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "ammo-electric",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "ammo-sniper",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "backpack",
		Type = "sub",
		Main = "personal"
	},
	{
		Name = "armor",
		Type = "sub",
		Main = "warfare"
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
		Name = "gun",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "lab",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "lab-tool",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "intermediates",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "seeds",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "food-raw",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "food-cooked",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "hydration",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "oxygen",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "debug",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "chest-storage",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "extraction-burner",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "extraction-electric",
		Type = "sub",
		Main = "machines"
	},
	{
		Name = "radar",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "roboport-construction",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "roboport-logistic",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "robot-construction",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "robot-logistic",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "solar",
		Type = "sub",
		Main = "energy"
	},
	{
		Name = "tools",
		Type = "sub",
		Main = "personal"
	},
	{
		Name = "transport-belt",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "transport-splitter",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "transport-underground",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "turret-gun",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "turret-laser",
		Type = "sub",
		Main = "warfare"
	},
	{
		Name = "module-speed",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "module-productivity",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "module-effectivity",
		Type = "sub",
		Main = "items"
	},
	{
		Name = "inserter-fast",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "inserter-long",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "inserter-stack",
		Type = "sub",
		Main = "logistics"
	},
	{
		Name = "railway",
		Type = "sub",
		Main = "logistics"
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