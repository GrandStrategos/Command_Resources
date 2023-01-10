local sidename = "United Kingdom/Ireland"

local data = {
	{48.83333333, -8.0},
	{50.0, -2.0},
	{50.0, -0.25},
	{50.66666667, 1.466666667},
	{51.0, 1.466666667},
	{51.11666667, 2.0},
	{51.5, 2.0},
	{55.0, 5.0},
	{57.0, 5.0},
	{60.0, 0.0},
	{61.0, 0.0},
	{61.0, -10.0},
	{54.56666667, -10.0},
	{54.0, -15.0},
	{51.0, -15.0},
	{51.0, -8.0}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end