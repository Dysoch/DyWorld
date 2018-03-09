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
    max_level = "5",
    order = dy.."robot-battery",
  },
  {
    type = "technology",
    name = dy.."robot-battery-6",
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
    max_level = "10",
    order = dy.."robot-battery",
  },
  {
    type = "technology",
    name = dy.."robot-battery-11",
    icon = dyworld_path_tech.."robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.2
      }
    },
    prerequisites = {dy.."robot-battery-6"},
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
    max_level = "15",
    order = dy.."robot-battery",
  },
  {
    type = "technology",
    name = dy.."robot-battery-16",
    icon = dyworld_path_tech.."robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.25
      }
    },
    prerequisites = {dy.."robot-battery-11"},
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
    max_level = "20",
    order = dy.."robot-battery",
  },
  {
    type = "technology",
    name = dy.."robot-battery-21",
    icon = dyworld_path_tech.."robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.25
      }
    },
    prerequisites = {dy.."robot-battery-16"},
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
