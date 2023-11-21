

local Table = {
	["fire-flame"] = (settings.startup["DyWorld_Fire_Setting"].value / 2),
	["fire-flame-on-tree"] = settings.startup["DyWorld_Fire_Setting"].value,
}

for k,v in pairs(Table) do
	if data.raw.fire[k] then
		data.raw.fire[k].maximum_spread_count = v
		data.raw.fire[k].spread_delay = 150
		data.raw.fire[k].spread_delay_deviation = 90
	end
end

data.raw.sticker["fire-sticker"].fire_spread_cooldown = 15
data.raw.sticker["fire-sticker"].fire_spread_radius = 2.5
data.raw.sticker["fire-sticker"].duration_in_ticks = 60 * 60
data.raw.sticker["fire-sticker"].damage_per_tick = { amount = 40, type = "fire" }