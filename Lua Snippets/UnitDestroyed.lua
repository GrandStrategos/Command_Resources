--[[This is a standard script for the destroyed unit event. 

It picks up the unit in the unit variable, checks that it is not a weapon and checks with the data tables on each side. The data tables can be created with the "PrintUnitsForScore.lua" script. You can modify the scores to your liking.

]]--
--It is recommended that the ChangeScore function be located in your LuaInit script.
function ChangeScore(side,amt,reason)
  local newScore = ScenEdit_GetScore(side) + amt
  ScenEdit_SetScore(side,newScore,reason)
  print (side..' score changed to '..newScore)
  return newScore
end
--SCRIPT START
local unit =  ScenEdit_UnitX()
if unit.type ~= 'Weapon' then
  local red_units= {
    {type= 'Ship,', class= 'CVN 75 Harry S Truman [Nimitz Class]', dbid= 3556, points=-5000, descriptor='sinked'},
    {type= 'Aircraft,', class= 'MQ-8B Fire Scout UAV', dbid= 3455, points=-120, descriptor='destroyed'},
  }

  local blue_units ={
    {type= 'Aircraft,', class= 'MQ-8C Fire-X UCAV [Bell 407 Mod]', dbid= 4031, points=-120, descriptor='destroyed'},
    {type= 'Aircraft,', class= 'RQ-4D Phoenix UAV', dbid= 4234, points=-350, descriptor='destroyed'}
  }

  local matchData = {}
  local targetList
  local side = unit.side
  if side == "Blue" then  
    targetList = blue_units 
  else 
    targetList = red_units end
	for k,v in ipairs (targetList) do
		if v.dbid == unit.dbid then
			matchData = v
		end
	end
	if matchData == {} then --If there isn't a match, the unit has not in the side_table
		
		print("The unit: ".. unit.classname .. " has no added to the list table")
		
	else
		ChangeScore(side, matchData.points, unit.name.." was destroyed")
	end
end