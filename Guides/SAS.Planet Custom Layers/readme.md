#### Command: Modern Operations - Custom Layers

##### SAS.Planet 

As GMap.Net seems to have been discontinued and no longer fetches online imagery, [**SAS.Planet**](https://gisenglish.geojamal.com/2018/06/download-sas-planet-nightly-all.html) is a working alternative to GMap that fulfills the functionality necessary to create Custom Layers for Command.

This guide is intended to aid the Command user in the generation of Custom Layers for use within the Command: Modern Operations application.

For familiarisation, the Henderson Field (Midway) custom overlay files can be found in this directory.

##### Instructions:

1. Download the application .zip folder at the above link, install the application and launch the .exe.

![sas planet](https://user-images.githubusercontent.com/121643870/210280525-4a4b794d-1a39-4983-a970-e74e2f3861f3.png)

2. Navigate as necessary to your desired location, for our purposes, we will use **Henderson Field** on Midway Atoll.

![midway](https://user-images.githubusercontent.com/121643870/210280784-68288122-98dc-4939-b28c-f7d068054f2c.png)

3. As appropriate, select your preferred basemap, we will use the Bing Maps - satellite basemap, but note that it is often best to try an area with a number of different basemaps and identify the best one, particularly as defence and other sensitive national-security sites might often be pixelated by government instruction on one map provider, but may not be censored on other providers.

![basemap](https://user-images.githubusercontent.com/121643870/210281328-ed6b5df2-85fc-4620-a233-3bbe4fc45368.png)

4. Select the Selection menu, and choose your desired selection type, Rectangular Selection (Alt + R) is generally best for our purposes, but often Polygonal Selection (Alt + P) can be useful if you want to avoid including large irrelevant areas from your custom layer. 

![selection](https://user-images.githubusercontent.com/121643870/210281647-db35fa34-e452-44ee-8550-a4d7b9fead59.png)

5. Once you have chosen your desired selection type, left-click and select your desired area, left-click again to finalize your selection.

![selected area](https://user-images.githubusercontent.com/121643870/210282034-c73edf7e-37b8-4718-99d1-d4b60263f7f7.png)

6. This will automatically open the Selection Manager under the Download tab, here you can change your desired basemap layer as well as select your zoom level. Note the effect of the selected zoom level on the number of tiles downloaded (resulting in a smaller or larger image). Selecting a sensible zoom level is a balance of keeping the size of the file to a minimum, whilst also attempting to use a zoom level that provides a useable quality, this is mostly a matter of and trial and error, especially with different basemap improving up to a certain zoom level, but any further zoom level providing no increased quality. Once you are happy with your selection, click **Start.**

![selection menu](https://user-images.githubusercontent.com/121643870/210286486-4d77c883-c2d6-4b24-acf2-3ee555442f2a.png)

7. Allow the download to complete. Once complete, in the bottom left corner you will see a squared blue dashed line icon, which when hovered over will say Selection Manager, click the button, this will open up the Selection Manager again.

![download](https://user-images.githubusercontent.com/121643870/210285303-482a5c92-9f2d-4449-909f-f20be7e56a27.png)

8. Navigate to the Stitch tab, here it is **important** you select the following options.

  * Output format: PNG (Portable Network Graphics)
  * Save to: *Name the file, and save it somewhere you can find it.*
  * Zoom: (In our case, 18), but select the same zoom level as before.
  * Map: Ensure the same basemap selection.
  * Overlay layer: If you wish to overlay the Google Maps roads on Bing satellite imagery, you can do it here.
  * Projection: Geographic (Latitude/Longitude) / WGS84 / EPSG:4326
  * Create georeferencing file: .w (short ext.)
 
![stitch tab](https://user-images.githubusercontent.com/121643870/210285387-7922ceee-6d7e-4732-ab38-4e5d85522d1a.png)

9. This will automatically open another menu, showing you the progress of SAS.Planet in stitching the downloaded tiles together. Let this process complete itself, and once complete the menu will close itself automatically, and you will be left with four files, the image .png file (containing the image) and the georeferencing .pgw, .png.aux.xml and .prj files.

10. Close SAS.Planet, and launch Command: Modern Operations application, load into any scenario/the editor.

![command maps](https://user-images.githubusercontent.com/121643870/210284763-f80f11a6-742e-4646-8cc6-c49d283ce2bb.png)

11. Using the View dropdown menu, navigate to Custom Layers and select, this will open the Custom Layer Manager.

![command menu](https://user-images.githubusercontent.com/121643870/210285433-1cd4c536-bbc1-4a94-b1f1-639c126b28a0.png)

12. In the Custom Layer Manager, click the green icon (Add Layer) to add your desired layer, likewise click the orange icon (Remove Selected) to remove a layer. Once added, it will appear in the manager. Close the Custom Layer Manager when you're finished.

![layer manager](https://user-images.githubusercontent.com/121643870/210285438-9c3d288f-cb99-43bf-94b8-723d7dc587f7.png)

13. Navigate to the area of your Custom Layer in Command, *et voilà.*

![command custom layer](https://user-images.githubusercontent.com/121643870/210285724-4382aa06-0652-4606-8a30-0728d29fb1fd.png)
