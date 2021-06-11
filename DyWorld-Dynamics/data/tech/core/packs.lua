

function Dy_Tech_Time_Calc(TIME, HOUR)
	if HOUR then
		return (math.floor(TIME * 60 * 60))
	else
		return (math.floor(TIME * 60))
	end
end

local function StackSizeCheck(StackSize)
	local Multi = settings.startup["DyWorld_Expensive_Tech_Modifier"].value
	if math.ceil((StackSize * Multi)) >= 65000 then
		return 65000
	elseif math.ceil((StackSize * Multi)) <= 1 then
		return 1
	else
		return (math.ceil((StackSize * Multi)))
	end
end

function Dy_Metal_Tech_Pack(STR, AMOUNT)
	if STR == "iron-1" then
		local returner = {"iron-ore-impure", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "copper-1" then
		local returner = {"copper-ore-impure", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "tin-1" then
		local returner = {"tin-ore-impure", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "iron-2" then
		local returner = {"iron-ore", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "copper-2" then
		local returner = {"copper-ore", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "tin-2" then
		local returner = {"tin-ore", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "iron-3" then
		local returner = {"iron-plate", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "copper-3" then
		local returner = {"copper-plate", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "tin-3" then
		local returner = {"tin-plate", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "steel" then
		local returner = {"steel-plate", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "bronze" then
		local returner = {"bronze-plate", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "limestone" then
		local returner = {"limestone", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "quartzite" then
		local returner = {"quartzite", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "granite" then
		local returner = {"granite", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "sandstone" then
		local returner = {"sandstone", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "slag" then
		local returner = {"slag", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "coal" then
		local returner = {"coal", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == nil then 
		local returner = {"limestone", StackSizeCheck(AMOUNT)}
		return returner
	else
		local returner = {"limestone", StackSizeCheck(50)}
		return returner
	end
end


function Dy_Chemical_Tech_Pack(STR, AMOUNT)
	if STR == "empty" then
		local returner = {"canister-empty", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "oxygen" then
		local returner = {"canister-oxygen", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "hydrogen" then
		local returner = {"canister-hydrogen", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "nitrogen" then
		local returner = {"canister-nitrogen", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "water" then
		local returner = {"canister-water", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "heavy-oil" then
		local returner = {"canister-heavy-oil", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "light-oil" then
		local returner = {"canister-light-oil", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "crude-oil" then
		local returner = {"canister-crude-oil", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "natural-gas" then
		local returner = {"canister-natural-gas", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == nil then 
		local returner = {"canister-empty", StackSizeCheck(AMOUNT)}
		return returner
	else
		local returner = {"canister-empty", StackSizeCheck(50)}
		return returner
	end
end


function Dy_Bio_Tech_Pack(STR, AMOUNT)
	if STR == "fish-pike" then
		local returner = {"raw-fish-pike-filet", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == "fish-salmon" then
		local returner = {"raw-fish-salmon-filet", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == 1 then
		local returner = {"canister-empty", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == nil then 
		local returner = {"canister-empty", StackSizeCheck(AMOUNT)}
		return returner
	else
		local returner = {"canister-empty", StackSizeCheck(50)}
		return returner
	end
end


function Dy_Main_Tech_Pack(STR, AMOUNT)
	if STR == 1 then
		local returner = {"dysci-01", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == 2 then
		local returner = {"dysci-02", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == 3 then
		local returner = {"dysci-03", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == 4 then
		local returner = {"dysci-04", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == 5 then
		local returner = {"dysci-05", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == 6 then
		local returner = {"dysci-06", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == 7 then
		local returner = {"dysci-07", StackSizeCheck(AMOUNT)}
		return returner
	elseif STR == nil then 
		local returner = {"dysci-1", StackSizeCheck(AMOUNT)}
		return returner
	else
		local returner = {"dysci-1", StackSizeCheck(50)}
		return returner
	end
end