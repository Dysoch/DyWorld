require "data/prefix"

local Data_Table = {
	{
		Name = "chalcopyrite",
		Order = "e",
		Coverage = 0.004,
		Mining_Hardness = 3.75,
		Mining_Time = 1.5,
		Tint = Material_Colors.Copper,
		Starting_Area = true,
		Starting_Area_Strength = 2,
		Multiplier = 1.05,
	},
	{
		Name = "hematite",
		Order = "d",
		Coverage = 0.004,
		Mining_Hardness = 5,
		Mining_Time = 2.5,
		Tint = Material_Colors.Iron,
		Starting_Area = true,
		Starting_Area_Strength = 2.5,
		Multiplier = 1.04,
	},
	{
		Name = "galena",
		Order = "i",
		Coverage = 0.003,
		Mining_Hardness = 1.25,
		Mining_Time = 5,
		Tint = Material_Colors.Lead,
		Starting_Area = false,
		Starting_Area_Strength = 1,
		Multiplier = 1.01,
	},
	{
		Name = "prolycotherium",
		Order = "h",
		Coverage = 0.0035,
		Mining_Hardness = 8,
		Mining_Time = 10,
		Tint = Material_Colors.Tin,
		Starting_Area = false,
		Starting_Area_Strength = 1,
		Multiplier = 0.99,
	},
	{
		Name = "carbolycite",
		Order = "f",
		Coverage = 0.004,
		Mining_Hardness = 1.5,
		Mining_Time = 5,
		Tint = Material_Colors.Tungsten,
		Starting_Area = true,
		Starting_Area_Strength = 2.5,
		Multiplier = 1.05,
	},
	{
		Name = "bauxite",
		Order = "g",
		Coverage = 0.004,
		Mining_Hardness = 4.75,
		Mining_Time = 2.5,
		Tint = Material_Colors.Stone,
		Starting_Area = true,
		Starting_Area_Strength = 2,
		Multiplier = 1.03,
	},
	{
		Name = "radicium",
		Order = "c",
		Coverage = 0.003,
		Mining_Hardness = 6.5,
		Mining_Time = 15,
		Tint = Material_Colors.Uranium,
		Starting_Area = false,
		Starting_Area_Strength = 1,
		Multiplier = 0.98,
	},
}

function DyWorld_Ore_Peak(Input)
local Peak = {
      noise_layer = Input,
      noise_octaves_difference = -0.85,
      noise_persistence = 0.4
	}
	return Peak
end

Remove = {"iron-ore", "copper-ore", "uranium-ore", "stone", "coal"}
Controls = data.raw["autoplace-control"]
for k,m in pairs(Remove) do
	Controls[m] = nil
	--Controls[m].order = "z"
	--Controls[m].hidden = true
	--Controls[m].richness = false
end

--data.raw["map-gen-presets"]["default"]["death-world"] = nil
--data.raw["map-gen-presets"]["default"]["death-world-marathon"] = nil
data.raw["map-gen-presets"]["default"]["rail-world"] = nil
data.raw["map-gen-presets"]["default"]["rich-resources"] = nil

for k,v in pairs(Data_Table) do
data:extend(
{
  {
    type = "noise-layer",
    name = v.Name,
  },
  {
    type = "autoplace-control",
    name = v.Name,
    richness = true,
    order = v.Name,
    category = "resource",
  },
  {
    type = "resource",
    name = v.Name,
	icons = 
	{
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = v.Tint,
	  }
	},
	icon_size = 32,
    flags = {"placeable-neutral"},
    order = "a-b-"..v.Order,
    minable =
    {
      hardness = v.Mining_Hardness,
      mining_particle = "stone-particle",
      mining_time = v.Mining_Time,
      result = v.Name,
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      control = v.Name,
	  sharpness = 15/16,
      richness_multiplier = 1500 * v.Multiplier,
      richness_multiplier_distance_bonus = 20 * v.Multiplier,
      richness_base = 10 * v.Multiplier,
      coverage = (v.Coverage / 2.75) * v.Multiplier,
      peaks =
      {
        {
		  noise_layer = v.Name,
          noise_octaves_difference = -0.85,
          noise_persistence = 0.4
		},
      },
    },
    stage_counts = {5000, 3000, 1500, 800, 400, 100, 50, 10},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/iron-ore/iron-ore.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        frame_count = 8,
        variation_count = 8,
		tint = v.Tint,
        hr_version = {
          filename = "__base__/graphics/entity/iron-ore/hr-iron-ore.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5,
		  tint = v.Tint,
        }
      }
	},
    map_color = v.Tint,
  },
  {
    type = "item",
    name = v.Name,
	icons = 
	{
	  {
		icon = dyworld_path_icon.."ore/iron.png",
		tint = v.Tint
	  }
	},
	icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = dy.."metal-0-ore",
    stack_size = 200,
	order = v.Name,
  },
})
	if v.Starting_Area then
		data.raw["resource"][v.Name].autoplace.starting_area_size = 10 * v.Starting_Area_Strength
		data.raw["resource"][v.Name].autoplace.starting_area_amount = 1000 * v.Starting_Area_Strength
	end
	--[[if v.Name == "chalcopyrite" then
		table.insert(data.raw["resource"][v.Name].autoplace.peaks, DyWorld_Ore_Peak("carbolycite"))
	elseif v.Name == "hematite" then
		table.insert(data.raw["resource"][v.Name].autoplace.peaks, DyWorld_Ore_Peak("carbolycite"))
	elseif v.Name == "galena" then
		table.insert(data.raw["resource"][v.Name].autoplace.peaks, DyWorld_Ore_Peak("radicium"))
	elseif v.Name == "prolycotherium" then
		table.insert(data.raw["resource"][v.Name].autoplace.peaks, DyWorld_Ore_Peak("bauxite"))
	elseif v.Name == "carbolycite" then
		table.insert(data.raw["resource"][v.Name].autoplace.peaks, DyWorld_Ore_Peak("radicium"))
	elseif v.Name == "bauxite" then
		table.insert(data.raw["resource"][v.Name].autoplace.peaks, DyWorld_Ore_Peak("prolycotherium"))
	elseif v.Name == "radicium" then
		table.insert(data.raw["resource"][v.Name].autoplace.peaks, DyWorld_Ore_Peak("galena"))
	end]]--
end	

data:extend(
{
  {
	type = "recipe",
	name = "chalcopyrite-smelting",
	energy_required = 3,
	enabled = true,
	category = "smelting",
	ingredients = {{"chalcopyrite", 3}},
	result = "copper-plate",
	result_count = 1,
  },
  {
	type = "recipe",
	name = "hematite-smelting",
	energy_required = 3,
	enabled = true,
	category = "smelting",
	ingredients = {{"hematite", 4}},
	result = "iron-plate",
	result_count = 1,
  },
  {
	type = "recipe",
	name = "bauxite-smelting",
	energy_required = 3,
	enabled = true,
	category = "smelting",
	ingredients = {{"bauxite", 2}},
	result = "stone",
	result_count = 1,
  },
})

data.raw.resource["copper-ore"].autoplace = nil
data.raw.resource["iron-ore"].autoplace = nil
data.raw.resource["uranium-ore"].autoplace = nil
data.raw.resource["coal"].autoplace = nil
data.raw.resource["stone"].autoplace = nil

data.raw.item["carbolycite"].fuel_category = "chemical"
data.raw.item["carbolycite"].fuel_value = "8MJ"
	
