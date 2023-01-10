local circle = World_GetCircleFromPoint({latitude = '-7.31' ,longitude = '72.41', numpoints = 36,radius=250})
for index,point in pairs(circle) do
ScenEdit_AddReferencePoint( {side="United Kingdom", lat=point.latitude, lon=point.longitude, highlighted=true})
end