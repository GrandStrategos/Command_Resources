-- This functions print in Lua console all the differents units in a side to create a table for a standard UnitDestroyed function.
function addToSet(set, key)
    set[key] = true
end

function removeFromSet(set, key)
    set[key] = nil
end

function setContains(set, key)
    return set[key] ~= nil
end

local side = "US" --CHANGE THIS TO THE NAME OF THE SIDE YOU WANT 
local base = {}
local s = VP_GetSide({ name = side})
for k, v in pairs(s.units) do
    local unit = ScenEdit_GetUnit({ guid = v.guid })
    if unit.type ~= "Group" and not setContains(base, unit.dbid) then
        print("{type= '"..unit.type.."', class= '"..unit.classname.."',name='"..unit.name.. "',dbid= "..unit.dbid..", points=0, descriptor='destroyed'},")
        addToSet(base,unit.dbid)
    end
end
