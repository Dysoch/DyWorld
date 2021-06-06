

local DyWorld_Prototype_1 = DyDs_CopyPrototype("lab", "lab", "lab-3", true)
local lab_inputs =
{
  "canister-empty",
}

DyWorld_Prototype_1.inputs = lab_inputs
DyWorld_Prototype_1.collision_box = {{-3.3, -3.3}, {3.3, 3.3}}
DyWorld_Prototype_1.selection_box = {{-3.5, -3.5}, {3.5, 3.5}}
DyWorld_Prototype_1.drawing_box = {{-3.5, -3.9}, {3.5, 3.5}}
DyWorld_Prototype_1.icon = "__space-exploration-graphics__/graphics/icons/mechanical-laboratory.png"
DyWorld_Prototype_1.on_animation = {
      layers =
      {
        {
          filename = "__space-exploration-graphics__/graphics/entity/mechanical-laboratory/sr/mechanical-laboratory.png",
          priority = "high",
          width = 1920/8,
          height = 1792/8,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(0, -16),
          animation_speed = 0.5,
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics__/graphics/entity/mechanical-laboratory/sr/mechanical-laboratory-shadow.png",
          priority = "high",
          width = 347,
          height = 200,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(40, 8),
          animation_speed = 0.5,
        },
      },
    }
DyWorld_Prototype_1.off_animation = {
      layers =
      {
        {
          filename = "__space-exploration-graphics__/graphics/entity/mechanical-laboratory/sr/mechanical-laboratory.png",
          priority = "high",
          width = 1920/8,
          height = 1792/8,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(0, -16),
          animation_speed = 0.000001,
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics__/graphics/entity/mechanical-laboratory/sr/mechanical-laboratory-shadow.png",
          priority = "high",
          width = 347,
          height = 200,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(40, 8),
          animation_speed = 0.000001,
        },
      },
    }

data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "lab-3",
    icon = "__space-exploration-graphics__/graphics/icons/mechanical-laboratory.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."labs",
    order = "lab-3",
    place_result = "lab-3",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "lab-3",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 8},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "lab-3",
	  enabled = false,
	  energy_required = 5,
    },
  },
})