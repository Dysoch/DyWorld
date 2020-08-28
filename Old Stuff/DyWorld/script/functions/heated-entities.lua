function Heated_Entity_Build(event)
    local Entity_New = "heat-pipe"
    local Entity_Placed = event.created_entity
    Pipe = Entity_Placed.surface.create_entity{name = Entity_New, position = Entity_Placed.position, force = Entity_Placed.force}
    Pipe.destructible = false
end

function Heated_Entity_Remove(event)
    local Center = event.entity.position
    local Entity_Removed = "heat-pipe"
    for _, entity in pairs(event.entity.surface.find_entities_filtered{
    area = {{Center.x-0.5, Center.y-0.5}, {Center.x+0.5, Center.y+0.5}},
    name = Entity_Removed}) do
		entity.destroy()
	end
end

function Heat_Pipe_Add(event)
    local Entity_New = "heat-pipe-invisible"
    local Entity_Placed = event.created_entity
    Pipe = Entity_Placed.surface.create_entity{name = Entity_New, position = Entity_Placed.position, force = Entity_Placed.force}
    Pipe.destructible = false
end

function Heat_Pipe_Remove(event)
    local Center = event.entity.position
    local Entity_Removed = "heat-pipe-invisible"
    for _, entity in pairs(event.entity.surface.find_entities_filtered{
    area = {{Center.x-0.5, Center.y-0.5}, {Center.x+0.5, Center.y+0.5}},
    name = Entity_Removed}) do
		entity.destroy()
	end
end