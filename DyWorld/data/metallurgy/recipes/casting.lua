require "data/prefix"

	
for k,v in pairs(Material_Table) do
	if v.Name == "stone" or v.Name == "wood" then
		--nothing
	else
		data:extend(
		{
		  {
			type = "recipe",
			name = dy..v.Name.."-plate",
			category = dy.."forge",
			energy_required = 7.5,
			enabled = false,
			ingredients =
			{
			  {type = "fluid", name = dy.."molten-"..v.Name, amount = 100},
			},
			results=
			{
			  {type = "item", name = v.Name.."-plate", amount = 10},
			},
			subgroup = dy.."casting-recipes",
			order = dy..v.Name.."-plate",
		  },
		})
		DyWorld_Add_To_Tech(dy.."ore-smelting", dy..v.Name.."-plate")
	end
end