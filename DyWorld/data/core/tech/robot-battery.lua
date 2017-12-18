require "data/prefix"

data:extend
({
  {
    type = "technology",
    name = dy.."robot-battery-1",
    icon = dyworld_path_tech.."robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.1
      }
    },
    prerequisites = {"robotics"},
    unit =
    {
      count_formula = "100*L",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    upgrade = true,
    max_level = "3",
    order = dy.."robot-battery",
  },
  {
    type = "technology",
    name = dy.."robot-battery-4",
    icon = dyworld_path_tech.."robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.15
      }
    },
    prerequisites = {dy.."robot-battery-1"},
    unit =
    {
      count_formula = "150*L",
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
      time = 45
    },
    upgrade = true,
    max_level = "6",
    order = dy.."robot-battery",
  },
  {
    type = "technology",
    name = dy.."robot-battery-7",
    icon = dyworld_path_tech.."robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.2
      }
    },
    prerequisites = {dy.."robot-battery-4"},
    unit =
    {
      count_formula = "200*L",
      ingredients =
      {
        {"science-pack-1", 3},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
      },
      time = 60
    },
    upgrade = true,
    max_level = "9",
    order = dy.."robot-battery",
  },
  {
    type = "technology",
    name = dy.."robot-battery-10",
    icon = dyworld_path_tech.."robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.25
      }
    },
    prerequisites = {dy.."robot-battery-7"},
    unit =
    {
      count_formula = "250*L",
      ingredients =
      {
        {"science-pack-1", 4},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
      },
      time = 60
    },
    upgrade = true,
    max_level = "12",
    order = dy.."robot-battery",
  },
  {
    type = "technology",
    name = dy.."robot-battery-13",
    icon = dyworld_path_tech.."robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.25
      }
    },
    prerequisites = {dy.."robot-battery-10"},
    unit =
    {
      count_formula = "300*L",
      ingredients =
      {
        {"science-pack-1", 5},
        {"science-pack-2", 2},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 60
    },
    upgrade = true,
    max_level = "infinite",
    order = dy.."robot-battery",
  },
})
