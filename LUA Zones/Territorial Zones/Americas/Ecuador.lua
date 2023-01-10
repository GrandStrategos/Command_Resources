local sidename = "Ecuador"

local data = {
	{-1.1755, -89.2658},
	{-0.65558, -89.0477},
	{0.487013, -89.8088},
	{0.817603, -90.6622},
	{1.857144, -91.9084},
	{1.82905, -92.1443},
	{1.654787, -92.2053},
	{-0.43108, -91.8482},
	{-1.12344, -91.6354},
	{-1.55569, -90.5009},
	{-1.61215, -89.6329},
	{-1.5416, -89.4752}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end