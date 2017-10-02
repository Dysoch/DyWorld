require "data/prefix"

local Data_Table_Looped = {
	{
		Name = "projectile-basic-",
		Projectile_Type = 1,
		Dmg_Mod = 0.25,
		DmgType= "physical",
		Piercing = false,
		Tint = {r=255, g=255, b=255}
	},
	{
		Name = "projectile-basic-",
		Projectile_Type = 1,
		Dmg_Mod = 0.5,
		DmgType= "physical",
		Piercing = true,
		Tint = {r=255, g=255, b=255}
	},
	{
		Name = "projectile-laser-",
		Projectile_Type = 2,
		Dmg_Mod = 0.5,
		DmgType= "physical",
		Piercing = false,
		Tint = {r=255, g=0, b=0}
	},
	{
		Name = "projectile-laser-",
		Projectile_Type = 2,
		Dmg_Mod = 1,
		DmgType= "physical",
		Piercing = true,
		Tint = {r=255, g=0, b=0}
	},
}

for i=1,50 do
	for k,v in pairs(Data_Table_Looped) do
		if v.Projectile_Type == 1 then
		data:extend(
		{
			DyWorld_Projectile_1(v, i)
		})
		elseif v.Projectile_Type == 2 then
		data:extend(
		{
			DyWorld_Projectile_2(v, i)
		})
		end
	end
end