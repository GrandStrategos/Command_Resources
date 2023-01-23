-- fun script to BOL target an area 
--THIS WILL WORK ON GROUND UNITS WILL A SINGLE MOUNT
-- You must have a reference point named G_E on side 'GR'

local size = ScenEdit_InputBox('Enter the area size')
local units = ScenEdit_SelectedUnits( )
local ip = ScenEdit_GetReferencePoint( { side="GR", name="G_E"} )
local wpn_salvos = '1'
local rn=0
local latlon=0
local wpn_options = {}
local mnt = 0
math.randomseed(os.time())

if units.units ~= nil then
    local un = units.units[1]
        local u =ScenEdit_GetUnit( { guid= un.guid} )
        for _,mount in pairs(u.mounts) do
            mnt = mount.mount_dbid
            for _,wpn in pairs(mount) do
                if type(wpn) == 'table' then
                for _,t in pairs(wpn) do
                    table.insert(wpn_options,[[

                ]]..string.sub(t.wpn_name, 0, 19)..' - '..t.wpn_dbid..[[

                ]])
                end
                end
            end
        
        end
    
local wpn_id = tonumber(ScenEdit_InputBox('Please type the weapon code:'..table.concat(wpn_options)))
local un = units.units[1]
local u =ScenEdit_GetUnit( { guid= un.guid} )

for _,mount in pairs(u.mounts) do
    for _,wpn in pairs(mount) do
        if type(wpn) == 'table' then
        for _,t in pairs(wpn) do
            print(t)
            if t.wpn_dbid == wpn_id then
                 wpn_salvos = ScenEdit_InputBox('Please type the number os salvos: 1-'..t.wpn_maxcap)
            end
        end
        end
    end

end
for d,unit in pairs(units.units) do

    for i=1,tonumber(wpn_salvos),1 do
    
    rn = math.random(0,size)/1000
    
    latlon = World_GetPointFromBearing( { latitude = ip.latitude, longitude = ip.longitude,
    distance = rn, bearing = math.random(0,359) } )
    
    
    ScenEdit_AttackContact( unit.guid, 'BOL', { mode='1', mount=mnt, weapon=wpn_id, qty=1,latitude=latlon.latitude,longitude=latlon.longitude } )


    end
    
end
else
    ScenEdit_MsgBox('Please run this action with the units selected',0)
end