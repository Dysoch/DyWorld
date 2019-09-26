function Heated_Entity_Build(event)
    local Entity_Placed = event.created_entity
    local Entity_New = "heat-pipe"
    Pipe = Entity_Placed.surface.create_entity{name = Entity_New, position = Entity_Placed.position, force = Entity_Placed.force}
    Pipe.destructible = true
    Pipe = Entity_Placed.surface.create_entity{name = Entity_Placed.name, position = Entity_Placed.position, force = Entity_Placed.force}
    Pipe.destructible = true
	Entity_Placed.destroy()
end

function Heat_Pipe_Add(event)
    local Entity_New = "heat-pipe-invisible"
    local Entity_Placed = event.created_entity
    Pipe = Entity_Placed.surface.create_entity{name = Entity_New, position = Entity_Placed.position, force = Entity_Placed.force}
    Pipe.destructible = true
end
