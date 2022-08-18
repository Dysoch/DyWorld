


function DyW.Fluid.Add(name, params)
data:extend({
  {
    type = "fluid",
    name = name,
    default_temperature = params[1],
    max_temperature = params[2],
	gas_temperature = params[3],
	emissions_multiplier = params[4],
    heat_capacity = params[5],
    fuel_value = params[6],
    base_color = params[11],
    flow_color = params[11],
    icon = "__DyWorld-Dynamics__/graphics/questionmark.png",
    icon_size = 64, 
    order = name,
    subgroup = DyDs.."f-"..params[8],
	auto_barrel = false,
	auto_canister = params[9],
	auto_canister_tier = params[10],
  },
})
    DyW.Fx.Edited("fluid", name, "Fluid_Add")
	if params[7] then
		data.raw.fluid[name].icon = "__DyWorld-Dynamics__/graphics/fluids/"..name..".png"
	end
end