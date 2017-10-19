require "data/prefix"


data.raw["transport-belt"]["transport-belt"].localised_name = {"edits-name.transport-belt"}
data.raw["transport-belt"]["fast-transport-belt"].localised_name = {"edits-name.fast-transport-belt"}
data.raw["transport-belt"]["express-transport-belt"].localised_name = {"edits-name.express-transport-belt"}

data.raw["underground-belt"]["underground-belt"].localised_name = {"edits-name.underground-belt"}
data.raw["underground-belt"]["fast-underground-belt"].localised_name = {"edits-name.fast-underground-belt"}
data.raw["underground-belt"]["express-underground-belt"].localised_name = {"edits-name.express-underground-belt"}

data.raw["splitter"]["splitter"].localised_name = {"edits-name.splitter"}
data.raw["splitter"]["fast-splitter"].localised_name = {"edits-name.fast-splitter"}
data.raw["splitter"]["express-splitter"].localised_name = {"edits-name.express-splitter"}



data.raw["transport-belt"]["transport-belt"].speed = (math.floor(Materials.Iron.Strength_Ultimate / (Materials.Iron.Hardness + Materials.Iron.Density))/426.67)
data.raw["transport-belt"]["fast-transport-belt"].speed = (math.floor(Materials.Steel.Strength_Ultimate / (Materials.Steel.Hardness + Materials.Steel.Density))/426.67)
data.raw["transport-belt"]["express-transport-belt"].speed = (math.floor(Materials.Stainless_Steel.Strength_Ultimate / (Materials.Stainless_Steel.Hardness + Materials.Stainless_Steel.Density))/426.67)

data.raw["underground-belt"]["underground-belt"].speed = (math.floor(Materials.Iron.Strength_Ultimate / (Materials.Iron.Hardness + Materials.Iron.Density))/426.67)
data.raw["underground-belt"]["fast-underground-belt"].speed = (math.floor(Materials.Steel.Strength_Ultimate / (Materials.Steel.Hardness + Materials.Steel.Density))/426.67)
data.raw["underground-belt"]["express-underground-belt"].speed = (math.floor(Materials.Stainless_Steel.Strength_Ultimate / (Materials.Stainless_Steel.Hardness + Materials.Stainless_Steel.Density))/426.67)

data.raw["splitter"]["splitter"].speed = (math.floor(Materials.Iron.Strength_Ultimate / (Materials.Iron.Hardness + Materials.Iron.Density))/426.67)
data.raw["splitter"]["fast-splitter"].speed = (math.floor(Materials.Steel.Strength_Ultimate / (Materials.Steel.Hardness + Materials.Steel.Density))/426.67)
data.raw["splitter"]["express-splitter"].speed = (math.floor(Materials.Stainless_Steel.Strength_Ultimate / (Materials.Stainless_Steel.Hardness + Materials.Stainless_Steel.Density))/426.67)



data.raw["transport-belt"]["transport-belt"].max_health = math.floor(((Materials.Iron.Density * Materials.Iron.Hardness) - Materials.Iron.Elasticity) + Materials.Iron.Strength_Ultimate)
data.raw["transport-belt"]["fast-transport-belt"].max_health = math.floor(((Materials.Steel.Density * Materials.Steel.Hardness) - Materials.Steel.Elasticity) + Materials.Steel.Strength_Ultimate)
data.raw["transport-belt"]["express-transport-belt"].max_health = math.floor(((Materials.Stainless_Steel.Density * Materials.Stainless_Steel.Hardness) - Materials.Stainless_Steel.Elasticity) + Materials.Stainless_Steel.Strength_Ultimate)

data.raw["underground-belt"]["underground-belt"].max_health = math.floor(((Materials.Iron.Density * Materials.Iron.Hardness) - Materials.Iron.Elasticity) + Materials.Iron.Strength_Ultimate)
data.raw["underground-belt"]["fast-underground-belt"].max_health = math.floor(((Materials.Steel.Density * Materials.Steel.Hardness) - Materials.Steel.Elasticity) + Materials.Steel.Strength_Ultimate)
data.raw["underground-belt"]["express-underground-belt"].max_health = math.floor(((Materials.Stainless_Steel.Density * Materials.Stainless_Steel.Hardness) - Materials.Stainless_Steel.Elasticity) + Materials.Stainless_Steel.Strength_Ultimate)

