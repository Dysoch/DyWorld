


function DyW.Fluid.Add(params)
data:extend({
  {
    type = "fluid",
    name = params.name,
    default_temperature = params.temp and params.temp or 10,
    max_temperature = params.max_temp and params.max_temp or 100,
	gas_temperature = params.gas_temp and params.gas_temp or 10,
	emissions_multiplier = params.pollution and params.pollution or 1,
    heat_capacity = params.heat and params.heat or "5J",
    fuel_value = params.fuel and params.fuel or "50MJ",
    base_color = params.color and params.color or {r = 0, g = 0, b = 0},
    flow_color = params.color and params.color or {r = 0, g = 0, b = 0},
    icon = "__DyWorld-Dynamics__/graphics/questionmark.png",
    icon_size = 64, 
    order = params.name,
    subgroup = params.group and params.group or DyDs.."z-fluids",
	auto_barrel = params.barrel and params.barrel or false,
	auto_canister = params.canister and params.canister or false,
	auto_canister_tier = params.canister_tier and params.canister_tier or 1,
  },
})
	if params.icon then
		data.raw.fluid[params.name].icon = "__DyWorld-Dynamics__/graphics/fluids/"..params.name..".png"
	end
end