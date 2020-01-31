local Dy_sounds = {}

Dy_sounds.plant =
{
  {
    filename = "__base__/sound/walking/plant/plant-01.ogg",
    volume = 0.4
  },
  {
    filename = "__base__/sound/walking/plant/plant-02.ogg",
    volume = 0.4
  },
  {
    filename = "__base__/sound/walking/plant/plant-03.ogg",
    volume = 0.4
  },
  {
    filename = "__base__/sound/walking/plant/plant-04.ogg",
    volume = 0.4
  },
  {
    filename = "__base__/sound/walking/plant/plant-05.ogg",
    volume = 0.4
  }
}

Dy_sounds.big_bush =
{
  {
    filename = "__base__/sound/walking/plant/bush-big-01.ogg",
    volume = 0.3
  },
  {
    filename = "__base__/sound/walking/plant/bush-big-02.ogg",
    volume = 0.3
  },
  {
    filename = "__base__/sound/walking/plant/bush-big-03.ogg",
    volume = 0.3
  },
  {
    filename = "__base__/sound/walking/plant/bush-big-04.ogg",
    volume = 0.3
  },
  {
    filename = "__base__/sound/walking/plant/bush-big-05.ogg",
    volume = 0.3
  },
  {
    filename = "__base__/sound/walking/plant/bush-big-06.ogg",
    volume = 0.3
  },
  {
    filename = "__base__/sound/walking/plant/bush-big-07.ogg",
    volume = 0.3
  }
}

Dy_sounds.small_bush =
{
  {
    filename = "__base__/sound/walking/plant/bush-small-01.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/plant/bush-small-02.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/plant/bush-small-03.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/plant/bush-small-04.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/plant/bush-small-05.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/plant/bush-small-06.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/plant/bush-small-07.ogg",
    volume = 0.6
  }
}
Dy_sounds.pebble =
{
  {
    filename = "__base__/sound/walking/pebble/stones_01.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/pebble/stones_02.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/pebble/stones_03.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/pebble/stones_03.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/pebble/stones_04.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/pebble/stones_05.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/pebble/stones_06.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/pebble/stones_07.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/pebble/stones_08.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/walking/pebble/stones_09.ogg",
    volume = 0.6
  }
}

Dy_sounds.car_stone_impact =
{
  { 
    filename = "__base__/sound/car-stone-impact.ogg", volume = 0.5
  },
  { 
    filename = "__base__/sound/car-stone-impact-2.ogg", volume = 0.5
  },
  { 
    filename = "__base__/sound/car-stone-impact-3.ogg", volume = 0.5
  },
  { 
    filename = "__base__/sound/car-stone-impact-4.ogg", volume = 0.5
  },
  { 
    filename = "__base__/sound/car-stone-impact-5.ogg", volume = 0.5
  },
  { 
    filename = "__base__/sound/car-stone-impact-6.ogg", volume = 0.5
  }
}

Dy_sounds.generic_impact =
{
  {
    filename = "__base__/sound/car-metal-impact.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-2.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-3.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-4.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-5.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-6.ogg", volume = 0.5
  }
}

Dy_sounds.flying_robot = function(volume)
  return
  {
    sound =
    {
      { 
        filename = "__base__/sound/flying-robot-1.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/flying-robot-2.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/flying-robot-3.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/flying-robot-4.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/flying-robot-5.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/flying-robot-6.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/flying-robot-7.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/flying-robot-8.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/flying-robot-9.ogg", volume = volume 
      }
    },
    max_sounds_per_type = 5,
    audible_distance_modifier = 1,
    probability = 1 / (10 * 60) -- average pause between the sound is 10 seconds
  }
end

Dy_sounds.construction_robot = function(volume)
  return
  {
    sound =
    {
      { 
        filename = "__base__/sound/construction-robot-1.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/construction-robot-2.ogg", volume = volume
      },
      { 
        filename = "__base__/sound/construction-robot-3.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/construction-robot-4.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/construction-robot-5.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/construction-robot-6.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/construction-robot-7.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/construction-robot-8.ogg", volume = volume 
      },
      { 
        filename = "__base__/sound/construction-robot-9.ogg", volume = volume 
      }
    },
    max_sounds_per_type = 1,
    audible_distance_modifier = 1,
    probability = 1 / (10 * 60) -- average pause between the sound is 10 seconds
  }
end


