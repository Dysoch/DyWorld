require "data/prefix"

local Data_Table = {
	{
		Name = "oxygen",
		Icon = dyworld_path_fluid.."oxygen.png",
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.85, 
		Barrel = true,
	},
	{
		Name = "hydrogen",
		Icon = dyworld_path_fluid.."hydrogen.png",
		Def_Temp = 15,
		Max_Temp = 100,
		Color_Base = {r=0, g=0.34, b=0.6},
		Color_Flow = {r=0.7, g=0.7, b=0.7},
		Pressure = 0.85, 
		Barrel = true,
	},
}

function Table_Fluid(DATA)
  local result =
  {
    type = "fluid",
    name = DATA.Name,
    icon = DATA.Icon,
    default_temperature = DATA.Def_Temp,
    max_temperature = DATA.Max_Temp,
    base_color = DATA.Color_Base,
    flow_color = DATA.Color_Flow,
    order = DATA.Name,
    pressure_to_speed_ratio = DATA.Pressure or 0.4,
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
		Table_Fluid(v),
	})
end