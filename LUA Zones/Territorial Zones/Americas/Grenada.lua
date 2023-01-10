local sidename = "Grenada"

local data = {
	{12.60777, -61.6648},
	{12.52841, -61.3819},
	{12.3976, -61.2095},
	{11.9035, -61.4885},
	{11.80761, -61.6287},
	{11.77793, -61.7866},
	{11.85475, -61.9448},
	{11.93878, -61.9971},
	{12.02973, -62.0052},
	{12.28032, -61.9037}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end