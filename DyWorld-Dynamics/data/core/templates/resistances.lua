




function Resist(type, DECREASE, PERCENT, TELEPORT)
	if not TELEPORT then
		p = {
			type = type,
			decrease = DECREASE,
			percent = PERCENT,
		}
		return p
	elseif TELEPORT then
		p = {
			type = "teleport",
			decrease = 100,
			percent = 100,
		}
		return p
	end
end

function Resist_Tier_1(Mult)
	
	p = {
	  Resist("impact", 0, Round_Resist_Percent((2.5 * Mult), 2)),
	  Resist("fire", 0, Round_Resist_Percent((20 * Mult), 2)),
	  Resist("physical", 0, Round_Resist_Percent((5 * Mult), 2)),
	}
	return p
end


