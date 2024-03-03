--Script associated with the GPS Jamming tutorial in Command Modern Operations


--Auxiliary Functions
function NewArea(position,mode)
  local side = mode.side
  local shape = mode.shape
  if side == nil or shape == nil then return false end
  local name = (mode.name or "RP")
  local bear_offset = (mode.bear_offset or 0)
  local rpTable={}
  local a = 1
  --Circle
  if shape== 'circle' then
    local distance = mode.distance
    for i = 0,359, 45 do
      local location = World_GetPointFromBearing({latitude=position.latitude, longitude=position.longitude, distance=distance, bearing=i})
      local rp =ScenEdit_AddReferencePoint({side = side, latitude=location.latitude, longitude=location.longitude})
      a=a+1
      table.insert(rpTable,rp.name)
    end
  elseif shape == 'square' then
    local distance = mode.distance
    for i = 0,3 do
      local b = 45 + (90 * i) + bear_offset
      local location = World_GetPointFromBearing({latitude=position.latitude, longitude=position.longitude, distance=distance, bearing=b})
      local rp =ScenEdit_AddReferencePoint({side = side, latitude=location.latitude, longitude=location.longitude})
    end
  end

  return (rpTable)

end
function UnitEntersAreaEvent(name, FilterType, area, script, mode, exit, isRepeatable, isActive)
  if isRepeatable == nil then isRepeatable = false end
  if isActive == nil then isActive = true end
  if exit == nil then exit = false end
  if mode == 'add' then
    local retval, result = pcall(ScenEdit_SetTrigger,{ description = name .. '_Entertrigg', mode = 'add', type = 'UnitEntersArea',TargetFilter = FilterType, Area = area, ExitArea = exit })
    if not retval then print("[ERROR]:"..result.." - trigger:"..name) return false end
    local retval, result = pcall(ScenEdit_SetAction,{ mode = 'add', type = 'LuaScript', name = name .. '-enteraction', ScriptText = script })
    if not retval then print("[ERROR]: "..result..'- trigger:'..name) return false end
    ScenEdit_SetEvent(name, { mode = 'add', IsRepeatable = isRepeatable, isActive = isActive, isShown = false })
    ScenEdit_SetEventTrigger(name, { mode = 'add', name = name .. '_Entertrigg' })
    ScenEdit_SetEventAction(name, { mode = 'add', name = name .. '-enteraction' })
  elseif mode == 'update' then
    if area ~= nil then
      ScenEdit_SetTrigger({ description = name .. '_Entertrigg', mode = 'update', type = 'UnitEntersArea',
        TargetFilter = FilterType, Area = area, ExitArea = exit })
    end
    if script ~= nil then
      ScenEdit_SetAction({ mode = 'update', type = 'LuaScript', name = name .. '-enteraction', ScriptText = script })
    end
  elseif mode == 'remove' then
    ScenEdit_SetTrigger({ description = name .. '_Entertrigg', mode = 'remove' })
    ScenEdit_SetAction({ description = name .. '-action', mode = 'remove' })
    ScenEdit_SetEvent(name, { mode = 'remove' })
  end
end
--Setup of the scenario

ScenEdit_AddSide({side='RED'})
ScenEdit_AddSide({side='BLUE'})
ScenEdit_SetSidePosture("RED","BLUE","H")
ScenEdit_SetSidePosture("BLUE","RED","H")

--Create Strike Mission for Red Side
ScenEdit_AddMission('RED','Strike','strike',{type='land'})

--Create Target and Jammer
local target = ScenEdit_AddUnit({type='Facility', side='BLUE', name='Asset', dbid=3583, latitude=42.0907773753571, longitude=9.08600454545776})

local jammer = ScenEdit_AddUnit({type='Facility', side='BLUE', name='Jammer', dbid=764, latitude=42.2338674032081, longitude=8.96962051461558})

--Add the Target to the strike mission target list
ScenEdit_AssignUnitAsTarget(target.guid, 'Strike')

-- Create the jamming area with a radius of 15nmi
local jamming_area = NewArea({latitude=jammer.latitude, longitude=jammer.longitude}, {side='BLUE', distance='15', shape='circle'})

--Create the UnitEntersArea Event with a filter for Weapon Units from RED side
local FilterType = {TargetSide = VP_GetSide({side='RED'}).guid, TargetType = 6}
UnitEntersAreaEvent('GPS JAMMING',FilterType,jamming_area,'GPS_Jamming()','add',false,true,true)


-- Create RedSide Strike
local red = ScenEdit_AddUnit({type='Air', side='RED', name='Striker', dbid=5271, loadoutid=29323, latitude=48.5710425274401, longitude=1.72828176271381, altitude=9000})
ScenEdit_AssignUnitToMission(red.guid,'Strike')


----- END SCENARIO SETUP


-- GPS GAME LOGIC

GPS_GuidedWeapons ={
  [3866] = {jamming_resistance = 90}
}


--GPS Jamming function 
function GPS_Jamming() 
  local weapon = UnitX() -- Unit that trigger the events
  local weaponU = SE_GetUnit({guid=weapon.guid}) --Unit Wrapper of the Unit

  if weaponU and GPS_GuidedWeapons[weaponU.dbid] then -- If the element exists in our table.
    if math.random()*100 > GPS_GuidedWeapons[weaponU.dbid].jamming_resistance then
      if weaponU.course then
        
        local last_waypoint = weaponU.course[#weaponU.course]
        local lat = last_waypoint.latitude
        local lon = last_waypoint.longitude
        --Amount of deviation
        lat = lat + math.random(-100,100)/10^4
        lon = lon + math.random(-100,100)/10^4
        -- We change the course of the weapon assigning the new latitude and longitude info
        if #weaponU.course == 1 then -- If the unit only has the terminal point
          weaponU.target ={ latitude=lat, longitude=lon, GUID='BOL' }
          weaponU.course ={ {latitude=lat, longitude=lon, TypeOf='TerminalPoint'} }
        else -- For weapons with a predefined course of waypoints, we maintain all the waypoints
          local newCourse = {}
          for k,v in ipairs(weaponU.course) do
            if k ~= #weaponU.course then
              newCourse[k] = v
            else
              newCourse[k] = {latitude=lat, longitude=lon, TypeOf='TerminalPoint'}
            end
          end
          weaponU.course = newCourse
          weaponU.target ={ latitude=lat, longitude=lon, GUID='BOL' }
        end
      end
    end
  end
end


