require "data/core/functions/prefix"
require "data/core/functions/colors"

local Data_Table = {
	{
		Name = "stone",
		Name_Ore = "stone",
		Order = "d",
		Coverage = 0.0042,
		Mining_Time = 1,
		Starting_Area = true,
		Starting_Area_Strength = 1.25,
		Multiplier = 1.02,
	},
	{
		Name = "coal",
		Name_Ore = "coal",
		Order = "d",
		Coverage = 0.0037,
		Mining_Time = 1,
		Starting_Area = true,
		Starting_Area_Strength = 1.25,
		Multiplier = 1.02,
	},
	{
		Name = "iron",
		Name_Ore = "iron-ore",
		Order = "d",
		Coverage = 0.0047,
		Mining_Time = 1.5,
		Starting_Area = true,
		Starting_Area_Strength = 1.25,
		Multiplier = 1.04,
	},
	{
		Name = "copper",
		Name_Ore = "copper-ore",
		Order = "d",
		Coverage = 0.0047,
		Mining_Time = 1,
		Starting_Area = true,
		Starting_Area_Strength = 1.25,
		Multiplier = 1.04,
	},
	{
		Name = "nickel",
		Name_Ore = "nickel-ore",
		Order = "e",
		Coverage = 0.0037,
		Mining_Time = 3,
		Starting_Area = true,
		Starting_Area_Strength = 1.15,
		Multiplier = 0.99,
	},
	{
		Name = "silver",
		Name_Ore = "silver-ore",
		Order = "e",
		Coverage = 0.0037,
		Mining_Time = 3,
		Starting_Area = true,
		Starting_Area_Strength = 1.15,
		Multiplier = 0.99,
	},
	{
		Name = "tin",
		Name_Ore = "tin-ore",
		Order = "e",
		Coverage = 0.0037,
		Mining_Time = 3,
		Starting_Area = true,
		Starting_Area_Strength = 1.05,
		Multiplier = 0.99,
	},
	{
		Name = "gold",
		Name_Ore = "gold-ore",
		Order = "f",
		Coverage = 0.0035,
		Mining_Time = 5,
		Multiplier = 0.97,
	},
	{
		Name = "lead",
		Name_Ore = "lead-ore",
		Order = "f",
		Coverage = 0.0035,
		Mining_Time = 5,
		Multiplier = 0.97,
	},
	{
		Name = "cobalt",
		Name_Ore = "cobalt-ore",
		Order = "f",
		Coverage = 0.0033,
		Mining_Time = 7,
		Multiplier = 0.97,
	},
	{
		Name = "arditium",
		Name_Ore = "arditium-ore",
		Order = "f",
		Coverage = 0.0031,
		Mining_Time = 9,
		Multiplier = 0.95,
	},
	{
		Name = "titanium",
		Name_Ore = "titanium-ore",
		Order = "f",
		Coverage = 0.0029,
		Mining_Time = 11,
		Multiplier = 0.90,
	},
	{
		Name = "tungsten",
		Name_Ore = "tungsten-ore",
		Order = "f",
		Coverage = 0.0029,
		Mining_Time = 11,
		Multiplier = 0.90,
	},
	{
		Name = "neutronium",
		Name_Ore = "neutronium-ore",
		Order = "f",
		Coverage = 0.0025,
		Mining_Time = 15,
		Multiplier = 0.90,
	},
}

for k,v in pairs(Data_Table) do
if not data.raw["noise-layer"][v.Name_Ore] then
data:extend(
{
  {
    type = "noise-layer",
    name = v.Name_Ore,
  },
})
end
if not data.raw["autoplace-control"][v.Name_Ore] then
data:extend(
{
  {
    type = "autoplace-control",
    name = v.Name_Ore,
    richness = true,
    order = v.Name_Ore,
    category = "resource",
  },
})
end
data:extend(
{
  {
    type = "resource",
    name = v.Name_Ore,
	localised_name = {"looped-name.ore", {"looped-name."..v.Name}},
	icons = 
	{
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = Material_Colors[v.Name],
	  }
	},
	icon_size = 32,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    flags = {"placeable-neutral"},
    order = "b-"..v.Order,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = v.Mining_Time,
      result = v.Name_Ore,
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      control = v.Name_Ore,
	  sharpness = 15/16,
      richness_multiplier = 1500 * v.Multiplier,
      richness_multiplier_distance_bonus = 20 * v.Multiplier,
      richness_base = 10 * v.Multiplier,
      coverage = (v.Coverage / 2.75) * v.Multiplier,
      peaks =
      {
        {
		  noise_layer = v.Name_Ore,
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
})
if not data.raw.item[v.Name_Ore] then
data:extend(
{
  {
    type = "item",
    name = v.Name_Ore,
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
	order = v.Name_Ore,
  },
})
end
	if v.Starting_Area then
		data.raw["resource"][v.Name_Ore].autoplace.starting_area_size = 10 * v.Starting_Area_Strength
		data.raw["resource"][v.Name_Ore].autoplace.starting_area_amount = 1000 * v.Starting_Area_Strength
	end
	if v.Name == "stone" then
		data.raw["resource"][v.Name_Ore].localised_name = {"looped-name."..v.Name}
	end
end	
