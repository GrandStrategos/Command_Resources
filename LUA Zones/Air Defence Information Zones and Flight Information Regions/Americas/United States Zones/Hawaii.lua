local sidename = "United States"

local data = {
	{26.5, -161.0},
	{26.5, -156.0},
	{22.0, -153.0},
	{20.0, -153.0},
	{17.0, -156.0},
	{17.0, -160.0},
	{20.0, -164.0},
	{24.0, -164.0}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end