Dy_sounds.heavy_gunshot =
{
  {
    filename = "__base__/sound/fight/heavy-gunshot-1.ogg",
    volume = 0.45
  },
  {
    filename = "__base__/sound/fight/heavy-gunshot-2.ogg",
    volume = 0.45
  },
  {
    filename = "__base__/sound/fight/heavy-gunshot-3.ogg",
    volume = 0.45
  },
  {
    filename = "__base__/sound/fight/heavy-gunshot-4.ogg",
    volume = 0.45
  }
}

Dy_sounds.light_gunshot = 
{
  {
    filename = "__base__/sound/fight/light-gunshot-1.ogg",
    volume = 0.3
  },
  {
    filename = "__base__/sound/fight/light-gunshot-2.ogg",
    volume = 0.3
  },
  {
    filename = "__base__/sound/fight/light-gunshot-3.ogg",
    volume = 0.3
  }
}

Dy_sounds.shotgun =
{
  {
    filename = "__base__/sound/fight/pump-shotgun-1.ogg",
    volume = 0.5
  },
  {
    filename = "__base__/sound/fight/pump-shotgun-2.ogg",
    volume = 0.5
  },
  {
    filename = "__base__/sound/fight/pump-shotgun-3.ogg",
    volume = 0.5
  }
}

Dy_sounds.small_explosion = function(volume)
  return
  {
    aggregation =
    {
      max_count = 1,
      max_sounds_per_type = 2,
      remove = true
    },
    variations =
    {
      {
        filename = "__base__/sound/fight/small-explosion-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/fight/small-explosion-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/fight/small-explosion-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/fight/small-explosion-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/fight/small-explosion-5.ogg",
        volume = volume
      }
    }
  }
end

Dy_sounds.large_explosion = function(volume)
  return
  {
    aggregation =
    {
      max_count = 1,
      remove = true
    },
    variations =
    {
      {
        filename = "__base__/sound/fight/large-explosion-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/fight/large-explosion-2.ogg",
        volume = volume
      }
    }
  }
end


Dy_sounds.biter_roars = function(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/biter-roar-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-5.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-6.ogg",
      volume = volume
    }
  }
end

Dy_sounds.biter_roars_big = function(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/biter-roar-big-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-big-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-big-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-big-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-roar-big-5.ogg",
      volume = volume
    }
  }
end

Dy_sounds.biter_dying = function(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/biter-death-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-5.ogg",
      volume = volume
    }
  }
end

Dy_sounds.biter_dying_big = function(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/biter-death-big-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-big-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-big-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-big-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/biter-death-big-5.ogg",
      volume = volume
    }
  }
end

Dy_sounds.biter_calls = function(volume)
  return
  {
    sound =
    {
      {
        filename = "__base__/sound/creatures/biter-call-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-5.ogg",
        volume = volume
      },
    },
    probability = 1 / (4 * 60), -- average pause between the sound is 4 seconds
    max_per_type = 2,
    --audible_distance_modifier = 0.9,
  }
end

Dy_sounds.biter_calls_big = function(volume)
  return
  {
    sound =
    {
      {
        filename = "__base__/sound/creatures/biter-call-big-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-big-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-big-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-big-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-big-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-call-big-6.ogg",
        volume = volume
      },
    },
    probability = 1 / (4 * 60), -- average pause between the sound is 4 seconds
    max_per_type = 2,
  }
end

Dy_sounds.biter_walk = function(volume)
  return
  {
    aggregation =
    {
      max_count = 2,
      remove = true
    },
    variations =
    {
      {
        filename = "__base__/sound/creatures/biter-walk-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-6.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-7.ogg",
        volume = volume
      }
    }
  }
end

Dy_sounds.biter_walk_big = function(volume)
  return
  {
    aggregation =
    {
      max_count = 2,
      remove = true
    },
    variations =
    {
      {
        filename = "__base__/sound/creatures/biter-walk-big-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-6.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-7.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-8.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-9.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/biter-walk-big-10.ogg",
        volume = volume
      },
    }
  }
end

Dy_sounds.spitter_walk = function(volume)
  return
  {
    aggregation =
    {
      max_count = 2,
      remove = true
    },
    variations =
    {
      {
        filename = "__base__/sound/creatures/spitter-walk-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-6.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-7.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-8.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-9.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-10.ogg",
        volume = volume
      }
    }
  }
end

