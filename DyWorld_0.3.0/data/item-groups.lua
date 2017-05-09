require "data/prefix"

Data_Table_Item_Group = {
	{
		Name = dyworld_prefix.."machines",
		Type = "main"
	},
	{
		Name = dyworld_prefix.."energy",
		Type = "main"
	},
	{
		Name = dyworld_prefix.."warfare",
		Type = "main"
	},
	{
		Name = dyworld_prefix.."items",
		Type = "main"
	},
	{
		Name = dyworld_prefix.."logistics",
		Type = "main"
	},
	{
		Name = dyworld_prefix.."personal",
		Type = "main"
	},
	{
		Name = dyworld_prefix.."accumulator",
		Type = "sub",
		Main = dyworld_prefix.."energy"
	},
	{
		Name = dyworld_prefix.."ammo-basic",
		Type = "sub",
		Main = dyworld_prefix.."warfare"
	},
	{
		Name = dyworld_prefix.."ammo-electric",
		Type = "sub",
		Main = dyworld_prefix.."warfare"
	},
	{
		Name = dyworld_prefix.."ammo-sniper",
		Type = "sub",
		Main = dyworld_prefix.."warfare"
	},
	{
		Name = dyworld_prefix.."backpack",
		Type = "sub",
		Main = dyworld_prefix.."personal"
	},
	{
		Name = dyworld_prefix.."armor",
		Type = "sub",
		Main = dyworld_prefix.."warfare"
	},
	{
		Name = dyworld_prefix.."assembling",
		Type = "sub",
		Main = dyworld_prefix.."machines"
	},
	{
		Name = dyworld_prefix.."furnace",
		Type = "sub",
		Main = dyworld_prefix.."machines"
	},
	{
		Name = dyworld_prefix.."gun",
		Type = "sub",
		Main = dyworld_prefix.."warfare"
	},
	{
		Name = dyworld_prefix.."lab",
		Type = "sub",
		Main = dyworld_prefix.."machines"
	},
	{
		Name = dyworld_prefix.."lab-tool",
		Type = "sub",
		Main = dyworld_prefix.."items"
	},
	{
		Name = dyworld_prefix.."chest-storage",
		Type = "sub",
		Main = dyworld_prefix.."logistics"
	},
	{
		Name = dyworld_prefix.."extraction",
		Type = "sub",
		Main = dyworld_prefix.."machines"
	},
	{
		Name = dyworld_prefix.."radar",
		Type = "sub",
		Main = dyworld_prefix.."warfare"
	},
	{
		Name = dyworld_prefix.."roboport",
		Type = "sub",
		Main = dyworld_prefix.."logistics"
	},
	{
		Name = dyworld_prefix.."robot-construction",
		Type = "sub",
		Main = dyworld_prefix.."logistics"
	},
	{
		Name = dyworld_prefix.."robot-logistic",
		Type = "sub",
		Main = dyworld_prefix.."logistics"
	},
	{
		Name = dyworld_prefix.."solar",
		Type = "sub",
		Main = dyworld_prefix.."energy"
	},
	{
		Name = dyworld_prefix.."tools",
		Type = "sub",
		Main = dyworld_prefix.."personal"
	},
	{
		Name = dyworld_prefix.."transport-belts",
		Type = "sub",
		Main = dyworld_prefix.."logistics"
	},
	{
		Name = dyworld_prefix.."turret-gun",
		Type = "sub",
		Main = dyworld_prefix.."warfare"
	},
	{
		Name = dyworld_prefix.."turret-laser",
		Type = "sub",
		Main = dyworld_prefix.."warfare"
	},
	{
		Name = dyworld_prefix.."module-speed",
		Type = "sub",
		Main = dyworld_prefix.."items"
	},
	{
		Name = dyworld_prefix.."module-productivity",
		Type = "sub",
		Main = dyworld_prefix.."items"
	},
	{
		Name = dyworld_prefix.."module-effectivity",
		Type = "sub",
		Main = dyworld_prefix.."items"
	},
}

function DyWorld_Item_Main_Group(NAME)
  local result =
  {
    type = "item-group",
    name = NAME,
    icon = "__core__/graphics/questionmark.png",
    icon_size = 64,
    order = "z-"..NAME,
  }
  return result
end

function DyWorld_Item_Sub_Group(NAME, MAIN)
  local result =
  {
    type = "item-subgroup",
    name = NAME,
    group = MAIN,
    order = NAME
  }
  return result
end

for k,v in pairs(Data_Table_Item_Group) do
	if v.Type == "main" then
		data:extend(
			{
				DyWorld_Item_Main_Group(v.Name)
			})
	elseif v.Type == "sub" then
		data:extend(
			{
				DyWorld_Item_Sub_Group(v.Name, v.Main)
			})
	end
end