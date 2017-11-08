require "data/prefix"


--[[data.raw.item["pipe"].order = "stone"
data.raw.item["pipe-to-ground"].order = "stone"

data.raw.item["pipe"].subgroup = dy.."pipe-normal"
data.raw.item["pipe-to-ground"].subgroup = dy.."pipe-underground"

data.raw.item["pipe"].localised_name = {"edits-name.pipe"}
data.raw.item["pipe-to-ground"].localised_name = {"edits-name.pipe-to-ground"}


data.raw.item["transport-belt"].order = "iron"
data.raw.item["fast-transport-belt"].order = "steel"
data.raw.item["express-transport-belt"].order = "stainless-steel"
data.raw.item["transport-belt"].subgroup = dy.."transport-belt"
data.raw.item["fast-transport-belt"].subgroup = dy.."transport-belt"
data.raw.item["express-transport-belt"].subgroup = dy.."transport-belt"

data.raw.item["underground-belt"].order = "iron"
data.raw.item["fast-underground-belt"].order = "steel"
data.raw.item["express-underground-belt"].order = "stainless-steel"
data.raw.item["underground-belt"].subgroup = dy.."transport-underground"
data.raw.item["fast-underground-belt"].subgroup = dy.."transport-underground"
data.raw.item["express-underground-belt"].subgroup = dy.."transport-underground"

data.raw.item["splitter"].order = "iron"
data.raw.item["fast-splitter"].order = "steel"
data.raw.item["express-splitter"].order = "stainless-steel"
data.raw.item["splitter"].subgroup = dy.."transport-splitter"
data.raw.item["fast-splitter"].subgroup = dy.."transport-splitter"
data.raw.item["express-splitter"].subgroup = dy.."transport-splitter"



data.raw.item["transport-belt"].localised_name = {"looped-name.belt", {"looped-name.iron"}}
data.raw.item["fast-transport-belt"].localised_name = {"looped-name.belt", {"looped-name.steel"}}
data.raw.item["express-transport-belt"].localised_name = {"looped-name.belt", {"looped-name.stainless-steel"}}

data.raw.item["underground-belt"].localised_name = {"looped-name.underground-belt", {"looped-name.iron"}}
data.raw.item["fast-underground-belt"].localised_name = {"looped-name.underground-belt", {"looped-name.steel"}}
data.raw.item["express-underground-belt"].localised_name = {"looped-name.underground-belt", {"looped-name.stainless-steel"}}

data.raw.item["splitter"].localised_name = {"looped-name.splitter", {"looped-name.iron"}}
data.raw.item["fast-splitter"].localised_name = {"looped-name.splitter", {"looped-name.steel"}}
data.raw.item["express-splitter"].localised_name = {"looped-name.splitter", {"looped-name.stainless-steel"}}



data.raw.item["transport-belt"].icons =
	{
	  {
		icon = "__base__/graphics/icons/transport-belt.png",
		tint = Material_Colors.Iron,
	  },
	} 
table.remove(data.raw.item["transport-belt"], icon)
data.raw.item["fast-transport-belt"].icons =
	{
	  {
		icon = "__base__/graphics/icons/transport-belt.png",
		tint = Material_Colors.Steel,
	  },
	} 
table.remove(data.raw.item["fast-transport-belt"], icon)
data.raw.item["express-transport-belt"].icons =
	{
	  {
		icon = "__base__/graphics/icons/transport-belt.png",
		tint = Material_Colors.Stainless_Steel,
	  },
	} 
table.remove(data.raw.item["express-transport-belt"], icon)

data.raw.item["underground-belt"].icons =
	{
	  {
		icon = "__base__/graphics/icons/underground-belt.png",
		tint = Material_Colors.Iron,
	  },
	} 
table.remove(data.raw.item["underground-belt"], icon)
data.raw.item["fast-underground-belt"].icons =
	{
	  {
		icon = "__base__/graphics/icons/underground-belt.png",
		tint = Material_Colors.Steel,
	  },
	} 
table.remove(data.raw.item["fast-underground-belt"], icon)
data.raw.item["express-underground-belt"].icons =
	{
	  {
		icon = "__base__/graphics/icons/underground-belt.png",
		tint = Material_Colors.Stainless_Steel,
	  },
	} 
table.remove(data.raw.item["express-underground-belt"], icon)

data.raw.item["splitter"].icons =
	{
	  {
		icon = "__base__/graphics/icons/splitter.png",
		tint = Material_Colors.Iron,
	  },
	} 
table.remove(data.raw.item["splitter"], icon)
data.raw.item["fast-splitter"].icons =
	{
	  {
		icon = "__base__/graphics/icons/splitter.png",
		tint = Material_Colors.Steel,
	  },
	} 
table.remove(data.raw.item["fast-splitter"], icon)
data.raw.item["express-splitter"].icons =
	{
	  {
		icon = "__base__/graphics/icons/splitter.png",
		tint = Material_Colors.Stainless_Steel,
	  },
	} 
table.remove(data.raw.item["express-splitter"], icon)

data.raw.item["pipe"].icons =
	{
	  {
		icon = "__base__/graphics/icons/pipe.png",
		tint = Material_Colors.Stone,
	  },
	} 
table.remove(data.raw.item["pipe"], icon)
data.raw.item["pipe-to-ground"].icons =
	{
	  {
		icon = "__base__/graphics/icons/pipe-to-ground.png",
		tint = Material_Colors.Stone,
	  },
	} 
table.remove(data.raw.item["pipe-to-ground"], icon)]]--

table.insert(data.raw.item["pipe-to-ground"].flags, "hidden")
table.insert(data.raw.item["pipe"].flags, "hidden")

table.insert(data.raw.item["transport-belt"].flags, "hidden")
table.insert(data.raw.item["fast-transport-belt"].flags, "hidden")
table.insert(data.raw.item["express-transport-belt"].flags, "hidden")

table.insert(data.raw.item["underground-belt"].flags, "hidden")
table.insert(data.raw.item["fast-underground-belt"].flags, "hidden")
table.insert(data.raw.item["express-underground-belt"].flags, "hidden")

table.insert(data.raw.item["splitter"].flags, "hidden")
table.insert(data.raw.item["fast-splitter"].flags, "hidden")
table.insert(data.raw.item["express-splitter"].flags, "hidden")

table.insert(data.raw.item["storage-tank"].flags, "hidden")
table.insert(data.raw.item["offshore-pump"].flags, "hidden")
table.insert(data.raw.item["pump"].flags, "hidden")

table.insert(data.raw.item["inserter"].flags, "hidden")
table.insert(data.raw.item["long-handed-inserter"].flags, "hidden")
table.insert(data.raw.item["fast-inserter"].flags, "hidden")
table.insert(data.raw.item["filter-inserter"].flags, "hidden")
table.insert(data.raw.item["stack-inserter"].flags, "hidden")
table.insert(data.raw.item["stack-filter-inserter"].flags, "hidden")
