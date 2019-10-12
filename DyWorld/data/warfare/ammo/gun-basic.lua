require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

local Data_Table = {
	"earth",
	"chemical",
	"poison",
	"fire",
	"physical",
	"acid",
	"plasma",
	"lava",
	"ice",
}

for _, Dmg in pairs(Data_Table) do
	if settings.startup["DyWorld_Combat_Overhaul"].value then
data:extend(
{
  {
    type = "ammo",
    name = "basic-ammo-"..Dmg,
	localised_name = {"looped-name.ammo-1", {"damage-type-name."..Dmg}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/firearm-magazine.png",
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
            projectile = "basic-ammo-"..Dmg.."-projectile",
            starting_speed = 1,
            direction_deviation = 0.05,
            range_deviation = 0.15,
            max_range = Damages[Dmg].Ammo_Range,
          }
        }
      }
    },
    subgroup = dy.."ammo-bullet-basic",
    order = Dmg,
    stack_size = 200,
    magazine_size = (10 * Damages[Dmg].Tier),
  },
  {
    type = "projectile",
    name = "basic-ammo-"..Dmg.."-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = false,
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
            damage = { amount = Damages[Dmg].Ammo_Damage, type = Dmg}
          },
          {
            type = "damage",
            damage = { amount = 1, type = "impact"}
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
    name = "basic-ammo-"..Dmg,
	localised_name = {"looped-name.ammo-1", {"damage-type-name."..Dmg}},
    icons = 
	{
	  {
		icon = "__base__/graphics/icons/firearm-magazine.png",
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
              damage = { amount = Damages[Dmg].Ammo_Damage, type = Dmg}
            },
            {
              type = "damage",
              damage = { amount = 1, type = "impact"}
            },
          }
        }
      }
    },
    subgroup = dy.."ammo-bullet-basic",
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
    name = "basic-ammo-"..Dmg,
    energy_required = math.ceil(Damages[Dmg].Ammo_Damage / 2),
    enabled = false,
    ingredients =
    {
      {type = "item", name = "gunpowder", amount = math.ceil(Damages[Dmg].Ammo_Damage)},
    },
    result = "basic-ammo-"..Dmg,
  },
})
	if Damages[Dmg].Tier >= 3 then
		DyWorld_Add_To_Tech(Dmg.."-ammo", "basic-ammo-"..Dmg)
	else
		data.raw.recipe["basic-ammo-"..Dmg].enabled = true
	end
end