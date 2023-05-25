--[[
This function generates random civilian traffic within your Area of Operations (AO). To implement it, you should place it in your LuaInit script and call it either from the GameSetup Script or through Time Regular Events.

To ensure the proper functioning of the functions, it's important to define an area using reference points, which will remove all civilian units located outside this designated area.

This function is particularly suitable for scenarios with a small to medium AO, where it performs effectively.

]]

--Auxiliary Functions
function randomTxt(numLetters)
  local totTxt = ""
  for i = 1,numLetters do
      totTxt = totTxt..string.char(math.random(65,90))
  end
  return totTxt
end
function RandomPosition(latitudeMin,latitudeMax,longitudeMin,longitudeMax)
	local pos_lat = RandomFloat(latitudeMin,latitudeMax,13) --latitude; 
	local pos_lon =RandomFloat(longitudeMin,longitudeMax,13) 
	return {latitude=pos_lat,longitude=pos_lon}
end
function RandomFloat(min,max,escala)
	if min ~= nil and max ~= nil then
		return math.random(min*(10^escala),max*(10^escala))/(10^escala)
	end
		return 0
end
function GetLimitsArea(lado,rpTable)

  local rp=ScenEdit_GetReferencePoints({side=lado,area=rpTable})
  local maxLat=0
  local maxLon=0
  local minLat=0
  local minLon=0
  for i=1,#rpTable do; 
      local point = ScenEdit_GetReferencePoint({side=lado,name=rpTable[i]})
      if i == 1 then
          maxLat=point.latitude
          minLat=point.latitude
          maxLon=point.longitude
          minLon=point.longitude
      else
          if maxLat < point.latitude then
              maxLat=point.latitude
          
          elseif minLat > point.latitude then
              minLat=point.latitude
          end
          if maxLon < point.longitude then
              maxLon=point.longitude 
          elseif minLon > point.longitude then
              minLon=point.longitude
          end
      end
  
  end
  return minLat,maxLat,minLon,maxLon
end

-- This table contains different types of civilian aircrafts
CIV_AIRCRAFT ={
	{dbid=2537, ferryRange=8000, loadoutid=9908},
	{dbid=2531, ferryRange=6700, loadoutid=9912}, --Boeing 747-300 -- Commercial (Commercial), 1984, 56x, Passenger
	{dbid=2533, ferryRange=7360, loadoutid=9919}, --Boeing 747-400F -- Commercial (Commercial), 1994, 126x, Freighter
	{dbid=2534, ferryRange=7670, loadoutid=9917}, --Boeing 747-400ER -- Commercial (Commercial), 2003, 6x, ER Passenger
	{dbid=2536, ferryRange=7750, loadoutid=9918},
	{dbid=3980, ferryRange=9800, loadoutid=19927}, --Boeing 777-200LR -- Commercial (Commercial), 1998
	{dbid=3981, ferryRange=8200, loadoutid=19933}, --Boeing 777-300ER -- Commercial (Commercial), 1998
	{dbid=2428, ferryRange=7250, loadoutid=9926}, --Airbus A.330-200 -- Commercial (Commercial), 1999
	{dbid=2429, ferryRange=5850, loadoutid=9928}, --Airbus A.330-300 -- Commercial (Commercial), 1995
}



-- This function stablish a route that cross the AO area. It works getting the bearing of the unit and assigning a contrary course. You could modify the dist variable to adjust to the length of your AO

function SetCourse(unit,bearing)
  local dist = 2000
  local pos
  local course
  if bearing == 0 then
      pos = World_GetPointFromBearing({latitude=unit.latitude, longitude=unit.longitude, bearing=math.random(170,190), distance=dist})
  elseif bearing == 45 then
      pos = World_GetPointFromBearing({latitude=unit.latitude, longitude=unit.longitude, bearing=math.random(215,235), distance=dist})
  elseif bearing == 90 then
      pos = World_GetPointFromBearing({latitude=unit.latitude, longitude=unit.longitude, bearing=math.random(240,280), distance=dist})
  elseif bearing == 135 then
      pos = World_GetPointFromBearing({latitude=unit.latitude, longitude=unit.longitude, bearing=math.random(305,325), distance=dist})
  elseif bearing == 180 then
      pos = World_GetPointFromBearing({latitude=unit.latitude, longitude=unit.longitude, bearing=math.random(350,370), distance=dist})
  elseif bearing == 225 then
      pos = World_GetPointFromBearing({latitude=unit.latitude, longitude=unit.longitude, bearing=math.random(40,50), distance=dist})
  elseif bearing == 270 then
      pos = World_GetPointFromBearing({latitude=unit.latitude, longitude=unit.longitude, bearing=math.random(80,100), distance=dist})
  elseif bearing == 315 then
      pos = World_GetPointFromBearing({latitude=unit.latitude, longitude=unit.longitude, bearing=math.random(130,140), distance=dist})
  end
  if pos ~= nil then
      course ={
          [1]={ latitude=pos.latitude, longitude=pos.longitude, TypeOf = 'ManualPlottedCourseWaypoint' }
      }
  else
      print("NULL COURSE: "..unit.name.."-"..bearing)
  end 
  
  ScenEdit_SetUnit({guid=unit.guid, course=course})
  
  
