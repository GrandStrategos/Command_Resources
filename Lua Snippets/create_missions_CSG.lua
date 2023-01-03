local units = VP_GetSide({name='GR'}).units


for index,unit in pairs(units) do
    local un = ScenEdit_GetUnit({guid=unit.guid})

    if un.guid == '1MXV18-0HMN9KJE0JNSF'  then --change this guid with your carrier's guid
       local mothership = un
local gowinds = VP_GetSide({name='GR'}).units
print (mothership)

local distances = {12,25,25,45,45,60}
local missions ={'sea','asw','aaw'}
local s_missions ={'MAP','AEW'}
local s_distances = {40,50}



for index,distance in pairs(distances) do

    for a=0,360,45 do

        ScenEdit_AddReferencePoint( {side='GR', RelativeTo=mothership.name, bearing=a ,distance=distance ,name="MP"..a..distance..mothership.name })  

    end
end
local mindex = 1
for index,mission in pairs(missions) do

    for a=0,315,45 do
        local b =a+45
        
       local addedmission = ScenEdit_AddMission('GR',mothership.name..'_'..mission..'_'..a,'patrol',{zone={"MP"..a..distances[mindex]..mothership.name,"MP"..a..distances[mindex+1]..mothership.name,"MP"..b..distances[mindex+1]..mothership.name,"MP"..b..distances[mindex]..mothership.name},type=mission})
       ScenEdit_SetMission(addedmission.side,addedmission.name,{OneThirdRule=false,CheckOPA=false,CheckWWR=false})    
    end
    mindex=mindex+2
end

for index2,distance2 in pairs(s_distances) do

    for a2=45,315,90 do

        ScenEdit_AddReferencePoint( {side='GR', RelativeTo=mothership.name, bearing=a2 ,distance=distance2 ,name="MP"..a2..distance2..mothership.name })  

    end
end

for ab=45,315,90 do
local bc=ab+90
if bc>360 then
    bc=bc-360
end    
    for index3,s_mission in pairs(s_missions) do
        ScenEdit_AddMission('GR',mothership.name..'_'..s_mission..'_'..ab,'support',{zone={"MP"..ab..s_distances[index3]..mothership.name,"MP"..bc..s_distances[index3]..mothership.name}})
    end
end

for a3=0,270,90 do

    ScenEdit_AddReferencePoint( {side='GR', RelativeTo=mothership.name, bearing=a3 ,distance=60 ,name="MP"..a3..'60'..mothership.name })  
    ScenEdit_AddMission('GR',mothership.name..'_Picket_'..a3,'support',{zone={"MP"..a3..'60'..mothership.name}})
end
    end
    
end