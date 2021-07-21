for k,v in pairs(Dy_Metals) do
data:extend({
  {
    type = "recipe",
    name = "cast-"..k.."-ingot",
	category = "casting-furnace",
	main_product = k.."-ingot",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-"..k, amount = 5},
      },
      results = 
      {
        {type = "item", name = k.."-ingot", amount = 1},
      },
	  energy_required = 1,
	  main_product = k.."-ingot",
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-"..k.."-plate",
	category = "casting-furnace",
	main_product = k.."-plate",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-"..k, amount = 1},
      },
      results = 
      {
        {type = "item", name = k.."-plate", amount = 1},
      },
	  energy_required = 0.25,
	  main_product = k.."-plate",
	  enabled = false,
    },
  },
})
end