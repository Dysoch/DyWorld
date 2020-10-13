

function DyDS_Add_Ammo(params)
data:extend(
{
  {
    type = "ammo",
    name = params.name,
	localised_name = params.localised_name or nil,
	localised_description = params.localised_description or nil,
    icon = DyDs_icon_temp,
    icon_size = 64, 
	icon_mipmaps = 4,
    ammo_type =
    {
      category = params.ammo_cat or "900mm",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
                {
                  type = "damage",
                  damage = {amount = params.dmg_amount or 5 , type = params.dmg_type or "physical"}
                }
              }
            }
          }
        }
      }
    },
    magazine_size = params.magazine_size or 1,
    subgroup = params.subgroup or DyDs.."ammo-bullet-basic",
    order = params.order or "a",
    stack_size = params.stack_size or 1000,
  }
})
	if params.icons then
		data.raw.ammo[params.name].icon = nil
		data.raw.ammo[params.name].icons = params.icons
	elseif params.icon then
		data.raw.ammo[params.name].icon = params.icon
	elseif data.raw.ammo[params.name].icon == DyDs_icon_temp then
		data.raw.ammo[params.name].icon_size = 32
	end
	if settings.startup["DyWorld_Combat_Overhaul"].value then 
	data.raw.ammo[params.name].ammo_type = {
	  category = params.ammo_cat or "900mm",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                },
              },
            },
          },
        },
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = params.name.."-projectile",
            starting_speed = 1,
            direction_deviation = 0.05,
            range_deviation = 0.15,
            max_range = params.range or 15,
          }
        }
      }
	}
data:extend({
  {
    type = "projectile",
    name = params.name.."-projectile",
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
            entity_name = "explosion-hit",
            offsets = {{0, 1}},
            offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
          },
          {
            type = "damage",
            damage = { amount = params.dmg_amount or 5, type = params.dmg_type or "physical"}
          },
        },
      }
    },
    animation =
    {
      filename = DyDs_path_entity.."bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
	  --tint = Damages[Dmg].Color,
    },
  },
})
		if params.piercing then
			data.raw.projectile[params.name.."-projectile"].piercing_damage = params.dmg_amount * 2
		end
	end
end