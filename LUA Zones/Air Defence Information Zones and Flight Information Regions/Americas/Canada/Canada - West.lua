local sidename = "Canada"

local data = {
	{54.58333333333, -133.0},
	{54.0, -136.0},
	{52.0, -135.0},
	{48.33333333, -132.0},
	{48.33333333, -128.0},
	{48.5, -125.0},
	{51.0, -129.75},
	{52.7, -132.5},
	{53.81666666666, -133.0},
	{54.58333333333, -133.0}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end