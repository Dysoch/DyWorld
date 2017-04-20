require "data/prefix"

Disable_Recipes = {"firearm-magazine", "piercing-rounds-magazine", "lab", "iron-axe", "steel-axe", "burner-mining-drill", "stone-furnace"}

for k,v in pairs(Disable_Recipes) do
	if not data.raw["recipe"][v].hidden then
		data.raw["recipe"][v].hidden = true
	end
end		