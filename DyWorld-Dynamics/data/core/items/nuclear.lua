

local Fission = {
	["uranium-ore"] = {Stack = 50, Fuel = "50MJ", Result = "spend-uranium-ore"},
	["spend-uranium-ore"] = {Stack = 50, Fuel = "5MJ"},
	["uranium-235"] = {Stack = 50, Fuel = "100MJ", Result = "spend-uranium-235"},
	["spend-uranium-235"] = {Stack = 50, Fuel = "10MJ"},
	["uranium-238"] = {Stack = 50, Fuel = "200MJ", Result = "spend-uranium-238"},
	["spend-uranium-238"] = {Stack = 50, Fuel = "20MJ"},
}

local Fusion = {
	["argonium-fuel-cell"] = {Stack = 10, Fuel = "1500MJ", Result = "spend-argonium-fuel-cell"},
	["spend-argonium-fuel-cell"] = {Stack = 10, Fuel = "150MJ", Result = "lense-4"},
}

local function Stack_Check(Stack)
	if Stack >= 1000 then
		return DyDs.."intermediates-all"
	elseif Stack >= 800 then
		return DyDs.."intermediates-tier-0"
	elseif Stack >= 600 then
		return DyDs.."intermediates-tier-1"
	elseif Stack >= 500 then
		return DyDs.."intermediates-tier-2"
	elseif Stack >= 400 then
		return DyDs.."intermediates-tier-3"
	elseif Stack >= 300 then
		return DyDs.."intermediates-tier-4"
	elseif Stack >= 200 then
		return DyDs.."intermediates-tier-5"
	elseif Stack >= 100 then
		return DyDs.."intermediates-tier-6"
	elseif Stack >= 50 then
		return DyDs.."intermediates-tier-7"
	elseif Stack >= 25 then
		return DyDs.."intermediates-tier-8"
	else
		return DyDs.."intermediates-tier-9"
	end
end

for k,v in pairs(Fission) do 
DyDS_Add_Item({
	name = k,
	icon = DyDs_path_icon.."intermediates/"..k..".png",
	order = k,
	stack_size = v.Stack,
	subgroup = Stack_Check(v.Stack),
	Chemical_Formula = v.Chem or nil,
	fuel_category = "fission",
	fuel_value = v.Fuel,
    burnt_result = v.Result or nil,
})
	if v.Rec then
DyDS_Add_Recipe_Item({
	name = k,
})
	end
end

for k,v in pairs(Fusion) do 
DyDS_Add_Item({
	name = k,
	icon = DyDs_path_icon.."intermediates/"..k..".png",
	order = k,
	stack_size = v.Stack,
	subgroup = Stack_Check(v.Stack),
	Chemical_Formula = v.Chem or nil,
	fuel_category = "fusion",
	fuel_value = v.Fuel,
    burnt_result = v.Result or nil,
})
	if v.Rec then
DyDS_Add_Recipe_Item({
	name = k,
})
	end
end