data.raw["splitter"]["splitter"].max_health = math.floor(((Materials.Iron.Density * Materials.Iron.Hardness) - Materials.Iron.Elasticity) + Materials.Iron.Strength_Ultimate)
data.raw["splitter"]["fast-splitter"].max_health = math.floor(((Materials.Steel.Density * Materials.Steel.Hardness) - Materials.Steel.Elasticity) + Materials.Steel.Strength_Ultimate)
data.raw["splitter"]["express-splitter"].max_health = math.floor(((Materials.Stainless_Steel.Density * Materials.Stainless_Steel.Hardness) - Materials.Stainless_Steel.Elasticity) + Materials.Stainless_Steel.Strength_Ultimate)



data.raw["underground-belt"]["underground-belt"].max_distance = math.floor(((Materials.Iron.Strength_Ultimate + Materials.Iron.Strength_Yield) / Materials.Iron.Elasticity) - Materials.Iron.Hardness)
data.raw["underground-belt"]["fast-underground-belt"].max_distance = math.floor(((Materials.Steel.Strength_Ultimate + Materials.Steel.Strength_Yield) / Materials.Steel.Elasticity) - Materials.Steel.Hardness)
data.raw["underground-belt"]["express-underground-belt"].max_distance = math.floor(((Materials.Stainless_Steel.Strength_Ultimate + Materials.Stainless_Steel.Strength_Yield) / Materials.Stainless_Steel.Elasticity) - Materials.Stainless_Steel.Hardness)



data.raw["transport-belt"]["transport-belt"].belt_horizontal = DyWorld_basic_belt_horizontal(Material_Colors.Iron)
data.raw["transport-belt"]["transport-belt"].belt_vertical = DyWorld_basic_belt_vertical(Material_Colors.Iron)
data.raw["transport-belt"]["transport-belt"].ending_top = DyWorld_basic_belt_ending_top(Material_Colors.Iron)
data.raw["transport-belt"]["transport-belt"].ending_bottom = DyWorld_basic_belt_ending_bottom(Material_Colors.Iron)
data.raw["transport-belt"]["transport-belt"].ending_side = DyWorld_basic_belt_ending_side(Material_Colors.Iron)
data.raw["transport-belt"]["transport-belt"].starting_top = DyWorld_basic_belt_starting_top(Material_Colors.Iron)
data.raw["transport-belt"]["transport-belt"].starting_bottom = DyWorld_basic_belt_starting_bottom(Material_Colors.Iron)
data.raw["transport-belt"]["transport-belt"].starting_side = DyWorld_basic_belt_starting_side(Material_Colors.Iron)
data.raw["transport-belt"]["transport-belt"].ending_patch = DyWorld_ending_patch_prototype(Material_Colors.Iron)
data.raw["transport-belt"]["transport-belt"].animations = {
      filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 16,
      direction_count = 12,
	  tint = Material_Colors.Iron,
      hr_version =
      {
        filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
        priority = "extra-high",
        width = 80,
        height = 80,
        scale = 0.5,
        frame_count = 16,
        direction_count = 12,
		tint = Material_Colors.Iron,
      }
    }
	
