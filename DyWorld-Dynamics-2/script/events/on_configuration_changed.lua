



function Event_on_configuration_changed()
    -- Early acces stuff, basically crash the game to ensure new version is used --
    if global.dyworld and global.dyworld.version and global.dyworld.version.hotfix ~= Version_Build_Hotfix then
        global.dyworld.version.major = Version_Build_Major
        global.dyworld.version.minor = Version_Build_Minor
        global.dyworld.version.hotfix = Version_Build_Hotfix
        global.dyworld.version.version = Version_Build
        for k,v in pairs(global.dyworld.players) do
            v.achievements = DyWorld_2_Achievements_Bonuses
            Attribute_Calc(k)
        end
        error("DyWorld-Dynamics 2 early access forbids the usage of savegames other then those from the same build. Please start a new world \n Sorry for this, but this is to ensure new scripts are working properly while adding them, without having to worry about migrating scripts for a temporary build \n Thanks for playing, Dysoch")
    end

    -- Always check this. Will change things every update --
    --game.player.force.reset_technology_effects()
    if global.dyworld and global.dyworld.version and global.dyworld.version.version ~= Version_Build then
        global.dyworld.version.major = Version_Build_Major
        global.dyworld.version.minor = Version_Build_Minor
        global.dyworld.version.hotfix = Version_Build_Hotfix
        global.dyworld.version.version = Version_Build
        for k,v in pairs(global.dyworld.players) do
            v.achievements = DyWorld_2_Achievements_Bonuses
            Attribute_Calc(k)
        end
    end
end