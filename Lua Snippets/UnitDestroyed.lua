--[[This is a standard script for the destroyed unit event. 

It picks up the unit in the unit variable, checks that it is not a weapon and checks with the data tables on each side. The data tables can be created with the "PrintUnitsForScore.lua" script. You can modify the scores to your liking.

Please change the side names to adjust to your scenario.

]]--
--It is recommended that the ChangeScore function be in your LuaInit script.
function ChangeScore(side,amt,reason)
  local newScore = ScenEdit_GetScore(side) + amt
  ScenEdit_SetScore(side,newScore,reason)
  print (side..' score changed to '..newScore)
  return newScore
end
--SCRIPT START
local red_units= {
	['2415-Facility'] = {name='Single-Unit Airfield (3x 3201-4000m Runways)', dbid=2415,crew = 0,cost = 0},
['1678-Facility'] = {name='SSM Bn (CH-SSC-9 [CJ-10])', dbid=1678,crew = 1,cost = 0},
['4225-Aircraft'] = {name='J-16 Flying Shark [Su-30MKK Copy]', dbid=4225,crew = 2,cost = 0},
['676-Submarine'] = {name='Type 095 Sui', dbid=676,crew = 130,cost = 0},
['355-Facility'] = {name='SSM Bn (CSS-2 Mod 1 [DF-3A])', dbid=355,crew = 1,cost = 0},
['4969-Aircraft'] = {name='H-6N Badger', dbid=4969,crew = 3,cost = 0},
['3224-Facility'] = {name='SSM Bn (CH-SSC-13 Splinter [CJ-100])', dbid=3224,crew = 1,cost = 0},
['5014-Aircraft'] = {name='J-20A Fagin', dbid=5014,crew = 1,cost = 0},
['4975-Aircraft'] = {name='YY-20A Kunpeng', dbid=4975,crew = 3,cost = 0},
['4900-Aircraft'] = {name='J-11BG', dbid=4900,crew = 1,cost = 0},
['7135-Aircraft'] = {name='H-6K Badger', dbid=7135,crew = 3,cost = 0},
['4876-Ship'] = {name='Type 076', dbid=4876,crew = 1100,cost = 0},
['4962-Aircraft'] = {name='GJ-11 Sharp Sword UCAV', dbid=4962,crew = 0,cost = 0},
['4719-Ship'] = {name='Type 052DL Luyang III Mod [125 Cangzhou]', dbid=4719,crew = 280,cost = 0},
['3617-Ship'] = {name='Type 054 Jiangkai I [525 Manshan]', dbid=3617,crew = 165,cost = 0},
['2006-Ship'] = {name='Type 071 Yuzhao [998 Kunlun Shan]', dbid=2006,crew = 120,cost = 0},
['3883-Ship'] = {name='Type 055 Renhai [101 Nanchang]', dbid=3883,crew = 320,cost = 0},
['2714-Ship'] = {name='Type 054A Jiangkai II [599 Anyang]', dbid=2714,crew = 165,cost = 0},
['4685-Ship'] = {name='Type 728 Pomornik [Pr.1232.2 Zubr]', dbid=4685,crew = 27,cost = 0},
['696-Ship'] = {name='Type 052C Luyang II [170 Lanzhou]', dbid=696,crew = 280,cost = 0},
['776-Submarine'] = {name='Type 093 Shang I', dbid=776,crew = 100,cost = 0},
['6642-Aircraft'] = {name='WZ-8', dbid=6642,crew = 0,cost = 0},
['7171-Aircraft'] = {name='WZ-7 Soaring Dragon UAV', dbid=7171,crew = 0,cost = 0},
}
local blue_units = {
	['427-Facility'] = {name='Building (Airport Terminal)', dbid=427,crew = 0,cost = 0},
	['217-Facility'] = {name='A/C Tarmac Space (2x Large Aircraft)', dbid=217,crew = 0,cost = 0},
	['353-Facility'] = {name='Runway Access Point (Very Large Aircraft)', dbid=353,crew = 0,cost = 0},
	['1496-Facility'] = {name='Ammo Pad', dbid=1496,crew = 0,cost = 0},
	['344-Facility'] = {name='A/C Tarmac Space (2x Very Large Aircraft)', dbid=344,crew = 0,cost = 0},
	['1293-Facility'] = {name='AvGas (1500k Liter Underground Tank)', dbid=1293,crew = 0,cost = 0},
	['1426-Facility'] = {name='Ammo Shelter', dbid=1426,crew = 0,cost = 0},
	['1386-Facility'] = {name='A/C Weather Shelter (1x Small Aircraft)', dbid=1386,crew = 0,cost = 0},
	['1423-Facility'] = {name='Runway-Grade Taxiway (2600m)', dbid=1423,crew = 0,cost = 0},
	['41-Facility'] = {name='A/C Hangar (2x Large Aircraft)', dbid=41,crew = 0,cost = 0},
	['35-Facility'] = {name='Runway (3200m)', dbid=35,crew = 0,cost = 0},
	['3-Facility'] = {name='Building (Control Tower)', dbid=3,crew = 0,cost = 0},
	['68-Facility'] = {name='A/C Hangar (2x Medium Aircraft)', dbid=68,crew = 0,cost = 0},
	['86-Facility'] = {name='A/C Hangar (2x Small Aircraft)', dbid=86,crew = 0,cost = 0},
	['55-Facility'] = {name='Runway (2600m)', dbid=55,crew = 0,cost = 0},
	['26-Facility'] = {name='A/C Hangar (4x Small Aircraft)', dbid=26,crew = 0,cost = 0},
	['1508-Facility'] = {name='AvGas Tank Farm (40 x 40k Liter Tank)', dbid=1508,crew = 0,cost = 0},
	['1391-Facility'] = {name='A/C Open Parking Spot (1x Very Large Aircraft)', dbid=1391,crew = 0,cost = 0},
	['322-Facility'] = {name='Ammo Bunker (Surface)', dbid=322,crew = 0,cost = 0},
	['17-Facility'] = {name='Building (Pump House)', dbid=17,crew = 0,cost = 0},
	['75-Facility'] = {name='Diesel (150k Liter Tank)', dbid=75,crew = 0,cost = 0},
	['1422-Facility'] = {name='Runway-Grade Taxiway (3200m)', dbid=1422,crew = 0,cost = 0},
	['1393-Facility'] = {name='AvGas (200k Liter Underground Tank)', dbid=1393,crew = 0,cost = 0},
	['944-Facility'] = {name='AvGas (150k Liter Underground Tank)', dbid=944,crew = 0,cost = 0},
	['1509-Facility'] = {name='AvGas Tank Farm (10 x 75k Liter Tank)', dbid=1509,crew = 0,cost = 0},
	['1421-Facility'] = {name='Runway-Grade Taxiway (4000m)', dbid=1421,crew = 0,cost = 0},
	['9-Facility'] = {name='A/C Hangar (4x Large Aircraft)', dbid=9,crew = 0,cost = 0},
	['757-Facility'] = {name='Runway (4000m)', dbid=757,crew = 0,cost = 0},
	['2289-Facility'] = {name='Building (Large Government Building)', dbid=2289,crew = 0,cost = 0},
	['2291-Facility'] = {name='Building (Very Large Leadership Compound)', dbid=2291,crew = 0,cost = 0},
	['105-Facility'] = {name='Building (Uplink Relay Station)', dbid=105,crew = 0,cost = 0},
	['3896-Facility'] = {name='Structure (Power Station - Coal)', dbid=3896,crew = 0,cost = 0},
	['598-Facility'] = {name='Structure (Power Station - Gas)', dbid=598,crew = 0,cost = 0},
}
local unit =  ScenEdit_UnitX()
if unit and unit.type ~= 'Weapon' then

	local matchData = {}
	local targetList
	local side = unit.side
	if side == "Blue" then  
		targetList = blue_units
	else 
		targetList = red_units
	end
	matchData = targetList[unit.dbid..'-'..unit.type]
	if matchData == {} then --If there isn't a match, the unit has not in the side_table
		
		print("The unit: ".. unit.classname .. " has no added to the list table")
		
	else
		ChangeScore(side, matchData.points, unit.name.." was destroyed")
	end
end
