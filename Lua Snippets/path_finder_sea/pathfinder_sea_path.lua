nClock = os.clock()
--find closest node to unit


local unit= ScenEdit_GetUnit( { side='PF', unitname='test'} )
min_d=1
local start_node = {}

for n=(round(unit.latitude,5))-0.02,(round(unit.latitude,5))+0.02,0.001 do
   -- print('-'..n)
   
    for k=(round(unit.longitude,5))-0.02,(round(unit.longitude,5))+0.02, 0.001 do
       -- print(n)
       -- print(k)
      -- print('--'..k)
        if grid_list_ord[round(n,5)]  and  grid_list_ord[round(n,5)][round(k,5)]  then

            start_node = grid_list[grid_list_ord[round(n,5)][round(k,5)].key_x][grid_list_ord[round(n,5)][round(k,5)].key_y]
           -- print('success')
           goto label
        else
            
        end

    end
end
::label::

print(start_node)
local current_node = start_node
local course = {}
--make path
local j =1
while current_node.dist > 1   do



    table.insert(course,{latitude=current_node.latitude,longitude=current_node.longitude})
    current_node = grid_list[current_node.nn_x][current_node.nn_y]

    

j=j+1
end
ScenEdit_SetUnit({side="PF", unitname="test", course = course})
print(("Elapsed time for pathfinding is: " .. os.clock()-nClock))

