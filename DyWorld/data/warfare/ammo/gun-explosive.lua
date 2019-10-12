require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

local Data_Table = {
	"earth",
	"fission",
	"nuclear",
	"sonic",
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
    name = "explosive-ammo-"..Dmg,
	localised_name = {"looped-name.ammo-3", {"damage-type-name."..Dmg}},
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
            projectile = "explosive-ammo-"..Dmg.."-projectile",
            starting_speed = 1,
            direction_deviation = 0.04,
            range_deviation = 0.15,
            max_range = Round(Damages[Dmg].Ammo_Range * 1.5),
          }
        }
      }
    },
    subgroup = dy.."ammo-bullet-explosive",
    order = Dmg,
    stack_size = 200,
    magazine_size = (10 * Damages[Dmg].Tier),
  },
  {
    type = "projectile",
    name = "explosive-ammo-"..Dmg.."-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = false,
    piercing_damage = Round((Damages[Dmg].Ammo_Damage * 10), 1),
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
            entity_name = dy.."explosion-tiny-no-particle"
          },
		  {
			type = "nested-result",
			action =
			{
              type = "area",
              radius = 3,
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
					damage = { amount = Round((Damages[Dmg].Ammo_Damage * 10), 1), type = Dmg}
				  },
				  {
					type = "damage",
					damage = { amount = 15, type = "explosion"}
				  },
				  {
					type = "damage",
					damage = { amount = 15, type = "impact"}
				  },
			    },
              }
            }
          },
		}
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
    name = "explosive-ammo-"..Dmg,
	localised_name = {"looped-name.ammo-3", {"damage-type-name."..Dmg}},
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
              entity_name = dy.."explosion-tiny-no-particle"
            },
		    {
			  type = "nested-result",
              action =
              {
				type = "area",
				radius = 3,
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
					  damage = { amount = Round((Damages[Dmg].Ammo_Damage * 10), 1), type = Dmg}
					},
					{
					  type = "damage",
					  damage = { amount = 15, type = "explosion"}
					},
					{
					  type = "damage",
					  damage = { amount = 15, type = "impact"}
					},
				  },
                }
              }
            }
		  }
        }
      }
    },
    subgroup = dy.."ammo-bullet-explosive",
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
    name = "explosive-ammo-"..Dmg,
    energy_required = math.ceil(Damages[Dmg].Ammo_Damage / 2),
    enabled = false,
    ingredients =
    {
      {type = "item", name = "gunpowder", amount = math.ceil(Damages[Dmg].Ammo_Damage * 10)},
    },
    result = "explosive-ammo-"..Dmg,
  },
})
	if Damages[Dmg].Tier >= 3 then
		DyWorld_Add_To_Tech(Dmg.."-ammo", "explosive-ammo-"..Dmg)
	else
		data.raw.recipe["explosive-ammo-"..Dmg].enabled = true
	end
end
