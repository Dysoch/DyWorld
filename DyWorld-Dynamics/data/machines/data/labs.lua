

local DyWorld_Prototype_1 = DyDs_CopyPrototype("lab", "lab", "lab-1", true)
local lab_inputs =
{
  "iron-ore-impure",
  "iron-ingot",
  "copper-ore-impure",
  "copper-ingot",
  "tin-ore-impure",
  "tin-ingot",
  "steel-plate",
  "bronze-plate",
  "limestone",
  "quartzite",
  "granite",
  "sandstone",
  "slag",
  "coal",
}

DyWorld_Prototype_1.inputs = lab_inputs
DyWorld_Prototype_1.fast_replaceable_group = "lab"
DyWorld_Prototype_1.resistances = Resist_Tier_1(0.8)
DyWorld_Prototype_1.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "lab-1",
    icon = "__base__/graphics/icons/lab.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."labs",
    order = "lab-1",
    place_result = "lab-1",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "lab-1",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 8},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "lab-1",
	  enabled = false,
	  energy_required = 5,
    },
  },
})

local DyWorld_Prototype_2 = DyDs_CopyPrototype("lab", "lab", "lab-2", true)
local lab_inputs =
{
  "canister-empty",
}
DyWorld_Prototype_2.inputs = lab_inputs
DyWorld_Prototype_2.fast_replaceable_group = "lab"

data:extend({
    DyWorld_Prototype_2,
  {
    type = "item",
    name = "lab-2",
    icon = "__base__/graphics/icons/lab.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."labs",
    order = "lab-2",
    place_result = "lab-2",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "lab-2",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        -- @todo Rewrite recipe Lab 2
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "iron-plate", amount = 8},
        {type = "item", name = "bronze-plate", amount = 2},
      },
      result = "lab-2",
	  enabled = false,
	  energy_required = 5,
    },
  },
})

local DyWorld_Prototype_3 = DyDs_CopyPrototype("lab", "lab", "lab-3", true)
local lab_inputs =
{
  "automation-science-pack",
  "logistic-science-pack",
  "chemical-science-pack",
  "military-science-pack",
  "production-science-pack",
  "utility-science-pack",
  "biological-science-pack",
}

DyWorld_Prototype_3.inputs = lab_inputs
DyWorld_Prototype_3.collision_box = {{-3.3, -3.3}, {3.3, 3.3}}
DyWorld_Prototype_3.selection_box = {{-3.5, -3.5}, {3.5, 3.5}}
DyWorld_Prototype_3.drawing_box = {{-3.5, -3.9}, {3.5, 3.5}}
DyWorld_Prototype_3.fast_replaceable_group = "lab"
DyWorld_Prototype_3.icon = "__space-exploration-graphics__/graphics/icons/mechanical-laboratory.png"
DyWorld_Prototype_3.on_animation = {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/mechanical-laboratory/sr/mechanical-laboratory.png",
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
          filename = "__space-exploration-graphics-5__/graphics/entity/mechanical-laboratory/sr/mechanical-laboratory-shadow.png",
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
DyWorld_Prototype_3.off_animation = {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/mechanical-laboratory/sr/mechanical-laboratory.png",
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
          filename = "__space-exploration-graphics-5__/graphics/entity/mechanical-laboratory/sr/mechanical-laboratory-shadow.png",
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
  DyWorld_Prototype_3,
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
        {type = "item", name = "lab-2", amount = 1},
        {type = "item", name = "control-board-2", amount = 3},
        {type = "item", name = "steel-plate", amount = 8},
        {type = "item", name = "titanium-plate", amount = 2},
      },
      result = "lab-3",
	  enabled = false,
	  energy_required = 5,
    },
  },
})

local DyWorld_Prototype_4 = DyDs_CopyPrototype("lab", "lab", "lab-4", true)
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
DyWorld_Prototype_4.inputs = lab_inputs
DyWorld_Prototype_4.collision_box = {{-3.3, -3.3}, {3.3, 3.3}}
DyWorld_Prototype_4.selection_box = {{-3.5, -3.5}, {3.5, 3.5}}
DyWorld_Prototype_4.drawing_box = {{-3.5, -3.9}, {3.5, 3.5}}
DyWorld_Prototype_4.fast_replaceable_group = "lab"
DyWorld_Prototype_4.icon = "__space-exploration-graphics__/graphics/icons/genetics-laboratory.png"
DyWorld_Prototype_4.on_animation = {
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
DyWorld_Prototype_4.off_animation = {
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
    DyWorld_Prototype_4,
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