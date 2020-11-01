



data:extend({
  {
    type = "fluid",
    name = "natural-gas",
    default_temperature = 50,
    max_temperature = 50,
	gas_temperature = 10,
	emissions_multiplier = 10,
    heat_capacity = "5J",
    fuel_value = "50MJ",
    base_color = {r=0, g=0.34, b=0.6},
    flow_color = {r=0.7, g=0.7, b=0.7},
    icon = DyDs_path_fluid.."oxygen.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "oxygen",
    subgroup = DyDs.."z-fluids",
	auto_barrel = false,
	auto_canister = true,
	auto_canister_tier = 2,
  },
  {
    type = "fluid",
    name = "oxygen",
    default_temperature = 20,
    max_temperature = 2800,
	gas_temperature = 20,
	emissions_multiplier = -1,
    heat_capacity = "5J",
    base_color = {r=0, g=0.34, b=0.6},
    flow_color = {r=0.7, g=0.7, b=0.7},
    icon = DyDs_path_fluid.."oxygen.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "oxygen",
    subgroup = DyDs.."z-fluids",
	auto_barrel = false,
	auto_canister = true,
	auto_canister_tier = 1,
  },
  {
    type = "fluid",
    name = "hydrogen",
    default_temperature = 20,
    max_temperature = 2660,
	gas_temperature = 20,
	emissions_multiplier = 2,
    heat_capacity = "5J",
    base_color = {r=0, g=0.34, b=0.6},
    flow_color = {r=0.7, g=0.7, b=0.7},
    icon = DyDs_path_fluid.."hydrogen.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "hydrogen",
    subgroup = DyDs.."z-fluids",
	auto_barrel = false,
	auto_canister = true,
	auto_canister_tier = 1,
  },
  {
    type = "fluid",
    name = "nitrogen",
    default_temperature = 20,
    max_temperature = 1369,
	gas_temperature = 20,
	emissions_multiplier = 5,
    heat_capacity = "5J",
    base_color = {r=0, g=0.34, b=0.6},
    flow_color = {r=0.7, g=0.7, b=0.7},
    icon = DyDs_path_fluid.."nitrogen.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "nitrogen",
    subgroup = DyDs.."z-fluids",
	auto_barrel = false,
	auto_canister = true,
	auto_canister_tier = 1,
  },
  {
    type = "fluid",
    name = "methane",
    default_temperature = 20,
    max_temperature = 20,
	gas_temperature = 20,
	emissions_multiplier = 3.5,
    heat_capacity = "5J",
    base_color = {r=0, g=0.34, b=0.6},
    flow_color = {r=0.7, g=0.7, b=0.7},
    icon = DyDs_path_fluid.."methane.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "methane",
    subgroup = DyDs.."z-fluids",
	auto_barrel = false,
	auto_canister = true,
	auto_canister_tier = 1,
  },
})

data.raw.fluid.water.auto_barrel = false
data.raw.fluid.water.auto_canister = true
data.raw.fluid.water.auto_canister_tier = 1
data.raw.fluid["crude-oil"].auto_canister = true
data.raw.fluid["crude-oil"].auto_canister_tier = 2
data.raw.fluid["heavy-oil"].auto_canister = true
data.raw.fluid["heavy-oil"].auto_canister_tier = 3
data.raw.fluid["light-oil"].auto_canister = true
data.raw.fluid["light-oil"].auto_canister_tier = 3