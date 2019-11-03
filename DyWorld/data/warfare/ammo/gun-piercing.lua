require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Warfare"].value then

local Data_Table = {
	"earth",
	"chemical",
	"poison",
	"fire",
	"physical",
	"acid",
	"plasma",
	"lava",
	"sonic",
	"fission",
	"ice",
}

for _, Dmg in pairs(Data_Table) do
	if settings.startup["DyWorld_Combat_Overhaul"].value then
data:extend(
{
  {
    type = "ammo",
    name = "piercing-ammo-"..Dmg,
	localised_name = {"looped-name.ammo-2", {"damage-type-name."..Dmg}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/piercing-rounds-magazine.png",
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
      category = "bullet",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            source_effects =
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "piercing-ammo-"..Dmg.."-projectile",
            starting_speed = 1,
            direction_deviation = 0.04,
            range_deviation = 0.15,
            max_range = Round(Damages[Dmg].Ammo_Range * 1.2),
          }
        }
      }
    },
    subgroup = dy.."ammo-bullet-piercing",
    order = Dmg,
    stack_size = 200,
    magazine_size = (10 * Damages[Dmg].Tier),
  },
  {
    type = "projectile",
    name = "piercing-ammo-"..Dmg.."-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = false,
    piercing_damage = Round((Damages[Dmg].Ammo_Damage * 2.5), 1),
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
            entity_name = "explosion-hit"
          },
          {
            type = "damage",
            damage = { amount = Round((Damages[Dmg].Ammo_Damage * 2.5), 1), type = Dmg}
          },
          {
            type = "damage",
            damage = { amount = 5, type = "impact"}
          },
        },
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
	  tint = Damages[Dmg].Color,
    },
  },
})
	else
data:extend(
{
  {
    type = "ammo",
    name = "piercing-ammo-"..Dmg,
	localised_name = {"looped-name.ammo-2", {"damage-type-name."..Dmg}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/piercing-rounds-magazine.png",
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
      category = "bullet",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit"
            },
            {
              type = "damage",
              damage = { amount = Round((Damages[Dmg].Ammo_Damage * 2.5), 1), type = Dmg}
            },
            {
              type = "damage",
              damage = { amount = 5, type = "impact"}
            },
          }
        }
      }
    },
    subgroup = dy.."ammo-bullet-piercing",
    order = Dmg,
    stack_size = 200,
    magazine_size = (10 * Damages[Dmg].Tier),
  },
})
	end
data:extend(
{
  {
    type = "recipe",
    name = "piercing-ammo-"..Dmg,
    energy_required = math.ceil(Damages[Dmg].Ammo_Damage / 2),
    enabled = false,
    ingredients =
    {
      {type = "item", name = "gunpowder", amount = math.ceil(Damages[Dmg].Ammo_Damage  / 2.5)},
      {type = "item", name = "steel-plate", amount = 2},
    },
    result = "piercing-ammo-"..Dmg,
  },
})
local RECIPE = data.raw.recipe["piercing-ammo-"..Dmg]
	DyWorld_Add_To_Tech(Dmg.."-ammo", "piercing-ammo-"..Dmg)
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

end