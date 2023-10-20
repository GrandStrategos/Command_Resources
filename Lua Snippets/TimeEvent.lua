--[[
  A function to create/remove/modify a CMO Time Event. See 
    https://github.com/GrandStrategos/Command_Resources/blob/main/Lua%20Snippets/RadarEMCON.lua

    for an example of use
]]

---TimeEvent let you add/remove/modify a CMO Time Event in one single line. 
--- - add: Create a new event;
--- - remove: delete the event, trigger and lua action associated with the script.
--- - update: updates the event, you can pass the trig_time or luascript or both. When you update an inactive event, the event is set to active again. 
---@param name string @Name of the event
---@param trig_time osdate @Date with the format: %d/%m/%Y %H:%M:%S 
---@param luascript string @The Lua script to be executed at given time
---@param mode string @  add|remove|update
---@return boolean @True if the event is created, false if not
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