Dy_sounds.spitter_walk_big = function(volume)
  return
  {
    aggregation =
    {
      max_count = 2,
      remove = true
    },
    variations =
    {
      {
        filename = "__base__/sound/creatures/spitter-walk-big-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-6.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-7.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-8.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-9.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-walk-big-10.ogg",
        volume = volume
      }
    }
  }
end

Dy_sounds.spitter_calls = function(volume)
  return
  {
    sound =
    {
      {
        filename = "__base__/sound/creatures/spitter-call-small-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-6.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-7.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-8.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-small-9.ogg",
        volume = volume
      }
    },
    probability = 1 / (4 * 60), -- average pause between the sound is 4 seconds
    max_per_type = 2,
    --audible_distance_modifier = 0.9,
  }
end

Dy_sounds.spitter_calls_med = function(volume)
  return
  {
    --aggregation =
    --{
    -- max_count = 1,
    --remove = true
    --},
    --variations =
    sound =
    {
      {
        filename = "__base__/sound/creatures/spitter-call-med-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-5.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-6.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-7.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-8.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-9.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-med-10.ogg",
        volume = volume
      },
    },
    probability = 1 / (8 * 60) -- average pause between the sound is 8 seconds
  }
end

Dy_sounds.spitter_calls_big = function(volume)
  return
  {
    sound =
    {
      {
        filename = "__base__/sound/creatures/spitter-call-big-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-big-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-big-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-big-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/spitter-call-big-5.ogg",
        volume = volume
      },
    },
    probability = 1 / (4 * 60), -- average pause between the sound is 4 seconds
    max_per_type = 2,
    --audible_distance_modifier = 0.9,
  }
end

Dy_sounds.spitter_roars = function(volume)
  return
  {
    layers =
    {
      [0] =
      {
        {
          filename = "__base__/sound/creatures/Spiters_1_1.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_2_1.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_3_1.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_4_1.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_5_1.ogg",
          volume = volume
        }
      },
      [1] =
      {
        {
          filename = "__base__/sound/creatures/Spiters_1_2.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_2_2.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_3_2.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_4_2.ogg",
          volume = volume
        },
        {
          filename = "__base__/sound/creatures/Spiters_5_2.ogg",
          volume = volume
        }
      }
    }
  }
end

Dy_sounds.spitter_dying = function(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/spitter-death-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-5.ogg",
      volume = volume
    }
  }
end

Dy_sounds.spitter_dying_big = function(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/spitter-death-big-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-big-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-big-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-big-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/spitter-death-big-5.ogg",
      volume = volume
    }
  }
end


Dy_sounds.worm_roars = function(volume)
  return
  {
    variations =
    {
      {
        filename = "__base__/sound/creatures/worm-roar-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-4.ogg",
        volume = volume
      }
    },
    audible_distance_modifier = 2.0
  }
end

Dy_sounds.worm_roar_alternative = function(volume)
  return
  {
    variations =
    {
      {
        filename = "__base__/sound/creatures/worm-roar-alt-1.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-alt-2.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-alt-3.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-alt-4.ogg",
        volume = volume
      },
      {
        filename = "__base__/sound/creatures/worm-roar-alt-5.ogg",
        volume = volume
      }
    },
    audible_distance_modifier = 2.0
  }
end

Dy_sounds.worm_breath = function(volume)
  return
  {
    variations =
    {
      {
        filename = "__base__/sound/creatures/worm-breathe-01.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-02.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-03.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-04.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-05.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-06.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-07.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/creatures/worm-breathe-08.ogg",
        volume = 0.5
      }
    },
    audible_distance_modifier = 2.0
  }
end

Dy_sounds.worm_dying = function(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/worm-death-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-5.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-6.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-7.ogg",
      volume = volume
    }
  }
end

Dy_sounds.worm_dying_small = function(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/worm-death-small-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-small-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-small-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-death-small-4.ogg",
      volume = volume
    }
  }
end

Dy_sounds.worm_fold = function(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/worm-folding-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-folding-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-folding-3.ogg",
      volume = volume
    }
  }
end

Dy_sounds.worm_standup = function(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/worm-standup-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-standup-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-standup-3.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-standup-4.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-standup-5.ogg",
      volume = volume
    }
  }
end

Dy_sounds.worm_standup_small = function(volume)
  return
  {
    {
      filename = "__base__/sound/creatures/worm-standup-small-1.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-standup-small-2.ogg",
      volume = volume
    },
    {
      filename = "__base__/sound/creatures/worm-standup-small-3.ogg",
      volume = volume
    }
  }
end

return sounds
