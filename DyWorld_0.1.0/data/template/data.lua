require "data/prefix"

Data_Table_Data = {
	{
		Name = "sniper",
		Type = "ammo"
	},
	{
		Name = "electric",
		Type = "ammo"
	},
	{
		Name = dyworld_prefix.."armor-01",
		Type = "equipment_grid",
		Width = 15,
		Height = 10,
	},
	{
		Name = dyworld_prefix.."armor-02",
		Type = "equipment_grid",
		Width = 15,
		Height = 15,
	},
	{
		Name = dyworld_prefix.."armor-03",
		Type = "equipment_grid",
		Width = 20,
		Height = 15,
	},
	{
		Name = dyworld_prefix.."armor-04",
		Type = "equipment_grid",
		Width = 20,
		Height = 20,
	},
	{
		Name = dyworld_prefix.."armor-05",
		Type = "equipment_grid",
		Width = 25,
		Height = 20,
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

for k,v in pairs(Data_Table_Data) do
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