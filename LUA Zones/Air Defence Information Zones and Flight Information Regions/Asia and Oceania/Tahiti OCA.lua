local sidename = "France"

local data = {
	{-5.0, -157.0},
	{-5.0, -155.0},
	{3.5, -145.0},
	{3.5, -120.0},
	{-30.0, -120.0},
	{-30.0, -157.0}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end