require "data/core/functions/prefix"

for k,v in pairs(Data_Metallurgy) do
	if data.raw.item[v.Name.."-plate"] then
		if not data.raw.item[v.Name.."-plate"].DyWorld then
			data.raw.item[v.Name.."-plate"].DyWorld = {}		
		end
		if not data.raw.item[v.Name.."-plate"].DyWorld.Metallurgy then
			data.raw.item[v.Name.."-plate"].DyWorld.Metallurgy = {}		
		end
		data.raw.item[v.Name.."-plate"].DyWorld.Name = v.Name
		data.raw.item[v.Name.."-plate"].DyWorld.Tier = Metal_Tiers[v.Name]
		if v.Ore then
			data.raw.item[v.Name.."-plate"].DyWorld.Metallurgy.Ore = v.Name.."-ore"
		end
		if v.Molten then
			data.raw.item[v.Name.."-plate"].DyWorld.Metallurgy.Molten = true
		end
		if v.Melting_Point and v.Boiling_Point then
			data.raw.item[v.Name.."-plate"].DyWorld.Metallurgy.Melting_Point = v.Melting_Point
			data.raw.item[v.Name.."-plate"].DyWorld.Metallurgy.Boiling_Point = v.Boiling_Point
		end
	end
end