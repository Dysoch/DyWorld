



local Tech = {
	["nano-speed-2"] = {"nano-speed-1", "logistic-science-pack"},
	["nano-range-2"] = {"nano-range-1", "logistic-science-pack"},
	["nanobots-cliff"] = {"nanobots", "logistic-science-pack", "intermediates-5"},
	["nanobots"] = {"automation-science-pack"},
	["roboport-interface"] = {"intermediates-5", "storage-3", "logistica-4"},
}


for k, v in pairs(Tech) do
	DyW.Tech.Prereq.Override(k, v)
end