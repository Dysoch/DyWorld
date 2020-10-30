data:extend({
  {
    type = "recipe",
    name = "quartz",
	category = "grinder",
	main_product = "quartz",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "quartzite", amount = 10},
        {type = "fluid", name = "water", amount = 50},
      },
      results = 
      {
        {type = "item", name = "quartz", amount_min = 10, amount_max = 30},
      },
	  energy_required = 7.5,
	  main_product = "quartz",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "granite", amount = 10 * ER_Mod},
        {type = "fluid", name = "water", amount = 50 * ER_Mod},
      },
      results = 
      {
        {type = "item", name = "quartz", amount_min = 5, amount_max = 15},
      },
	  energy_required = 7.5 * ER_Mod,
	  main_product = "quartz",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "concrete-powder",
	category = "grinder",
	main_product = "concrete-powder",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "limestone", amount = 10},
        {type = "item", name = "sand", amount = 50},
      },
      results = 
      {
        {type = "item", name = "concrete-powder", amount_min = 10, amount_max = 30},
      },
	  energy_required = 30,
	  main_product = "concrete-powder",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "granite", amount = 10 * ER_Mod},
        {type = "item", name = "sand", amount = 50 * ER_Mod},
      },
      results = 
      {
        {type = "item", name = "concrete-powder", amount_min = 5, amount_max = 15},
      },
	  energy_required = 30 * ER_Mod,
	  main_product = "concrete-powder",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "refined-concrete-powder",
	category = "grinder",
	main_product = "refined-concrete-powder",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "limestone", amount = 10},
        {type = "item", name = "quartz", amount = 50},
        {type = "item", name = "aluminium-plate", amount = 5},
      },
      results = 
      {
        {type = "item", name = "refined-concrete-powder", amount_min = 10, amount_max = 30},
      },
	  energy_required = 30,
	  main_product = "refined-concrete-powder",
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "limestone", amount = 10 * ER_Mod},
        {type = "item", name = "quartz", amount = 50 * ER_Mod},
        {type = "item", name = "aluminium-plate", amount = 5 * ER_Mod},
      },
      results = 
      {
        {type = "item", name = "refined-concrete-powder", amount_min = 5, amount_max = 15},
      },
	  energy_required = 30 * ER_Mod,
	  main_product = "refined-concrete-powder",
	  enabled = false,
    },
  },
})