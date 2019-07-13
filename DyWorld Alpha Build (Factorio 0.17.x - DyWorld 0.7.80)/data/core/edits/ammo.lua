require "data/prefix"

ammo_bullet_1 = {
      category = "bullet",
      target_type = "direction",
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
            projectile = dyworld_prefix.."projectile-basic-3",
            starting_speed = 1,
            direction_deviation = 0.075,
            range_deviation = 0.15,
            max_range = 25,
          }
        }
      }
    }

ammo_bullet_2 = {
      category = "bullet",
      target_type = "direction",
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
            projectile = dyworld_prefix.."projectile-basic-piercing-8",
            starting_speed = 1,
            direction_deviation = 0.05,
            range_deviation = 0.1,
            max_range = 40,
          }
        }
      }
    }

ammo_bullet_3 = {
      category = "bullet",
      target_type = "direction",
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
            projectile = dyworld_prefix.."projectile-basic-piercing-50",
            starting_speed = 1,
            direction_deviation = 0.05,
            range_deviation = 0.1,
            max_range = 50,
          }
        }
      }
    }
	
data.raw["ammo"]["firearm-magazine"].ammo_type = ammo_bullet_1
data.raw["ammo"]["piercing-rounds-magazine"].ammo_type = ammo_bullet_2
data.raw["ammo"]["uranium-rounds-magazine"].ammo_type = ammo_bullet_3
data.raw["ammo"]["rocket"].ammo_type.target_type = "position"
data.raw["ammo"]["explosive-rocket"].ammo_type.target_type = "position"
data.raw["capsule"]["grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.max_range = data.raw["capsule"]["grenade"].capsule_action.attack_parameters.range + 10
data.raw["projectile"]["cluster-grenade"].action[2].action_delivery.max_range = data.raw["capsule"]["grenade"].capsule_action.attack_parameters.range + 10
data.raw["capsule"]["cluster-grenade"].capsule_action.attack_parameters.ammo_type.action.action_delivery.max_range = data.raw["capsule"]["cluster-grenade"].capsule_action.attack_parameters.range + 10
data.raw["capsule"]["poison-capsule"].capsule_action.attack_parameters.ammo_type.action.action_delivery.max_range = data.raw["capsule"]["poison-capsule"].capsule_action.attack_parameters.range + 10
data.raw["capsule"]["slowdown-capsule"].capsule_action.attack_parameters.ammo_type.action.action_delivery.max_range = data.raw["capsule"]["slowdown-capsule"].capsule_action.attack_parameters.range + 10
data.raw["capsule"]["defender-capsule"].capsule_action.attack_parameters.ammo_type.action.action_delivery.max_range = data.raw["capsule"]["defender-capsule"].capsule_action.attack_parameters.range + 10
data.raw["capsule"]["distractor-capsule"].capsule_action.attack_parameters.ammo_type.action.action_delivery.max_range = data.raw["capsule"]["distractor-capsule"].capsule_action.attack_parameters.range + 10
data.raw["capsule"]["destroyer-capsule"].capsule_action.attack_parameters.ammo_type.action.action_delivery.max_range = data.raw["capsule"]["destroyer-capsule"].capsule_action.attack_parameters.range + 10
