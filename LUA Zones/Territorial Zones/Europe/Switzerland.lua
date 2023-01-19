local sidename = "Switzerland"

local data = {
	{47.8101, 8.576932},
	{47.67521, 8.789062},
	{47.73096, 8.80479},
	{47.64942, 8.890972},
	{47.65676, 9.278737},
	{47.54454, 9.563233},
	{47.38335, 9.674408},
	{47.27129, 9.53087},
	{47.05238, 9.475093},
	{47.02698, 9.879637},
	{46.93686, 9.879967},
	{46.84433, 10.10612},
	{47.00106, 10.38974},
	{46.93686, 10.49131},
	{46.68056, 10.38654},
	{46.61448, 10.49173},
	{46.54547, 10.47098},
	{46.54976, 10.29974},
	{46.63628, 10.24378},
	{46.60984, 10.10223},
	{46.45208, 10.03865},
	{46.41294, 10.16611},
	{46.33261, 10.10568},
	{46.26051, 10.17571},
	{46.2188, 10.06824},
	{46.37827, 9.957867},
	{46.29347, 9.585868},
	{46.37775, 9.463457},
	{46.50444, 9.461719},
	{46.49672, 9.284764},
	{46.23356, 9.247784},
	{46.03306, 9.009604},
	{45.90208, 9.08958},
	{45.82157, 9.032922},
	{45.83342, 8.912845},
	{45.95633, 8.897011},
	{45.99907, 8.792},
	{46.07271, 8.855358},
	{46.24884, 8.446116},
	{46.46393, 8.444903},
	{46.266, 8.085962},
	{46.14515, 8.152452},
	{45.91976, 7.867459},
	{45.98757, 7.571646},
	{45.85951, 7.103034},
	{46.04816, 6.875105},
	{46.12438, 6.903317},
	{46.14601, 6.793703},
	{46.28214, 6.863897},
	{46.34308, 6.780259},
	{46.42633, 6.821307},
	{46.45226, 6.679631},
	{46.4035, 6.338587},
	{46.31148, 6.221696},
	{46.22995, 6.298929},
	{46.13049, 5.952608},
	{46.20712, 5.969885},
	{46.25416, 6.12599},
	{46.37192, 6.161784},
	{46.41518, 6.068484},
	{46.54306, 6.158882},
	{46.57602, 6.112675},
	{46.78665, 6.459471},
	{46.92741, 6.43232},
	{47.04792, 6.714487},
	{47.32687, 7.052185},
	{47.35331, 6.87756},
	{47.4975, 6.994453},
	{47.49184, 7.20174},
	{47.44463, 7.173302},
	{47.42352, 7.249982},
	{47.44343, 7.415466},
	{47.58984, 7.588688},
	{47.60106, 7.689659},
	{47.56106, 7.628605},
	{47.53196, 7.692318},
	{47.62075, 8.206177},
	{47.56788, 8.44232},
	{47.64427, 8.626689},
	{47.6744, 8.405748},
	{47.8101, 8.576932}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end