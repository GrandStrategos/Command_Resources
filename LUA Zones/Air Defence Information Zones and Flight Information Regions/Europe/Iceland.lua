local sidename = "Iceland"

local data = {
	{61.0, -30.0},
	{61.0, -25.0},
	{61.0, -20.0},
	{61.0, -15.0},
	{61.0, -10.0},
	{63.0, -8.0},
	{65.0, -8.0},
	{67.5, -8.0},
	{69.0, -12.0},
	{69.0, -15.0},
	{69.0, -20.0},
	{69.0, -23.0},
	{67.5, -30.0},
	{65.0, -30.0},
	{63.0, -30.0}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end