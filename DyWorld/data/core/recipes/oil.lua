data:extend(
{
  {
    type = "recipe",
    name = "basic-oil-processing",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="crude-refined-oil", amount=100, fluidbox_index = 2}
    },
    results=
    {
      {type="fluid", name="petroleum-gas", amount=45, fluidbox_index = 3}
    },
    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
    icon_size = 32,
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-a[basic-oil-processing]",
    main_product = ""
  },
  {
    type = "recipe",
    name = "advanced-oil-processing",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="water", amount=50},
      {type="fluid", name="crude-refined-oil", amount=100}
    },
    results=
    {
      {type="fluid", name="heavy-oil", amount=25},
      {type="fluid", name="kerosine", amount=45},
      {type="fluid", name="petroleum-gas", amount=55}
    },
    icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
    icon_size = 32,
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-b[advanced-oil-processing]"
  },
  {
    type = "recipe",
    name = "crude-refined-oil-processing",
    category = "centrifuging",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type="fluid", name="water", amount=50},
      {type="fluid", name="crude-oil", amount=100}
    },
    results=
    {
      {type="fluid", name="crude-refined-oil", amount=25},
      {type="fluid", name="carbon-dioxide", amount=5},
      {type="fluid", name="water", amount=5},
    },
    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
    icon_size = 32,
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-a[basic-oil-processing]"
  },
  {
    type = "recipe",
    name = "rocket-fuel",
    category = "centrifuging",
    enabled = false,
    energy_required = 30,
    ingredients =
    {
      {type="fluid", name="kerosine", amount=50},
      {type="item", name="lead-plate", amount=5},
      {type="item", name="solid-fuel", amount=10},
    },
    results=
    {
      {type="item", name="rocket-fuel", amount=5},
    },
  },
})
