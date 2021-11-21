
local Table = {
	["sulfuric-acid"] = {25, 25, 25, 1, "100J", "0MJ", true, "acidic", false, 1, {r = 0.75, g = 0.65, b = 0.1}},
}

--[[
	[1] = temp,
	[2] = max temp,
	[3] = gas temp,
	[4] = pollution,
	[5] = heat,
	[6] = fuel,
	[7] = icon,
	[8] = group,
	[9] = canister, 
	[10] = canister tier,
	[11] = color
]]--

for k,v in pairs(Table) do
	DyW.Fluid.Add(k, v)
end