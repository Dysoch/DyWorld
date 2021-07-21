



function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function Round_Resist_Percent(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	if math.floor(num * mult + 0.5) / mult >= 100 then
		return 100
	else
		return math.floor(num * mult + 0.5) / mult
	end
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

function DyDs_CopyItem(name, newName)
    if not data.raw.item[name] then error("item "..name.." doesn't exist") end
    local p = table.deepcopy(data.raw.item[name])
    p.name = newName
    if p.minable and p.minable.result then
        p.minable.result = newName
    end
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
    return p
end

function DyDs_CopyRecipe(name, newName, Ingredients, Results, Time, Cat)
    if not data.raw.recipe[name] then error("recpe "..name.." doesn't exist") end
    local p = table.deepcopy(data.raw.recipe[name])
    p.name = newName
    if p.result then
        p.result = nil
    end
	p.category = Cat and Cat or "assembling-tier-1"
	p.main_product = newName
	p.normal = {
		ingredients = Ingredients,
		results = Results,
		main_product = newName,
		energy_required = Time,
		enabled = false,
	}
    return p
end