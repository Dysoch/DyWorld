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
  {
    type = "recipe",
    name = dy.."molten-glass",
    icons = 
	{
	  {
	    icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
	  },
	  {
	    icon = data.raw.fluid[dy.."molten-glass"].icon,
        scale = 0.75,
        shift = {4, 7}
	  },
	},
    category = dy.."blast-furnace",
    energy_required = 5,
	enabled = false,
    ingredients =
    {
      {type = "item", name = dy.."sand", amount = 10},
      {type = "fluid", name = dy.."molten-rock", amount = 5, minimum_temperature = 999},
    },
    results=
    {
      {type = "fluid", name = dy.."molten-glass", amount = 200},
    },
    subgroup = dy.."sub-recipes",
    order = dy.."molten-glass",
  },
})

for k,v in pairs(Material_Table) do
	if v.Type == "Basic" then
		data:extend(
		{
		  {
			type = "recipe",
			name = dy.."molten-"..v.Name,
			localised_name = {"looped-name.melting-ore", {"looped-name."..v.Name}},
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
			energy_required = 1.5,
			enabled = false,
			ingredients =
			{
			  {type = "fluid", name = dy.."molten-rock", amount = 5, minimum_temperature = Materials[v.Table].Melting_Point},
			  {type = "item", name = v.Name.."-clean-ore", amount = 1},
			},
			results=
			{
			  {type = "fluid", name = dy.."molten-"..v.Name, amount = 14},
			  {type = "fluid", name = dy.."sludge", amount = 10},
			},
			subgroup = dy.."melting-recipes",
			order = dy.."molten-"..v.Name,
		  },
		  {
			type = "recipe",
			name = dy.."molten-"..v.Name.."-pebble",
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
			energy_required = 1.5,
			enabled = false,
			ingredients =
			{
			  {type = "fluid", name = dy.."molten-rock", amount = 0.5, minimum_temperature = Materials[v.Table].Melting_Point},
			  {type = "item", name = v.Name.."-pebble", amount = 1},
			},
			results=
			{
			  {type = "fluid", name = dy.."molten-"..v.Name, amount = 1.3},
			  {type = "fluid", name = dy.."sludge", amount = 1.1},
			},
			subgroup = dy.."melting-recipes",
			order = dy.."molten-"..v.Name.."-pebble",
		  },
		})
	end
end

DyWorld_Add_To_Tech(dy.."ore-smelting", dy.."molten-rock")