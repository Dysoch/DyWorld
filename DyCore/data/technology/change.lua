

	----- Prerequisites changes -----
DyW.Tech.Prereq = {}

function DyW.Tech.Prereq.Override(TECH, PREREQ)
	if data.raw.technology[TECH] then
		local T = data.raw.technology[TECH]
		if T.prerequisites then
			T.prerequisites = PREREQ
		else
			T.prerequisites = PREREQ
		end
		if T.hidden then
			T.hidden = false
		end
	end
end

function DyW.Tech.Prereq.Add_1(TECH, PREREQ)
	if data.raw.technology[TECH] then
		local T = data.raw.technology[TECH]
		if T.prerequisites then
			if not T.prerequisites[PREREQ] then
				table.insert(T.prerequisites, PREREQ)
			end
		else
			T.prerequisites = {PREREQ}
		end	
		if T.hidden then
			T.hidden = false
		end	
	end
end

function DyW.Tech.Prereq.Add_2(TECH, PREREQS)
	if data.raw.technology[TECH] then
		local T = data.raw.technology[TECH]
		if T.prerequisites then
			for k,v in pairs(PREREQS) do
				if not T.prerequisites[k] then
					table.insert(T.prerequisites, k)
				end
			end
		else
			T.prerequisites = PREREQS
		end	
		if T.hidden then
			T.hidden = false
		end	
	end
end

function DyW.Tech.Prereq.Remove(TECH, PREREQ)
	if data.raw.technology[TECH] then
		local T = data.raw.technology[TECH]
		if T.prerequisites then
			if T.prerequisites[PREREQ] then
				T.prerequisites[PREREQ] = nil
			end
		end	
		if T.hidden then
			T.hidden = false
		end	
	end
end



--[[function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end]]