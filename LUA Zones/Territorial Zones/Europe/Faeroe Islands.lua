local sidename = "Faeroe Islands"

local data = {
	{62.59584, -6.56974},
	{62.50662, -6.00886},
	{62.34563, -5.82586},
	{61.28727, -6.27094},
	{61.17392, -6.43256},
	{61.13821, -6.72268},
	{61.20279, -6.98126},
	{62.06279, -8.11268},
	{62.21525, -8.03499},
	{62.46543, -7.47695},
	{62.59584, -6.56974}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end