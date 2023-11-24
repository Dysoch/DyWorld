

function Dy_Diff(NMB, NB, TYPE)
    local VAR = settings.startup["DyWorld_Difficulty"].value
    if TYPE == "stacksize" then
        if VAR == "Very Easy" then
            local form = Round((NMB * 5), NB)
            if form <= 1 then
                return 1
            else
                return form
            end
        elseif VAR == "Easy" then
            local form = Round((NMB * 2.5), NB)
            if form <= 1 then
                return 1
            else
                return form
            end
        elseif VAR == "Normal" then
            local form = Round((NMB), NB)
            if form <= 1 then
                return 1
            else
                return form
            end
        elseif VAR == "Hard" then
            local form = Round((NMB * 0.5), NB)
            if form <= 1 then
                return 1
            else
                return form
            end
        elseif VAR == "Insane" then
            local form = Round((NMB * 0.25), NB)
            if form <= 1 then
                return 1
            else
                return form
            end
        elseif VAR == "Death" then
            local form = Round((NMB * 0.125), NB)
            if form <= 1 then
                return 1
            else
                return form
            end
        end
    elseif TYPE == "crafting" then
        if VAR == "Very Easy" then
            local form = Round((NMB * 10), NB)
            if form <= 1 then
                return 1
            else
                return form
            end
        elseif VAR == "Easy" then
            local form = Round((NMB * 5), NB)
            if form <= 1 then
                return 1
            else
                return form
            end
        elseif VAR == "Normal" then
            local form = Round((NMB), NB)
            if form <= 1 then
                return 1
            else
                return form
            end
        elseif VAR == "Hard" then
            local form = Round((NMB * 0.5), NB)
            if form <= 1 then
                return 1
            else
                return form
            end
        elseif VAR == "Insane" then
            local form = Round((NMB * 0.25), NB)
            if form <= 1 then
                return 1
            else
                return form
            end
        elseif VAR == "Death" then
            local form = Round((NMB * 0.125), NB)
            if form <= 1 then
                return 1
            else
                return form
            end
        end
    else
        if VAR == "Very Easy" then
            return Round((NMB * 0.25), NB)
        elseif VAR == "Easy" then
            return Round((NMB * 0.5), NB)
        elseif VAR == "Normal" then
            return Round((NMB), NB)
        elseif VAR == "Hard" then
            return Round((NMB * 1.5), NB)
        elseif VAR == "Insane" then
            return Round((NMB * 2), NB)
        elseif VAR == "Death" then
            return Round((NMB * 5), NB)
        end
    end
end


local core = "data.core."
local logistics = "data.logistics."
local warfare = "data.warfare."
local machine = "data.machines."


-- Core --
require(core.."main")

-- Logistics --
require(logistics.."data")

-- Machines --
require(machine.."data")

-- Warfare --
require(warfare.."data")