data.raw["transport-belt"]["fast-transport-belt"].belt_horizontal = DyWorld_basic_belt_horizontal(Material_Colors.Steel)
data.raw["transport-belt"]["fast-transport-belt"].belt_vertical = DyWorld_basic_belt_vertical(Material_Colors.Steel)
data.raw["transport-belt"]["fast-transport-belt"].ending_top = DyWorld_basic_belt_ending_top(Material_Colors.Steel)
data.raw["transport-belt"]["fast-transport-belt"].ending_bottom = DyWorld_basic_belt_ending_bottom(Material_Colors.Steel)
data.raw["transport-belt"]["fast-transport-belt"].ending_side = DyWorld_basic_belt_ending_side(Material_Colors.Steel)
data.raw["transport-belt"]["fast-transport-belt"].starting_top = DyWorld_basic_belt_starting_top(Material_Colors.Steel)
data.raw["transport-belt"]["fast-transport-belt"].starting_bottom = DyWorld_basic_belt_starting_bottom(Material_Colors.Steel)
data.raw["transport-belt"]["fast-transport-belt"].starting_side = DyWorld_basic_belt_starting_side(Material_Colors.Steel)
data.raw["transport-belt"]["fast-transport-belt"].ending_patch = DyWorld_ending_patch_prototype(Material_Colors.Steel)
data.raw["transport-belt"]["fast-transport-belt"].animations = {
      filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 16,
      direction_count = 12,
	  tint = Material_Colors.Steel,
      hr_version =
      {
        filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
        priority = "extra-high",
        width = 80,
        height = 80,
        scale = 0.5,
        frame_count = 16,
        direction_count = 12,
		tint = Material_Colors.Steel,
      }
    }
	
data.raw["transport-belt"]["express-transport-belt"].belt_horizontal = DyWorld_basic_belt_horizontal(Material_Colors.Stainless_Steel)
data.raw["transport-belt"]["express-transport-belt"].belt_vertical = DyWorld_basic_belt_vertical(Material_Colors.Stainless_Steel)
data.raw["transport-belt"]["express-transport-belt"].ending_top = DyWorld_basic_belt_ending_top(Material_Colors.Stainless_Steel)
data.raw["transport-belt"]["express-transport-belt"].ending_bottom = DyWorld_basic_belt_ending_bottom(Material_Colors.Stainless_Steel)
data.raw["transport-belt"]["express-transport-belt"].ending_side = DyWorld_basic_belt_ending_side(Material_Colors.Stainless_Steel)
data.raw["transport-belt"]["express-transport-belt"].starting_top = DyWorld_basic_belt_starting_top(Material_Colors.Stainless_Steel)
data.raw["transport-belt"]["express-transport-belt"].starting_bottom = DyWorld_basic_belt_starting_bottom(Material_Colors.Stainless_Steel)
data.raw["transport-belt"]["express-transport-belt"].starting_side = DyWorld_basic_belt_starting_side(Material_Colors.Stainless_Steel)
data.raw["transport-belt"]["express-transport-belt"].ending_patch = DyWorld_ending_patch_prototype(Material_Colors.Stainless_Steel)
data.raw["transport-belt"]["express-transport-belt"].animations = {
      filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 16,
      direction_count = 12,
	  tint = Material_Colors.Stainless_Steel,
      hr_version =
      {
        filename = "__base__/graphics/entity/transport-belt/hr-transport-belt.png",
        priority = "extra-high",
        width = 80,
        height = 80,
        scale = 0.5,
        frame_count = 16,
        direction_count = 12,
		tint = Material_Colors.Stainless_Steel,
      }
    }

	

data.raw["underground-belt"]["underground-belt"].belt_horizontal = DyWorld_basic_belt_horizontal(Material_Colors.Iron)
data.raw["underground-belt"]["underground-belt"].belt_vertical = DyWorld_basic_belt_vertical(Material_Colors.Iron)
data.raw["underground-belt"]["underground-belt"].ending_top = DyWorld_basic_belt_ending_top(Material_Colors.Iron)
data.raw["underground-belt"]["underground-belt"].ending_bottom = DyWorld_basic_belt_ending_bottom(Material_Colors.Iron)
data.raw["underground-belt"]["underground-belt"].ending_side = DyWorld_basic_belt_ending_side(Material_Colors.Iron)
data.raw["underground-belt"]["underground-belt"].starting_top = DyWorld_basic_belt_starting_top(Material_Colors.Iron)
data.raw["underground-belt"]["underground-belt"].starting_bottom = DyWorld_basic_belt_starting_bottom(Material_Colors.Iron)
data.raw["underground-belt"]["underground-belt"].starting_side = DyWorld_basic_belt_starting_side(Material_Colors.Iron)
data.raw["underground-belt"]["underground-belt"].ending_patch = DyWorld_ending_patch_prototype(Material_Colors.Iron)
data.raw["underground-belt"]["underground-belt"].structure = {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.25, 0},
          width = 57,
          height = 43,
          y = 43,
		  tint = Material_Colors.Iron,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            y = 85,
            scale = 0.5,
			tint = Material_Colors.Iron,
          }
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.25, 0},
          width = 57,
          height = 43,
		  tint = Material_Colors.Iron,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            scale = 0.5,
			tint = Material_Colors.Iron,
          }

        }

      }
    }
	
