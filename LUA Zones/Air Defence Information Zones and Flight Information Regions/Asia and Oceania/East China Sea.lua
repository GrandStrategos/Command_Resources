local sidename = "China"

local data = {
	{33.18333333333, 121.78333333333},
	{31.5, 122.35},
	{30.75, 123.25},
	{30.15, 123.05},
	{28.8, 122.35},
	{27.45, 121.25},
	{26.73333333333, 120.96666666666},
	{24.75, 123.0},
	{25.63333333333, 125.0},
	{31.0, 128.3333333},
	{33.18333333333, 125.0}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end