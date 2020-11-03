data:extend({
  {
    type = "recipe",
    name = "stone-brick-basic-1",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "limestone", amount = 10},
        {type = "item", name = "lignite", amount = 1},
      },
      result = "stone-brick",
	  result_count = 5,
	  energy_required = 5,
	  enabled = true,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "limestone", amount = 20},
        {type = "item", name = "lignite", amount = 1},
      },
      result = "stone-brick",
	  result_count = 5,
	  energy_required = 25,
	  enabled = true,
    },
  },
  {
    type = "recipe",
    name = "stone-brick-basic-2",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "granite", amount = 5},
        {type = "item", name = "lignite", amount = 1},
      },
      result = "stone-brick",
	  result_count = 5,
	  energy_required = 5,
	  enabled = true,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "granite", amount = 10},
        {type = "item", name = "lignite", amount = 1},
      },
      result = "stone-brick",
	  result_count = 5,
	  energy_required = 25,
	  enabled = true,
    },
  },
  {
    type = "recipe",
    name = "stone-brick-basic-3",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "sandstone", amount = 15},
        {type = "item", name = "lignite", amount = 1},
      },
      result = "stone-brick",
	  result_count = 5,
	  energy_required = 5,
	  enabled = true,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "sandstone", amount = 40},
        {type = "item", name = "lignite", amount = 1},
      },
      result = "stone-brick",
	  result_count = 5,
	  energy_required = 25,
	  enabled = true,
    },
  },
  {
    type = "recipe",
    name = "stone-brick-basic-4",
	category = "kiln-basic",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "quartzite", amount = 20},
        {type = "item", name = "lignite", amount = 1},
      },
      result = "stone-brick",
	  result_count = 5,
	  energy_required = 5,
	  enabled = true,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "quartzite", amount = 50},
        {type = "item", name = "lignite", amount = 1},
      },
      result = "stone-brick",
	  result_count = 5,
	  energy_required = 25,
	  enabled = true,
    },
  },
  {
    type = "recipe",
    name = "stone-brick-advanced-1",
	category = "bloomery",
	main_product = "stone-brick",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "quartzite", amount = 35},
      },
      results = 
      {
        {type = "item", name = "stone-brick", amount_min = 10, amount_max = 20},
      },
	  energy_required = 10,
	  main_product = "stone-brick",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "stone-brick-advanced-2",
	category = "bloomery",
	main_product = "stone-brick",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "limestone", amount = 15},
      },
      results = 
      {
        {type = "item", name = "stone-brick", amount_min = 10, amount_max = 20},
      },
	  energy_required = 10,
	  main_product = "stone-brick",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "stone-brick-advanced-3",
	category = "bloomery",
	main_product = "stone-brick",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "granite", amount = 10},
      },
      results = 
      {
        {type = "item", name = "stone-brick", amount_min = 10, amount_max = 20},
      },
	  energy_required = 10,
	  main_product = "stone-brick",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "stone-brick-advanced-4",
	category = "bloomery",
	main_product = "stone-brick",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "sandstone", amount = 50},
      },
      results = 
      {
        {type = "item", name = "stone-brick", amount_min = 10, amount_max = 20},
      },
	  energy_required = 10,
	  main_product = "stone-brick",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "landfill-1",
	category = "bloomery",
	main_product = "landfill",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "limestone", amount = 50},
      },
      results = 
      {
        {type = "item", name = "landfill", amount_min = 25, amount_max = 50},
      },
	  energy_required = 30,
	  main_product = "landfill",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "landfill-2",
	category = "bloomery",
	main_product = "landfill",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "quartzite", amount = 50},
      },
      results = 
      {
        {type = "item", name = "landfill", amount_min = 25, amount_max = 50},
      },
	  energy_required = 30,
	  main_product = "landfill",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "landfill-3",
	category = "bloomery",
	main_product = "landfill",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "granite", amount = 50},
      },
      results = 
      {
        {type = "item", name = "landfill", amount_min = 25, amount_max = 50},
      },
	  energy_required = 30,
	  main_product = "landfill",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "landfill-4",
	category = "bloomery",
	main_product = "landfill",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "sandstone", amount = 50},
      },
      results = 
      {
        {type = "item", name = "landfill", amount_min = 25, amount_max = 50},
      },
	  energy_required = 30,
	  main_product = "landfill",
	  enabled = false,
    },
  },
})