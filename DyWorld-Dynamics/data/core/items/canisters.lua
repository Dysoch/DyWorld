


DyDS_Add_Item({
	name = "canister-empty",
    icon = DyDs_path_icon.."canister.png",
	order = "1",
	stack_size = 10,
	subgroup = DyDs.."z-canisters",
})

data:extend({
  {
    type = "recipe",
    name = "canister-empty",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "copper-plate", amount = 1},
        {type = "item", name = "iron-plate", amount = 2},
      },
      result = "canister-empty",
	  result_count = 1,
	  energy_required = 0.5,
	  enabled = false,
    },
    expensive =
    {
      ingredients =
      {
        {type = "item", name = "copper-plate", amount = 1},
        {type = "item", name = "iron-plate", amount = 2},
      },
      result = "canister-empty",
	  result_count = 1,
	  energy_required = 5,
	  enabled = false,
    },
  },
})