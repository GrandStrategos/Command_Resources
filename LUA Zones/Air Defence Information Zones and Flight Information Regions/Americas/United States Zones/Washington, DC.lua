local circle = World_GetCircleFromPoint({latitude = '38.859444' ,longitude = '-77.036389', numpoints = 36,radius=30})
for index,point in pairs(circle) do
ScenEdit_AddReferencePoint( {side="United States", lat=point.latitude, lon=point.longitude, highlighted=true})
end