
local reci = data.raw.recipe

if mods["LogisticTrainNetwork"] then
	if reci["logistic-train-stop"] then
		reci["logistic-train-stop"].hidden = false
		reci["logistic-train-stop"].DyWorld_Hider = false
	end
end
