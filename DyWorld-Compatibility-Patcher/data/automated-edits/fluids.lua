



for _,fluid in pairs(data.raw.fluid) do
data:extend(
{
  {
    type = "recipe",
    name = "dyworld-"..fluid.name.."-del",
	category = "dy-recycling",
	hidden = true,
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = fluid.name, amount = 10},
      },
      results = 
      {
        {type = "item", name = "exotic-partical", amount_min = 1, amount_max = 1, probability = 0.0001},
      },
	  enabled = false,
	  energy_required = 0.1,
	  hidden = true,
	  allow_decomposition = false,
	  allow_as_intermediate = false,
    },
  },
})

	DyWorld_Add_To_Tech("recycling", "dyworld-"..fluid.name.."-del")
end