data.raw["underground-belt"]["fast-underground-belt"].belt_horizontal = DyWorld_basic_belt_horizontal(Material_Colors.Steel)
data.raw["underground-belt"]["fast-underground-belt"].belt_vertical = DyWorld_basic_belt_vertical(Material_Colors.Steel)
data.raw["underground-belt"]["fast-underground-belt"].ending_top = DyWorld_basic_belt_ending_top(Material_Colors.Steel)
data.raw["underground-belt"]["fast-underground-belt"].ending_bottom = DyWorld_basic_belt_ending_bottom(Material_Colors.Steel)
data.raw["underground-belt"]["fast-underground-belt"].ending_side = DyWorld_basic_belt_ending_side(Material_Colors.Steel)
data.raw["underground-belt"]["fast-underground-belt"].starting_top = DyWorld_basic_belt_starting_top(Material_Colors.Steel)
data.raw["underground-belt"]["fast-underground-belt"].starting_bottom = DyWorld_basic_belt_starting_bottom(Material_Colors.Steel)
data.raw["underground-belt"]["fast-underground-belt"].starting_side = DyWorld_basic_belt_starting_side(Material_Colors.Steel)
data.raw["underground-belt"]["fast-underground-belt"].ending_patch = DyWorld_ending_patch_prototype(Material_Colors.Steel)
data.raw["underground-belt"]["fast-underground-belt"].structure = {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.25, 0},
          width = 57,
          height = 43,
          y = 43,
		  tint = Material_Colors.Steel,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            y = 85,
            scale = 0.5,
			tint = Material_Colors.Steel,
          }
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.25, 0},
          width = 57,
          height = 43,
		  tint = Material_Colors.Steel,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            scale = 0.5,
			tint = Material_Colors.Steel,
          }

        }

      }
    }
	
data.raw["underground-belt"]["express-underground-belt"].belt_horizontal = DyWorld_basic_belt_horizontal(Material_Colors.Stainless_Steel)
data.raw["underground-belt"]["express-underground-belt"].belt_vertical = DyWorld_basic_belt_vertical(Material_Colors.Stainless_Steel)
data.raw["underground-belt"]["express-underground-belt"].ending_top = DyWorld_basic_belt_ending_top(Material_Colors.Stainless_Steel)
data.raw["underground-belt"]["express-underground-belt"].ending_bottom = DyWorld_basic_belt_ending_bottom(Material_Colors.Stainless_Steel)
data.raw["underground-belt"]["express-underground-belt"].ending_side = DyWorld_basic_belt_ending_side(Material_Colors.Stainless_Steel)
data.raw["underground-belt"]["express-underground-belt"].starting_top = DyWorld_basic_belt_starting_top(Material_Colors.Stainless_Steel)
data.raw["underground-belt"]["express-underground-belt"].starting_bottom = DyWorld_basic_belt_starting_bottom(Material_Colors.Stainless_Steel)
data.raw["underground-belt"]["express-underground-belt"].starting_side = DyWorld_basic_belt_starting_side(Material_Colors.Stainless_Steel)
data.raw["underground-belt"]["express-underground-belt"].ending_patch = DyWorld_ending_patch_prototype(Material_Colors.Stainless_Steel)
data.raw["underground-belt"]["express-underground-belt"].structure = {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.25, 0},
          width = 57,
          height = 43,
          y = 43,
		  tint = Material_Colors.Stainless_Steel,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            y = 85,
            scale = 0.5,
			tint = Material_Colors.Stainless_Steel,
          }
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          shift = {0.25, 0},
          width = 57,
          height = 43,
		  tint = Material_Colors.Stainless_Steel,
          hr_version =
          {
            filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure.png",
            priority = "extra-high",
            shift = {0.15625, 0.0703125},
            width = 106,
            height = 85,
            scale = 0.5,
			tint = Material_Colors.Stainless_Steel,
          }

        }

      }
    }


	
