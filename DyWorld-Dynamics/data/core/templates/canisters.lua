


for k,v in pairs(data.raw.fluid) do
	if v.auto_canister then
		DyDS_Add_Tool({
			name = "canister-"..v.name,
			localised_name = {"looped-name.canister-filled", {"fluid-name."..v.name}},
			icons = {
				{
					icon = data.raw.tool["canister-empty"].icon,
				},
				{
					icon = data.raw.fluid[v.name].icon,
					scale = 0.3,
					offset = {-8, -8},
				},
			},
			order = v.name,
			stack_size = 10,
			durability = 1,
			subgroup = DyDs.."z-canisters",
		})
	table.insert(data.raw.lab["lab-2"].inputs, "canister-"..v.name)
data:extend({
  {
    type = "recipe",
    name = "canister-"..v.name,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "canister-empty", amount = 2},
        {type = "fluid", name = v.name, amount = 400},
      },
      result = "canister-"..v.name,
	  result_count = 2,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "empty-canister-"..v.name,
	category = "centrifuging",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "canister-"..v.name, amount = 1},
      },
      results =
      {
        {type = "item", name = "canister-empty", amount = 1, probability = 0.99},
        {type = "fluid", name = v.name, amount = 400},
      },
	  energy_required = 2.5,
	  enabled = false,
	  main_product = v.name,
    },
  },
})
	DyWorld_Add_To_Tech("fluids-"..v.auto_canister_tier, "canister-"..v.name)
	DyWorld_Add_To_Tech("fluids-"..v.auto_canister_tier, "empty-canister-"..v.name)
	end
end

