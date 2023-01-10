local sidename = "South Korea"

local data = {
	{39.0, 123.5},
	{39.0, 133.0},
	{37.28333333333, 133.0},
	{36.0, 130.5},
	{35.21666666666, 129.8},
	{34.71666666666, 129.15},
	{34.28333333333, 128.86666666666},
	{32.5, 127.5},
	{32.5, 126.83333333333},
	{30.0, 125.41666666666},
	{30.0, 124.0},
	{37.0, 124.0}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end