data:extend
({
  {
    type = "technology",
    name = "inserter-capacity-bonus-8",
    icon = "__base__/graphics/technology/inserter-capacity.png",
    icon_size = 128,
    prerequisites = {"inserter-capacity-bonus-7"},
	effects =
	{
	  {
		type = "inserter-stack-size-bonus",
		modifier = 0.5
	  },
	  {
		type = "stack-inserter-capacity-bonus",
		modifier = 2
	  }
	},
    unit =
    {
      count_formula = "400+4^(L-4)*100",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 30
    },
    max_level = "infinite",
    upgrade = true,
    order = "c-k-f-e"
  }
})
