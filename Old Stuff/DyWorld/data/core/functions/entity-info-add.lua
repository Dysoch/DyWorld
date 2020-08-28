require "data/core/functions/prefix"

for k,v in pairs(Data_Entity) do
	if data.raw.item[k.."-plate"] then
		if not data.raw.item[k.."-plate"].DyWorld then
			data.raw.item[k.."-plate"].DyWorld = {}		
		end
		if not data.raw.item[k.."-plate"].DyWorld.Entity then
			data.raw.item[k.."-plate"].DyWorld.Entity = v		
		end
		data.raw.item[k.."-plate"].DyWorld.Name = k
		data.raw.item[k.."-plate"].DyWorld.Tier = Metal_Tiers[k]
		data.raw.item[k.."-plate"].DyWorld.Resistances = Metal_Resistances[k]
		data.raw.item[k.."-plate"].DyWorld.Entity = v		
	end
end

for k,v in pairs(Data_Warfare) do
	if data.raw.item[k.."-plate"] then
		if not data.raw.item[k.."-plate"].DyWorld then
			data.raw.item[k.."-plate"].DyWorld = {}		
		end
		if not data.raw.item[k.."-plate"].DyWorld.Warfare then
			data.raw.item[k.."-plate"].DyWorld.Warfare = v		
		end
		data.raw.item[k.."-plate"].DyWorld.Name = k
		data.raw.item[k.."-plate"].DyWorld.Tier = Metal_Tiers[k]
		data.raw.item[k.."-plate"].DyWorld.Resistances = Metal_Resistances[k]
		data.raw.item[k.."-plate"].DyWorld.Warfare = v		
	end
end