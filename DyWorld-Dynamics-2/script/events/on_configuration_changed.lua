



function Event_on_configuration_changed()

    -- Always check this. Will change things every update --
    game.forces.player.reset_technology_effects()
    if global.dyworld and global.dyworld.version and global.dyworld.version.version ~= Version_Build then
        global.dyworld.version.major = Version_Build_Major
        global.dyworld.version.minor = Version_Build_Minor
        global.dyworld.version.hotfix = Version_Build_Hotfix
        global.dyworld.version.version = Version_Build
        --for k,v in pairs(global.dyworld.players) do
            --v.achievements = DyWorld_2_Achievements_Bonuses
            --Attribute_Calc(k)
        --end
    end
end