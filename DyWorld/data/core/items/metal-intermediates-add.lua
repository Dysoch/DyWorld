require "data/core/functions/prefix"

for k,v in pairs(Data_Metallurgy) do
	if data.raw.item[v.Name.."-plate"] then
		if not data.raw.item[v.Name.."-plate"].DyWorld then
			data.raw.item[v.Name.."-plate"].DyWorld = {}		
		end
		if not data.raw.item[v.Name.."-plate"].DyWorld.Intermediates then
			data.raw.item[v.Name.."-plate"].DyWorld.Intermediates = {}		
		end
		data.raw.item[v.Name.."-plate"].DyWorld.Name = v.Name
		data.raw.item[v.Name.."-plate"].DyWorld.Tier = Metal_Tiers[v.Name]
		if v.Cable then
			data.raw.item[v.Name.."-plate"].DyWorld.Intermediates.Cable = true
		end
		if v.Gear then
			data.raw.item[v.Name.."-plate"].DyWorld.Intermediates.Gear = true
		end
		if v.Stick then
			data.raw.item[v.Name.."-plate"].DyWorld.Intermediates.Stick = true
		end
		if v.Tech_Processing then
			data.raw.item[v.Name.."-plate"].DyWorld.Intermediates.Tech_Processing = true
		end
	end
end