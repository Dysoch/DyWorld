



function Event_on_configuration_changed()
    if global.dyworld and global.dyworld.version and global.dyworld.version ~= Version_Build then
        global.dyworld.version = Version_Build
        for k,v in pairs(global.dyworld.players) do
            v.achievements = DyWorld_2_Achievements_Bonuses
            Attribute_Calc(k)
        end
    end
end