
StackSizes = {
	{Name = "iron-ore", Amount = 200, Type = "item"},
	{Name = "copper-ore", Amount = 200, Type = "item"},
	{Name = "stone", Amount = 200, Type = "item"},
	{Name = "wood", Amount = 200, Type = "item"},
	{Name = "raw-wood", Amount = 200, Type = "item"},
	{Name = "coal", Amount = 200, Type = "item"},
}

for k,v in pairs(StackSizes) do
	data.raw[v.Type][v.Name].stack_size = v.Amount
end