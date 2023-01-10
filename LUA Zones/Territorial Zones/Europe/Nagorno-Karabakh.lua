local sidename = "Armenia"

local data = {
	{40.41957, 46.81643},
	{40.36774, 46.83473},
	{40.37536, 46.89571},
	{40.28542, 46.91857},
	{40.23968, 47.00852},
	{40.23663, 46.93839},
	{40.2031, 46.93992},
	{40.17566, 46.89723},
	{40.18328, 46.81034},
	{40.14669, 46.82406},
	{40.1101, 46.76613},
	{40.0598, 46.78899},
	{40.02016, 46.62588},
	{40.01864, 46.81948},
	{39.95308, 46.81643},
	{39.93936, 46.93534},
	{39.85704, 46.8515},
	{39.83418, 46.86369},
	{39.90735, 46.9704},
	{39.86619, 47.14572},
	{39.9043, 47.1884},
	{39.80674, 47.34237},
	{39.74118, 47.32408},
	{39.71527, 47.14724},
	{39.64362, 47.03443},
	{39.61313, 47.10913},
	{39.60551, 47.02224},
	{39.55063, 47.08931},
	{39.46983, 47.02071},
	{39.42105, 47.0573},
	{39.3997, 47.04053},
	{39.3997, 46.98108},
	{39.50642, 46.84692},
	{39.48355, 46.82253},
	{39.46526, 46.86522},
	{39.4058, 46.81796},
	{39.42867, 46.77375},
	{39.52319, 46.76308},
	{39.50337, 46.70972},
	{39.5552, 46.66246},
	{39.60551, 46.71887},
	{39.63295, 46.69143},
	{39.58874, 46.57557},
	{39.80369, 46.571},
	{40.04608, 46.34538},
	{40.1101, 46.36214},
	{40.17108, 46.27982},
	{40.28847, 46.34538},
	{40.28389, 46.46886},
	{40.35249, 46.57709},
	{40.36164, 46.66704},
	{40.4028, 46.70362}
}

for i, latlon in ipairs(data) do
    ScenEdit_AddReferencePoint({
        side = sidename,
        lat = latlon[1],
        lon = latlon[2]
    })
end