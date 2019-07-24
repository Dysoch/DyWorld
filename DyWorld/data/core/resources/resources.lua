require "data/core/functions/prefix"
require "data/core/functions/colors"

local Data_Table = {
	{
		Name = "nickel",
		Order = "e",
		Coverage = 0.004,
		Mining_Time = 3,
		Starting_Area = true,
		Starting_Area_Strength = 2,
		Multiplier = 1.05,
	},
	{
		Name = "silver",
		Order = "e",
		Coverage = 0.004,
		Mining_Time = 3,
		Starting_Area = true,
		Starting_Area_Strength = 1.5,
		Multiplier = 1,
	},
	{
		Name = "tin",
		Order = "h",
		Coverage = 0.004,
		Mining_Time = 3,
		Starting_Area = true,
		Starting_Area_Strength = 1,
		Multiplier = 1,
	},
	{
		Name = "gold",
		Order = "h",
		Coverage = 0.0035,
		Mining_Time = 5,
		Starting_Area = false,
		Starting_Area_Strength = 1,
		Multiplier = 0.97,
	},
	{
		Name = "lead",
		Order = "h",
		Coverage = 0.0035,
		Mining_Time = 5,
		Starting_Area = false,
		Starting_Area_Strength = 1,
		Multiplier = 0.97,
	},
	{
		Name = "cobalt",
		Order = "h",
		Coverage = 0.0033,
		Mining_Time = 7,
		Starting_Area = false,
		Starting_Area_Strength = 1,
		Multiplier = 0.97,
	},
	{
		Name = "arditium",
		Order = "h",
		Coverage = 0.0031,
		Mining_Time = 9,
		Starting_Area = false,
		Starting_Area_Strength = 1,
		Multiplier = 0.95,
	},
	{
		Name = "titanium",
		Order = "h",
		Coverage = 0.0029,
		Mining_Time = 11,
		Starting_Area = false,
		Starting_Area_Strength = 1,
		Multiplier = 0.90,
	},
	{
		Name = "tungsten",
		Order = "h",
		Coverage = 0.0029,
		Mining_Time = 11,
		Starting_Area = false,
		Starting_Area_Strength = 1,
		Multiplier = 0.90,
	},
	{
		Name = "neutronium",
		Order = "h",
		Coverage = 0.0025,
		Mining_Time = 15,
		Starting_Area = false,
		Starting_Area_Strength = 1,
		Multiplier = 0.90,
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

for k,v in pairs(Data_Table) do
data:extend(
{
  {
    type = "noise-layer",
    name = v.Name.."-ore",
  },
  {
    type = "autoplace-control",
    name = v.Name.."-ore",
    richness = true,
    order = v.Name.."-ore",
    category = "resource",
  },
  {
    type = "resource",
    name = v.Name.."-ore",
	localised_name = {"looped-name.ore", {"looped-name."..v.Name}},
	icons = 
	{
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = Material_Colors[v.Name],
	  }
	},
	icon_size = 32,
    flags = {"placeable-neutral"},
    order = "a-b-"..v.Order,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = v.Mining_Time,
      result = v.Name.."-ore",
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      control = v.Name.."-ore",
	  sharpness = 15/16,
      richness_multiplier = 1500 * v.Multiplier,
      richness_multiplier_distance_bonus = 20 * v.Multiplier,
      richness_base = 10 * v.Multiplier,
      coverage = (v.Coverage / 2.75) * v.Multiplier,
      peaks =
      {
        {
		  noise_layer = v.Name.."-ore",
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
		tint = Material_Colors[v.Name],
        hr_version = {
          filename = "__base__/graphics/entity/iron-ore/hr-iron-ore.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5,
		  tint = Material_Colors[v.Name],
        }
      }
	},
    map_color = Material_Colors[v.Name],
  },
  {
    type = "item",
    name = v.Name.."-ore",
	localised_name = {"looped-name.ore", {"looped-name."..v.Name}},
	icons = 
	{
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = v.Tint
	  }
	},
	icon_size = 32,
	flags = {},
    subgroup = dy.."0-resource",
    stack_size = 200,
	order = v.Name.."-ore",
  },
})
	if v.Starting_Area then
		data.raw["resource"][v.Name.."-ore"].autoplace.starting_area_size = 10 * v.Starting_Area_Strength
		data.raw["resource"][v.Name.."-ore"].autoplace.starting_area_amount = 1000 * v.Starting_Area_Strength
	end
end	