--[[

-- This auto-generates barrel items and fill/empty recipes for every fluid defined that doesn't have "auto_barrel = false".

-- The technology the barrel unlocks will be added to
local technology_name = "fluid-handling"
-- The base empty barrel item
local empty_barrel_name = "empty-barrel"

-- Item icon masks
local barrel_side_mask = "__base__/graphics/icons/fluid/barreling/barrel-side-mask.png"
local barrel_hoop_top_mask = "__base__/graphics/icons/fluid/barreling/barrel-hoop-top-mask.png"

-- Recipe icon masks
local barrel_empty_icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png"
local barrel_empty_side_mask = "__base__/graphics/icons/fluid/barreling/barrel-empty-side-mask.png"
local barrel_empty_top_mask = "__base__/graphics/icons/fluid/barreling/barrel-empty-top-mask.png"
local barrel_fill_icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png"
local barrel_fill_side_mask = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png"
local barrel_fill_top_mask = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png"

-- Alpha used for barrel masks
local side_alpha = 0.75
local top_hoop_alpha = 0.75
-- Fluid required per barrel recipe
local fluid_per_barrel = 50
-- Crafting energy per barrel fill recipe
local energy_per_fill = 0.2
-- Crafting energy per barrel empty recipe
local energy_per_empty = 0.2

local function get_technology(name)
  local technologies = data.raw["technology"]
  if technologies then
    return technologies[name]
  end
  return nil
end

local function get_item(name)
  local items = data.raw["item"]
  if items then
    return items[name]
  end
  return nil
end

local function get_recipes_for_barrel(name)
  local recipes = data.raw["recipe"]
  if recipes then
    return recipes["fill-" .. name], recipes["empty-" .. name]
  end
  return nil
end

local function generate_barrel_icons(fluid, base_icon, side_mask, top_mask)
  return
  {
    {
      icon = base_icon.icon or base_icon,
      icon_size = base_icon.icon_size or 64,
      icon_mipmaps = base_icon.icon_mipmaps or 4
    },
    {
      icon = side_mask,
      icon_size = 64,
      icon_mipmaps = 4,
      tint = util.get_color_with_alpha(fluid.base_color, side_alpha, true)
    },
    {
      icon = top_mask,
      icon_size = 64,
      icon_mipmaps = 4,
      tint = util.get_color_with_alpha(fluid.flow_color, top_hoop_alpha, true)
    }
  }
end

-- Generates a barrel item with the provided name and fluid definition using the provided empty barrel stack size
local function create_barrel_item(name, fluid, empty_barrel_item)
  local result =
  {
    type = "item",
    name = name,
    localised_name = {"item-name.filled-barrel", fluid.localised_name or {"fluid-name." .. fluid.name}},
    icons = generate_barrel_icons(fluid, empty_barrel_item, barrel_side_mask, barrel_hoop_top_mask),
    icon_size = empty_barrel_item.icon_size,
    icon_mipmaps = empty_barrel_item.icon_mipmaps,
    subgroup = "barrel",
    order = "b[" .. name .. "]",
    stack_size = empty_barrel_item.stack_size
  }

  data:extend({result})
  return result
end

local function get_or_create_barrel_item(name, fluid, empty_barrel_item)
  local existing_item = get_item(name)
  if existing_item then
    return existing_item
  end

  return create_barrel_item(name, fluid, empty_barrel_item)
end

local function generate_barrel_recipe_icons(fluid, base_icon, side_mask, top_mask, fluid_icon_shift)
  local icons = generate_barrel_icons(fluid, base_icon, side_mask, top_mask)
  if fluid.icon and fluid.icon_size then
    table.insert(icons,
    {
      icon = fluid.icon,
      icon_size = fluid.icon_size,
      icon_mipmaps = fluid.icon_mipmaps,
      scale = 16.0 / fluid.icon_size, -- scale = 0.5 * 32 / icon_size simplified
      shift = fluid_icon_shift
    }
    )
  elseif fluid.icons then
    icons = util.combine_icons(icons, fluid.icons, {scale = 0.5, shift = fluid_icon_shift}, fluid.icon_size)
  end

  return icons
end

-- Creates a recipe to fill the provided barrel item with the provided fluid
local function create_fill_barrel_recipe(item, fluid)
  local recipe =
  {
    type = "recipe",
    name = "fill-" .. item.name,
    localised_name = {"recipe-name.fill-barrel", fluid.localised_name or {"fluid-name." .. fluid.name}},
    category = "crafting-with-fluid",
    energy_required = energy_per_fill,
    subgroup = "fill-barrel",
    order = "b[fill-" .. item.name .. "]",
    enabled = false,
    icons = generate_barrel_recipe_icons(fluid, barrel_fill_icon, barrel_fill_side_mask, barrel_fill_top_mask, {-8, -8}),
    icon_size = 64, icon_mipmaps = 4,
    ingredients =
    {
      {type = "fluid", name = fluid.name, amount = fluid_per_barrel, catalyst_amount = fluid_per_barrel},
      {type = "item", name = empty_barrel_name, amount = 1, catalyst_amount = 1}
    },
    results=
    {
      {type = "item", name = item.name, amount = 1, catalyst_amount = 1}
    },
    allow_decomposition = false
  }

  data:extend({recipe})
  return recipe
end

-- Creates a recipe to empty the provided full barrel item producing the provided fluid
local function create_empty_barrel_recipe(item, fluid)
  local recipe =
  {
    type = "recipe",
    name = "empty-" .. item.name,
    localised_name = {"recipe-name.empty-filled-barrel", fluid.localised_name or {"fluid-name." .. fluid.name}},
    category = "crafting-with-fluid",
    energy_required = energy_per_empty,
    subgroup = "empty-barrel",
    order = "c[empty-" .. item.name .. "]",
    enabled = false,
    icons = generate_barrel_recipe_icons(fluid, barrel_empty_icon, barrel_empty_side_mask, barrel_empty_top_mask, {7, 8}),
    icon_size = 64, icon_mipmaps = 4,
    ingredients =
    {
      {type = "item", name = item.name, amount = 1, catalyst_amount = 1}
    },
    results=
    {
      {type = "fluid", name = fluid.name, amount = fluid_per_barrel, catalyst_amount = fluid_per_barrel},
      {type = "item", name = empty_barrel_name, amount = 1, catalyst_amount = 1}
    },
    allow_decomposition = false
  }

  data:extend({recipe})
  return recipe
end

local function get_or_create_barrel_recipes(item, fluid)
  local fill_recipe, empty_recipe = get_recipes_for_barrel(item.name)

  if not fill_recipe then
    fill_recipe = create_fill_barrel_recipe(item, fluid)
  end
  if not empty_recipe then
    empty_recipe = create_empty_barrel_recipe(item, fluid)
  end

  return fill_recipe, empty_recipe
end

-- Adds the provided barrel recipe and fill/empty recipes to the technology as recipe unlocks if they don't already exist
local function add_barrel_to_technology(fill_recipe, empty_recipe, technology)
  local unlock_key = "unlock-recipe"
  local effects = technology.effects

  if not effects then
    technology.effects = {}
    effects = technology.effects
  end

  local add_fill_recipe = true
  local add_empty_recipe = true

  for k,v in pairs(effects) do
    if k == unlock_key then
      local recipe = v.recipe
      if recipe == fill_recipe.name then
        add_fill_recipe = false
      elseif recipe == empty_recipe.name then
        add_empty_recipe = false
      end
    end
  end

  if add_fill_recipe then
    table.insert(effects, {type = unlock_key, recipe = fill_recipe.name})
  end
  if add_empty_recipe then
    table.insert(effects, {type = unlock_key, recipe = empty_recipe.name})
  end
end

local function log_barrel_error(string)
  log("Auto barrel generation is disabled: " .. string .. ".")
end

local function can_process_fluids(fluids, technology, empty_barrel_item)

  if not fluids then
    log_barrel_error("there are no fluids")
    return
  end

  if not technology then
    log_barrel_error("the " .. technology_name .. " technology doesn't exist")
    return
  end

  if not empty_barrel_item then
    log_barrel_error("the " .. empty_barrel_name .. " item doesn't exist")
    return
  end

  if not empty_barrel_item.icon then
    log_barrel_error("the " .. empty_barrel_name .. " item singular-icon definition doesn't exist")
    return
  end

  return true
end

local function process_fluid(fluid, technology, empty_barrel_item)

  -- Allow fluids to opt-out
  if fluid.auto_barrel == false then return end

  if not (fluid.icon or fluid.icons) then
    log("Can't make barrel recipe for "..fluid.name..", it doesn't have any icon or icons.")
    return
  end

  local barrel_name = fluid.name .. "-barrel"

  -- check if a barrel already exists for this fluid if not - create one
  local barrel_item = get_or_create_barrel_item(barrel_name, fluid, empty_barrel_item)

  -- check if the barrel has a recipe if not - create one
  local barrel_fill_recipe, barrel_empty_recipe = get_or_create_barrel_recipes(barrel_item, fluid)

  -- check if the barrel recipe exists in the unlock list of the technology if not - add it
  add_barrel_to_technology(barrel_fill_recipe, barrel_empty_recipe, technology)

end

local function process_fluids(fluids, technology, empty_barrel_item)

  if not can_process_fluids(fluids, technology, empty_barrel_item) then return end

  for name, fluid in pairs(fluids) do
    process_fluid(fluid, technology, empty_barrel_item)
  end

end

process_fluids(data.raw["fluid"], get_technology(technology_name), get_item(empty_barrel_name))
]]--