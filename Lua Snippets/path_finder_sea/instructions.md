INSTRUCTIONS
add side with name PF and in that side :
1.add a reference point for the most southwest point of pathfinding area named SW
2.add a reference point for the most northeast point of pathfinding area named NE
3.add a reference point for the goal named G
4.add a ship named test

5.First run pathfinder_sea_heatmap_vector.lua :

  this will create a grid ,generate a heatmap , and populate nodes with the next node that needs to be taken.(let it run. 
  For the entire med takes aprox. 5 mins on xeon w3690.It will say not responding but you must let it run)
  
6.Run pathfinder_sea_path.lua : 
  this will make a path for the unit named test
  
  
  CONSTRAINTS 
  
    unit "test" and RP "G" must be inside area and in depth >30m
    this script is not optimized , i just hacked it together.
    Make the area larger than your starting point (unit) and goal point (G)
    
    
  After you run the first script you only need to run the second script if you want to find a path for the unit from a different location . 
  The algorithm is goal based which means if the goal (final destination) remains the same you can find paths in the defined area for the 
  same goal for multiple units . Just modify the 2nd script.
  
  
    