data.raw["splitter"]["splitter"].belt_horizontal = DyWorld_basic_belt_horizontal(Material_Colors.Iron)
data.raw["splitter"]["splitter"].belt_vertical = DyWorld_basic_belt_vertical(Material_Colors.Iron)
data.raw["splitter"]["splitter"].ending_top = DyWorld_basic_belt_ending_top(Material_Colors.Iron)
data.raw["splitter"]["splitter"].ending_bottom = DyWorld_basic_belt_ending_bottom(Material_Colors.Iron)
data.raw["splitter"]["splitter"].ending_side = DyWorld_basic_belt_ending_side(Material_Colors.Iron)
data.raw["splitter"]["splitter"].starting_top = DyWorld_basic_belt_starting_top(Material_Colors.Iron)
data.raw["splitter"]["splitter"].starting_bottom = DyWorld_basic_belt_starting_bottom(Material_Colors.Iron)
data.raw["splitter"]["splitter"].starting_side = DyWorld_basic_belt_starting_side(Material_Colors.Iron)
data.raw["splitter"]["splitter"].ending_patch = DyWorld_ending_patch_prototype(Material_Colors.Iron)
data.raw["splitter"]["splitter"].structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/splitter/splitter-north.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 83,
        height = 36,
        shift = {0.265625, 0},
		tint = Material_Colors.Iron,
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 70,
          shift = {0.25, 0.046875},
          scale = 0.5,
		  tint = Material_Colors.Iron,
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 80,
        shift = {0.109375, -0.03125},
		tint = Material_Colors.Iron,
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 93,
          height = 157,
          shift = {0.148438, -0.179688},
          scale = 0.5,
		  tint = Material_Colors.Iron,
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/splitter/splitter-south.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 85,
        height = 35,
        shift = {0.140625, -0.015625},
		tint = Material_Colors.Iron,
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 168,
          height = 67,
          shift = {0.140625, 0.0234375},
          scale = 0.5,
		  tint = Material_Colors.Iron,
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 78,
        shift = {0.296875, -0.03125},
		tint = Material_Colors.Iron,
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 94,
          height = 154,
          shift = {0.203125, -0.109375},
          scale = 0.5,
		  tint = Material_Colors.Iron,
        }
      },
    }
	
