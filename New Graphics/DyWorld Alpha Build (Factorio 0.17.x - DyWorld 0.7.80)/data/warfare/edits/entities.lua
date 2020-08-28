require "data/prefix"


data.raw.unit["small-biter"].localised_name = {"edits-name.small-biter"}
data.raw.unit["medium-biter"].localised_name = {"edits-name.medium-biter"}
data.raw.unit["big-biter"].localised_name = {"edits-name.big-biter"}
data.raw.unit["behemoth-biter"].localised_name = {"edits-name.behemoth-biter"}
data.raw.unit["small-spitter"].localised_name = {"edits-name.small-spitter"}
data.raw.unit["medium-spitter"].localised_name = {"edits-name.medium-spitter"}
data.raw.unit["big-spitter"].localised_name = {"edits-name.big-spitter"}
data.raw.unit["behemoth-spitter"].localised_name = {"edits-name.behemoth-spitter"}

data.raw.corpse["small-biter-corpse"].localised_name = {"edits-name.small-biter-corpse"}
data.raw.corpse["medium-biter-corpse"].localised_name = {"edits-name.medium-biter-corpse"}
data.raw.corpse["big-biter-corpse"].localised_name = {"edits-name.big-biter-corpse"}
data.raw.corpse["behemoth-biter-corpse"].localised_name = {"edits-name.behemoth-biter-corpse"}
data.raw.corpse["small-spitter-corpse"].localised_name = {"edits-name.small-spitter-corpse"}
data.raw.corpse["medium-spitter-corpse"].localised_name = {"edits-name.medium-spitter-corpse"}
data.raw.corpse["big-spitter-corpse"].localised_name = {"edits-name.big-spitter-corpse"}
data.raw.corpse["behemoth-spitter-corpse"].localised_name = {"edits-name.behemoth-spitter-corpse"}

data.raw["unit-spawner"]["biter-spawner"].localised_name = {"edits-name.biter-spawner"}
data.raw["unit-spawner"]["spitter-spawner"].localised_name = {"edits-name.spitter-spawner"}

data.raw.corpse["biter-spawner-corpse"].localised_name = {"edits-name.biter-spawner-corpse"}
data.raw.corpse["spitter-spawner-corpse"].localised_name = {"edits-name.spitter-spawner-corpse"}

data.raw["unit-spawner"]["biter-spawner"].result_units = (function()
                     local res = {}
                     res[1] = {dy.."arachtoid-1", {{0.0, 0.0}, {0.3, 0.33}, {0.5, 0.0}}}
                     res[2] = {dy.."arachtoid-2", {{0.1, 0.0}, {0.4, 0.33}, {0.6, 0.0}}}
                     res[3] = {dy.."arachtoid-3", {{0.2, 0.0}, {0.5, 0.33}, {0.7, 0.0}}}
                     res[4] = {dy.."arachtoid-4", {{0.3, 0.0}, {0.6, 0.33}, {0.8, 0.0}}}
                     res[5] = {dy.."arachtoid-5", {{0.4, 0.0}, {0.7, 0.33}, {0.9, 0.0}}}
                     res[6] = {dy.."arachtoid-6", {{0.5, 0.0}, {0.8, 0.33}, {1.0, 0.0}}}
                     res[7] = {dy.."arachtoid-7", {{0.6, 0.0}, {0.9, 0.33}, {1.0, 0.1}}}
                     res[8] = {dy.."arachtoid-8", {{0.7, 0.0}, {1.0, 0.2}}}
                     res[9] = {dy.."arachtoid-9", {{0.8, 0.0}, {1.0, 0.3}}}
                     res[10] = {dy.."arachtoid-10", {{0.9, 0.0}, {1.0, 0.4}}}
                     return res
                   end)()

data.raw["unit-spawner"]["spitter-spawner"].result_units = (function()
                     local res = {}
                     res[1] = {dy.."cuspira-1", {{0.0, 0.0}, {0.3, 0.33}, {0.5, 0.0}}}
                     res[2] = {dy.."cuspira-2", {{0.1, 0.0}, {0.4, 0.33}, {0.6, 0.0}}}
                     res[3] = {dy.."cuspira-3", {{0.2, 0.0}, {0.5, 0.33}, {0.7, 0.0}}}
                     res[4] = {dy.."cuspira-4", {{0.3, 0.0}, {0.6, 0.33}, {0.8, 0.0}}}
                     res[5] = {dy.."cuspira-5", {{0.4, 0.0}, {0.7, 0.33}, {0.9, 0.0}}}
                     res[6] = {dy.."cuspira-6", {{0.5, 0.0}, {0.8, 0.33}, {1.0, 0.0}}}
                     res[7] = {dy.."cuspira-7", {{0.6, 0.0}, {0.9, 0.33}, {1.0, 0.1}}}
                     res[8] = {dy.."cuspira-8", {{0.7, 0.0}, {1.0, 0.2}}}
                     res[9] = {dy.."cuspira-9", {{0.8, 0.0}, {1.0, 0.3}}}
                     res[10] = {dy.."cuspira-10", {{0.9, 0.0}, {1.0, 0.4}}}
                     return res
                   end)()