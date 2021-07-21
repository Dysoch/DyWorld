




function DyDS_Add_Recipe_Item(params)
data:extend(
{
  {
    type = "recipe",
    name = params.name,
	category = "assembling-tier-1",
	main_product = params.name,
    normal =
    {
      ingredients =
      {
      },
      results = 
      {
        {type = "item", name = params.name, amount = 1},
      },
	  main_product = params.name,
	  energy_required = 1,
	  enabled = false,
    },
  }
})
end

function DyDS_Add_Ingredient_To_Recipe(RECIPE, ADD)
	if not RECIPE then error("RECIPE doesnt exist (DyDS_Add_Ingredient_To_Recipe)") end
	if not ADD then error("ADD doesnt exist (DyDS_Add_Ingredient_To_Recipe)") end
	if not data.raw.recipe[RECIPE] then error("Recipe "..RECIPE.." doesnt exist (DyDS_Add_Ingredient_To_Recipe)") end
	local Recipe = data.raw.recipe[RECIPE]
	if not Recipe.normal then error("Recipe "..RECIPE.." doesnt have normal table (DyDS_Add_Ingredient_To_Recipe)") end
	if not Recipe.normal.ingredients then error("Recipe "..RECIPE.." doesnt have ingredients table (DyDS_Add_Ingredient_To_Recipe)") end
	table.insert(Recipe.normal.ingredients, ADD)
end

function DyDS_Override_Results_Recipe(RECIPE, AMOUNT)
	if not RECIPE then error("RECIPE doesnt exist (DyDS_Override_Results_Recipe)") end
	if not AMOUNT then error("AMOUNT doesnt exist (DyDS_Override_Results_Recipe)") end
	if not data.raw.recipe[RECIPE] then error("Recipe "..RECIPE.." doesnt exist (DyDS_Override_Results_Recipe)") end
	local Recipe = data.raw.recipe[RECIPE]
	if not Recipe.normal then error("Recipe "..RECIPE.." doesnt have normal table (DyDS_Override_Results_Recipe)") end
	local ADD = {type = "item", name = RECIPE, amount = AMOUNT}
	Recipe.normal.results = {ADD}
	if Recipe.normal.result then Recipe.normal.result = nil end
	if Recipe.normal.result_count then Recipe.normal.result_count = nil end
end

function DyDS_Recipe_Set_Time(RECIPE, TIME)
	if not RECIPE then error("RECIPE doesnt exist (DyDS_Recipe_Set_Time)") end
	if not TIME then error("TIME doesnt exist (DyDS_Recipe_Set_Time)") end
	if not data.raw.recipe[RECIPE] then error("Recipe "..RECIPE.." doesnt exist (DyDS_Recipe_Set_Time)") end
	local Recipe = data.raw.recipe[RECIPE]
	if not Recipe.normal then error("Recipe "..RECIPE.." doesnt have normal table (DyDS_Recipe_Set_Time)") end
	Recipe.normal.energy_required = TIME
end

function DyDS_Recipe_Set_Tier(RECIPE, TIER)
	if not RECIPE then error("RECIPE doesnt exist (DyDS_Recipe_Set_Tier)") end
	if not TIER then error("TIER doesnt exist (DyDS_Recipe_Set_Tier)") end
	if not data.raw.recipe[RECIPE] then error("Recipe "..RECIPE.." doesnt exist (DyDS_Recipe_Set_Tier)") end
	local Recipe = data.raw.recipe[RECIPE]
	if TIER == "0" then
		Recipe.category = "assembling-tier-0"
	elseif TIER == "1" then
		Recipe.category = "assembling-tier-1"
	elseif TIER == "2" then
		Recipe.category = "assembling-tier-2"
	elseif TIER == "3" then
		Recipe.category = "assembling-tier-3"
	elseif TIER == "4" then
		Recipe.category = "assembling-tier-4"
	elseif TIER == "5" then
		Recipe.category = "assembling-tier-5"
	elseif TIER == "6" then
		Recipe.category = "assembling-tier-6"
	elseif TIER == "7" then
		Recipe.category = "assembling-tier-7"
	elseif TIER == "8" then
		Recipe.category = "assembling-tier-8"
	elseif TIER == "9" then
		Recipe.category = "assembling-tier-9"
	elseif TIER == "10" then
		Recipe.category = "assembling-tier-10"
	elseif TIER == "kiln" then
		Recipe.category = "kiln-basic"
	elseif TIER == "bloomery" then
		Recipe.category = "bloomery"
	elseif TIER == "grinder" then
		Recipe.category = "grinder"
	elseif TIER == "farming" then
		Recipe.category = "farming"
	elseif TIER == "smelting" then
		Recipe.category = "smelting"
	elseif TIER == "electrolysis" then
		Recipe.category = "electrolysis"
	elseif TIER == "blasting" then
		Recipe.category = "blast-furnace"
	elseif TIER == "casting" then
		Recipe.category = "casting-furnace"
	else
		Recipe.category = "assembling-tier-1"
	end
end

