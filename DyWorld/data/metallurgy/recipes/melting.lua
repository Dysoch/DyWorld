require "data/prefix"

data:extend(
{
  {
    type = "recipe",
    name = dy.."molten-rock",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."molten-rock"].icon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
    category = dy.."blast-furnace",
    energy_required = 5,
	enabled = false,
    ingredients =
    {
      {type = "item", name = "stone", amount = 10},
      {type = "item", name = "coal", amount = 1},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-rock", amount = 125},
    },
    subgroup = dy.."sub-recipes",
    order = dy.."molten-rock",
  },
})

for k,v in pairs(Material_Table) do
	if v.Type == "Basic" then
		data:extend(
		{
		  {
			type = "recipe",
			name = dy.."molten-"..v.Name,
			icons = 
			{
			  {
				icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
			  },
			  {
				icon = dyworld_path_fluid.."base.png",
				tint = Material_Colors[v.Table],
				scale = 0.75,
				shift = {4, 7}
			  },
			},
			category = dy.."blast-furnace",
			energy_required = 0.5,
			enabled = false,
			ingredients =
			{
			  {type = "fluid", name = dy.."molten-rock", amount = 10, minimum_temperature = Materials[v.Table].Melting_Point},
			  {type = "item", name = v.Name.."-ore", amount = 1},
			},
			results=
			{
			  {type = "fluid", name = dy.."molten-"..v.Name, amount = 14},
			  {type = "fluid", name = dy.."sludge", amount = 10},
			},
			subgroup = dy.."melting-recipes",
			order = dy.."molten-"..v.Name,
		  },
		})
		DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-"..v.Name)
	end
end

DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-rock")