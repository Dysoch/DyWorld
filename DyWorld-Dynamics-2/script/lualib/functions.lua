


function Dy_Log(String)
	if settings.startup["DyWorld_Debug"].value then
		log(String)
	end
end

function Dy_Find_Str(Table, String)
	return string.find(Table, String, 1, true)
end

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function getDistance(objA_X, objA_Y, objB_X, objB_Y)
    -- Get the length for each of the components x and y
    local xDist = objB_X - objA_X
    local yDist = objB_Y - objA_Y
	return math.sqrt((xDist^2)+(yDist^2)) 
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function Table_Empty(T)
    for _, _ in pairs(T) do
        return false
    end
    return true
end

function number_abre(number, km)
    if km then
        if number >= 1000000 then
            return "[color=blue]"..Round((number / 1000000), 2).."Mm[/color]"
        elseif number >= 1000 then
            return "[color=blue]"..Round((number / 1000), 2).."Km[/color]"
        else
            return "[color=blue]"..Round((number), 2).."m[/color]"
        end
    else
        if number >= 1000000 then
            return "[color=blue]"..Round((number / 1000000), 2).."m[/color]"
        elseif number >= 1000 then
            return "[color=blue]"..Round((number / 1000), 2).."k[/color]"
        else
            return "[color=blue]"..Round((number), 2).."[/color]"
        end
    end
end