end

--[[ 
    This function create civilian units outside of your AO.
    Iterates a for loop that rounds the AO each 45 degrees, and 
    creates between 1 and 8 units. You can modify parameters at your will.
    
    You must call this function in a Regular Time Event with a recommended Regular Time Trigger of 30min or 1 hour.

]]
function CivilianOutAO()
  local CIVILIAN = 'Civilian' --The name of your civilian side
  local center_AO = {latitude = 0 , longitude = 0} -- This is the "center" of your AO.
  for i=0,359,45 do
      for a =1,math.random(4,8) do
          -- The location where the unit will be created. Modify the distance parameter to adjust to your AO
          local p = World_GetPointFromBearing({latitude=center_AO.latitude, longitude=center_AO.longitude, bearing=math.random(i-5,i+5), distance=math.random(200,1000)})
          -- With this you can create a random position to evict units be created in the same spot.
          local position = RandomPosition(p.latitude-0.1,p.latitude+0.1,p.longitude-0.1,p.longitude+0.1)

          local unit = ScenEdit_AddUnit({type='Aircraft', side=CIVILIAN, dbid=CIV_AIRCRAFT[math.random(1,#CIV_AIRCRAFT)].dbid, loadoutid=CIV_AIRCRAFT[math.random(1,#CIV_AIRCRAFT)].loadoutid, name='NOAO '..randomTxt(3), latitude=position.latitude, longitude=position.longitude, altitude=10000})

          SetCourse(unit,i)
      end
  end
end
-- This function create civilian units inside your AO. This is tipically called on your GameSetup function at the start of your scenario.
function CivilianInAO()
  local CIVILIAN = 'Civilian' --The name of your civilian side
  local CIV_AREA = {'RP-23','RP-24','RP-25','RP-26'} -- The name of the reference points that define where do you want to create civilian traffic. Works better with square area since the functions that gets the limits of the area returns the max/min latitude and longitude.
  
  for i=1,40 do -- You can change 40 to the numbers of units you want to create in the area, or substitute with a math.random(a,b) to create a random number of civilian units each time

    -- Gets a random position 
    local position = RandomPosition(GetLimitsArea(CIVILIAN,CIV_AREA))

    local unit = ScenEdit_AddUnit({type='Aircraft', side=CIVILIAN, dbid=CIV_AIRCRAFT[math.random(1,#CIV_AIRCRAFT)].dbid, loadoutid=CIV_AIRCRAFT[math.random(1,#CIV_AIRCRAFT)].loadoutid, name='CAR AO '..randomTxt(3), latitude=position.latitude, longitude=position.longitude, altitude=10000})
    -- Gets a point to set the unit course. Modify distance to adjust the dimensions of yout AO
    local path = World_GetPointFromBearing({latitude=unit.latitude, longitude=unit.longitude, bearing=math.random(0,360), distance=3000})
    local course = {
        [1]={ latitude=path.latitude, longitude=path.longitude, TypeOf = 'ManualPlottedCourseWaypoint' }
    }
    ScenEdit_SetUnit({guid=unit.guid, course=course})
    end
end

--This function clears all civilian units that have already crossed the AO and are out of the AO. You must call this function in a Regular Time Event with a recommended Regular Time Trigger of 30min or 1 hour.
function CleanUpIdleCivilians()
  local CIVILIAN = 'Civilian' --The name of your civilian side
  local CIV_AREA = {'RP-23','RP-24','RP-25','RP-26'}

	local unitList = VP_GetSide({side=CIVILIAN}).units
	
    for k,v in ipairs(unitList) do
      local civ = ScenEdit_GetUnit({guid=v.guid})
      if not civ:inArea(CIV_AREA) then
          local fuel = civ.fuel
          for _,f in pairs(fuel) do
              if f.current < f.max*0.85 then
                  ScenEdit_KillUnit({guid=civ.guid})
              end
          end
      end
    end
	
end