data.raw["splitter"]["fast-splitter"].belt_horizontal = DyWorld_basic_belt_horizontal(Material_Colors.Steel)
data.raw["splitter"]["fast-splitter"].belt_vertical = DyWorld_basic_belt_vertical(Material_Colors.Steel)
data.raw["splitter"]["fast-splitter"].ending_top = DyWorld_basic_belt_ending_top(Material_Colors.Steel)
data.raw["splitter"]["fast-splitter"].ending_bottom = DyWorld_basic_belt_ending_bottom(Material_Colors.Steel)
data.raw["splitter"]["fast-splitter"].ending_side = DyWorld_basic_belt_ending_side(Material_Colors.Steel)
data.raw["splitter"]["fast-splitter"].starting_top = DyWorld_basic_belt_starting_top(Material_Colors.Steel)
data.raw["splitter"]["fast-splitter"].starting_bottom = DyWorld_basic_belt_starting_bottom(Material_Colors.Steel)
data.raw["splitter"]["fast-splitter"].starting_side = DyWorld_basic_belt_starting_side(Material_Colors.Steel)
data.raw["splitter"]["fast-splitter"].ending_patch = DyWorld_ending_patch_prototype(Material_Colors.Steel)
data.raw["splitter"]["fast-splitter"].structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/splitter/splitter-north.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 83,
        height = 36,
        shift = {0.265625, 0},
		tint = Material_Colors.Steel,
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 70,
          shift = {0.25, 0.046875},
          scale = 0.5,
		  tint = Material_Colors.Steel,
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 80,
        shift = {0.109375, -0.03125},
		tint = Material_Colors.Steel,
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 93,
          height = 157,
          shift = {0.148438, -0.179688},
          scale = 0.5,
		  tint = Material_Colors.Steel,
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/splitter/splitter-south.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 85,
        height = 35,
        shift = {0.140625, -0.015625},
		tint = Material_Colors.Steel,
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 168,
          height = 67,
          shift = {0.140625, 0.0234375},
          scale = 0.5,
		  tint = Material_Colors.Steel,
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 78,
        shift = {0.296875, -0.03125},
		tint = Material_Colors.Steel,
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 94,
          height = 154,
          shift = {0.203125, -0.109375},
          scale = 0.5,
		  tint = Material_Colors.Steel,
        }
      },
    }
	
data.raw["splitter"]["express-splitter"].belt_horizontal = DyWorld_basic_belt_horizontal(Material_Colors.Stainless_Steel)
data.raw["splitter"]["express-splitter"].belt_vertical = DyWorld_basic_belt_vertical(Material_Colors.Stainless_Steel)
data.raw["splitter"]["express-splitter"].ending_top = DyWorld_basic_belt_ending_top(Material_Colors.Stainless_Steel)
data.raw["splitter"]["express-splitter"].ending_bottom = DyWorld_basic_belt_ending_bottom(Material_Colors.Stainless_Steel)
data.raw["splitter"]["express-splitter"].ending_side = DyWorld_basic_belt_ending_side(Material_Colors.Stainless_Steel)
data.raw["splitter"]["express-splitter"].starting_top = DyWorld_basic_belt_starting_top(Material_Colors.Stainless_Steel)
data.raw["splitter"]["express-splitter"].starting_bottom = DyWorld_basic_belt_starting_bottom(Material_Colors.Stainless_Steel)
data.raw["splitter"]["express-splitter"].starting_side = DyWorld_basic_belt_starting_side(Material_Colors.Stainless_Steel)
data.raw["splitter"]["express-splitter"].ending_patch = DyWorld_ending_patch_prototype(Material_Colors.Stainless_Steel)
data.raw["splitter"]["express-splitter"].structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/splitter/splitter-north.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 83,
        height = 36,
        shift = {0.265625, 0},
		tint = Material_Colors.Stainless_Steel,
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 70,
          shift = {0.25, 0.046875},
          scale = 0.5,
		  tint = Material_Colors.Stainless_Steel,
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 80,
        shift = {0.109375, -0.03125},
		tint = Material_Colors.Stainless_Steel,
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 93,
          height = 157,
          shift = {0.148438, -0.179688},
          scale = 0.5,
		  tint = Material_Colors.Stainless_Steel,
        }
      },
      south =
      {
        filename = "__base__/graphics/entity/splitter/splitter-south.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 85,
        height = 35,
        shift = {0.140625, -0.015625},
		tint = Material_Colors.Stainless_Steel,
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 168,
          height = 67,
          shift = {0.140625, 0.0234375},
          scale = 0.5,
		  tint = Material_Colors.Stainless_Steel,
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west.png",
        frame_count = 32,
        line_length = 16,
        priority = "extra-high",
        width = 51,
        height = 78,
        shift = {0.296875, -0.03125},
		tint = Material_Colors.Stainless_Steel,
        hr_version =
        {
          filename = "__base__/graphics/entity/splitter/hr-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 94,
          height = 154,
          shift = {0.203125, -0.109375},
          scale = 0.5,
		  tint = Material_Colors.Stainless_Steel,
        }
      },
    }


