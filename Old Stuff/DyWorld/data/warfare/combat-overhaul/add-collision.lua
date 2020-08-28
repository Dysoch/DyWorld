require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Combat_Overhaul"].value then

Projectile_Table_To_Change = {
	"grenade", 
	--"rocket", 
	--"atomic-rocket", 
	--"explosive-rocket", 
	"explosive-uranium-cannon-projectile",
	"explosive-cannon-projectile",
	"cluster-grenade", 
}

for k,v in pairs(Projectile_Table_To_Change) do
	if data.raw.projectile[v] then
	local Changed = data.raw.projectile[v]
		if not Changed.collision_box then
			Changed.collision_box = {{-0.05, -0.25}, {0.05, 0.25}}
		end
		Changed.direction_only = false
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

end