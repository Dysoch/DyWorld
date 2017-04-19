module("Dyzilla", package.seeall)
require "config"

function Startup()
global.Dyzilla = {}
global.Dyzilla.Chunks = 0
global.Dyzilla.Alive = 0
global.Dyzilla.Dead = 0
global.Dyzilla.Max = 0
global.Dyzilla.Supplies = false
end

function Hell(event)
	global.Dyzilla.Max = 99
	if math.random(6)==5 then
	debug("chance happened (Hell)")
		if global.Dyzilla.Alive <= global.Dyzilla.Max and global.Dyzilla.Chunks > (250+(50*global.Dyzilla.Alive)) then
		debug("Max spawners is not 0 (Extreme)")
		local BuildEntity = "dyzilla-spawner"
		local PosX = event.area.left_top.x+math.random(32)
		local PosY = event.area.left_top.y+math.random(32)
			for _,player in pairs(game.players) do
				if player.surface.can_place_entity{name=(BuildEntity), position={PosX,PosY}} then 
					if remote.interfaces["DyTech-World"] then
						player.surface.create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
					else
						player.surface.create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.dyzilla}
					end
					global.Dyzilla.Alive = global.Dyzilla.Alive + 1
					PlayerPrint("Dyzilla Spawner has been FOUND! ("..global.Dyzilla.Alive.." alive at the moment)")
					debug("Dyzilla: New spawner spawned in, total alive: "..global.Dyzilla.Alive)
				end
			end
		end
	end
end