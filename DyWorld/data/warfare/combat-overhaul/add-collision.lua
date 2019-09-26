require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

Projectile_Table_To_Change = {
	"grenade", --done
	"rocket", --done
	"atomic-rocket", --done
	"explosive-rocket", --done
	"explosive-uranium-cannon-projectile",
	"explosive-cannon-projectile",
	"cluster-grenade", --done
}

for k,v in pairs(Projectile_Table_To_Change) do
	if data.raw.projectile[v] then
	local Changed = data.raw.projectile[v]
		if not Changed.collision_box then
			Changed.collision_box = {{-0.05, -0.25}, {0.05, 0.25}}
		end
		if not Changed.direction_only then
			Changed.direction_only = true
		end
		if not Changed.acceleration then
			Changed.acceleration = 0
		end
	end
end

for k,v in pairs(data.raw["ammo"]) do
	if not v.magazine_size then
		v.magazine_size = 50
	else
		v.magazine_size = math.floor(v.magazine_size * 2.5)
	end
end