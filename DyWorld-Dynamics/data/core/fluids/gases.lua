


local Table = {
	["natural-gas"] = {50, 50, 10, 2.5, "5J", "50MJ", true, "gases", true, 2, {r = 0, g = 0.34, b = 0.6}},
	["oxygen"] = {20, 2800, 20, 1, "5J", "0MJ", true, "gases", true, 1, {r = 0, g = 0.34, b = 0.6}},
	["hydrogen"] = {20, 2660, 20, 2, "5J", "0MJ", true, "gases", true, 1, {r = 0, g = 0.34, b = 0.6}},
	["nitrogen"] = {20, 1369, 20, 5, "5J", "0MJ", true, "gases", true, 1, {r = 0, g = 0.34, b = 0.6}},
	["methane"] = {20, 20, 20, 5, "5J", "0MJ", true, "gases", true, 1, {r = 0, g = 0.34, b = 0.6}},
	["helium"] = {20, 20, 20, 1, "5J", "0MJ", false, "gases", false, 2, {r = 0, g = 0.34, b = 0.6}},
	["fluorine"] = {20, 20, 20, 1, "5J", "0MJ", false, "gases", false, 2, {r = 0, g = 0.34, b = 0.6}},
	["chlorine"] = {20, 20, 20, 1, "5J", "0MJ", false, "gases", false, 2, {r = 0, g = 0.34, b = 0.6}},
	["neon"] = {20, 20, 20, 1, "5J", "0MJ", false, "gases", false, 2, {r = 0, g = 0.34, b = 0.6}},
	["argon"] = {20, 20, 20, 1, "5J", "0MJ", true, "gases", false, 2, {r = 0, g = 0.34, b = 0.6}},
	["krypton"] = {20, 20, 20, 1, "5J", "0MJ", false, "gases", false, 2, {r = 0, g = 0.34, b = 0.6}},
	["xenon"] = {20, 20, 20, 1, "5J", "0MJ", true, "gases", false, 2, {r = 0, g = 0.34, b = 0.6}},
	["radon"] = {20, 20, 20, 1, "5J", "0MJ", false, "gases", false, 2, {r = 0, g = 0.34, b = 0.6}},
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
