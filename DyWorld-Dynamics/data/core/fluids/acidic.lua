
local Table = {
	{
		name = "sulfuric-acid",
		temp = 25,
		max_temp = 25,
		gas_temp = 25,
		pollution = 1,
		heat = "100J",
		fuel = "0MJ",
		color = {r = 0.75, g = 0.65, b = 0.1},
		icon = true,
		group = DyDs.."f-acidic",
	},
}

for k,v in pairs(Table) do
	DyW.Fluid.Add(v)
end