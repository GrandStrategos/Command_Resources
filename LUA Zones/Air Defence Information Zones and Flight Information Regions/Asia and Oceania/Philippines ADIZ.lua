local sidename = "Philippines"

local data = {
	{21.0, 117.5},
	{21.0, 124.0},
	{17.99827222221, 124.00144769444},
	{14.9984456111, 126.00142125},
	{10.99871674999, 126.00139866666},
	{10.99875833333, 117.00140416666},
	{20.41666666666, 117.0}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end