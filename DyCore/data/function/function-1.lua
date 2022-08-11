


function DyW.Fx.Edited(type, name)
    if data.raw[type][name].DyWorld_Edited then
        data.raw[type][name].DyWorld_Edited = data.raw[type][name].DyWorld_Edited + 1
    else
        data.raw[type][name].DyWorld_Edited = 1
    end
end


function DyW.Fx.DC(type, name, newName)
    if not data.raw[type][name] then error("type "..type.." "..name.." doesn't exist") end
    local p = table.deepcopy(data.raw[type][name])
    p.name = newName
    p.DyWorld_Edited = 1
    if p.minable and p.minable.result then
        p.minable.result = newName
    end
    if p.place_result then
        p.place_result = newName
    end
    if p.result then
        p.result = newName
    end
	p.take_result = newName
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
    return p
end