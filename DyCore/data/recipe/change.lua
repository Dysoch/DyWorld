

DyW.Recipe.Change = {}

function DyW.Recipe.Change.Category(RECIPE, CATEGORY)
    if data.raw.recipe[RECIPE] then
        if CATEGORY and data.raw["recipe-category"][CATEGORY] then
            data.raw.recipe[RECIPE].category = CATEGORY
        end
    end
    DyW.Fx.Edited("recipe", RECIPE, "Recipe_Change_Category")
end