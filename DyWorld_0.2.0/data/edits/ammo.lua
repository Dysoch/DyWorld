ammo_bullet = {
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
          repeat_count = 1,
          action_delivery =
          {
            type = "projectile",
            projectile = "shotgun-pellet",
            starting_speed = 1,
            direction_deviation = 0.01,
            range_deviation = 0.01,
            max_range = 75,
          }
        }
      }
    }
	
data.raw["ammo"]["firearm-magazine"].ammo_type = ammo_bullet
data.raw["ammo"]["piercing-rounds-magazine"].ammo_type = ammo_bullet