
local Table = {
	["water"] = {15, 100, 20, 1, "200J", "0MJ", true, "basic", true, 1, {r = 0, g = 0.34, b = 0.6}},
	["steam"] = {15, 5000, 15, 1, "200J", "0MJ", true, "basic", false, 1, {r = 0.5, g = 0.5, b = 0.5}},
	["blood"] = {20, 20, 20, 1, "0J", "0MJ", true, "basic", false, 1, {r = 1, g = 0, b = 0}},
	["bodily-fluid"] = {20, 20, 20, 1, "0J", "0MJ", false, "basic", false, 1, {r = 0.75, g = 0.6, b = 0.6}},
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
