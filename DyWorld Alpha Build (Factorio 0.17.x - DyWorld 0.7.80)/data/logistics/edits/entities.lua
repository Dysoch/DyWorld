require "data/prefix"



--[[data.raw["transport-belt"]["transport-belt"].localised_name = {"looped-name.belt", {"looped-name.iron"}}
data.raw["transport-belt"]["fast-transport-belt"].localised_name = {"looped-name.belt", {"looped-name.steel"}}
data.raw["transport-belt"]["express-transport-belt"].localised_name = {"looped-name.belt", {"looped-name.stainless-steel"}}

data.raw["underground-belt"]["underground-belt"].localised_name = {"looped-name.underground-belt", {"looped-name.iron"}}
data.raw["underground-belt"]["fast-underground-belt"].localised_name = {"looped-name.underground-belt", {"looped-name.steel"}}
data.raw["underground-belt"]["express-underground-belt"].localised_name = {"looped-name.underground-belt", {"looped-name.stainless-steel"}}

data.raw["splitter"]["splitter"].localised_name = {"looped-name.splitter", {"looped-name.iron"}}
data.raw["splitter"]["fast-splitter"].localised_name = {"looped-name.splitter", {"looped-name.steel"}}
data.raw["splitter"]["express-splitter"].localised_name = {"looped-name.splitter", {"looped-name.stainless-steel"}}



data.raw["transport-belt"]["transport-belt"].speed = (DyWorld_Material_Formulas(1, "Iron")/426.67)
data.raw["transport-belt"]["fast-transport-belt"].speed = (DyWorld_Material_Formulas(1, "Steel")/426.67)
data.raw["transport-belt"]["express-transport-belt"].speed = (DyWorld_Material_Formulas(1, "Stainless_Steel")/426.67)

data.raw["underground-belt"]["underground-belt"].speed = (DyWorld_Material_Formulas(1, "Iron")/426.67)
data.raw["underground-belt"]["fast-underground-belt"].speed = (DyWorld_Material_Formulas(1, "Steel")/426.67)
data.raw["underground-belt"]["express-underground-belt"].speed = (DyWorld_Material_Formulas(1, "Stainless_Steel")/426.67)

data.raw["splitter"]["splitter"].speed = (DyWorld_Material_Formulas(1, "Iron")/426.67)
data.raw["splitter"]["fast-splitter"].speed = (DyWorld_Material_Formulas(1, "Steel")/426.67)
data.raw["splitter"]["express-splitter"].speed = (DyWorld_Material_Formulas(1, "Stainless_Steel")/426.67)



data.raw["transport-belt"]["transport-belt"].max_health = DyWorld_Material_Formulas(3, "Iron")
data.raw["transport-belt"]["fast-transport-belt"].max_health = DyWorld_Material_Formulas(3, "Steel")
data.raw["transport-belt"]["express-transport-belt"].max_health = DyWorld_Material_Formulas(3, "Stainless_Steel")

data.raw["underground-belt"]["underground-belt"].max_health = DyWorld_Material_Formulas(3, "Iron")
data.raw["underground-belt"]["fast-underground-belt"].max_health = DyWorld_Material_Formulas(3, "Steel")
data.raw["underground-belt"]["express-underground-belt"].max_health = DyWorld_Material_Formulas(3, "Stainless_Steel")

data.raw["splitter"]["splitter"].max_health = DyWorld_Material_Formulas(3, "Iron")
data.raw["splitter"]["fast-splitter"].max_health = DyWorld_Material_Formulas(3, "Steel")
data.raw["splitter"]["express-splitter"].max_health = DyWorld_Material_Formulas(3, "Stainless_Steel")



data.raw["underground-belt"]["underground-belt"].max_distance = DyWorld_Material_Formulas(2, "Iron")
data.raw["underground-belt"]["fast-underground-belt"].max_distance = DyWorld_Material_Formulas(2, "Steel")
data.raw["underground-belt"]["express-underground-belt"].max_distance = DyWorld_Material_Formulas(2, "Stainless_Steel")



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

data.raw["pipe"]["pipe"].pictures = DyWorld_pipepictures(Material_Colors.Stone)
data.raw["pipe-to-ground"]["pipe-to-ground"].pictures =
    {
      up =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
		tint = Material_Colors.Stone,
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5,
		   tint = Material_Colors.Stone,
        }
      },
      down =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
		tint = Material_Colors.Stone,
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5,
		   tint = Material_Colors.Stone,
        }
      },
      left =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
		tint = Material_Colors.Stone,
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5,
		   tint = Material_Colors.Stone,
        }
      },
      right =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
		tint = Material_Colors.Stone,
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5,
		   tint = Material_Colors.Stone,
        }
      },
    }

data.raw["pipe"]["pipe"].localised_name = {"edits-name.pipe"}
data.raw["pipe-to-ground"]["pipe-to-ground"].localised_name = {"edits-name.pipe-to-ground"}
	
data.raw["pipe"]["pipe"].max_health = DyWorld_Material_Formulas(3, "Stone")
data.raw["pipe-to-ground"]["pipe-to-ground"].max_health = DyWorld_Material_Formulas(3, "Stone")

data.raw["pipe"]["pipe"].fluid_box.base_area = (DyWorld_Material_Formulas(4, "Stone") / 100)
data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.base_area = (DyWorld_Material_Formulas(4, "Stone") / 100)

data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance = DyWorld_Material_Formulas(2, "Stone") ]]--
