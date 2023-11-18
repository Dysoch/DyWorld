local DyDs_icon_temp = "__DyCore__/graphics/questionmark.png"


function DyW.Fluid.Add(name, params)
data:extend({
  {
    type = "fluid",
    name = name,
    default_temperature = params.temp_def or 15,
    max_temperature = params.temp_max or 100,
	gas_temperature = params.temp_gas or 100,
	emissions_multiplier = params.emission or 1,
    heat_capacity = params.heat or "1KJ",
    fuel_value = params.fuel or "0J",
    base_color = params.color or {},
    flow_color = params.color or {},
    icon = DyDs_icon_temp,
    icon_size = 64,
    order = v.order or name,
    subgroup = (params.group and DyDs..params.group) or "fluid",
	auto_barrel = false,
	auto_canister = params.canister and true or false,
	auto_canister_tier = params.canister or nil,
  },
})
    DyW.Fx.Edited("fluid", name, "Fluid_Add")
	if params.icons then
        data.raw.fluid[name].icon = nil
		data.raw.fluid[name].icons = params.icons
	end
	if params.icon then
        data.raw.fluid[name].icons = nil
		data.raw.fluid[name].icon = params.icon
	end
end