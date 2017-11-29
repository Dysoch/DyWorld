require "data/prefix"

for k,v in pairs(Material_Table) do
	if v.Type == "Basic" or v.Type == "Simple_Alloy" or v.Type == "Alloy" or v.Type == "Complex_Alloy" or v.Type == "Super_Alloy" then
		data:extend(
		{
		  {
			type = "fluid",
			name = dy.."molten-"..v.Name,
			localised_name = {"looped-name.fluid-molten", {"looped-name."..v.Name}},
			icons = 
			{
			  { 
				icon = dyworld_path_fluid.."base.png",
				tint = Material_Colors[v.Table],
			  },
			},
			default_temperature = Materials[v.Table].Melting_Point,
			max_temperature = Materials[v.Table].Boiling_Point,
			base_color = Material_Colors[v.Table],
			flow_color = Material_Colors[v.Table],
			order = v.Name,
			pressure_to_speed_ratio = 0.4,
			flow_to_energy_ratio = 0.59,
			auto_barrel = false
		  },
		})
	end
end

local Data_Table = {
	{
		Name = "molten-rock",
		Icon = dyworld_path_fluid.."rock.png",
		Def_Temp = Materials.Stone.Melting_Point,
		Max_Temp = Materials.Stone.Boiling_Point,
		Color_Base = Material_Colors.Stone,
		Color_Flow = Material_Colors.Stone,
		Barrel = false,
	},
	{
		Name = "molten-glass",
		Icon = dyworld_path_fluid.."rock.png",
		Def_Temp = 250,
		Max_Temp = 250,
		Color_Base = Material_Colors.Silver,
		Color_Flow = Material_Colors.Silver,
		Barrel = false,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Fluid(v),
	})
end