## GPS Jamming in Command Modern Operations

Today, I want to present a brief tutorial on implementing GPS Jamming for weapons in Command Modern Operations. GPS jamming has been a recurrent tactic during the war in Ukraine and is certainly a factor to consider regarding the effectiveness of GPS-guided munitions. To illustrate this, I will create an example using a simple data structure from which complex models can be developed according to individual needs.

The first step is to identify which guided munitions in your scenario will be affected by GPS jamming. We will create a data structure in Lua using a table. The table keys will be the DBIDs of the weapons vulnerable to jamming, streamlining the process of verifying whether a weapon is compromised by our jammer. Each key will map to a nested table containing a single attribute, jamming_resistance. A resistance value of 0 means the weapon can't resist jamming at all, while a value of 100 indicates the weapon is fully protected against jamming. This simple system helps us understand how vulnerable each weapon is to jamming. 

_(Please note that you can include any attributes relevant to your weapon's GPS guidance in the attribute table. These attributes can be tailored to the specific logic you wish to implement, allowing for customization based on the desired complexity of your scenario.)_


```
GPS_GuidedMunitions = {
  [3866] = {jamming_resistance = 90},
  [DBID] = {jamming_resistance = 95},
  ...
}
```
Once we have the data structure let's do how to simulate the GPS Logic.

We want an event to be triggered to simulate the probability of interference occurring if one of our GPS-guided munitions enters the interference zone of a Jammer.

Let's start with a blank scenario in Command, adding the BLUE and RED sides.
```
ScenEdit_AddSide({side='RED'})
ScenEdit_AddSide({side='BLUE'})
ScenEdit_SetSidePosture("RED","BLUE","H")
ScenEdit_SetSidePosture("BLUE","RED","H")
```
We create the Strike mission in order to be able to assign the target to it.
```
ScenEdit_AddMission('RED','Strike','strike',{type='land'})
```
On the BLUE side, create a Target and a Jammer. The jammer can be any unit since the jamming capability will be determined by our Lua code. Also we add our Asset as target for the Red Strike Mission
```
local target = ScenEdit_AddUnit({type='Facility', side='BLUE', name='Asset', dbid=3583, latitude=42.0907773753571, longitude=9.08600454545776})

local jammer = ScenEdit_AddUnit({type='Facility', side='BLUE', name='Jammer', dbid=764, latitude=42.2338674032081, longitude=8.96962051461558})

--Add the Target to the strike mission target list
ScenEdit_AssignUnitAsTarget(target.guid, 'Strike')
```
### Jamming Area
After creating the Jammer, we will create a circular area around it, keeping in mind the desired range of our jammer. Since the jammer is relatively close to the unit we want to protect, we will assign it an effective radius of 15nmi.

To achieve this, we create a circle around the Jammer with a radius of 15nmi using an auxiliary function to create areas. (All Auxiliary functions will be provided in the complete script called GPSJamming.lua in the same folder as this readme.md file)
```
local jamming_area = NewArea({latitude=jammer.latitude, longitude=jammer.longitude}, {side='BLUE', distance='15', shape='circle'})
```

### Jamming Event
Once we have our area, we will create the GPS Jamming event, using a "Unit enters area" trigger. 

Another option would be use the "UnitRemainsInArea" trigger and assign a time for the trigger to activate. The "UnitRemainsInArea" trigger allows for more complex logic; for example, with a short stay time like 1 minute and making the event repeatable, we can accumulate the number of times the trigger is launched. Thus, for weapons under the jammer's influence for a prolonged period, the probability of eventually being jammed will increase.

To create the Event, I will use an auxiliary function I have for creating such events. Additionally, a FilterType can be assigned so the event is only activated when the unit is a RED side weapon. For now, I have named the Lua action to be executed GPSJamming(), which we will develop next.
```
local FilterType = {TargetSide = VP_GetSide({side='RED'}).guid, TargetType = 6}
UnitEntersAreaEvent('GPS JAMMING',FilterType,jamming_area,'GPS_Jamming()','add',false,true,true)
```
### Jamming Logic
Once the event is set up, we will define the GPSJamming() function and its structure.

The function should evaluate whether the weapon that has entered the area is among those I have decided can be jammed. This is as simple as checking if the DBID of the unit that has entered the area exists in the table.
```
local weapon = UnitX() -- Unit that trigger the events
local weaponU = SE_GetUnit({guid=weapon.guid}) --Unit Wrapper of the Unit

if weaponU and GPS_GuidedWeapons[weaponU.dbid] then -- If the element exists in our table.
  if math.random()*100 > GPS_GuidedWeapons[weaponU.dbid].jamming_resistance then
    -- Code to jam the weapon
  end
end
```

Now is maybe the most complicate part, we want that if our Guided Munition is Jammed, the GPS coordinates of the weapon changes a bit. Let's first examines how can we know which is the target of the weapon.

In the variable weaponU that's the [Unit Wrapper](https://commandlua.github.io/assets/Wrappers.html#wrapper_Unit) of the weapon, we have the attribute .target. If we print this attribute it shows like this:

```
print(weaponU.target)

  contact {
  guid = 'WT2BOY-0HN1QK5NH8DFQ', 
  name = 'Asset', 
  type = 'Fixed Facility', 
  }
```
So basically weaponU.target returns a [Contact Wrapper](https://commandlua.github.io/assets/Wrappers.html#wrapper_Contact). So we can access the latitude and longitude info of the contact.
```
if weaponU.target then
  local lat = weaponU.target.latitude
  local lon = weaponU.target.longitude
```

Also we can access the data of the terminal point of the weapon using the course attribute.
```
if weaponU.course then
  local last_waypoint = weaponU.course[#weaponU.course] -- Acces to the last waypoint
  local lat = last_waypoint.latitude
  local lon = last_waypoint.longitude
end
```

Now what we have to do is change the latitude and longitude of this terminal point. We can customize this change as we want, for example depending on the strength of the jammer we can make this variation higher or lower, also we can again use the jamming_resistance attribute to calculate the variation of the impact point.

```
lat = lat + math.random(-10,10)/10^4
lon = lon + math.random(-10,10)/10^4
```

And at the end, we assign the new course to the weapon and assign the "BOL" target.
```
weaponU.course = { {latitude=lat, longitude=lon, TypeOf='TerminalPoint'} }
weaponU.target ={ latitude=lat, longitude=lon, GUID='BOL' }
```

So this is how GPS_Jamming Function looks like. In this function I've added a check for weapons with a plotted course, to only change the last waypoint.
```
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
        lat = lat + math.random(-10,10)/10^4
        lon = lon + math.random(-10,10)/10^4

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
```