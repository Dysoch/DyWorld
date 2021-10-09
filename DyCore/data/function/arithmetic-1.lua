



function DyW.Math.Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function DyW.Math.Round_Value(num, numDecimalPlaces, Value)
	local mult = 10^(numDecimalPlaces or 0)
	if math.floor(num * mult + 0.5) / mult >= Value then
		return Value
	else
		return math.floor(num * mult + 0.5) / mult
	end
end