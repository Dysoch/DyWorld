


for _,type in pairs({"item", "fluid", "module", "ammo", "capsule", "tool", "gun", "armor", "rail-planner", "repair-tool"}) do
	for _,v in pairs(data.raw[type]) do
		if not v.Chemical_Formula then
			v.Chemical_Formula = "none"
		end
	end
end

for _,type in pairs({"item", "fluid", "module", "ammo", "capsule", "tool", "gun", "armor", "rail-planner", "repair-tool"}) do
	for _,v in pairs(data.raw[type]) do
		if v.Chemical_Formula then
data:extend(
{
  {
    type = "recipe",
    name = "chem-recycle-"..v.name,
	category = "chemical-recycling",
	main_product = v.name,
	allow_decomposition = false,
	hide_from_player_crafting = true,
	hide_from_stats = true,
    normal =
    {
      ingredients =
      {
        {type = v.type == "fluid" and "fluid" or "item", name = v.name, amount = v.type == "fluid" and 10 or 1},
      },
      results =
      {
        {type = v.type == "fluid" and "fluid" or "item", name = v.name, amount = 0},
      },
	  energy_required = 10,
	  main_product = v.name,
	  enabled = false,
	  allow_decomposition = false,
	  hide_from_player_crafting = true,
	  hide_from_stats = true,
    },
  },
})
			if string.find(v.Chemical_Formula, "Os-", 1, true) then
				if data.raw.item["osmium-ore-impure"] or data.raw.tool["osmium-ore-impure"] then
					local result = {type = "item", name = "osmium-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["osmium-ore"] or data.raw.tool["osmium-ore"] then
					local result = {type = "item", name = "osmium-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "W-", 1, true) then
				if data.raw.item["tungsten-ore-impure"] or data.raw.tool["tungsten-ore-impure"] then
					local result = {type = "item", name = "tungsten-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["tungsten-ore"] or data.raw.tool["tungsten-ore"] then
					local result = {type = "item", name = "tungsten-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Zn-", 1, true) then
				if data.raw.item["zinc-ore-impure"] or data.raw.tool["zinc-ore-impure"] then
					local result = {type = "item", name = "zinc-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["zinc-ore"] or data.raw.tool["zinc-ore"] then
					local result = {type = "item", name = "zinc-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Cr-", 1, true) then
				if data.raw.item["chromium-ore-impure"] or data.raw.tool["chromium-ore-impure"] then
					local result = {type = "item", name = "chromium-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["chromium-ore"] or data.raw.tool["chromium-ore"] then
					local result = {type = "item", name = "chromium-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Co-", 1, true) then
				if data.raw.item["cobalt-ore-impure"] or data.raw.tool["cobalt-ore-impure"] then
					local result = {type = "item", name = "cobalt-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["cobalt-ore"] or data.raw.tool["cobalt-ore"] then
					local result = {type = "item", name = "cobalt-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Na-", 1, true) then
				if data.raw.item["sodium-ore-impure"] or data.raw.tool["sodium-ore-impure"] then
					local result = {type = "item", name = "sodium-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["sodium-ore"] or data.raw.tool["sodium-ore"] then
					local result = {type = "item", name = "sodium-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["sodium"] or data.raw.tool["sodium"] then
					local result = {type = "item", name = "sodium", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Li-", 1, true) then
				if data.raw.item["lithium-ore-impure"] or data.raw.tool["lithium-ore-impure"] then
					local result = {type = "item", name = "lithium-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["lithium-ore"] or data.raw.tool["lithium-ore"] then
					local result = {type = "item", name = "lithium-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Ti-", 1, true) then
				if data.raw.item["titanium-ore-impure"] or data.raw.tool["titanium-ore-impure"] then
					local result = {type = "item", name = "titanium-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["titanium-ore"] or data.raw.tool["titanium-ore"] then
					local result = {type = "item", name = "titanium-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Ni-", 1, true) then
				if data.raw.item["nickel-ore-impure"] or data.raw.tool["nickel-ore-impure"] then
					local result = {type = "item", name = "nickel-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["nickel-ore"] or data.raw.tool["nickel-ore"] then
					local result = {type = "item", name = "nickel-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Sn-", 1, true) then
				if data.raw.item["tin-ore-impure"] or data.raw.tool["tin-ore-impure"] then
					local result = {type = "item", name = "tin-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["tin-ore"] or data.raw.tool["tin-ore"] then
					local result = {type = "item", name = "tin-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Pb-", 1, true) then
				if data.raw.item["lead-ore-impure"] or data.raw.tool["lead-ore-impure"] then
					local result = {type = "item", name = "lead-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["lead-ore"] or data.raw.tool["lead-ore"] then
					local result = {type = "item", name = "lead-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Ag-", 1, true) then
				if data.raw.item["silver-ore-impure"] or data.raw.tool["silver-ore-impure"] then
					local result = {type = "item", name = "silver-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["silver-ore"] or data.raw.tool["silver-ore"] then
					local result = {type = "item", name = "silver-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Au-", 1, true) then
				if data.raw.item["gold-ore-impure"] or data.raw.tool["gold-ore-impure"] then
					local result = {type = "item", name = "gold-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["gold-ore"] or data.raw.tool["gold-ore"] then
					local result = {type = "item", name = "gold-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Al-", 1, true) then
				if data.raw.item["aluminium-ore-impure"] or data.raw.tool["aluminium-ore-impure"] then
					local result = {type = "item", name = "aluminium-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif data.raw.item["aluminium-ore"] or data.raw.tool["aluminium-ore"] then
					local result = {type = "item", name = "aluminium-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "S-", 1, true) then
				if data.raw.item["sulfur"] then
					local result = {type = "item", name = "sulfur", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Si-", 1, true) then
				if data.raw.item["silicon"] then
					local result = {type = "item", name = "silicon", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Cu-", 1, true) then
				if data.raw.tool["copper-ore-impure"] then
					local result = {type = "item", name = "copper-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				else
					local result = {type = "item", name = "copper-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Fe-", 1, true) then
				if data.raw.tool["iron-ore-impure"] then
					local result = {type = "item", name = "iron-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				else
					local result = {type = "item", name = "iron-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "U-", 1, true) then
				if data.raw.tool["uranium-ore-impure"] then
					local result = {type = "item", name = "uranium-ore-impure", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				else
					local result = {type = "item", name = "uranium-ore", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "C-", 1, true) or string.find(v.Chemical_Formula, "C1-", 1, true) then
				if data.raw.item["carbon"] then
					local result = {type = "item", name = "carbon", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				else
					local result = {type = "item", name = "coal", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "C2-", 1, true) then
				if data.raw.item["carbon"] then
					local result = {type = "item", name = "carbon", amount_min = 0, amount_max = 6, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				else
					local result = {type = "item", name = "coal", amount_min = 0, amount_max = 6, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if data.raw.fluid["oxygen"] then
				if string.find(v.Chemical_Formula, "O-", 1, true) then
					local result = {type = "fluid", name = "oxygen", amount_min = 0, amount_max = 10, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif string.find(v.Chemical_Formula, "O2-", 1, true) then
					local result = {type = "fluid", name = "oxygen", amount_min = 0, amount_max = 20, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif string.find(v.Chemical_Formula, "O3-", 1, true) then
					local result = {type = "fluid", name = "oxygen", amount_min = 0, amount_max = 30, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif string.find(v.Chemical_Formula, "O4-", 1, true) then
					local result = {type = "fluid", name = "oxygen", amount_min = 0, amount_max = 40, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				elseif string.find(v.Chemical_Formula, "O5-", 1, true) then
					local result = {type = "fluid", name = "oxygen", amount_min = 0, amount_max = 50, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if string.find(v.Chemical_Formula, "Naphtha-", 1, true) then
				if data.raw.item["naphtha"] then
					local result = {type = "item", name = "naphtha", amount_min = 0, amount_max = 3, probability = 0.1}
					table.insert(data.raw.recipe["chem-recycle-"..v.name].normal.results, result)
				end
			end
			if not data.raw.technology["chemical-recycling-1"] then
				data.raw.recipe["chem-recycle-"..v.name].normal.enabled = true
			else
				local AMOUNT = -1
				for k,v in pairs(data.raw.recipe["chem-recycle-"..v.name].normal.results) do
					AMOUNT = AMOUNT + 1
				end
				DyWorld_Add_To_Tech("chemical-recycling-"..(AMOUNT >= 1 and AMOUNT or 1), "chem-recycle-"..v.name)
			end
		end
	end
end