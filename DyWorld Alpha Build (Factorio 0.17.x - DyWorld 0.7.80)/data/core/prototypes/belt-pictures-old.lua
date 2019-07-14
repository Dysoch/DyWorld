-- Specifies set of pictures and animations used by more entities, to avoid duplication.
-- The standard set of transport belt pictures (vertical/horizontal + endings + startings)
-- are used in transport belt, transport belt to ground and splitter.

require "data/prefix"

function DyWorld_ending_patch_prototype_Old(TINT)
	local result = 
  {
    sheet =
    {
      filename = dyworld_path_entity.."start-end-integration-patches.png",
      width = 40,
      height = 40,
      priority = "extra-high",
	  tint = TINT,
      hr_version =
      {
        filename = dyworld_path_entity.."hr-start-end-integration-patches.png",
        width = 80,
        height = 80,
        priority = "extra-high",
        scale = 0.5,
		tint = TINT,
      }
    }
  }
	return result
end

---------------------- BASIC BELT PICTURES
function DyWorld_basic_belt_horizontal_Old(TINT)
	local result = 
  {
	layers = {
	  {
		filename = dyworld_path_entity.."lr-belt-base.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-base.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  scale = 0.5,
		  line_length = 32,
		  frame_count = 32,
		}
	  },
	  {
		filename = dyworld_path_entity.."lr-belt-mask.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		tint = TINT,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-mask.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  scale = 0.5,
		  line_length = 32,
		  frame_count = 32,
		  tint = TINT,
		}
	  },
	},
  }
	return result
end

function DyWorld_basic_belt_vertical_Old(TINT)
	local result = 
  {
	layers = {
	  {
		filename = dyworld_path_entity.."lr-belt-base.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 40,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-base.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  scale = 0.5,
		  y = 80,
		}
	  },
	  {
		filename = dyworld_path_entity.."lr-belt-mask.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 40,
		tint = TINT,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-mask.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  scale = 0.5,
		  y = 80,
		  tint = TINT,
		}
	  },
	},
  }
	return result
end


function DyWorld_basic_belt_ending_top_Old(TINT)
	local result = 
  {
	layers = {
	  {
		filename = dyworld_path_entity.."lr-belt-base.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 80,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-base.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  y = 160,
		  scale = 0.5,
		}
	  },
	  {
		filename = dyworld_path_entity.."lr-belt-mask.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 80,
		tint = TINT,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-mask.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  y = 160,
		  scale = 0.5,
		  tint = TINT,
		}
	  },
	},
  }
	return result
end


function DyWorld_basic_belt_ending_bottom_Old(TINT)
	local result = 
  {
	layers = {
	  {
		filename = dyworld_path_entity.."lr-belt-base.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 120,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-base.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  y = 240,
		  scale = 0.5,
		}
	  },
	  {
		filename = dyworld_path_entity.."lr-belt-mask.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 120,
		tint = TINT,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-mask.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  y = 240,
		  scale = 0.5,
		  tint = TINT,
		}
	  },
	},
  }
	return result
end


function DyWorld_basic_belt_ending_side_Old(TINT)
	local result = 
  {
	layers = {
	  {
		filename = dyworld_path_entity.."lr-belt-base.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 160,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-base.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  y = 320,
		  scale = 0.5,
		}
	  },
	  {
		filename = dyworld_path_entity.."lr-belt-mask.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 160,
		tint = TINT,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-mask.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  y = 320,
		  scale = 0.5,
		  tint = TINT,
		}
	  },
	},
  }
	return result
end

function DyWorld_basic_belt_starting_top_Old(TINT)
	local result = 
  {
	layers = {
	  {
		filename = dyworld_path_entity.."lr-belt-base.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 200,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-base.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  y = 400,
		  scale = 0.5,
		}
	  },
	  {
		filename = dyworld_path_entity.."lr-belt-mask.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 200,
		tint = TINT,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-mask.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  y = 400,
		  scale = 0.5,
		  tint = TINT,
		}
	  },
	},
  }
	return result
end


function DyWorld_basic_belt_starting_bottom_Old(TINT)
	local result = 
  {
	layers = {
	  {
		filename = dyworld_path_entity.."lr-belt-base.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 240,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-base.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  y = 480,
		  scale = 0.5,
		}
	  },
	  {
		filename = dyworld_path_entity.."lr-belt-mask.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 240,
		tint = TINT,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-mask.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  y = 480,
		  scale = 0.5,
		  tint = TINT,
		}
	  },
	},
  }
	return result
end


function DyWorld_basic_belt_starting_side_Old(TINT)
	local result = 
  {
	layers = {
	  {
		filename = dyworld_path_entity.."lr-belt-base.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 280,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-base.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  y = 560,
		  scale = 0.5,
		}
	  },
	  {
		filename = dyworld_path_entity.."lr-belt-mask.png",
		priority = "extra-high",
		width = 40,
		height = 40,
		line_length = 32,
		frame_count = 32,
		y = 280,
		tint = TINT,
		hr_version =
		{
		  filename = dyworld_path_entity.."hr-belt-mask.png",
		  priority = "extra-high",
		  width = 80,
		  height = 80,
		  line_length = 32,
		  frame_count = 32,
		  y = 560,
		  scale = 0.5,
		  tint = TINT,
		}
	  },
	},
  }
	return result
end

