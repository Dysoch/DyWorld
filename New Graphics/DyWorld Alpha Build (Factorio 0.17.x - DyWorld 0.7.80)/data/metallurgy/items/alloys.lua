require "data/prefix"

for k,v in pairs(Material_Table) do
	if v.Type == "Simple_Alloy" or v.Type == "Alloy" or v.Type == "Complex_Alloy" or v.Type == "Super_Alloy" then
		if not data.raw.item[v.Name.."-plate"] then
			data:extend(
			{	  
			  {
				type = "item",
				name = v.Name.."-plate",
				icons = 
				{
				  {
					icon = dyworld_path_icon.."alloy/"..v.Name..".png",
				  },
				},
				flags = {},
				subgroup = dy.."metal-3-alloy-2",
				stack_size = 200,
				order = v.Name,
			  },
			})
		end
	end
	if v.Type == "Simple_Alloy" then
		data.raw.item[v.Name.."-plate"].subgroup = dy.."metal-3-alloy-1"
	elseif v.Type == "Alloy" then
		data.raw.item[v.Name.."-plate"].subgroup = dy.."metal-3-alloy-2"
	elseif v.Type == "Complex_Alloy" then
		data.raw.item[v.Name.."-plate"].subgroup = dy.."metal-3-alloy-3"
	elseif v.Type == "Super_Alloy" then
		data.raw.item[v.Name.."-plate"].subgroup = dy.."metal-3-alloy-4"
	end
end

data.raw.item["copper-plate"].subgroup = dy.."metal-2-plate"
data.raw.item["copper-plate"].order = "copper"
data.raw.item["iron-plate"].subgroup = dy.."metal-2-plate"
data.raw.item["iron-plate"].order = "iron"
data.raw.item["steel-plate"].subgroup = dy.."metal-3-alloy-1"
data.raw.item["steel-plate"].order = "steel"

data.raw.item["copper-ore"].order = "copper"
data.raw.item["copper-ore"].subgroup = dy.."metal-1-ore"
data.raw.item["iron-ore"].order = "iron"
data.raw.item["iron-ore"].subgroup = dy.."metal-1-ore"