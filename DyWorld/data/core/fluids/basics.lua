require "data/core/functions/prefix"
require "data/core/functions/colors"

local Data_Table = {
	{
		Name = "pollution",
		Tier = 1,
		Def_Temp = 25,
		Max_Temp = 25,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Barrel = false,
	},
	{
		Name = "hydrogen",
		Tier = 1,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Emissions_Multiplier = 0.1,
		Barrel = true,
	},
	{
		Name = "oxygen",
		Tier = 1,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Emissions_Multiplier = 0.1,
		Barrel = true,
	},
	{
		Name = "carbon-monoxide",
		Tier = 1,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Emissions_Multiplier = 0.1,
		Barrel = true,
	},
	{
		Name = "carbon-dioxide",
		Tier = 1,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Emissions_Multiplier = 0.1,
		Barrel = true,
	},
	{
		Name = "hydrogen-peroxide",
		Tier = 1,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Emissions_Multiplier = 0.1,
		Barrel = true,
	},
	{
		Name = "nitrogen",
		Tier = 1,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Emissions_Multiplier = 1.5,
		Barrel = true,
	},
	{
		Name = "methane",
		Tier = 1,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Emissions_Multiplier = 2,
		Barrel = true,
	},
	{
		Name = "argon",
		Tier = 1,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Emissions_Multiplier = 0.1,
		Barrel = true,
	},
	{
		Name = "boron",
		Tier = 1,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Emissions_Multiplier = 0.1,
		Barrel = true,
	},
	{
		Name = "science-base",
		Tier = 1,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Barrel = false,
	},
	{
		Name = "science-1",
		Tier = 1,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Barrel = false,
	},
	{
		Name = "science-2",
		Tier = 2,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Barrel = false,
	},
	{
		Name = "science-3",
		Tier = 3,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Barrel = false,
	},
	{
		Name = "science-4",
		Tier = 3,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Barrel = false,
	},
	{
		Name = "science-5",
		Tier = 5,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Barrel = false,
	},
	{
		Name = "science-6",
		Tier = 6,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Barrel = false,
	},
	{
		Name = "science-7",
		Tier = 7,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Barrel = false,
	},
	{
		Name = "crude-refined-oil",
		Tier = 2,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Barrel = true,
	},
	{
		Name = "kerosine",
		Tier = 2,
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.4, 
		Barrel = true,
	},
}
 --------------------- BALANCING ABOVE THIS LINE, BELOW IS CODE ---------------------

local function DyWorld_Fluid(DATA)
  local result =
  {
    type = "fluid",
    name = DATA.Name,
	icons = 
	{
	  {
		icon = dyworld_path_fluid..DATA.Name..".png",
	  }
	},
    default_temperature = DATA.Def_Temp,
    max_temperature = DATA.Max_Temp,
    base_color = DATA.Color_Base,
    flow_color = DATA.Color_Flow,
    order = DATA.Name,
    subgroup = dy.."fluids-"..(DATA.Tier-1),
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false
  }
	if DATA.Barrel then
		result.auto_barrel = true
	end
	if DATA.Gas_Temp then
		result.gas_temperature = DATA.Gas_Temp
	end
	if DATA.Pressure then
		result.pressure_to_speed_ratio = DATA.Pressure
	end
	if DATA.Flow then
		result.flow_to_energy_ratio = DATA.Flow
	end
	if DATA.Emissions_Multiplier then
		result.emissions_multiplier = DATA.Emissions_Multiplier
	end
	if DATA.Heat_Capacity then
		result.heat_capacity = DATA.Heat_Capacity
	else
		result.heat_capacity = "0.2KJ"
	end
  return result
end

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Fluid(v),
	})
end