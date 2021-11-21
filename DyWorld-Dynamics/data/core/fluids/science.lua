

local Science_Table = {"automation", "logistic", "chemical", "military", "production", "utility", "biological"}

for k,v in pairs(Science_Table) do
data:extend({
  {
    type = "fluid",
    name = v.."-science-fluid",
    default_temperature = 500,
    max_temperature = 500,
	gas_temperature = 1000,
	emissions_multiplier = 1,
    heat_capacity = "0J",
    fuel_value = "0MJ",
    base_color = Science_Colors[v],
    flow_color = Science_Colors[v],
	icons = {
	  {
		icon = DyDs_path_fluid.."metal.png",
		tint = Science_Colors[v],
	  },
	},
    icon_size = 64,
    subgroup = DyDs.."f-science-1",
	auto_barrel = false,
	auto_canister = false,
  },
  {
    type = "fluid",
    name = v.."-science-fluid-advanced",
    default_temperature = 500,
    max_temperature = 500,
	gas_temperature = 1000,
	emissions_multiplier = 1,
    heat_capacity = "0J",
    fuel_value = "0MJ",
    base_color = Science_Colors[v],
    flow_color = Science_Colors[v],
	icons = {
	  {
		icon = DyDs_path_fluid.."metal.png",
		tint = Science_Colors[v],
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."f-science-2",
	auto_barrel = false,
	auto_canister = false,
  },
})
end
