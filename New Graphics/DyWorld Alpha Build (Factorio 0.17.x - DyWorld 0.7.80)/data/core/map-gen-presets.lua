data:extend(
{
  {
    type = "map-gen-presets",
    name = "default",
    -- default changes nothing
    default =
    {
      default = true,
      order = "a"
    },
    ["marathon"] =
    {
      order = "c",
      advanced_settings =
      {
        difficulty_settings =
        {
          recipe_difficulty = defines.difficulty_settings.recipe_difficulty.expensive,
          technology_difficulty = defines.difficulty_settings.technology_difficulty.expensive,
          technology_price_multiplier = 4
        }
      }
    },
    ["death-world"] =
    {
      order = "d",
      basic_settings =
      {
        autoplace_controls =
        {
          ["enemy-base"] = { frequency = "very-high", size = "very-big"}
        },
        starting_area = "small"
      },
      advanced_settings =
      {
        enemy_evolution =
        {
          time_factor = 0.00002,
          pollution_factor = 0.00002
        }
      }
    },
    ["death-world-marathon"] =
    {
      order = "d",
      basic_settings =
      {
        autoplace_controls =
        {
          ["enemy-base"] = { frequency = "very-high", size = "very-big"}
        },
        starting_area = "small"
      },
      advanced_settings =
      {
        enemy_evolution =
        {
          time_factor = 0.00002,
          pollution_factor = 0.00002
        },
        difficulty_settings =
        {
          recipe_difficulty = defines.difficulty_settings.recipe_difficulty.expensive,
          technology_difficulty = defines.difficulty_settings.technology_difficulty.expensive,
          technology_price_multiplier = 4
        }
      }
    },
    ["rich-resources"] =
    {
      order = "b",
      basic_settings =
      {
        autoplace_controls =
        {
          ["hematite"] = { richness = "very-good"},
          ["chalcopyrite"] = { richness = "very-good"},
          ["bauxite"] = { richness = "very-good"},
          ["carbolycite"] = { richness = "very-good"},
          ["radicium"] = { richness = "very-good"},
          ["prolycotherium"] = { richness = "very-good"},
          ["galena"] = { richness = "very-good"},
          ["crude-oil"] = { richness = "very-good"}
        }
      }
    },
    ["rail-world"] =
    {
      order = "e",
      basic_settings =
      {
        autoplace_controls =
        {
          ["carbolycite"] =
          {
            frequency = "very-low",
            size = "high"
          },
          ["chalcopyrite"] =
          {
            frequency = "very-low",
            size = "high"
          },
          ["crude-oil"] =
          {
            frequency = "very-low",
            size = "high"
          },
          ["radicium"] =
          {
            frequency = "very-low",
            size = "high"
          },
          ["prolycotherium"] =
          {
            frequency = "very-low",
            size = "high"
          },
          ["galena"] =
          {
            frequency = "very-low",
            size = "high"
          },
          ["hematite"] =
          {
            frequency = "very-low",
            size = "high"
          },
          ["bauxite"] =
          {
            frequency = "very-low",
            size = "high"
          }
        },
        terrain_segmentation = "very-low",
        water = "high"
      },
      advanced_settings =
      {
        enemy_evolution =
        {
          time_factor = 0.000002
        },
        enemy_expansion =
        {
         enabled = false
        }
      }
    }
  }
})
