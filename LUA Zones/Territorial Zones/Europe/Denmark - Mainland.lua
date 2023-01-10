local sidename = "Denmark"

local data = {
	{55.08622, 8.04127889840253},
	{55.28783, 8.05983678653859},
	{55.5137, 7.73016327131796},
	{55.60003, 7.72769955069384},
	{55.77753, 7.82145548917952},
	{56.04198, 7.74045539160306},
	{56.54077, 7.75464377788813},
	{56.93177, 7.93121860825232},
	{57.27341, 8.34949540349026},
	{57.3549, 8.91576917620665},
	{57.34962, 9.24115890935632},
	{57.75924, 9.73192877769105},
	{57.79001, 10.08006},
	{57.93659, 10.45262},
	{57.94423, 10.72125},
	{57.81891, 11.0019},
	{57.56041, 11.0051078341592},
	{57.50641, 11.34538},
	{57.24954, 11.55873},
	{57.15441, 11.47203},
	{57.02589, 11.19863},
	{56.99823, 10.98635},
	{57.03093, 10.7880553935416},
	{56.85279, 10.6377189241891},
	{56.73487, 10.70862},
	{56.70673, 11.00617},
	{56.58616, 11.22566},
	{56.72535, 11.14373},
	{56.85907, 11.25298},
	{56.93421, 11.58591},
	{56.91322, 11.82626},
	{56.68374, 12.00879},
	{56.64349, 11.9808},
	{56.53316, 11.80466},
	{56.4912, 11.62929},
	{56.49927, 11.42245},
	{56.56444, 11.2546326948431},
	{56.44973, 11.31976},
	{56.31058, 11.26881},
	{56.40395, 11.64055},
	{56.35863, 12.10377},
	{56.30392, 12.08775},
	{56.21403, 12.37062},
	{56.05967, 12.64537},
	{55.92464, 12.6483116082942},
	{55.84218, 12.7063326552279},
	{55.84218, 12.70633},
	{55.67633, 12.93117},
	{55.43111, 12.61361},
	{55.25, 12.67722},
	{55.149, 12.8402},
	{54.91414, 12.89165},
	{54.79377, 12.76524},
	{54.68996, 12.43671},
	{54.41108, 12.11208},
	{54.36681, 11.94044},
	{54.37899, 11.65438},
	{54.56486, 11.3322},
	{54.6397, 11.06993},
	{54.62241, 10.87967},
	{54.55485, 10.82207},
	{54.53062, 10.6966},
	{54.6436, 10.29204},
	{54.75919, 10.1859176684657},
	{54.82046, 9.94227656561116},
	{54.84251, 9.80986},
	{54.8207, 9.7141},
	{54.8565, 9.6176},
	{54.8799, 9.627},
	{54.88921, 9.58961},
	{54.8215, 9.43785},
	{54.83161, 9.42092},
	{54.84368, 9.40691},
	{54.80399, 9.34854},
	{54.81099, 9.24931},
	{54.84913, 9.23997},
	{54.9122, 8.9314},
	{54.9122, 8.6403},
	{54.97209, 8.56482},
	{54.97521, 8.51424},
	{55.0554, 8.4815},
	{55.0523, 8.48},
	{55.07054, 8.38894}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end