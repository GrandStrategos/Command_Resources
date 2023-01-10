local sidename = "Ireland"

local data = {
	{53.91666667, -5.5},
	{52.33333333, -5.5},
	{51.0, -8.0},
	{51.0, -15.0},
	{54.0, -15.0},
	{54.56666667, -10.0},
	{54.75, -9.0},
	{55.33333333, -8.25},
	{55.41666667, -7.333333333},
	{55.33333333, -6.933333333},
	{54.41666667, -8.166666667}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end