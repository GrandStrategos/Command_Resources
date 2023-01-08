local nClock = os.clock()
local nClock_total = os.clock()
-- define area
local area_SW = ScenEdit_GetReferencePoint({side='PF',name='SW'})
local area_NE = ScenEdit_GetReferencePoint({side='PF',name='NE'})

local landtype = 'test'
local slope = 5
local goal_rp = ScenEdit_GetReferencePoint({side='PF',name='G'})
local heatmap = {}

-- define grid size in decimal degrees

local grid_s = 0.02

-- create grid

local c_lat = area_SW.latitude
local c_lon = area_SW.longitude
local cnt_lat = 1
local cnt_lon = 1
grid_list ={} 
local distance =0


while c_lat < area_NE.latitude do
    grid_list[cnt_lat] = {}
    while c_lon < area_NE.longitude do
        
        
        landtype = World_GetLocation ( { latitude = c_lat, longitude = c_lon } )
       -- local circle = World_GetCircleFromPoint( { latitude = c_lat, longitude = c_lon, numpoints = 10 ,radius=1 } )
        --local island = false
       --[[ for n,point in pairs (circle) do

            local point_type  = World_GetLocation ( { latitude = point.latitude, longitude = point.longitude } )
           -- print(point_type.cover)
            if point_type.cover then
                island=true
            end
            
        end
        ]]--
    if landtype.cover then
       obstacle = true

    else
        if landtype.altitude > -30 then
            obstacle = true
        else
            --print(island)
          
        obstacle = false
        
        end
    end
   grid_list[cnt_lat][cnt_lon]={nn_x=0,nn_y=0,key_x=cnt_lat,key_y=cnt_lon ,obstacle=obstacle,latitude=c_lat,longitude=c_lon,isgoal=false,isvisited=false,dist=0}

        
       
        c_lon=c_lon+grid_s
        cnt_lon =cnt_lon+1
        
    end
    c_lon=area_SW.longitude
    c_lat=c_lat+grid_s
    cnt_lat=cnt_lat+1
    
    cnt_lon=1
    
    
end
--print(grid_list)

local total_d =1000
local min_d =1
local c_x = 0
local c_y = 0
local max_x =0
local max_y =0
for n, item in pairs(grid_list) do
    for k , item2 in pairs(item) do
        --print(item2)
        total_d =  Tool_Range( { latitude=goal_rp.latitude, longitude=goal_rp.longitude }, { latitude=item2.latitude, longitude=item2.longitude })
            
        if total_d < min_d then
            item2.isgoal = true 
            
            min_d = total_d
        end
        if item2.obstacle == true then
            
            grid_list[item2.key_x][item2.key_y].dist=357755
           -- ScenEdit_AddReferencePoint( {side="PF", name=item2.dist, latitude=item2.latitude, longitude=item2.longitude, highlighted=false, color='red' } )

        
            else 
                if item2.isgoal == true then
                     
                    table.insert(heatmap,item2)
                    c_x=n
                    c_y=k
                 --  ScenEdit_AddReferencePoint( {side="PF", name=item2.dist, latitude=item2.latitude, longitude=item2.longitude, highlighted=false, color='pink' } )
                else
                 --   ScenEdit_AddReferencePoint( {side="PF", name=item2.dist, latitude=item2.latitude, longitude=item2.longitude, highlighted=false, color='green' } )
                end
               
            end
         max_y = k -1
    end
     max_x = n -1
end



    --print(S_N)
while #heatmap ~= 0 do
    local S_N = heatmap[1]
    for l=-1,1,1 do
        for m=-1,1,1 do
        if (S_N.key_x+l ~= S_N.key_x or S_N.key_y+m ~= S_N.key_y) and (S_N.key_x+l < max_x and S_N.key_y+m < max_y ) and (S_N.key_x+l > 1 and S_N.key_y+m >1 ) then
            if grid_list[S_N.key_x+l][S_N.key_y+m].obstacle == true then
                --print('obstacle')
                grid_list[S_N.key_x+l][S_N.key_y+m].dist=357755
                grid_list[S_N.key_x+l][S_N.key_y+m].isvisited=true
            else
                if grid_list[S_N.key_x+l][S_N.key_y+m].isvisited == true then
                    --print('case visited')

                    if grid_list[S_N.key_x+l][S_N.key_y+m].dist > S_N.dist +1 then
                        if l==0 or m ==0 then
                        grid_list[S_N.key_x+l][S_N.key_y+m].dist = S_N.dist +1
                        else
                            grid_list[S_N.key_x+l][S_N.key_y+m].dist = S_N.dist +math.sqrt(2)
                        end
                    end

                else
                    --print('case not visited')
                    if l==0 or m ==0 then
                    grid_list[S_N.key_x+l][S_N.key_y+m].dist = S_N.dist +1
                    else
                        grid_list[S_N.key_x+l][S_N.key_y+m].dist = S_N.dist +math.sqrt(2)
                    end
                    table.insert(heatmap,grid_list[S_N.key_x+l][S_N.key_y+m])
                    grid_list[S_N.key_x+l][S_N.key_y+m].isvisited = true

                end
                 

            end
        end
        end
    end
    table.remove(heatmap,1)

end



