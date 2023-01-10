local sidename = "Taiwan"

local data = {
	{28.0134577, 123.0},
	{23.0, 123.0},
	{21.0, 121.5},
	{21.0, 117.5},
	{23.0, 117.5}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end