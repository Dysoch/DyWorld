require "data/prefix"

data:extend(
{
  {
    type = "lab",
    name = dy.."lab-2",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = dy.."lab-2"},
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
    on_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 33,
      line_length = 11,
      animation_speed = 1 / 3,
      shift = {0.2, 0.15}
    },
    off_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15}
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      apparent_volume = 1
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "60kW",
    researching_speed = 1,
    inputs =
    {
      "science-pack-1",
      "science-pack-2",
    },
    module_specification =
    {
      module_slots = 2,
      max_entity_info_module_icons_per_row = 3,
      max_entity_info_module_icon_rows = 1,
      module_info_icon_shift = {0, 0.9}
    }
  },
  {
    type = "lab",
    name = dy.."lab-3",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = dy.."lab-3"},
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
    on_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 33,
      line_length = 11,
      animation_speed = 1 / 3,
      shift = {0.2, 0.15}
    },
    off_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15}
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      apparent_volume = 1
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "120kW",
    researching_speed = 1.25,
    inputs =
    {
      "science-pack-1",
      "science-pack-2",
      "military-science-pack",
    },
    module_specification =
    {
      module_slots = 2,
      max_entity_info_module_icons_per_row = 3,
      max_entity_info_module_icon_rows = 1,
      module_info_icon_shift = {0, 0.9}
    }
  },
  {
    type = "lab",
    name = dy.."lab-4",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = dy.."lab-4"},
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
    on_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 33,
      line_length = 11,
      animation_speed = 1 / 3,
      shift = {0.2, 0.15}
    },
    off_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15}
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      apparent_volume = 1
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "250kW",
    researching_speed = 1.5,
    inputs =
    {
      "science-pack-1",
      "science-pack-2",
      "science-pack-3",
      "military-science-pack",
    },
    module_specification =
    {
      module_slots = 2,
      max_entity_info_module_icons_per_row = 3,
      max_entity_info_module_icon_rows = 1,
      module_info_icon_shift = {0, 0.9}
    }
  },
  {
    type = "lab",
    name = dy.."lab-5",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = dy.."lab-5"},
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
    on_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 33,
      line_length = 11,
      animation_speed = 1 / 3,
      shift = {0.2, 0.15}
    },
    off_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15}
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      apparent_volume = 1
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "500kW",
    researching_speed = 2,
    inputs =
    {
      "science-pack-1",
      "science-pack-2",
      "science-pack-3",
      "military-science-pack",
      "production-science-pack",
    },
    module_specification =
    {
      module_slots = 2,
      max_entity_info_module_icons_per_row = 3,
      max_entity_info_module_icon_rows = 1,
      module_info_icon_shift = {0, 0.9}
    }
  },
  {
    type = "lab",
    name = dy.."lab-6",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = dy.."lab-6"},
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
    on_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 33,
      line_length = 11,
      animation_speed = 1 / 3,
      shift = {0.2, 0.15}
    },
    off_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15}
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      apparent_volume = 1
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "1000kW",
    researching_speed = 2.5,
    inputs =
    {
      "science-pack-1",
      "science-pack-2",
      "science-pack-3",
      "military-science-pack",
      "production-science-pack",
      "high-tech-science-pack",
    },
    module_specification =
    {
      module_slots = 2,
      max_entity_info_module_icons_per_row = 3,
      max_entity_info_module_icon_rows = 1,
      module_info_icon_shift = {0, 0.9}
    }
  },
  {
    type = "lab",
    name = dy.."lab-7",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = dy.."lab-7"},
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
    on_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 33,
      line_length = 11,
      animation_speed = 1 / 3,
      shift = {0.2, 0.15}
    },
    off_animation =
    {
      filename = "__base__/graphics/entity/lab/lab.png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15}
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      apparent_volume = 1
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "2500kW",
    researching_speed = 3,
    inputs =
    {
      "science-pack-1",
      "science-pack-2",
      "science-pack-3",
      "military-science-pack",
      "production-science-pack",
      "high-tech-science-pack",
      "space-science-pack"
    },
    module_specification =
    {
      module_slots = 2,
      max_entity_info_module_icons_per_row = 3,
      max_entity_info_module_icon_rows = 1,
      module_info_icon_shift = {0, 0.9}
    }
  },
  {
    type = "item",
    name = dy.."lab-2",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"goes-to-quickbar"},
    subgroup = dy.."lab",
    order = dy.."lab-2",
    place_result = dy.."lab-2",
    stack_size = 10
  },
  {
    type = "recipe",
    name = dy.."lab-2",
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "lab", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 4},
      {type = "item", name = "stone", amount = 2},
    },
    result = dy.."lab-2"
  },
  {
    type = "item",
    name = dy.."lab-3",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"goes-to-quickbar"},
    subgroup = dy.."lab",
    order = dy.."lab-3",
    place_result = dy.."lab-3",
    stack_size = 10
  },
  {
    type = "recipe",
    name = dy.."lab-3",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
      {type = "item", name = dy.."lab-2", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 4},
      {type = "item", name = "stone", amount = 2},
    },
    result = dy.."lab-3"
  },
  {
    type = "item",
    name = dy.."lab-4",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"goes-to-quickbar"},
    subgroup = dy.."lab",
    order = dy.."lab-4",
    place_result = dy.."lab-4",
    stack_size = 10
  },
  {
    type = "recipe",
    name = dy.."lab-4",
    energy_required = 20,
    enabled = false,
    ingredients =
    {
      {type = "item", name = dy.."lab-3", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 4},
      {type = "item", name = "stone", amount = 2},
    },
    result = dy.."lab-4"
  },
  {
    type = "item",
    name = dy.."lab-5",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"goes-to-quickbar"},
    subgroup = dy.."lab",
    order = dy.."lab-5",
    place_result = dy.."lab-5",
    stack_size = 10
  },
  {
    type = "recipe",
    name = dy.."lab-5",
    energy_required = 30,
    enabled = false,
    ingredients =
    {
      {type = "item", name = dy.."lab-4", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 4},
      {type = "item", name = "stone", amount = 2},
    },
    result = dy.."lab-5"
  },
  {
    type = "item",
    name = dy.."lab-6",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"goes-to-quickbar"},
    subgroup = dy.."lab",
    order = dy.."lab-6",
    place_result = dy.."lab-6",
    stack_size = 10
  },
  {
    type = "recipe",
    name = dy.."lab-6",
    energy_required = 30,
    enabled = false,
    ingredients =
    {
      {type = "item", name = dy.."lab-5", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 4},
      {type = "item", name = "stone", amount = 2},
    },
    result = dy.."lab-6"
  },
  {
    type = "item",
    name = dy.."lab-7",
    icon = "__base__/graphics/icons/lab.png",
    flags = {"goes-to-quickbar"},
    subgroup = dy.."lab",
    order = dy.."lab-7",
    place_result = dy.."lab-7",
    stack_size = 10
  },
  {
    type = "recipe",
    name = dy.."lab-7",
    energy_required = 30,
    enabled = false,
    ingredients =
    {
      {type = "item", name = dy.."lab-6", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 4},
      {type = "item", name = "stone", amount = 2},
    },
    result = dy.."lab-7"
  },
}
)

data.raw.item.lab.order = dy.."lab-1"
data.raw.item.lab.subgroup = dy.."lab"
data.raw.item.lab.localized_name = {"entity-name.lab"}
data.raw.lab.lab.localized_name = {"entity-name.lab"}
data.raw.lab.lab.inputs = {"science-pack-1"}

DyWorld_Add_To_Tech(dy.."labs-1", dy.."lab-2")
DyWorld_Add_To_Tech(dy.."labs-2", dy.."lab-3")
DyWorld_Add_To_Tech(dy.."labs-3", dy.."lab-4")
DyWorld_Add_To_Tech(dy.."labs-4", dy.."lab-5")
DyWorld_Add_To_Tech(dy.."labs-5", dy.."lab-6")
DyWorld_Add_To_Tech(dy.."labs-6", dy.."lab-7")