
local Purify_List = {
	["copper"] = "nitrogen",
	["iron"] = "water",
	["tin"] = "hydrogen",
	["titanium"] = "hydrogen",
	["aluminium"] = "nitrogen",
	["magnesium"] = "methane",
	["gold"] = "methane",
	["silver"] = "methane",
	["lead"] = "methane",
}
for i = 1,3 do
	for k,v in pairs(Purify_List) do
data:extend({
  {
    type = "recipe",
    name = "ore-purify-"..k.."-"..i,
	category = "centrifuging",
	main_product = k.."-ore",
    normal =
    {
      ingredients =
      {
        i == 1 and {type = "item", name = k.."-ore-impure", amount = 10} or nil,
        i == 2 and {type = "item", name = k.."-ore-impure", amount = 100} or nil,
        i == 3 and {type = "item", name = k.."-ore-impure", amount = 1000} or nil,
		
        i == 1 and {type = "item", name = "canister-"..v, amount = 2} or nil,
        i == 2 and {type = "fluid", name = v, amount = 200} or nil,
        i == 3 and {type = "fluid", name = v, amount = 500} or nil,
      },
      results = 
      {
        i == 1 and {type = "fluid", name = v, amount = 70} or nil,
        i == 1 and {type = "item", name = "canister-empty", amount = 2} or nil,
        i == 2 and {type = "fluid", name = v, amount_min = 50, amount_max = 100} or nil,
        i == 3 and {type = "fluid", name = v, amount_min = 50, amount_max = 200} or nil,
		
        i == 1 and {type = "item", name = k.."-ore", amount_min = 6, amount_max = 10} or nil,
        i == 2 and {type = "item", name = k.."-ore", amount_min = 70, amount_max = 100} or nil,
        i == 3 and {type = "item", name = k.."-ore", amount_min = 800, amount_max = 1000} or nil,
      },
	  energy_required = (5*i),
	  main_product = k.."-ore",
	  enabled = false,
    },
  },
})
	end
end