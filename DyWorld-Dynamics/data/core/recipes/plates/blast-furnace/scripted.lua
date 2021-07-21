


local function Reagent_Check(TIER)
	if TIER == 1 then
		return "hydrogen"
	elseif TIER == 2 then
		return "nitrogen"
	elseif TIER == 3 then
		return "oxygen"
	else
		return "water"
	end
end

for k,v in pairs(Dy_Metals) do
	if data.raw.fluid["molten-"..k] then
data:extend({
  {
    type = "recipe",
    name = "melt-"..k.."",
	category = "blast-furnace",
	main_product = "molten-"..k,
    normal =
    {
      ingredients =
      {
        {type = "item", name = k.."-ore", amount = 100},
        {type = "fluid", name = Reagent_Check(v.Tier), amount = 75},
      },
      results = 
      {
        {type = "fluid", name = "molten-"..k, amount_min = 90, amount_max = 125},
        {type = "item", name = "slag", amount_min = 1, amount_max = 5},
      },
	  energy_required = 30,
	  main_product = "molten-"..k,
	  enabled = false,
    },
  },
})
	end
end