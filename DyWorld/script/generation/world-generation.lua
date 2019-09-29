require "script/generation/noise"

Ruins = {"sand-rock-big", "rock-big", "rock-huge"}
Ruins_Start = {"small-scorchmark", "mineable-wreckage", "mineable-wreckage", "mineable-wreckage", "character-corpse-dyworld"}
AddedItems = {"simple-control-board", "raw-fish", "stone-brick", "chitin", "acorn", "sand", "stone-gear-wheel", "stone-plate", "stone", "coal", "wood", "red-wire", "green-wire", "concrete", "glass", "rotor", "wheat", "carrot", "obsidian", "filter-empty", "blade", "resin", "iron-stick", "copper-plate", "iron-plate", "copper-cable", "iron-gear-wheel", "nickel-stick", "nickel-plate", "nickel-cable", "nickel-gear-wheel", "silver-stick", "silver-plate", "tin-cable", "tin-plate", "tin-gear-wheel", "basic-control-board"}

local keysetRuins = {}
local keysetRuins_Start = {}
local keysetAddedItem = {}
local keysetAddedItemAll = {}

function AddedItemsAll_Adder()
	AddedItemsAll = {}
	for k,v in pairs(game.item_prototypes) do
		if v.type == "mining-tool" then
			-- do nothing
		elseif string.find(v.name, "debug", 1, true) then
			-- do nothing
		elseif string.find(v.name, "dummy", 1, true) then
			-- do nothing
		else
			table.insert(AddedItemsAll, v.name)
		end
	end
	for k in pairs(AddedItemsAll) do
		table.insert(keysetAddedItemAll, k)
	end
end

for k in pairs(Ruins) do
    table.insert(keysetRuins, k)
end
for k in pairs(Ruins_Start) do
    table.insert(keysetRuins_Start, k)
end
for k in pairs(AddedItems) do
    table.insert(keysetAddedItem, k)
end

function Ruins_Spawner(event)
	for i = 1, (math.random(2,8)) do
		BuildEntity = Ruins[keysetRuins[math.random(#keysetRuins)]]
		PosX = event.area.left_top.x+math.random(-63,63)
		PosY = event.area.left_top.y+math.random(-63,63)
		if game.surfaces[1].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
			game.surfaces[1].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.player}
		end
	end
end

function Ruins_Spawner_Start(event)
	for i = 1, (math.random(5,10)) do
		BuildEntity = Ruins_Start[keysetRuins_Start[math.random(#keysetRuins_Start)]]
		PosX = event.area.left_top.x + math.random(-63, 63)
		PosY = event.area.left_top.y + math.random(-63, 63)
		Pos_1 = game.surfaces[1].find_non_colliding_position(BuildEntity1, {PosX, PosY}, 150, 1)
		game.surfaces[1].create_entity{name = (BuildEntity), position = Pos_1, force = game.forces.player}
	end
end

function Ruins_Spawner_FarOut(event)
	AddedItemsAll_Adder()
	PosX = event.area.left_top.x + math.random(150)
	PosY = event.area.left_top.y + math.random(150)
	BuildEntity = "crash-site-chest-2"
	Chest_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity, {PosX,PosY}, 250, 1)
	Chest_Created = game.surfaces[1].create_entity{name = (BuildEntity), position = Chest_Pos, force = game.forces.player}
	for i = 1, (math.random(5,25)) do
		AddedItem = AddedItemsAll[keysetAddedItemAll[math.random(#keysetAddedItemAll)]]
		Chest_Created.insert{name = AddedItem, count = math.random(25)}
	end
	global.dyworld.Chunks_Generation_1 = math.floor(global.dyworld.Chunks_Generation_1 * (math.random() + 1))
end

function Ship_Spawner(event)
	PosX1 = 0 + math.random(-150, 150)
	PosY1 = 0 + math.random(-150, 150)
	PosX2 = 0 + math.random(-150, 150)
	PosY2 = 0 + math.random(-150, 150)
	PosX3 = 0 + math.random(-150, 150)
	PosY3 = 0 + math.random(-150, 150)
	PosX4 = 0 + math.random(-150, 150)
	PosY4 = 0 + math.random(-150, 150)
	PosX5 = 0 + math.random(-250, 250)
	PosY5 = 0 + math.random(-250, 250)
	BuildEntity1 = "crash-site-lab-broken"
	BuildEntity2 = "crash-site-assembling-machine-1-broken"
	BuildEntity3 = "crash-site-assembling-machine-2-broken"
	BuildEntity4 = "crash-site-chest-1"
	BuildEntity5 = "crash-site-chest-2"
	Ship_1_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity1, {PosX1,PosY1}, 250, 1)
	Ship_2_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity2, {PosX2,PosY2}, 250, 1)
	Ship_3_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity3, {PosX3,PosY3}, 250, 1)
	Ship_4_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity4, {PosX4,PosY4}, 250, 1)
	Ship_5_Pos = game.surfaces[1].find_non_colliding_position(BuildEntity5, {PosX5,PosY5}, 500, 1)
	if not global.dyworld.Generation_Ship_1 then 
		game.surfaces[1].create_entity{name = (BuildEntity1), position = Ship_1_Pos, force = game.forces.player}
		global.dyworld.Generation_Ship_1 = true
		global.dyworld.Generation_Ship_1_PosX = Ship_1_Pos.x
		global.dyworld.Generation_Ship_1_PosY = Ship_1_Pos.y
	end
	if not global.dyworld.Generation_Ship_2 then 
		game.surfaces[1].create_entity{name = (BuildEntity2), position = Ship_2_Pos, force =game.forces.player}
		global.dyworld.Generation_Ship_2 = true
		global.dyworld.Generation_Ship_2_PosX = Ship_2_Pos.x
		global.dyworld.Generation_Ship_2_PosY = Ship_2_Pos.y
	end
	if not global.dyworld.Generation_Ship_3 then 
		game.surfaces[1].create_entity{name = (BuildEntity3), position = Ship_3_Pos, force = game.forces.player}
		global.dyworld.Generation_Ship_3 = true
		global.dyworld.Generation_Ship_3_PosX = Ship_3_Pos.x
		global.dyworld.Generation_Ship_3_PosY = Ship_3_Pos.y
	end
	if not global.dyworld.Generation_Ship_4 then 
		Ship_4_Created = game.surfaces[1].create_entity{name = (BuildEntity4), position = Ship_4_Pos, force = game.forces.player}
		for i = 1, (math.random(5,10)) do
			AddedItem = AddedItems[keysetAddedItem[math.random(#keysetAddedItem)]]
			Ship_4_Created.insert{name = AddedItem, count = math.random(25)}
		end
		global.dyworld.Generation_Ship_4 = true
		global.dyworld.Generation_Ship_4_PosX = Ship_4_Pos.x
		global.dyworld.Generation_Ship_4_PosY = Ship_4_Pos.y
	end
	if not global.dyworld.Generation_Ship_5 then 
		Ship_5_Created = game.surfaces[1].create_entity{name = (BuildEntity5), position = Ship_5_Pos, force = game.forces.player}
		for i = 1, (math.random(10,25)) do
			AddedItem = AddedItems[keysetAddedItem[math.random(#keysetAddedItem)]]
			Ship_5_Created.insert{name = AddedItem, count = math.random(25)}
		end
		global.dyworld.Generation_Ship_5 = true
		global.dyworld.Generation_Ship_5_PosX = Ship_5_Pos.x
		global.dyworld.Generation_Ship_5_PosY = Ship_5_Pos.y
	end
end