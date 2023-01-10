local sidename = "United States"

local data = {
	{43.25, -65.9167},
	{44.35, -67.2667},
	{43.16667, -69.6667},
	{41.08333, -69.6667},
	{40.53333, -72.25},
	{39.91667, -73.0},
	{39.63333, -73.0},
	{39.6, -73.6667},
	{37.0, -75.5},
	{36.16667, -75.1667},
	{35.16667, -75.1667},
	{32.0, -80.5},
	{30.5, -81.0},
	{26.66667, -79.6667},
	{25.0, -80.0833},
	{24.41667, -81.25},
	{24.33333, -81.75},
	{24.5, -82.1},
	{24.68333, -82.1},
	{24.71667, -82.0},
	{25.0, -81.5},
	{25.16667, -81.3833},
	{25.58333, -81.5},
	{26.25, -82.3333},
	{27.83333, -83.0833},
	{28.91667, -83.5},
	{29.7, -84.0},
	{29.33333, -85.0},
	{30.0, -87.1667},
	{30.0, -88.5},
	{28.75, -88.9167},
	{28.75, -90.0},
	{29.41667, -94.0},
	{28.33333, -96.0},
	{27.5, -97.0},
	{26.0, -97.0},
	{26.0, -95.0},
	{26.5, -95.0},
	{26.5, -84.0},
	{24.0, -83.0},
	{24.0, -79.41667},
	{25.66667, -79.41667},
	{27.5, -78.83333},
	{30.75, -74.0},
	{39.5, -63.75}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end