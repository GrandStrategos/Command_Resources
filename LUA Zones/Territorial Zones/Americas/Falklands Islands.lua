local sidename = "United Kingdom"

local data = {
	{-51.3213, -57.5651},
	{-51.1749, -57.825},
	{-50.9925, -58.9838},
	{-51.0713, -59.4825},
	{-50.8018, -61.2735},
	{-50.8234, -61.6179},
	{-50.9874, -61.7755},
	{-51.1789, -61.6001},
	{-51.8904, -61.6577},
	{-52.309, -61.174},
	{-52.4539, -60.7282},
	{-52.6471, -59.1663},
	{-52.608, -58.6961},
	{-51.8482, -57.4861},
	{-51.6584, -57.3676},
	{-51.4487, -57.418},
	{-51.3213, -57.5651}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end