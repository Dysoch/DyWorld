



for k,v in pairs(Dy_Metals) do
data:extend({
  {
    type = "fluid",
    name = "molten-"..k,
	localised_name = {"looped-name.molten", {"looped-name."..k}},
    default_temperature = 500,
    max_temperature = 500,
	gas_temperature = 1000,
	emissions_multiplier = 1,
    heat_capacity = "0J",
    fuel_value = "0MJ",
    base_color = Dy_Metal_Colors[k],
    flow_color = Dy_Metal_Colors[k],
	icons = {
	  {
		icon = DyDs_path_fluid.."metal.png",
		tint = Dy_Metal_Colors[k],
	  },
	  {
	    icon = DyDs_path_looped.."1.png"
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    order = k,
    subgroup = DyDs.."f-molten-1",
	auto_barrel = false,
	auto_canister = false,
  },
  {
    type = "fluid",
    name = "molten-"..k.."-2",
	localised_name = {"looped-name.molten-2", {"looped-name."..k}},
    default_temperature = 500,
    max_temperature = 500,
	gas_temperature = 1000,
	emissions_multiplier = 1,
    heat_capacity = "0J",
    fuel_value = "0MJ",
    base_color = Dy_Metal_Colors[k],
    flow_color = Dy_Metal_Colors[k],
	icons = {
	  {
		icon = DyDs_path_fluid.."metal.png",
		tint = Dy_Metal_Colors[k],
	  },
	  {
	    icon = DyDs_path_looped.."2.png"
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    order = k,
    subgroup = DyDs.."f-molten-2",
	auto_barrel = false,
	auto_canister = false,
  },
  {
    type = "fluid",
    name = "molten-"..k.."-3",
	localised_name = {"looped-name.molten-3", {"looped-name."..k}},
    default_temperature = 500,
    max_temperature = 500,
	gas_temperature = 1000,
	emissions_multiplier = 1,
    heat_capacity = "0J",
    fuel_value = "0MJ",
    base_color = Dy_Metal_Colors[k],
    flow_color = Dy_Metal_Colors[k],
	icons = {
	  {
		icon = DyDs_path_fluid.."metal.png",
		tint = Dy_Metal_Colors[k],
	  },
	  {
	    icon = DyDs_path_looped.."3.png"
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    order = k,
    subgroup = DyDs.."f-molten-3",
	auto_barrel = false,
	auto_canister = false,
  },
  {
    type = "fluid",
    name = "molten-"..k.."-4",
	localised_name = {"looped-name.molten-4", {"looped-name."..k}},
    default_temperature = 500,
    max_temperature = 500,
	gas_temperature = 1000,
	emissions_multiplier = 1,
    heat_capacity = "0J",
    fuel_value = "0MJ",
    base_color = Dy_Metal_Colors[k],
    flow_color = Dy_Metal_Colors[k],
	icons = {
	  {
		icon = DyDs_path_fluid.."metal.png",
		tint = Dy_Metal_Colors[k],
	  },
	  {
	    icon = DyDs_path_looped.."4.png"
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    order = k,
    subgroup = DyDs.."f-molten-4",
	auto_barrel = false,
	auto_canister = false,
  },
  {
    type = "fluid",
    name = "molten-"..k.."-5",
	localised_name = {"looped-name.molten-5", {"looped-name."..k}},
    default_temperature = 500,
    max_temperature = 500,
	gas_temperature = 1000,
	emissions_multiplier = 1,
    heat_capacity = "0J",
    fuel_value = "0MJ",
    base_color = Dy_Metal_Colors[k],
    flow_color = Dy_Metal_Colors[k],
	icons = {
	  {
		icon = DyDs_path_fluid.."metal.png",
		tint = Dy_Metal_Colors[k],
	  },
	  {
	    icon = DyDs_path_looped.."5.png"
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    order = k,
    subgroup = DyDs.."f-molten-5",
	auto_barrel = false,
	auto_canister = false,
  },
})
end

data:extend({
  {
    type = "fluid",
    name = "molten-steel",
    default_temperature = 500,
    max_temperature = 500,
	gas_temperature = 1000,
	emissions_multiplier = 1,
    heat_capacity = "0J",
    fuel_value = "0MJ",
    base_color = Steel_Color,
    flow_color = Steel_Color,
	icons = {
	  {
		icon = DyDs_path_fluid.."metal.png",
		tint = Steel_Color,
	  },
	  {
	    icon = DyDs_path_looped.."1.png"
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    order = "steel",
    subgroup = DyDs.."f-molten-1",
	auto_barrel = false,
	auto_canister = false,
  },
  {
    type = "fluid",
    name = "molten-bronze",
    default_temperature = 500,
    max_temperature = 500,
	gas_temperature = 1000,
	emissions_multiplier = 1,
    heat_capacity = "0J",
    fuel_value = "0MJ",
    base_color = Bronze_Color,
    flow_color = Bronze_Color,
	icons = {
	  {
		icon = DyDs_path_fluid.."metal.png",
		tint = Bronze_Color,
	  },
	  {
	    icon = DyDs_path_looped.."1.png"
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    order = "bronze",
    subgroup = DyDs.."f-molten-1",
	auto_barrel = false,
	auto_canister = false,
  },
})
