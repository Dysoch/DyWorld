require "data/core/functions/prefix"
require "data/core/functions/colors"

local noise = require("noise");
local tne = noise.to_noise_expression;
local resource_autoplace = require("resource-autoplace");

local Data_Table = {
	{
		Name = "stone",
		Name_Ore = "stone",
		Order = "b",
		Mining_Time = 1,
		Starting_Area = true,
		Starting_Area_Rq_Factor = 1.35,
		Rq_Factor = 1.06,
		Base_Density = 24,
	},
	{
		Name = "coal",
		Name_Ore = "coal",
		Order = "b",
		Mining_Time = 1,
		Starting_Area = true,
		Starting_Area_Rq_Factor = 1.25,
		Rq_Factor = 1.12,
		Base_Density = 12,
	},
	{
		Name = "iron",
		Name_Ore = "iron-ore",
		Order = "b",
		Mining_Time = 1.5,
		Starting_Area = true,
		Starting_Area_Rq_Factor = 1.5,
		Rq_Factor = 1.11,
		Base_Density = 15,
	},
	{
		Name = "copper",
		Name_Ore = "copper-ore",
		Order = "b",
		Mining_Time = 1,
		Starting_Area = true,
		Starting_Area_Rq_Factor = 1.45,
		Rq_Factor = 1.08,
		Base_Density = 13,
	},
	{
		Name = "nickel",
		Name_Ore = "nickel-ore",
		Order = "d",
		Mining_Time = 3,
		Starting_Area = true,
		Starting_Area_Rq_Factor = 1.32,
		Rq_Factor = 1.04,
		Base_Density = 12,
	},
	{
		Name = "silver",
		Name_Ore = "silver-ore",
		Order = "d",
		Mining_Time = 3,
		Starting_Area = true,
		Starting_Area_Rq_Factor = 1.27,
		Rq_Factor = 1.03,
		Base_Density = 8,
	},
	{
		Name = "tin",
		Name_Ore = "tin-ore",
		Order = "d",
		Mining_Time = 3,
		Starting_Area = true,
		Starting_Area_Rq_Factor = 1.41,
		Rq_Factor = 1.06,
		Base_Density = 9,
	},
	{
		Name = "gold",
		Name_Ore = "gold-ore",
		Order = "e",
		Mining_Time = 5,
		Starting_Area = false,
		Starting_Area_Rq_Factor = 0,
		Rq_Factor = 1.02,
		Base_Density = 5,
	},
	{
		Name = "lead",
		Name_Ore = "lead-ore",
		Order = "e",
		Mining_Time = 5,
		Starting_Area = false,
		Starting_Area_Rq_Factor = 0,
		Rq_Factor = 1.08,
		Base_Density = 12,
	},
	{
		Name = "cobalt",
		Name_Ore = "cobalt-ore",
		Order = "e",
		Mining_Time = 7,
		Starting_Area = false,
		Starting_Area_Rq_Factor = 0,
		Rq_Factor = 1.02,
		Base_Density = 10,
	},
	{
		Name = "arditium",
		Name_Ore = "arditium-ore",
		Order = "e",
		Mining_Time = 9,
		Starting_Area = false,
		Starting_Area_Rq_Factor = 0,
		Rq_Factor = 1.08,
		Base_Density = 15,
	},
	{
		Name = "titanium",
		Name_Ore = "titanium-ore",
		Order = "e",
		Mining_Time = 11,
		Starting_Area = false,
		Starting_Area_Rq_Factor = 0,
		Rq_Factor = 1.034,
		Base_Density = 11,
	},
	{
		Name = "tungsten",
		Name_Ore = "tungsten-ore",
		Order = "e",
		Mining_Time = 11,
		Starting_Area = false,
		Starting_Area_Rq_Factor = 0,
		Rq_Factor = 1.045,
		Base_Density = 12,
	},
	{
		Name = "neutronium",
		Name_Ore = "neutronium-ore",
		Order = "e",
		Mining_Time = 15,
		Starting_Area = false,
		Starting_Area_Rq_Factor = 0,
		Rq_Factor = 1.01,
		Base_Density = 25,
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
		tint = Material_Colors[v.Name],
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

-- Initialize the core patch sets in a predictable order
resource_autoplace.initialize_patch_set(v.Name_Ore, v.Starting_Area)

local function autoplace_settings(name, order, coverage)
  return
  {
    order = order,
    control = name,
    sharpness = 15/16,
    richness_multiplier = 1500,
    richness_multiplier_distance_bonus = 20,
    richness_base = 10,
    coverage = coverage,
    peaks =
    {
      {
        noise_layer = name,
        noise_octaves_difference = -0.85,
        noise_persistence = 0.4
      }
    },
    starting_area_size = 5500 * coverage,
    starting_area_amount = 1600
  }
end

local function resource(resource_parameters, autoplace_parameters)
  if coverage == nil then coverage = 0.02 end

  return
  {
    type = "resource",
    name = resource_parameters.name_ore,
	localised_name = {"looped-name.ore", {"looped-name."..resource_parameters.name}},
	icons = 
	{
	  {
		icon = dyworld_path_icon.."base-ore.png",
		tint = Material_Colors[resource_parameters.name],
	  }
	},
    icon_size = 32,
    flags = {"placeable-neutral"},
    order = "a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = resource_parameters.mining_time,
	  results = {
            {name = resource_parameters.name_ore, amount_min = 1, amount_max = 1, probability = 1},
            --{name = v.Name_Ore, amount_min = 1, amount_max = 1, probability = 0.45},
        },
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    -- autoplace = autoplace_settings(name, order, coverage),
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = resource_parameters.name_ore,
      order = resource_parameters.order,
      base_density = autoplace_parameters.base_density,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
      candidate_spot_count = autoplace_parameters.candidate_spot_count,
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
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
		tint = Material_Colors[resource_parameters.name],
        hr_version = {
          filename = "__base__/graphics/entity/iron-ore/hr-iron-ore.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5,
		  tint = Material_Colors[resource_parameters.name],
        }
      }
	},
    map_color = resource_parameters.map_color
  }
end

data:extend(
{
  resource(
    {
      name = v.Name,
      name_ore = v.Name_Ore,
      order = v.Order,
      map_color = Material_Colors[v.Name],
      mining_time = v.Mining_Time,
    },
    {
      base_density = v.Base_Density,
      regular_rq_factor_multiplier = v.Rq_Factor,
      starting_rq_factor_multiplier = v.Starting_Area_Rq_Factor,
    }
  ),
}
)
end

INSERT = {name = "sand", amount_min = 1, amount_max = 1, probability = 0.05}
table.insert(data.raw["resource"]["stone"].minable.results, INSERT)
INSERT = {name = "sulfur", amount_min = 1, amount_max = 3, probability = 0.025}
table.insert(data.raw["resource"]["coal"].minable.results, INSERT)
