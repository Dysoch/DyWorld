



function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function DyDs_CopyPrototype(type, name, newName, change_results)
    if not data.raw[type][name] then error("type "..type.." "..name.." doesn't exist") end
    local p = table.deepcopy(data.raw[type][name])
    p.name = newName
    if p.minable and p.minable.result then
        p.minable.result = newName
    end
    if change_results then
        if p.place_result then
            p.place_result = newName
        end
        if p.result then
            p.result = newName
        end
        if p.take_result then
            p.take_result = newName
        end
        if p.placed_as_equipment_result then
            p.placed_as_equipment_result = newName
        end
        if p.normal and p.normal.result then
            p.normal.result = newName
        end
        if p.expensive and p.expensive.result then
            p.expensive.result = newName
        end
    end
    return p
end