



local change_item_group = {
	["aai-strongbox"] = DyDs.."chests-aai-1",
	["aai-strongbox-passive-provider"] = DyDs.."chests-aai-1",
	["aai-strongbox-storage"] = DyDs.."chests-aai-1",
	["aai-strongbox-requester"] = DyDs.."chests-aai-1",
	["aai-strongbox-active-provider"] = DyDs.."chests-aai-1",
	["aai-strongbox-buffer"] = DyDs.."chests-aai-1",
	
	["aai-storehouse"] = DyDs.."chests-aai-2",
	["aai-storehouse-storage"] = DyDs.."chests-aai-2",
	["aai-storehouse-passive-provider"] = DyDs.."chests-aai-2",
	["aai-storehouse-requester"] = DyDs.."chests-aai-2",
	["aai-storehouse-buffer"] = DyDs.."chests-aai-2",
	["aai-storehouse-active-provider"] = DyDs.."chests-aai-2",
	
	["aai-warehouse"] = DyDs.."chests-aai-3",
	["aai-warehouse-passive-provider"] = DyDs.."chests-aai-3",
	["aai-warehouse-storage"] = DyDs.."chests-aai-3",
	["aai-warehouse-active-provider"] = DyDs.."chests-aai-3",
	["aai-warehouse-buffer"] = DyDs.."chests-aai-3",
	["aai-warehouse-requester"] = DyDs.."chests-aai-3",
	
	["burner-turbine"] = DyDs.."generator",
	
	["motor"] = DyDs.."intermediates-tier-1",
	["electric-motor"] = DyDs.."intermediates-tier-2",
}

for k,v in pairs(change_item_group) do
	if data.raw.item[k] then
		data.raw.item[k].subgroup = v
	end
end
