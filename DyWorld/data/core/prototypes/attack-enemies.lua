
function DyWorld_spitter_attack_parameters(data)
  return
  {
    type = "projectile",
    ammo_category = "rocket",
    cooldown = data.cooldown,
    range = data.range,
    min_attack_distance = data.min_attack_distance,
    projectile_creation_distance = 1.9,
    damage_modifier = data.damage_modifier,
    warmup = 30,
    ammo_type =
    {
      category = "biological",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = data.projectile,
          starting_speed = 0.5,
          max_range = data.range * 2,
          direction_deviation = 0.05,
          range_deviation = 0.15,
        }
      }
    },
    sound = make_spitter_roars(data.roarvolume),
    animation = DyWorld_spitterattackanimation(data.scale, data.tint),
  }
end

function DyWorld_make_unit_melee_ammo_type(damagevalue, damagetype)
  return
  {
    category = "melee",
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damagevalue , type = damagetype}
        }
      }
    }
  }
end