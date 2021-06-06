

function Dy_Tech_Time_Calc(TIME, HOUR)
	if HOUR then
		return (math.floor(TIME * 60 * 60))
	else
		return (math.floor(TIME * 60))
	end
end


function Dy_Metal_Tech_Pack(STR, AMOUNT)
	local SET = settings.startup["DyWorld_Expensive_Tech_Modifier"].value
	if STR == "iron-1" then
		local returner = {"iron-ore-impure", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "copper-1" then
		local returner = {"copper-ore-impure", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "tin-1" then
		local returner = {"tin-ore-impure", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "iron-2" then
		local returner = {"iron-ore", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "copper-2" then
		local returner = {"copper-ore", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "tin-2" then
		local returner = {"tin-ore", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "iron-3" then
		local returner = {"iron-plate", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "copper-3" then
		local returner = {"copper-plate", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "tin-3" then
		local returner = {"tin-plate", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "steel" then
		local returner = {"steel-plate", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "bronze" then
		local returner = {"bronze-plate", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "limestone" then
		local returner = {"limestone", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "quartzite" then
		local returner = {"quartzite", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "granite" then
		local returner = {"granite", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "sandstone" then
		local returner = {"sandstone", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "slag" then
		local returner = {"slag", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == "coal" then
		local returner = {"coal", math.ceil(SET * AMOUNT)}
		return returner
	elseif STR == nil then 
		local returner = {"limestone", math.ceil(SET * AMOUNT)}
		return returner
	else
		local returner = {"limestone", math.ceil(SET * AMOUNT)}
		return returner
	end
end