require "data/core/functions/prefix"
require "data/core/functions/colors"

function DyWorld_Master_Recipe_Creator(v)
if v.Enabled then
data:extend(
{
  {
    type = "recipe",
    name = v.Name,
    enabled = v.Recipe_Enabled,
    normal = {
	  energy_required = v.Time,
	  ingredients = {},
	},
    expensive = {
	  energy_required = v.Time,
	  ingredients = {},
	},
  },
})
	-- Ingredients adder if needed
	if v.Recipe_Ingredients then
		for Ingr_Name, Ingr_Amount in pairs(v.Recipe_Ingredients) do
			local Ingredient = {type = "item", name = Ingr_Name, amount = Ingr_Amount}
			table.insert(data.raw.recipe[v.Name].normal.ingredients, Ingredient)
			local Ingredient = {type = "item", name = Ingr_Name, amount = Ingr_Amount * 5}
			table.insert(data.raw.recipe[v.Name].expensive.ingredients, Ingredient)
		end
	end
	-- Category switcher if needed
	if v.Category then
		data.raw.recipe[v.Name].category = v.Category
	end
	-- Fluid adder if needed up to a max of 4 fluids
	if v.Add_Fluid_1 then
		local Ingredient = {type = "fluid", name = v.Add_Fluid_1, amount = v.Add_Fluid_1_Amount}
		table.insert(data.raw.recipe[v.Name].normal.ingredients, Ingredient)
		local Ingredient = {type = "fluid", name = v.Add_Fluid_1, amount = v.Add_Fluid_1_Amount * 5}
		table.insert(data.raw.recipe[v.Name].expensive.ingredients, Ingredient)
	end
	if v.Add_Fluid_2 then
		local Ingredient = {type = "fluid", name = v.Add_Fluid_2, amount = v.Add_Fluid_2_Amount}
		table.insert(data.raw.recipe[v.Name].ingredients, Ingredient)
	end
	if v.Add_Fluid_3 then
		local Ingredient = {type = "fluid", name = v.Add_Fluid_3, amount = v.Add_Fluid_3_Amount}
		table.insert(data.raw.recipe[v.Name].ingredients, Ingredient)
	end
	if v.Add_Fluid_4 then
		local Ingredient = {type = "fluid", name = v.Add_Fluid_4, amount = v.Add_Fluid_4_Amount}
		table.insert(data.raw.recipe[v.Name].ingredients, Ingredient)
	end
	-- Allow for an alternate output
	if v.Alternate_Output then
		data.raw.recipe[v.Name].normal.result = v.Alternate_Output
		data.raw.recipe[v.Name].expensive.result = v.Alternate_Output
	else
		if not v.Multi_Output then
			data.raw.recipe[v.Name].normal.result = v.Name
			data.raw.recipe[v.Name].expensive.result = v.Name
		end
	end
	-- Allow for a multi output recipe if needed
	-- YOU NEED TO SPECIFY ICON AND ITEM GROUP
	if v.Multi_Output then
		data.raw.recipe[v.Name].normal.results = {}
		data.raw.recipe[v.Name].expensive.results = {}
		for _,RESULTS in pairs(v.Multi_Output) do
			table.insert(data.raw.recipe[v.Name].normal.results, RESULTS)
			table.insert(data.raw.recipe[v.Name].expensive.results, RESULTS)
		end
		if v.Icon_Type_Icons then
			data.raw.recipe[v.Name].icons = v.Icon
		else
			data.raw.recipe[v.Name].icon = v.Icon
		end
		data.raw.recipe[v.Name].subgroup = dy..v.Subgroup
	end
end
end