


for k,v in pairs(data.raw.fluid) do
	if v.auto_canister then
		DyDS_Add_Tool({
			name = "canister-"..v.name,
			localised_name = {"looped-name.canister-filled", {"fluid-name."..v.name}},
			icons = {
				{
					icon = data.raw.tool["canister-empty"].icon,
				},
				{
					icon = data.raw.fluid[v.name].icon,
					scale = 0.3,
					offset = {-8, -8},
				},
			},
			order = v.name,
			stack_size = 10,
			durability = 1,
			subgroup = DyDs.."z-canisters",
		})
	table.insert(data.raw.lab["lab-2"].inputs, "canister-"..v.name)
data:extend({
  {
    type = "recipe",
    name = "canister-"..v.name,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "canister-empty", amount = 2},
        {type = "fluid", name = v.name, amount = 400},
      },
      result = "canister-"..v.name,
	  result_count = 2,
	  energy_required = 2.5,
	  enabled = false,
    },
  },
})
	DyWorld_Add_To_Tech("fluids-"..v.auto_canister_tier, "canister-"..v.name)
	end
end