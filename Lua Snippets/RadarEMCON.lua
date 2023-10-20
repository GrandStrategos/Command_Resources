--[[
  This is an example of use the https://github.com/GrandStrategos/Command_Resources/blob/main/Lua%20Snippets/TimeEvent.lua function to turn on/off radars
]]

function TimeEvent(name, trig_time, luascript, mode, Repeatable)
  local retval, retval1, retval2, event
  
  if mode == 'add' then -- ADD
    retval, event = pcall(ScenEdit_SetTrigger, { mode = 'add', type = 'Time', name = name .. '-trig', time = trig_time })
    if not retval then
      print("[Error at " .. debug.getinfo(1).currentline .. "] - AddTimeEvent: Error adding the trigger. " .. event)
      return false
    end
    retval, event = pcall(ScenEdit_SetAction,
    { mode = 'add', type = 'LuaScript', name = name .. '-action', ScriptText = luascript })
    if not retval then
      print("[Error at " .. debug.getinfo(1).currentline .. "] - AddTimeEvent: Error adding the action. " .. event)
      return false
    end
    retval, event = pcall(ScenEdit_SetEvent, name, { mode = 'add', isShown = false })
    retval1 = pcall(ScenEdit_SetEventTrigger, name, { mode = 'add', name = name .. '-trig' })
    retval2 = pcall(ScenEdit_SetEventAction, name, { mode = 'add', name = name .. '-action' })
    if retval and retval1 and retval2 then
      return true
    else
      print("[Error at " .. debug.getinfo(1).currentline .. "] - TimeEvent failed when creating the event: " .. event)
    end
  elseif mode == 'remove' then --REMOVE
    retval = pcall(ScenEdit_SetEvent, name, { mode = 'remove' })
    retval1 = pcall(ScenEdit_SetTrigger, { description = name .. '-trig', mode = 'remove' })
    retval2 = pcall(ScenEdit_SetAction, { description = name .. '-action', mode = 'remove', })
    if retval and retval1 and retval2 then return false else print("[Error at " ..
      debug.getinfo(1).currentline .. "] - TimeEvent failed when removing the event: " .. name) end
  elseif mode == 'update' then --UPDATE
    if trig_time ~= nil then
      retval = pcall(ScenEdit_SetTrigger, { mode = 'update', type = 'Time', name = name .. '-trig', time = trig_time })
      retval1, event = pcall(ScenEdit_SetEvent, name, { mode = 'update', isActive = true })
      if retval and retval1 then return true else print("[Error at " ..
        debug.getinfo(1).currentline .. "] - TimeEvent failed when updating the event: " .. event) end
    end
    if luascript ~= nil then
      retval = pcall(ScenEdit_SetAction, { mode = 'update', type = 'LuaScript', name = name .. '-action',
        ScriptText = luascript })
      if retval then return false else print("[Error at " ..
        debug.getinfo(1).currentline .. "] - TimeEvent failed when updating the event action: " .. event) end
    end
  elseif mode == 'remove' then
    ScenEdit_SetEvent(name, {mode='remove'})
    ScenEdit_SetAction({name=name..'-action', mode='remove'})
    ScenEdit_SetTrigger({name=name..'-trig', mode='remove'})
    return true
  end
  print("ERROR TimeEvent. No mode recognized. Use add|remove|update")
  return false
end

ScenEdit_AddSide({side="BLUE"})

ScenEdit_SetTime({DateFormat= "DDMMYYYY", Date= "12.3.2021", Time= "05.00.00"})

for i = 1,4 do
  local currentTime = ScenEdit_CurrentTime()
  local timeON=os.date("%d/%m/%Y %H:%M", currentTime + i*60*60)
  local timeOFF=os.date("%d/%m/%Y %H:%M", currentTime + (i+4)*60*60)
  local position = {latitude=50.9162017358236, longitude=12.1724849902148}
  local unit = ScenEdit_AddUnit({type='Facility',side='BLUE',name='Radar #'..i, dbid=293,latitude=position.latitude+i/100, longitude=position.longitude+i*1.1})
  if unit~= nil then
    TimeEvent('RadarON#'..i,timeON,"ScenEdit_SetEMCON('unit','"..unit.guid.."','Inherit;Radar=Active')","add")
    TimeEvent('RadarOFF#'..i,timeOFF ,"ScenEdit_SetEMCON('unit','"..unit.guid.."','Inherit;Radar=Passive')","add")
  end
end