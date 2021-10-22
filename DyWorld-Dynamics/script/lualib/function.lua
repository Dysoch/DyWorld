


function Dy_Log(String)
	if settings.startup["DyWorld_Debug"].value then
		log(String)
	end
end

function Dy_Check_GUI(GUI)
    if GUI == 0 then return true
    elseif GUI == 1 then return false
    elseif GUI == 2 then return false
    elseif GUI == 3 then return false
    elseif GUI == 4 then return false
    elseif GUI == 5 then return false
    elseif GUI == 6 then return false
    elseif GUI == 7 then return false
    elseif GUI == 8 then return false
    elseif GUI == 9 then return false
    elseif GUI == 10 then return false
    elseif GUI == 11 then return false
    elseif GUI == 12 then return false
    elseif GUI == 13 then return false
    elseif GUI == 14 then return false
    elseif GUI == 16 then return false
    elseif GUI == 17 then return false
    elseif GUI == 18 then return false
    else return true
    end
end

function Dy_Find_Str(Table, String)
	return string.find(Table, String, 1, true)
end

function Entity_Check(type)
	if type == "transport-belt" then return false
	elseif type == "splitter" then return false
	elseif type == "container" then return false
	elseif type == "character" then return false
	elseif type == "electric-pole" then return false
	elseif type == "inserter" then return false
	elseif type == "pipe" then return false
	elseif type == "lamp" then return false
	elseif type == "pipe-to-ground" then return false
	elseif type == "transport-belt" then return false
	elseif type == "underground-belt" then return false
	elseif type == "loader" then return false
	elseif type == "loader-1x1" then return false
	elseif type == "car" then return false
	elseif type == "rail-signal" then return false
	elseif type == "rail-chain-signal" then return false
	elseif type == "locomotive" then return false
	elseif type == "cargo-wagon" then return false
	elseif type == "straight-rail" then return false
	elseif type == "curved-rail" then return false
	else return true
	end
end

function Distance_Car_Check(name)
	if name == "car-1" then return true
	elseif name == "car" then return true
	elseif name == "splitter" then return true
	else return false
	end
end

function Distance_Train_Check(name)
	if name == "locomotive" then return true
	elseif name == "cargo-wagon-1" then return true
	else return false
	end
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

function Pick_Random_Attack_Location(surface)
	local Location = {x = 0, y = 0}
	local Loc_table = global.dyworld.game_stats.building_locations[surface]
	if tablelength(Loc_table) >= 1 then
		local randomized = math.random(#Loc_table)
		Location = {x = Loc_table[randomized].posx, y = Loc_table[randomized].posy}
		--debug("Random Attack Location on "..surface..": x = "..Location.x..", y = "..Location.y)
		return Location
	else
		return Location
	end
end

function Pick_Random_Attack_Strength(STRENGTH)
	local Amount = 1
	if settings.global["DyWorld_Attack_Difficulty"].value == "Easy" then
		Amount = math.random(STRENGTH)
		return Amount
	elseif settings.global["DyWorld_Attack_Difficulty"].value == "Medium" then
		Amount = math.random(STRENGTH*3)
		return Amount
	elseif settings.global["DyWorld_Attack_Difficulty"].value == "Hard" then
		Amount = math.random(STRENGTH*9)
		return Amount
	elseif settings.global["DyWorld_Attack_Difficulty"].value == "Death" then
		Amount = math.random(STRENGTH*27)
		return Amount
	end
end

function Pick_Attack_Time()
	local Amount = 1
	if settings.global["DyWorld_Attack_Difficulty"].value == "Easy" then
		Amount = 60*60*15
		return Amount
	elseif settings.global["DyWorld_Attack_Difficulty"].value == "Medium" then
		Amount = 60*60*10
		return Amount
	elseif settings.global["DyWorld_Attack_Difficulty"].value == "Hard" then
		Amount = 60*60*5
		return Amount
	elseif settings.global["DyWorld_Attack_Difficulty"].value == "Death" then
		Amount = 60*60*1
		return Amount
	end
end