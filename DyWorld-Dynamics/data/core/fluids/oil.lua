
local Table = {
	["gasoline"] = {20, 2800, 20, 1, "5J", "40MJ", true, "oil", false, 2, {r = 0, g = 0.34, b = 0.6}},
	["crude-oil"] = {20, 500, 25, 1, "100J", "0MJ", true, "oil", true, 2, {r = 0.5, g = 0.5, b = 0.5}},
	["heavy-oil"] = {25, 25, 25, 1, "0J", "0MJ", true, "oil", true, 3, {r = 0.5, g = 0.04, b = 0}},
	["light-oil"] = {25, 25, 25, 1, "100J", "0MJ", true, "oil", true, 3, {r = 0.57, g = 0.33, b = 0}},
	["petroleum-gas"] = {25, 25, 25, 1, "100J", "50MJ", true, "oil", false, 1, {r = 0.3, g = 0.1, b = 0.3}},
	["lubricant"] = {25, 25, 25, 1, "200J", "0MJ", true, "oil", false, 1, {r = 0.15, g = 0.32, b = 0.03}},
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