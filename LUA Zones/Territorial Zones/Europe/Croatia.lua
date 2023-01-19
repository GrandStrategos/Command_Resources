local sidename = "Croatia"

local data = {
	{45.86292, 18.85934},
	{45.91819, 18.90328},
	{45.91689, 18.65953},
	{45.73713, 18.44685},
	{45.76847, 17.8593},
	{45.93582, 17.57007},
	{45.94234, 17.34762},
	{45.99118, 17.37243},
	{45.96798, 17.30973},
	{46.16968, 17.15929},
	{46.26188, 16.91379},
	{46.37409, 16.8374},
	{46.555, 16.36835},
	{46.49836, 16.24163},
	{46.37829, 16.30156},
	{46.39357, 16.05812},
	{46.30878, 16.01414},
	{46.21666, 15.64667},
	{46.14635, 15.59613},
	{46.04452, 15.73249},
	{45.84652, 15.70932},
	{45.8476, 15.53855},
	{45.72453, 15.25752},
	{45.65001, 15.4062},
	{45.60445, 15.27705},
	{45.48898, 15.38567},
	{45.45635, 15.34581},
	{45.42208, 15.16672},
	{45.52928, 14.93113},
	{45.4595, 14.81762},
	{45.67294, 14.57001},
	{45.53775, 14.49049},
	{45.47041, 14.32277},
	{45.51998, 14.00192},
	{45.4258, 13.88711},
	{45.44257, 13.67532},
	{45.58957, 13.46682},
	{45.45306, 13.21048},
	{44.96399, 13.35209},
	{44.59868, 13.70103},
	{44.18666, 14.40209},
	{43.65966, 15.06262},
	{43.23339, 15.9202},
	{43.28435, 15.38153},
	{43.19568, 15.22482},
	{43.06657, 15.18776},
	{42.93269, 15.29264},
	{42.82558, 15.63689},
	{42.75281, 16.00342},
	{42.81437, 16.23354},
	{42.68421, 16.23319},
	{42.58286, 16.33833},
	{42.57794, 16.15373},
	{42.49652, 16.02449},
	{42.35913, 15.98564},
	{42.24382, 16.06753},
	{42.1766, 16.34699},
	{42.25109, 16.54756},
	{42.4353, 16.60465},
	{42.54864, 16.47956},
	{42.57161, 17.28371},
	{42.38777, 18.08975},
	{42.2096, 18.41958},
	{42.39239, 18.53984},
	{42.48405, 18.43368},
	{42.56387, 18.43643},
	{42.60263, 18.24433},
	{42.8096, 17.89134},
	{42.90977, 17.82926},
	{42.92858, 17.54049},
	{42.97303, 17.71208},
	{43.08951, 17.64085},
	{43.25407, 17.34124},
	{43.40302, 17.25072},
	{43.47201, 17.2781},
	{43.57564, 17.00814},
	{44.08318, 16.42766},
	{44.20866, 16.17241},
	{44.348, 16.21865},
	{44.37797, 16.13124},
	{44.40281, 16.17222},
	{44.51341, 16.12229},
	{44.56279, 16.01861},
	{44.62552, 16.05474},
	{44.80073, 15.74079},
	{44.8466, 15.79343},
	{45.06185, 15.74116},
	{45.20876, 15.80513},
	{45.23018, 15.97718},
	{45.03104, 16.19368},
	{45.00102, 16.34767},
	{45.2206, 16.51303},
	{45.18499, 16.81934},
	{45.2764, 16.93112},
	{45.14838, 17.17398},
	{45.1895, 17.27332},
	{45.10971, 17.48427},
	{45.13371, 17.66968},
	{45.04429, 17.8515},
	{45.15172, 18.00982},
	{45.08059, 18.11816},
	{45.13886, 18.26395},
	{45.04348, 18.53248},
	{45.09307, 18.53695},
	{45.09494, 18.67319},
	{44.99394, 18.72918},
	{44.99239, 18.79582},
	{44.9027, 18.76744},
	{44.8554, 19.02141},
	{44.91538, 18.99758},
	{44.95302, 19.15606},
	{44.97714, 19.05196},
	{45.01086, 19.10276},
	{45.14542, 19.0864},
	{45.12972, 19.14195},
	{45.20251, 19.17622},
	{45.19591, 19.44727},
	{45.37394, 18.9741},
	{45.41208, 19.03024},
	{45.49288, 18.99915},
	{45.51091, 19.10128},
	{45.57186, 18.89823},
	{45.65603, 18.97575},
	{45.70769, 18.91305},
	{45.71917, 18.97482},
	{45.72131, 18.90955},
	{45.74189, 18.97875},
	{45.76699, 18.85418},
	{45.80566, 18.92303},
	{45.80923, 18.84932},
	{45.86292, 18.85934}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end