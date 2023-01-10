local circle = World_GetCircleFromPoint({latitude = '13.54472222' ,longitude = '144.8416667', numpoints = 36,radius=250})
for index,point in pairs(circle) do
ScenEdit_AddReferencePoint( {side="United States", lat=point.latitude, lon=point.longitude, highlighted=true})
end