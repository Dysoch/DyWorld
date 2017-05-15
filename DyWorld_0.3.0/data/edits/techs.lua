require "data/prefix"

T1_Tech = {"stone-walls", "landfill"}
T2_Tech = {"automation", "logistics", "optics", "turrets", "steel-processing", "toolbelt", "military", "heavy-armor"}

for k,v in pairs(T1_Tech) do
	if not data.raw.technology[v].prerequisites then
		data.raw.technology[v].prerequisites = {}
	end
	table.insert(data.raw.technology[v].prerequisites, dyworld_prefix.."tech-"..primitive)
end

--[[for k,v in pairs(T2_Tech) do
	if not data.raw.technology[v].prerequisites then
		data.raw.technology[v].prerequisites = {}
	end
	table.insert(data.raw.technology[v].prerequisites, dyworld_prefix.."tech-"..basic)
end]]--