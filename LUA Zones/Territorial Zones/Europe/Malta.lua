local sidename = "Malta"

local data = {
	{36.28255, 14.23397},
	{36.22466, 14.45032},
	{35.97991, 14.77969},
	{35.83806, 14.82108},
	{35.6775, 14.73541},
	{35.61038, 14.58678},
	{35.60052, 14.31605},
	{35.92183, 13.98334},
	{36.06493, 13.93621},
	{36.17497, 13.96995},
	{36.25357, 14.07212},
	{36.28255, 14.23397}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end