--[[
for n,item2 in pairs(grid_list) do
    for n,item in pairs(item2) do
    --print(item.dist)
    
    local color = string.format("%x",255-(item.dist))
    color = color.."0000"
       ScenEdit_AddReferencePoint( {side="PF", name=item.dist, latitude=item.latitude, longitude=item.longitude, highlighted=false, color=color } )
    

end
end 
]]--
print(("Elapsed time is: " .. os.clock()-nClock))
print("Heatmap DONE!!!")
nClock = os.clock()
local min_d_x =0 
local min_d_y =0 

local best_distance = ''
local matrix = {
    north = 0,
    south =0,
    east=0,
    west=0,
    neast=0,
    nwest=0,
    seast=0,
    swest=0
}

for k,rows in pairs(grid_list) do
    for p, cr_node in pairs (rows) do
       
    if  cr_node.key_x-1 > 1 and cr_node.key_y-1 > 1 and cr_node.key_x+1 < max_x and cr_node.key_y+1 < max_y then
       
        matrix.north = grid_list[cr_node.key_x+1][cr_node.key_y].dist 
        matrix.south = grid_list[cr_node.key_x-1][cr_node.key_y].dist 
        matrix.east =  grid_list[cr_node.key_x][cr_node.key_y+1].dist 
        matrix.west =  grid_list[cr_node.key_x][cr_node.key_y-1].dist 
        matrix.neast =grid_list[cr_node.key_x+1][cr_node.key_y+1].dist
        matrix.nwest =grid_list[cr_node.key_x+1][cr_node.key_y-1].dist
        matrix.seast = grid_list[cr_node.key_x-1][cr_node.key_y+1].dist
        matrix.swest= grid_list[cr_node.key_x-1][cr_node.key_y-1].dist
        local min_d_matrix = 350792746729678236
        for i,dir in pairs(matrix) do
           
           if dir < min_d_matrix then
            
            min_d_matrix =dir
            best_distance = i
           end
       
        end
      -- print(best_distance)
       if best_distance == 'north' then
        grid_list[cr_node.key_x][cr_node.key_y].nn_x = grid_list[cr_node.key_x+1][cr_node.key_y].key_x
        grid_list[cr_node.key_x][cr_node.key_y].nn_y = grid_list[cr_node.key_x+1][cr_node.key_y].key_y
     
       end
       if best_distance == 'south' then
        grid_list[cr_node.key_x][cr_node.key_y].nn_x = grid_list[cr_node.key_x-1][cr_node.key_y].key_x
        grid_list[cr_node.key_x][cr_node.key_y].nn_y = grid_list[cr_node.key_x-1][cr_node.key_y].key_y
                 
       end
       if best_distance == 'east' then
        grid_list[cr_node.key_x][cr_node.key_y].nn_x = grid_list[cr_node.key_x][cr_node.key_y+1].key_x
        grid_list[cr_node.key_x][cr_node.key_y].nn_y = grid_list[cr_node.key_x][cr_node.key_y+1].key_y
                 
       end
       if best_distance == 'west' then
        grid_list[cr_node.key_x][cr_node.key_y].nn_x = grid_list[cr_node.key_x][cr_node.key_y-1].key_x
        grid_list[cr_node.key_x][cr_node.key_y].nn_y = grid_list[cr_node.key_x][cr_node.key_y-1].key_y
                 
       end
       if best_distance == 'neast' then
        grid_list[cr_node.key_x][cr_node.key_y].nn_x = grid_list[cr_node.key_x+1][cr_node.key_y+1].key_x
        grid_list[cr_node.key_x][cr_node.key_y].nn_y = grid_list[cr_node.key_x+1][cr_node.key_y+1].key_y
                 
       end
       if best_distance == 'nwest' then
        grid_list[cr_node.key_x][cr_node.key_y].nn_x = grid_list[cr_node.key_x+1][cr_node.key_y-1].key_x
        grid_list[cr_node.key_x][cr_node.key_y].nn_y = grid_list[cr_node.key_x+1][cr_node.key_y-1].key_y
                 
       end
       if best_distance == 'seast' then
        grid_list[cr_node.key_x][cr_node.key_y].nn_x = grid_list[cr_node.key_x-1][cr_node.key_y+1].key_x
        grid_list[cr_node.key_x][cr_node.key_y].nn_y = grid_list[cr_node.key_x-1][cr_node.key_y+1].key_y
                 
       end
       if best_distance == 'swest' then
        grid_list[cr_node.key_x][cr_node.key_y].nn_x = grid_list[cr_node.key_x-1][cr_node.key_y-1].key_x
        grid_list[cr_node.key_x][cr_node.key_y].nn_y = grid_list[cr_node.key_x-1][cr_node.key_y-1].key_y
                 
       end

       
        
end
end
end
grid_list_ord={}
function round(number, precision)
    tostring(number)
    local result = string.sub(number,1,precision)
    result = tonumber(result)
   
    return result
    
 end
for p,rows in pairs(grid_list) do
   -- print(rows[p])
    grid_list_ord[round(rows[p].latitude,5)] ={}
    for h,node in pairs(rows) do
    grid_list_ord[round(node.latitude,5)][round(node.longitude,5)] = node
   -- print(grid_list_ord[round(node.latitude,5)][round(node.longitude,5)].latitude..','..grid_list_ord[round(node.latitude,5)][round(node.longitude,5)].longitude)
   -- print(round(node.latitude,5)..','..round(node.longitude,5))
end
end
--print(grid_list_ord)

--
print(("Elapsed time for vector generation is: " .. os.clock()-nClock))