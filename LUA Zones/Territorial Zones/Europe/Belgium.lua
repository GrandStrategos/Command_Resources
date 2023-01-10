local sidename = "Belgium"

local data = {
	{49.49607, 5.471192},
	{49.50869, 5.612146},
	{49.55359, 5.844924},
	{49.66382, 5.911477},
	{49.70902, 5.886408},
	{49.87252, 5.782304},
	{49.96153, 5.775548},
	{49.98093, 5.834258},
	{50.03157, 5.860916},
	{50.13628, 5.960182},
	{50.13364, 6.138878},
	{50.18555, 6.189256},
	{50.26966, 6.280484},
	{50.32803, 6.405904},
	{50.45483, 6.373586},
	{50.62174, 6.274425},
	{50.6238, 6.178153},
	{50.72542, 6.115089},
	{50.75449, 6.02126},
	{50.77263, 5.883112},
	{50.81331, 5.695341},
	{50.86257, 5.639016},
	{50.95131, 5.758834},
	{51.0964, 5.831918},
	{51.14322, 5.853691},
	{51.16402, 5.830848},
	{51.22135, 5.562758},
	{51.26598, 5.558679},
	{51.30426, 5.485728},
	{51.31456, 5.142227},
	{51.43147, 5.105977},
	{51.4706, 5.080353},
	{51.48314, 5.026626},
	{51.45739, 4.842145},
	{51.50408, 4.770126},
	{51.42305, 4.665381},
	{51.48228, 4.540108},
	{51.47919, 4.482556},
	{51.4464, 4.379563},
	{51.3738, 4.242808},
	{51.20144, 3.894012},
	{51.25551, 3.795069},
	{51.30392, 3.592713},
	{51.29499, 3.367397},
	{51.36696, 3.370403},
	{51.45, 3.296389},
	{51.53901, 3.106117},
	{51.53044, 3.0132},
	{51.26485, 2.394051},
	{51.09038, 2.54555},
	{50.85039, 2.606596},
	{50.81743, 2.639428},
	{50.73057, 2.794353},
	{50.69641, 2.90173},
	{50.64217, 3.244312},
	{50.52526, 3.291606},
	{50.49574, 3.389613},
	{50.48939, 3.501922},
	{50.3691, 3.654404},
	{50.30966, 3.702467},
	{50.32811, 3.902388},
	{50.25668, 4.137527},
	{50.21387, 4.161526},
	{50.13456, 4.200876},
	{50.1313, 4.122944},
	{50.01655, 4.134069},
	{49.95552, 4.197571},
	{49.94007, 4.454202},
	{49.98333, 4.787078},
	{49.86634, 4.850328},
	{49.7957, 4.855581},
	{49.79982, 4.995999},
	{49.69717, 5.161245},
	{49.61082, 5.313421}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end