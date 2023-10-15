#### Command: Modern Operations - Yooper's Custom Map Guide

Credit: Reproduced with kind permission from Yooper, original post on [**forum.**](https://www.matrixgames.com/forums/viewtopic.php?f=10201&t=398935)

* [**QGIS Custom Layer Guide**](https://github.com/GrandStrategos/Command_Resources/tree/main/Guides/Yooper's%20QGIS%20Custom%20Layers%20and%20Map%20Guide#yoopers-custom-layer-guide)
* [**Mapbox/QGIS Custom Map Guide**](https://github.com/GrandStrategos/Command_Resources/tree/main/Guides/Yooper's%20QGIS%20Custom%20Layers%20and%20Map%20Guide#yoopers-custom-map-guide)

##### Yooper's QGIS Custom Layer Guide

![2023-10-15_15-13-16](https://github.com/GrandStrategos/Command_Resources/assets/133597501/264c6f47-659b-4115-8df7-35e3b0959912)

Do you want your maps to look like that? In CMO? Yes, you can do it. You can do it now, without any added work from the devs, and your maps can be exactly how you want them.

We used to have G.MAPS for getting map snippets, then that was abandoned and now folks are using SAS.Planet. I'm not a fan of it, mainly the whole bootleg/jank feel and the security warnings every time I open it up. So after Stamen took a dump, I decided to find a new way to give me sweet maps.

QGIS is an open source piece of software that allows us to make maps and export the bits we need. It's even easier than SAS.Planet and it looks better too. You can download it here : https://www.qgis.org/en/site/forusers/download.html

Download, install, and open it up. On the left hand side you'll see a bunch of stuff in the Browser. Initially open up XYZ tiles and double click OpenStreetMap. You can verify QGIS working.

![2023-10-15_15-27-39](https://github.com/GrandStrategos/Command_Resources/assets/133597501/0f5d5b96-30e6-404e-8892-f2f7936b3e2a)

Now for some maps!

Go to the Plugins tab followed by Manage and Install Plugins. Search for MapTiler. Install the Plugin and Restart QGIS.

![2023-10-15_15-29-38](https://github.com/GrandStrategos/Command_Resources/assets/133597501/77b8095f-f24c-4d3c-8db9-1ac99c871b45)

On the left hand side you will see a MapTiler tab. Open it up and double click one of the maps. You will see it open up in the Layers tab below.

![2023-10-15_15-31-07](https://github.com/GrandStrategos/Command_Resources/assets/133597501/c285167b-7e7b-4f0f-930b-94244d71bfd7)

This is the "Toner" map. If you don't like it, you can Right Click the map in the Layers tab and Remove Layer.

This is a super duper important step! You must change your coordinate reference system to WGS 84. The authority ID is EPSG:4326.

![2023-10-15_15-32-26](https://github.com/GrandStrategos/Command_Resources/assets/133597501/48847a8d-4570-4742-b426-b7e7bc2f951b)

To add additional maps from MapTiler, Right Click on MapTiler in the Browser and double click on the MaTiler Cloud type you'd like. I really like Dark Matter, the unit icons really pop.

![2023-10-15_15-37-51](https://github.com/GrandStrategos/Command_Resources/assets/133597501/cfe76520-e392-4c8d-81b0-d405e312e4e3)

In the Upper Left click on Project, Import/Export, and Export Map to Image.

![2023-10-15_15-38-55](https://github.com/GrandStrategos/Command_Resources/assets/133597501/e254ef17-3ebd-48a9-9fc5-9b3d5320f9cf)

I like 300 dpi, more than that and the files get really big. Try to keep your zoom level, or scale, approximately the same if you are doing multiple areas. Click on Draw on Canvas, and select where you'd like your map. After you've click-dragged your map click Save. It'll open up a File Save dialog, create a unique name and save it.

After a few seconds you should see a success bar on the top. Or go check for it in your folder that you selected.

![2023-10-15_15-41-54](https://github.com/GrandStrategos/Command_Resources/assets/133597501/9a676ad2-8e4b-40d3-b9a1-3df78b3b0e73)

Now to CMO! Click the Custom Layers button. Then select Add Layer and find the file you just made in QGIS. It will take a few seconds and should appear.

![2023-10-15_15-43-08](https://github.com/GrandStrategos/Command_Resources/assets/133597501/e8cdf860-7d0a-42c2-8a36-15aa655dc693)

A few important items :
1. The CRS needs to be set any time you open a new map in QGIS.
2. If your DPI is too high the file size for CMO will get too large and it will hang or crash when loading.
3. You have to either load the layers each time you load the scenario, or you have to use some Lua to load the attachment.
4. This only does one zoom level, so if you zoom in ridiculously close, all you will see is the PNG you created but zoomified. This is the nature of how it works using an overlay. You are "overlaying" this image on the normal CMO map system.

##### Yooper's Mapbox/QGIS Custom Map Guide

To make your own, custom maps, things get more interesting. Create an account at MapBox.

![2023-10-15_15-47-40](https://github.com/GrandStrategos/Command_Resources/assets/133597501/f499dfb3-cfd2-4d65-8158-bd649b248686)

Then make your own map! Select the style, then modify the layers as you see fit. I've made a satellite map, but slightly darker, with blue roads.

![2023-10-15_15-50-45](https://github.com/GrandStrategos/Command_Resources/assets/133597501/d96403dc-8dd2-4125-adbd-8b5eb07f1e2b)

This took me like, 30 seconds.

Save it with a Unique name, then make it Public.

![2023-10-15_15-51-36](https://github.com/GrandStrategos/Command_Resources/assets/133597501/0d543ffa-dbb4-48c7-bd9a-c0ece3d34176)

Now go back to QGIS.

![2023-10-15_15-52-36](https://github.com/GrandStrategos/Command_Resources/assets/133597501/b8a9423e-9214-4432-b555-2677c6ca6e3b)

You will need your Mapbox studio user name, your map name, and your public token. (See this link for detailed instructions, just scroll down to the QGIS section.) https://docs.mapbox.com/help/tutorials/mapbox-arcgis-qgis/

Select NEW, give it a unique name, and follow the URL format in the link above. Click OK, then Connect. You will see it under the WMS/WMTS drop down in the Browser.

![2023-10-15_15-59-14](https://github.com/GrandStrategos/Command_Resources/assets/133597501/4f0490ea-e226-47f2-97a1-7d895ef9ae16)

Follow the same steps to export the image (and remember your CRS!) and you now have "your" map! Note : Mapbox is free for 200,000 tile requests. So if you go wild and make dozens of maps and try to export the world, you could run into the paid tier. But that's on you.

In contrast the MapTiler plug in is 100% free and requires no sign ins or logins.

An interesting note, I've used 540 static tile requests out of 200,000. That occurred while I was making this post, testing things, and not really getting terribly detailed. So don't share your tokens or maps, otherwise it'll take a few hundred people to max out your account. This also puts maps into perspective, someone has to pay for this stuff somewhere. It is bandwidth intense to send all of these tiles. I found this eye opening and gave me a new found respect for the maps we already have in CMO.

QGIS is very powerful. This is 100% a professional grade piece of software. You can probably make it do awesome stuff, like bathymetry layers and such. I'd really love to see the types of maps people are making so share your schemes.
