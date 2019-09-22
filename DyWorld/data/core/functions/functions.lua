
-- Important functions used everywhere

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function Expensive_Check(num)
	local Setting = settings.startup["DyWorld_Expensive_Multiplier"].value
	return Round((num * Setting))
end

DyWorld_Productivity_Module_Add = {}