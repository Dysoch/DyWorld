
function Dy_Combine_RGB_Alloy(Name, Table)
	if Dy_Metal_Colors[Name] then 
		return Dy_Metal_Colors[Name]
	else
		local R_1 = 0
		local G_1 = 0
		local B_1 = 0
		local R_2 = 0
		local G_2 = 0
		local B_2 = 0
		if Dy_Metal_Colors[Table.Ingre_1] then
			R_1 = Dy_Metal_Colors[Table.Ingre_1][1] * Table.Rat_1
			G_1 = Dy_Metal_Colors[Table.Ingre_1][2] * Table.Rat_1
			B_1 = Dy_Metal_Colors[Table.Ingre_1][3] * Table.Rat_1
		else 
			R_1 = 170
			G_1 = 170
			B_1 = 170
		end
		if Dy_Metal_Colors[Table.Ingre_2] then
			R_2 = Dy_Metal_Colors[Table.Ingre_2][1] * Table.Rat_2
			G_2 = Dy_Metal_Colors[Table.Ingre_2][2] * Table.Rat_2
			B_2 = Dy_Metal_Colors[Table.Ingre_2][3] * Table.Rat_2
		else 
			R_2 = 170
			G_2 = 170
			B_2 = 170
		end
		local R = Round(((R_1 + R_2) / 2), 0)
		local G = Round(((G_1 + G_2) / 2), 0)
		local B = Round(((B_1 + B_2) / 2), 0)
		Dy_Metal_Colors[Name] = {R, G, B}
		return {R, G, B}
	end
end


for k,v in pairs(Dy_Alloys) do
	if not data.raw.fluid["molten-"..k] then
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
    base_color = Dy_Combine_RGB_Alloy(k, v),
    flow_color = Dy_Combine_RGB_Alloy(k, v),
	icons = {
	  {
		icon = DyDs_path_fluid.."metal.png",
		tint = Dy_Combine_RGB_Alloy(k, v),
	  },
	},
    icon_size = 64, icon_mipmaps = 4,
    order = k,
    subgroup = DyDs.."z-fluids",
	auto_barrel = false,
	auto_canister = false,
  },
})
	end
	if not data.raw.item[k.."-plate"] then
		DyDS_Add_Item({
			name = k.."-plate",
			order = k.."-plate",
			localised_name = {"looped-name.plate", {"looped-name."..k}},
			icons = {{icon = DyDs_path_icon.."base-plate-3.png", tint = Dy_Combine_RGB_Alloy(k, v)}},
			--localised_name = {"looped-name.gold-4"},
			stack_size = 500,
			subgroup = DyDs.."metal-4",
		})
	end
data:extend({
  {
    type = "recipe",
    name = "molten-alloy-"..k,
	category = "blast-furnace",
	main_product = "molten-"..k,
    normal =
    {
      ingredients =
      {
      },
      results = 
      {
        {type = "fluid", name = "molten-"..k, amount = 100},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 10 * v.Tier,
	  main_product = "molten-"..k,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "cast-alloy-"..k,
	category = "casting-furnace",
	main_product = k.."-plate",
    normal =
    {
      ingredients =
      {
        {type = "fluid", name = "molten-"..k, amount = 1},
      },
      results = 
      {
        {type = "item", name = k.."-plate", amount = 1},
      },
	  energy_required = 0.25,
	  main_product = k.."-plate",
	  enabled = false,
    },
  },
})
	if data.raw.fluid["molten-"..v.Ingre_1] then
		local Ingredient = {type = "fluid", name = "molten-"..v.Ingre_1, amount = math.ceil(100 * v.Rat_1)}
		table.insert(data.raw.recipe["molten-alloy-"..k].normal.ingredients, Ingredient)
	end
	if data.raw.fluid["molten-"..v.Ingre_2] then
		local Ingredient = {type = "fluid", name = "molten-"..v.Ingre_2, amount = math.ceil(100 * v.Rat_2)}
		table.insert(data.raw.recipe["molten-alloy-"..k].normal.ingredients, Ingredient)
	end
	DyWorld_ATTA("molten-alloy-"..k, {"metallurgy-alloy-"..v.Tier})
	DyWorld_ATTA("cast-alloy-"..k, {"metallurgy-alloy-"..v.Tier})
end