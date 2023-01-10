local sidename = "Norway"

local data = {
	{58.94807, 10.88459},
	{58.67209, 9.788562},
	{57.93699, 8.445971},
	{57.76738, 7.702662},
	{57.76286, 7.167384},
	{57.89679, 6.438152},
	{58.28463, 5.599891},
	{58.57106, 5.203857},
	{58.92296, 5.005698},
	{59.23225, 4.465079},
	{59.66481, 4.6718},
	{60.27226, 4.493625},
	{61.07825, 4.087294},
	{61.69793, 4.158258},
	{62.27468, 4.670766},
	{62.95566, 5.949287},
	{63.25971, 6.838481},
	{64.04329, 8.112306},
	{64.86966, 9.996641},
	{65.70174, 10.79834},
	{66.19979, 11.09295},
	{66.67942, 11.57881},
	{66.81522, 11.85855},
	{67.38519, 11.31672},
	{67.56024, 11.37912},
	{67.8226, 12.12795},
	{68.25707, 12.61778},
	{68.46342, 13.26349},
	{68.85878, 13.86247},
	{69.23153, 14.73341},
	{69.50811, 15.73981},
	{69.74494, 17.05521},
	{70.39682, 18.34579},
	{70.85298, 21.70096},
	{71.28052, 23.73041},
	{71.38312, 25.58085},
	{71.28935, 28.39157},
	{70.87273, 30.43242},
	{70.46742, 31.71329},
	{70.33878, 31.74381},
	{70.1438, 31.58611},
	{70.09752, 31.4387},
	{69.79484, 30.81765},
	{69.57652, 30.94647},
	{69.54086, 30.52085},
	{69.679515, 30.113164},
	{69.56646, 30.18328},
	{69.41437, 30.00517},
	{69.30124, 29.30802},
	{69.11276, 29.24023},
	{69.01302, 29.04129},
	{69.11276, 28.802},
	{69.22606, 28.8302},
	{69.48561, 29.33259},
	{69.69349, 29.12391},
	{69.83185, 28.37711},
	{70.009, 27.99046},
	{70.0914, 27.96327},
	{70.07509, 27.61685},
	{69.91734, 27.10162},
	{69.94004, 26.46707},
	{69.6674, 25.89357},
	{69.60963, 25.9763},
	{69.54809, 25.84246},
	{69.42175, 25.79458},
	{69.39274, 25.84692},
	{69.20322, 25.69275},
	{69.01285, 25.77499},
	{68.89269, 25.62836},
	{68.79793, 25.15599},
	{68.64155, 25.12039},
	{68.55589, 24.89895},
	{68.8369, 23.87215},
	{68.70626, 23.67446},
	{68.62902, 23.17025},
	{68.71811, 22.37965},
	{68.95809, 22.17063},
	{69.27704, 21.63224},
	{69.3124, 21.27682},
	{69.22606, 21.011},
	{69.10366, 21.10923},
	{69.03671, 21.06309},
	{69.12014, 20.72041},
	{69.04564, 20.06342},
	{68.92496, 20.30675},
	{68.805, 20.33457},
	{68.55915, 19.93975},
	{68.49152, 20.23045},
	{68.35625, 19.92478},
	{68.58112, 18.40826},
	{68.53881, 18.12616},
	{68.20072, 18.15447},
	{67.96881, 17.90697},
	{68.11935, 17.28142},
	{67.91576, 16.74277},
	{67.57278, 16.46749},
	{67.51905, 16.16486},
	{67.43362, 16.09642},
	{67.2044, 16.40528},
	{67.05239, 16.3922},
	{66.48376, 15.38016},
	{66.28258, 15.48703},
	{66.15356, 15.03602},
	{66.13484, 14.51926},
	{65.80605, 14.62875},
	{65.53757, 14.50493},
	{65.30926, 14.50939},
	{64.58158, 13.65827},
	{64.46194, 14.11386},
	{64.1902, 14.15862},
	{64.02248, 13.98533},
	{64.05579, 12.92609},
	{63.97648, 12.68649},
	{63.59333, 12.14727},
	{63.47815, 12.20888},
	{63.27507, 11.98315},
	{62.99955, 12.21605},
	{62.90188, 12.07382},
	{62.74841, 12.13751},
	{62.61555, 12.0533},
	{62.27119, 12.3},
	{61.72291, 12.1394},
	{61.56326, 12.41666},
	{61.56807, 12.56911},
	{61.35761, 12.8741},
	{61.06081, 12.68148},
	{61.01498, 12.2214},
	{60.51235, 12.60674},
	{60.40884, 12.60604},
	{60.3237, 12.4989},
	{60.19358, 12.54178},
	{60.03565, 12.44385},
	{59.89008, 12.17624},
	{59.84116, 11.84034},
	{59.69782, 11.94113},
	{59.61044, 11.69755},
	{59.24532, 11.83298},
	{58.90679, 11.65288},
	{58.88939, 11.46046},
	{59.06328, 11.43346},
	{59.09221, 11.19892}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end