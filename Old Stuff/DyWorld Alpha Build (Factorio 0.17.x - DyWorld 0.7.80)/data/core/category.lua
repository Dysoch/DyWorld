require "data/prefix"

local Data_Table = {
	{
		Name = dy.."farming",
		Type = "recipe"
	},
	{
		Name = dy.."splicer",
		Type = "recipe"
	},
	{
		Name = dy.."compressor",
		Type = "recipe"
	},
	{
		Name = dy.."grinder",
		Type = "recipe"
	},
	{
		Name = dy.."electrolyser",
		Type = "recipe"
	},
	{
		Name = dy.."recombiner",
		Type = "recipe"
	},
	{
		Name = dy.."geodrill",
		Type = "recipe"
	},
	{
		Name = dy.."grenade-ammo",
		Type = "ammo"
	},
	{
		Name = dy.."recycling",
		Type = "recipe"
	},
	{
		Name = dy.."armor-remover",
		Type = "recipe"
	},
	{
		Name = dy.."blast-furnace",
		Type = "recipe"
	},
	{
		Name = dy.."forge",
		Type = "recipe"
	},
	{
		Name = dy.."ore-cleaning",
		Type = "recipe"
	},
	{
		Name = dy.."gear-crafting",
		Type = "recipe"
	},
	{
		Name = dy.."cable-crafting",
		Type = "recipe"
	},
	{
		Name = dy.."coil-crafting",
		Type = "recipe"
	},
	{
		Name = dy.."pcb-crafting",
		Type = "recipe"
	},
	{
		Name = dy.."tile-crafting",
		Type = "recipe"
	},
	{
		Name = dy.."tile-uncrafting",
		Type = "recipe"
	},
	{
		Name = "radiation",
		Type = "dmg"
	},
	{
		Name = "vehicle",
		Type = "equipment"
	},
}

function DyWorld_Damage_Type(NAME)
  local result =
  {
    type = "damage-type",
    name = NAME
  }
  return result
end

function DyWorld_Resource_Type(NAME)
  local result =
  {
    type = "resource-category",
    name = NAME
  }
  return result
end

function DyWorld_Recipe_Type(NAME)
  local result =
  {
    type = "recipe-category",
    name = NAME
  }
  return result
end

function DyWorld_Noise_Type(NAME)
  local result =
  {
    type = "noise-layer",
    name = NAME
  }
  return result
end

function DyWorld_Ammo_Type(NAME)
  local result =
  {
    type = "ammo-category",
    name = NAME
  }
  return result
end

function DyWorld_Equipment_Category(NAME)
  local result =
  {
    type = "equipment-category",
    name = NAME
  }
  return result
end

function DyWorld_Autoplace_Type(NAME)
  local result =
  {
    type = "autoplace-control",
    name = NAME,
    richness = true,
    order = NAME
  }
  return result
end

function DyWorld_Equipment_Grid_Type(NAME, WIDTH, HEIGHT)
  local result =
  {
    type = "equipment-grid",
    name = NAME,
    width = WIDTH,
    height = HEIGHT,
    equipment_categories = {"armor"}
  }
  return result
end

for k,v in pairs(Data_Table) do
	if v.Type == "dmg" then
		data:extend(
			{
				DyWorld_Damage_Type(v.Name)
			})
	elseif v.Type == "resource" then
		data:extend(
			{
				DyWorld_Resource_Type(v.Name)
			})
	elseif v.Type == "recipe" then
		data:extend(
			{
				DyWorld_Recipe_Type(v.Name)
			})
	elseif v.Type == "ammo" then
		data:extend(
			{
				DyWorld_Ammo_Type(v.Name)
			})
	elseif v.Type == "equipment" then
		data:extend(
			{
				DyWorld_Equipment_Category(v.Name)
			})
	elseif v.Type == "noise" then
		data:extend(
			{
				DyWorld_Noise_Type(v.Name)
			})
	elseif v.Type == "autoplace" then
		data:extend(
			{
				DyWorld_Autoplace_Type(v.Name)
			})
	elseif v.Type == "equipment_grid" then
		data:extend(
			{
				DyWorld_Equipment_Grid_Type(v.Name, v.Width, v.Height)
			})
	end
end