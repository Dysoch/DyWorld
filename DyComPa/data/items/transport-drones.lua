local change_item_group = {
	["supply-depot"] = DyDs.."transport-drones2",
	["request-depot"] = DyDs.."transport-drones2",
  	["fuel-depot"] = DyDs.."transport-drones2",
  	["fluid-depot"] = DyDs.."transport-drones2",
  	["buffer-depot"] = DyDs.."transport-drones2",
  	["road-network-reader"] = DyDs.."transport-drones2",
  	["transport-depot-writer"] = DyDs.."transport-drones2",
	["transport-depot-reader"] = DyDs.."transport-drones",
  	["transport-drone"] = DyDs.."transport-drones2",
  
}

for k,v in pairs(change_item_group) do
	if data.raw.item[k] then
		data.raw.item[k].subgroup = v
	end
end
