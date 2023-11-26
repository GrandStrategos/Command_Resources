--[[
This script shows how Lua is configured to create an event that is triggered when a particular unit class is 
detected and an attack is performed on this unit when it is detected.
]]

------------------- SCENARIO SETUP --------------------

ScenEdit_AddSide({side="RED"})
ScenEdit_AddSide({side="BLUE"})
ScenEdit_SetSidePosture("RED","BLUE","H")
ScenEdit_SetSidePosture("BLUE","RED","H")


--Create RED SIDE
-- local airbase = ScenEdit_AddUnit({type='Facility', side='RED', name='Red AB', dbid=2416,latitude='50.488192127276', longitude='9.40206019439332'})
local drones = ScenEdit_AddUnit({type='Facility', side='RED', name='Drones',guid='RED-UCAV-PLATFORM', dbid=3666,latitude='50.488192127276', longitude='9.40206019439332'})

local awacs = ScenEdit_AddUnit({type='Aircraft', side='RED', name='U-2S', dbid=6619,loadoutid=8583, latitude=49, longitude=23, altitude=8000})
if awacs ~= nil then
  local course ={
    { latitude=55, longitude=17, TypeOf = 'ManualPlottedCourseWaypoint' },
  }
  SE_SetUnit({guid=awacs.guid, course=course})
  ScenEdit_SetEMCON('unit',awacs.guid,'Radar=Active')
end


--Create BLUE SIDE
local location = {latitude=50, longitude=22.5}

for i= 1,8 do
  if i % 2 == 0 then
    ScenEdit_AddUnit({type='Ground Unit', dbid= 189, name='HIM#'..i, side='BLUE', latitude=location.latitude+i/2, longitude=location.longitude-i/2})
  else
    ScenEdit_AddUnit({type='Ground Unit', dbid= 204, name='GMLRS#'..i, side='BLUE', latitude=location.latitude+i/2, longitude=location.longitude-i/2})
  end
end

---------------------------------- LOGIC SETUP ---------------------------------------
--Logic for detection
local TargetFilter = {TargetSide = 'BLUE', TargetType=8,TargetSubType=4000 , SpecificUnitClass = 189}
ScenEdit_SetTrigger({name='UnitDetected-HIMARS',mode='add', type='UnitDetected',TargetFilter=TargetFilter,MCL=3, DetectorSideID=VP_GetSide({side='RED'}).guid})
ScenEdit_SetAction({name='UnitDetected-HIMARS_lua',mode='add',type='LuaScript', ScriptText='AttackContact()'})
ScenEdit_SetEvent('ContactDetected', { mode = 'add', IsRepeatable = true, isShown = false })
ScenEdit_SetEventTrigger('ContactDetected', { mode = 'add', name = 'UnitDetected-HIMARS' })
ScenEdit_SetEventAction('ContactDetected', { mode = 'add', name = 'UnitDetected-HIMARS_lua' })

--Attack Function

function AttackContact()
local contact=ScenEdit_UnitC()
if contact ~= nil then
ScenEdit_AttackContact('RED-UCAV-PLATFORM', contact.guid, {mode=0})
end
end


