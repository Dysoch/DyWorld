



function DyW.Equip.Grid(Width, Height, Cat)
	local Base = "DyWorld-equipment-grid-"
	if data.raw["equipment-grid"][Base..Width.."-"..Height.."-"..Cat] then
        DyW.Fx.Edited("equipment-grid", Base..Width.."-"..Height.."-"..Cat)
		return Base..Width.."-"..Height.."-"..Cat
	else
		data:extend(
		{
		  {
			type = "equipment-grid",
			name = Base..Width.."-"..Height.."-"..Cat,
			width = Width,
			height = Height,
			equipment_categories = {"armor"}
		  },
		})
		if not data.raw["equipment-category"][Cat] then 
			data:extend(
			{
			  {
				type = "equipment-category",
				name = Cat,
			  },
			})
		end
		data.raw["equipment-grid"][Base..Width.."-"..Height.."-"..Cat].equipment_categories = {Cat}
        DyW.Fx.Edited("equipment-grid", Base..Width.."-"..Height.."-"..Cat)
		return Base..Width.."-"..Height.."-"..Cat
	end
end

function DyW.Equip.Size(Width, Height, Type)
	if Type == 1 then
		return {
		  width = Width,
		  height = Height,
		  type = "full"
		}
	end
end