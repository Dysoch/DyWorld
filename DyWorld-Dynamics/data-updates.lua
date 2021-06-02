




for i,inserter in pairs(data.raw["inserter"]) do
    inserter.allow_custom_vectors = true
	--inserter.fast_replaceable_group = "inserter"
end

require(DyDs_data_tech.. "data")
require("data.core.templates.canisters")