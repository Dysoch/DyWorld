

local DyWorld_Prototype_1 = DyDs_CopyPrototype("lab", "lab", "lab-4", true)
local lab_inputs =
{
  "raw-fish-pike-filet",
  "raw-fish-salmon-filet",
  "chitin",
  "soil",
  "acidic-residue",
  "blood-bottle",
  "dna-myriapod",
  "dna-arachnid",
  "wood",
  "sulfur",
  "exotic-partical",
}

DyWorld_Prototype_1.inputs = lab_inputs
DyWorld_Prototype_1.collision_box = {{-3.3, -3.3}, {3.3, 3.3}}
DyWorld_Prototype_1.selection_box = {{-3.5, -3.5}, {3.5, 3.5}}
DyWorld_Prototype_1.drawing_box = {{-3.5, -3.9}, {3.5, 3.5}}
DyWorld_Prototype_1.icon = "__space-exploration-graphics__/graphics/icons/genetics-laboratory.png"
DyWorld_Prototype_1.on_animation = {
      layers =
      {
        {
          filename = "__space-exploration-graphics-2__/graphics/entity/genetics-laboratory/sr/genetics-laboratory.png",
          priority = "high",
          width = 3584/8/2,
          height = 2048/4/2,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, -16),
          animation_speed = 0.5,
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-2__/graphics/entity/genetics-laboratory/sr/genetics-laboratory-shadow.png",
          priority = "high",
          width = 604/2,
          height = 302/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 32,
          shift = util.by_pixel(40, 8),
          animation_speed = 0.5,
        },
      },
    }
DyWorld_Prototype_1.off_animation = {
      layers =
      {
        {
          filename = "__space-exploration-graphics-2__/graphics/entity/genetics-laboratory/sr/genetics-laboratory.png",
          priority = "high",
          width = 3584/8/2,
          height = 2048/4/2,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, -16),
          animation_speed = 0.000001,
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-2__/graphics/entity/genetics-laboratory/sr/genetics-laboratory-shadow.png",
          priority = "high",
          width = 604/2,
          height = 302/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 32,
          shift = util.by_pixel(40, 8),
          animation_speed = 0.000001,
        },
      },
    }


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "lab-4",
    icon = "__space-exploration-graphics__/graphics/icons/genetics-laboratory.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."labs",
    order = "lab-4",
    place_result = "lab-4",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "lab-4",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "lab-1", amount = 1},
        {type = "item", name = "control-board-2", amount = 3},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "lab-4",
	  enabled = false,
	  energy_required = 5,
    },
  },
})