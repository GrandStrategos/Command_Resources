local sidename = "Ukraine"

local data = {
	{44.18514, 33.74111},
	{44.25274, 34.26107},
	{44.61881, 34.84141},
	{44.59629, 35.14297},
	{44.76369, 35.55299},
	{44.91004, 36.77336},
	{45.34245, 36.6326},
	{45.6285, 36.68182},
	{45.62823, 35.438},
	{45.77488, 35.28564},
	{45.98242, 35.39051},
	{46.27571, 35.68168},
	{46.44311, 36.86226},
	{46.87976, 37.68795},
	{46.90794, 38.23458},
	{46.98434, 38.34363},
	{47.14577, 38.23646},
	{47.26876, 38.33399},
	{47.57578, 38.35044},
	{47.68547, 38.77278},
	{47.87456, 38.89768},
	{47.87052, 39.79582},
	{48.25315, 40.02181},
	{48.72522, 39.72397},
	{48.83595, 39.81295},
	{48.79372, 39.97699},
	{48.86925, 40.07697},
	{49.07146, 39.94304},
	{49.25943, 40.21973},
	{49.45564, 40.03775},
	{49.617, 40.13633},
	{49.59675, 39.75062},
	{49.88759, 39.18078},
	{49.80669, 38.97066},
	{50.00444, 38.68342},
	{49.96393, 38.49386},
	{50.08701, 38.32207},
	{49.95674, 38.01829},
	{50.20374, 37.6273},
	{50.45763, 37.4912},
	{50.2664, 36.69009},
	{50.30485, 36.29673},
	{50.45094, 36.06503},
	{50.3512, 35.65619},
	{50.54106, 35.43968},
	{50.77589, 35.48671},
	{50.97485, 35.35207},
	{51.05244, 35.39932},
	{51.0533, 35.19453},
	{51.23457, 35.11463},
	{51.17887, 34.79203},
	{51.25998, 34.4445},
	{51.43061, 34.24437},
	{51.52107, 34.30675},
	{51.64089, 34.16838},
	{51.73144, 34.43817},
	{51.82551, 34.41526},
	{52.3665, 33.83052},
	{52.38401, 33.19363},
	{52.26574, 32.68511},
	{52.33629, 32.37774},
	{52.13871, 32.33414},
	{52.04567, 32.09864},
	{52.14352, 31.44313},
	{52.08429, 30.96254},
	{51.66853, 30.5178},
	{51.36194, 30.63389},
	{51.26238, 30.54269},
	{51.51249, 30.17722},
	{51.45927, 29.83666},
	{51.53086, 29.72976},
	{51.41413, 29.31954},
	{51.6548, 29.10863},
	{51.46511, 28.72904},
	{51.5712, 28.6546},
	{51.60501, 28.30654},
	{51.68158, 28.2657},
	{51.56811, 28.05254},
	{51.60484, 27.39467},
	{51.77204, 27.20421},
	{51.94319, 25.82173},
	{51.88105, 24.38555},
	{51.66664, 24.12127},
	{51.61961, 23.60589},
	{51.40597, 23.69689},
	{51.28753, 23.64824},
	{50.89116, 24.0528},
	{50.79443, 23.95754},
	{50.63629, 24.09559},
	{50.50226, 24.06966},
	{50.09914, 23.28451},
	{49.52911, 22.64446},
	{49.17498, 22.70781},
	{49.03181, 22.87373},
	{49.08812, 22.56767},
	{48.58807, 22.17265},
	{48.39289, 22.1443},
	{48.10844, 22.59099},
	{48.09523, 22.83156},
	{47.95209, 22.89432},
	{48.10089, 23.18908},
	{47.96906, 23.49312},
	{47.94588, 24.59885},
	{47.72358, 24.88861},
	{47.75208, 25.11652},
	{47.89764, 25.2839},
	{47.99669, 26.19286},
	{48.18475, 26.35805},
	{48.3007, 26.65128},
	{48.47254, 27.5429},
	{48.43696, 27.79957},
	{48.06579, 28.49105},
	{48.1529, 28.53054},
	{48.1311, 28.69253},
	{47.88425, 29.20207},
	{47.45819, 29.15878},
	{47.25082, 29.55247},
	{47.12225, 29.49746},
	{46.9408, 29.57242},
	{46.80365, 29.93456},
	{46.52822, 29.89527},
	{46.3987, 30.05838},
	{46.37157, 29.88758},
	{46.47337, 29.74339},
	{46.41638, 29.56717},
	{46.558, 29.23593},
	{46.45775, 28.93127},
	{46.09314, 28.95068},
	{45.73626, 28.51983},
	{45.51327, 28.41816},
	{45.46872, 28.2129},
	{45.32553, 28.34715},
	{45.22538, 28.71774},
	{45.43802, 29.38951},
	{45.33265, 29.65933},
	{45.20331, 29.68883},
	{45.07682, 30.34146},
	{45.29546, 30.48593},
	{45.59201, 30.19723},
	{46.41726, 31.16062},
	{46.07453, 31.45199},
	{45.81387, 32.55891},
	{45.68676, 32.52311},
	{45.47386, 32.21538},
	{45.253, 32.2434},
	{45.01117, 33.04436},
	{44.80311, 33.21702},
	{44.61742, 33.10262},
	{44.47893, 33.13958},
	{44.18514, 33.74111}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end