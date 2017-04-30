

for k,v in pairs(data.raw["projectile"]) do
	if not v.collision_box then
		v.collision_box = {{-0.05, -0.25}, {0.05, 0.25}}
	end
	if not v.direction_only then
		v.direction_only = true
	end
end

for k,v in pairs(data.raw["ammo"]) do
	if not v.magazine_size then
		v.magazine_size = 50
	else
		v.magazine_size = v.magazine_size*2
	end
end

