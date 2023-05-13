

for _, type in pairs(data.raw) do
    for _, v in pairs(type) do
        if v.stack_size then
            local mult = settings.startup["DyCore_Sett_Stacksize"].value:gsub("", "")
            local max_stack = 4294967295
            v.stack_size = DyW.Math.Round_Value((v.stack_size * mult), 0, max_stack)
            if v.stack_size <= 0 then
                v.stack_size = 1
            end
        end
        if v.name == "character" and v.type == "character" and v.max_health then
            local mult = settings.startup["DyCore_Sett_Health_Player"].value:gsub("", "")
            v.max_health = DyW.Math.Round((v.max_health * mult), 0)
            if v.max_health <= 0 then
                v.max_health = 1
            end
        end
        if v.type == "unit" and v.max_health then
            if v.max_health then
                local mult = settings.startup["DyCore_Sett_Health_Enemy"].value:gsub("", "")
                v.max_health = DyW.Math.Round((v.max_health * mult), 1)
                if v.max_health <= 0 then
                    v.max_health = 1
                end
            end
            --[[if v.loot then
                local mult = string.remove(settings.startup["DyCore_Sett_Loot"].value, "")
                v.max_health = DyW.Math.Round((v.max_health * mult), 1)
                if v.max_health <= 0 then
                    v.max_health = 0.00000000000000001
                elseif v.max_health >= 1 then
                    v.max_health = 1
                end
            end]]--
        end
    end
end


-- Logging Events --

local Stats_Table = {}
local Stats_Table_Total = 0
for Type,Table in pairs(data.raw) do
	Stats_Table[Type] = 0
	for k,v in pairs(data.raw[Type]) do
		Stats_Table[Type] = Stats_Table[Type] + 1
		Stats_Table_Total = Stats_Table_Total + 1
	end
end

log("DyCore: checksum complete, no errors. Statistics following:")
log("DyCore: data.raw. holds a total of "..Stats_Table_Total.." entries")
for k,v in pairs(Stats_Table) do
	log("DyCore: data.raw."..k.." holds "..v.." entries")
end