require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Logistics"].value then

data.raw.inserter["inserter-tier-1"].next_upgrade = "inserter-tier-2"
data.raw.inserter["inserter-tier-2"].next_upgrade = "inserter-tier-3"
data.raw.inserter["inserter-tier-3"].next_upgrade = "inserter-tier-4"
data.raw.inserter["inserter-tier-4"].next_upgrade = "inserter-tier-5"
data.raw.inserter["inserter-tier-5"].next_upgrade = "stack-inserter-tier-1"
data.raw.inserter["stack-inserter-tier-1"].next_upgrade = "stack-inserter-tier-2"
data.raw.inserter["stack-inserter-tier-2"].next_upgrade = "stack-inserter-tier-3"
data.raw.inserter["stack-inserter-tier-3"].next_upgrade = "stack-inserter-tier-4"
data.raw.inserter["stack-inserter-tier-4"].next_upgrade = "stack-inserter-tier-5"

data.raw.inserter["long-inserter-tier-1"].next_upgrade = "long-inserter-tier-2"
data.raw.inserter["long-inserter-tier-2"].next_upgrade = "long-inserter-tier-3"
data.raw.inserter["long-inserter-tier-3"].next_upgrade = "long-inserter-tier-4"
data.raw.inserter["long-inserter-tier-4"].next_upgrade = "long-inserter-tier-5"
data.raw.inserter["long-inserter-tier-5"].next_upgrade = "stack-long-inserter-tier-1"
data.raw.inserter["stack-long-inserter-tier-1"].next_upgrade = "stack-long-inserter-tier-2"
data.raw.inserter["stack-long-inserter-tier-2"].next_upgrade = "stack-long-inserter-tier-3"
data.raw.inserter["stack-long-inserter-tier-3"].next_upgrade = "stack-long-inserter-tier-4"
data.raw.inserter["stack-long-inserter-tier-4"].next_upgrade = "stack-long-inserter-tier-5"

data.raw.inserter["filter-long-inserter-tier-1"].next_upgrade = "filter-long-inserter-tier-2"
data.raw.inserter["filter-long-inserter-tier-2"].next_upgrade = "stack-long-filter-inserter-tier-1"
data.raw.inserter["stack-long-filter-inserter-tier-1"].next_upgrade = "stack-long-filter-inserter-tier-2"

data.raw.inserter["filter-inserter-tier-1"].next_upgrade = "filter-inserter-tier-2"
data.raw.inserter["filter-inserter-tier-2"].next_upgrade = "stack-filter-inserter-tier-1"
data.raw.inserter["stack-filter-inserter-tier-1"].next_upgrade = "stack-filter-inserter-tier-2"

data.raw.inserter["inserter"].next_upgrade = "inserter-tier-1"
data.raw.inserter["fast-inserter"].next_upgrade = "inserter-tier-2"
data.raw.inserter["stack-inserter"].next_upgrade = "stack-inserter-tier-1"
data.raw.inserter["filter-inserter"].next_upgrade = "filter-inserter-tier-1"
data.raw.inserter["long-handed-inserter"].next_upgrade = "long-inserter-tier-1"
data.raw.inserter["stack-filter-inserter"].next_upgrade = "stack-filter-inserter-tier-1"

end