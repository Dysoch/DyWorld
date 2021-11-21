
local Table = {
	{
		name = "water",
		temp = 15,
		max_temp = 100,
		gas_temp = 20,
		pollution = 1,
		heat = "200J",
		fuel = "0MJ",
		color = {r = 0, g = 0.34, b = 0.6},
		icon = true,
		group = DyDs.."f-basic",
		canister = true,
		canister_tier = 1,
	},
	{
		name = "steam",
		temp = 15,
		max_temp = 5000,
		gas_temp = 15,
		pollution = 1,
		heat = "200J",
		fuel = "0MJ",
		color = {r = 0.5, g = 0.5, b = 0.5},
		icon = true,
		group = DyDs.."f-basic",
	},
	{
		name = "blood",
		temp = 20,
		max_temp = 20,
		gas_temp = 20,
		pollution = 1,
		heat = "0J",
		fuel = "0MJ",
		color = {r = 1, g = 0, b = 0},
		icon = true,
		group = DyDs.."f-basic",
	},
	{
		name = "bodily-fluid",
		temp = 20,
		max_temp = 20,
		gas_temp = 20,
		pollution = 1,
		heat = "0J",
		fuel = "0MJ",
		color = {r = 0.75, g = 0.6, b = 0.6},
		icon = false,
		group = DyDs.."f-basic",
	},
}

for k,v in pairs(Table) do
	DyW.Fluid.Add(v)
end
