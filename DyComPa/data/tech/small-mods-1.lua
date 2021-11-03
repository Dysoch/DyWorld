
local tech = data.raw.technology

if mods["LogisticTrainNetwork"] then
	if tech["logistic-train-network"] then
		tech["logistic-train-network"].prerequisites = {"rails-2"}
		tech["logistic-train-network"].unit.time = 600
		tech["logistic-train-network"].unit.count = 1
		tech["logistic-train-network"].unit.ingredients = {
			{"copper-ingot", 1500},
			{"iron-ingot", 2500},
			{"bronze-plate", 1000},
		}
	end
end
