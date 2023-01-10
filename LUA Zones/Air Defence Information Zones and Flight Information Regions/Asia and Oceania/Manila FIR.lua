local sidename = "Philippines"

local data = {
	{16.66667, 114.0},
	{21.0, 117.5},
	{21.0, 130.0},
	{7.0, 130.0},
	{4.0, 132.5709},
	{4.0, 120.0},
	{7.5, 117.5},
	{10.5, 114.0}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end