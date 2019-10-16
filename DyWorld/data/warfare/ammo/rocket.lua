require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

local Data_Table = {
	"water",
	"earth",
	"electric",
	"chemical",
	"poison",
	"fire",
	"physical",
	"sonic",
	"fusion",
	"laser",
	"lightning",
	"acid",
	"plasma",
	"gas",
	"fungal",
	"lava",
	"fission",
	"nuclear",
	"ice",
}

for _, Dmg in pairs(Data_Table) do
data:extend(
{
  {
    type = "ammo",
    name = "rocket-"..Dmg,
	localised_name = {"looped-name.ammo-8", {"damage-type-name."..Dmg}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/rocket.png",
	  },
	  {
		icon = dyworld_path_damage..Dmg..".png",
		scale= 0.6, 
		shift = {8, 9},
	  },
	},
    icon_size = 32,
    ammo_type =
    {
      category = "rocket",
	  target_type = "position",
	  clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "rocket-"..Dmg.."-projectile",
            starting_speed = 0.1,
            direction_deviation = 0.1,
            range_deviation = 0.25,
            max_range = Round(Damages[Dmg].Ammo_Range * 2.5),
          }
        }
      }
    },
    subgroup = dy.."ammo-rocket",
    order = Dmg,
    stack_size = 200,
    magazine_size = (5 * Damages[Dmg].Tier),
  },
  {
    type = "projectile",
    name = "rocket-"..Dmg.."-projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    piercing_damage = Round((Damages[Dmg].Ammo_Damage * 25), 1),
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = dy.."explosion-medium"
          },
		  {
			type = "nested-result",
			action =
			{
              type = "area",
              radius = 5,
              action_delivery =
              {
				type = "instant",
				target_effects =
				{
				  {
					type = "create-entity",
					entity_name = "explosion-hit"
				  },
				  {
					type = "damage",
					damage = { amount = Round((Damages[Dmg].Ammo_Damage * 20), 1), type = Dmg}
				  },
				  {
					type = "damage",
					damage = { amount = 50, type = "explosion"}
				  },
				  {
					type = "damage",
					damage = { amount = 25, type = "impact"}
				  },
			    },
              }
            }
          },
		}
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 8,
      line_length = 8,
      width = 9,
      height = 35,
      shift = {0, 0},
	  tint = Damages[Dmg].Color,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      width = 7,
      height = 24,
      priority = "high",
      shift = {0, 0}
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 1},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
  },
})

data:extend(
{
  {
    type = "recipe",
    name = "rocket-"..Dmg,
    energy_required = math.ceil(Damages[Dmg].Ammo_Damage / 2),
    enabled = false,
    ingredients =
    {
      {type = "item", name = "gunpowder", amount = math.ceil(Damages[Dmg].Ammo_Damage)},
      {type = "item", name = "explosives", amount = 1},
      {type = "item", name = "electronic-control-board", amount = 1},
      {type = "item", name = "tungsten-plate", amount = 2},
    },
    result = "rocket-"..Dmg,
  },
})
local RECIPE = data.raw.recipe["rocket-"..Dmg]
	DyWorld_Add_To_Tech(Dmg.."-ammo", "rocket-"..Dmg)
	if Dmg == "water" then
		local RESULT = {type = "fluid", name = "water", amount = 50}
		table.insert(RECIPE.ingredients, RESULT)
		RECIPE.category = "crafting-with-fluid"
	elseif Dmg == "earth" then
		local RESULT = {type = "item", name = "stone", amount = 5}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "electric" then
		local RESULT = {type = "item", name = "battery", amount = 1}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "chemical" then
		local RESULT = {type = "fluid", name = "argon", amount = 50}
		table.insert(RECIPE.ingredients, RESULT)
		RECIPE.category = "crafting-with-fluid"
	elseif Dmg == "poison" then
		local RESULT = {type = "fluid", name = "boron", amount = 50}
		table.insert(RECIPE.ingredients, RESULT)
		RECIPE.category = "crafting-with-fluid"
	elseif Dmg == "fire" then
		local RESULT = {type = "item", name = "coal", amount = 5}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "physical" then
		local RESULT = {type = "item", name = "obsidian", amount = 2}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "impact" then
		local RESULT = {type = "item", name = "obsidian", amount = 8}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "explosion" then
		local RESULT = {type = "item", name = "explosives", amount = 1}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "sonic" then
		local RESULT = {type = "fluid", name = "pollution", amount = 50}
		table.insert(RECIPE.ingredients, RESULT)
		RECIPE.category = "crafting-with-fluid"
	elseif Dmg == "fusion" then
		local RESULT = {type = "item", name = "uranium-235", amount = 5}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "laser" then
		local RESULT = {type = "item", name = "diamond", amount = 1}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "lightning" then
		local RESULT = {type = "item", name = "battery-pack", amount = 5}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "acid" then
		local RESULT = {type = "fluid", name = "sulfuric-acid", amount = 50}
		table.insert(RECIPE.ingredients, RESULT)
		RECIPE.category = "crafting-with-fluid"
	elseif Dmg == "plasma" then
		local RESULT = {type = "fluid", name = "methane", amount = 50}
		table.insert(RECIPE.ingredients, RESULT)
		RECIPE.category = "crafting-with-fluid"
	elseif Dmg == "gas" then
		local RESULT = {type = "fluid", name = "carbon-dioxide", amount = 50}
		table.insert(RECIPE.ingredients, RESULT)
		RECIPE.category = "crafting-with-fluid"
	elseif Dmg == "fungal" then
		local RESULT = {type = "item", name = "wood", amount = 5}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "lava" then
		local RESULT = {type = "item", name = "coal", amount = 5}
		table.insert(RECIPE.ingredients, RESULT)
		local RESULT = {type = "item", name = "sulfur", amount = 5}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "fission" then
		local RESULT = {type = "item", name = "uranium-238", amount = 5}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "nuclear" then
		local RESULT = {type = "item", name = "uranium-fuel-cell", amount = 1}
		table.insert(RECIPE.ingredients, RESULT)
	elseif Dmg == "ice" then
		local RESULT = {type = "fluid", name = "water", amount = 250}
		table.insert(RECIPE.ingredients, RESULT)
		RECIPE.category = "crafting-with-fluid"
	end
end
