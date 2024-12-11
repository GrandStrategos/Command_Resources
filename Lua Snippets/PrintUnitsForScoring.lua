--Change between sides to obtain the tables for the different sides

function addToSet(set, key)
    set[key] = true
end

function removeFromSet(set, key)
    set[key] = nil
end

function setContains(set, key)
    return set[key] ~= nil
end

local side = ScenEdit_PlayerSide()
local base = {}
local s = VP_GetSide({ name = side})
for k, v in pairs(s.units) do
    local unit = ScenEdit_GetUnit({ guid = v.guid })
    if unit and unit.type ~= "Group" and not setContains(base, unit.dbid) then
        --print("{type= '"..unit.type.."', class= '"..unit.classname.."', dbid= "..unit.dbid..", points=0, descriptor='destroyed'},")
        print("['"..unit.dbid..'-'..unit.type.."'] = {name='"..unit.classname.."', dbid="..unit.dbid..",crew = "..unit.crew..",cost = 0},")
        addToSet(base,unit.dbid)
    end
end