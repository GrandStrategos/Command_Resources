#### Command: Modern Operations - Using Lua to Add Units

##### Preparation:

In order to be most effective in your use of Lua code to add units, you need to create the script template in advance. 

The most effective way of doing this is preparing a spreadsheet (Office Excel or Google Sheets) with spaces for the changeable elements (i.e. Unit Name, Latitude and Longitude), allowing you to quickly enter those values, copy the script and paste it into the Lua Script Console.

![scripttemplate](https://github.com/GrandStrategos/Command_Resources/assets/133597501/b7ff6b47-22c4-484f-bf93-79f0b6fade98)

Once you have your script template ready, you're good to go in terms to making your scripts, although there's a couple things to note.

1. Whilst you can write a script with the DBID as a changeable element for each unit you wish to add, this is rather messy and unwieldy, my advice is copy/reuse the template, again and again, for each DBID and save yourself any confusion.
2. The GetElevation, alt >=0 and else print(place.name) elements of the script above, whilst superfluous, are a big help in avoiding painfully bugged Lua scripts. As you can't add many units in the water (i.e. below altitude 0) in Command, without this your entire script won't fire, but with it, it will give instead you a print out in your console to say why it couldn't, allowing you to fix that line of the script. Conversely, if you want to place ships/submarines in positions at sea, remove it.
3. Because you're using a spreadsheet, the gap between column A ({name='), column B (where the Unit Name is) and column C (',lat=) causes spaces to appear before and after the name you chose for the units when you fire the script, you can avoid this by pasting it into a Notepad application first, and using Ctrl+H to remove that space/tab gap, cleaning up the script, the gaps don't matter for the latitude or longitude element.

##### Manual Addition:

In order to show the manual way of filling up your template, I'm going to make a Lua script to add the 25 Patriot batteries operated by the Japan Air Self-Defense Force. 

![bmd_page-0016](https://github.com/GrandStrategos/Command_Resources/assets/133597501/3a403729-510d-4b42-8bf4-e8a490e7d4de)
Source: [**2011 Japanese MoD White Paper**](https://web.archive.org/web/20180417164745/http://www.mod.go.jp:80/e/d_act/bmd/bmd.pdf) *(pg. 16)*

With your project in hand, you need to find information. 

If you aim to make an airbase, open up the airbase's location - on Google Maps, Google Earth Pro, Bing, Maxar, Yandex, Wikimapia, OSM, etc - and start figuring out what is what - runway, runway access points, aircraft spaces, revetments, shelters, ammo and fuel storage - and start marking them. 

For our purposes, as we aim to build the Patriot missile sites for Japan, we need source material like above, giving us the rough locations of the sites, and providing us with a stepping off point for our research. 

1. Once you've identified the location of one of the sites, get the **coordinates in decimal degrees**.

![shariki](https://github.com/GrandStrategos/Command_Resources/assets/133597501/3a206bf8-c52d-47fc-8084-9eab8468de93)

2. Add the name, latitude and longitude to the template.

![shariki template](https://github.com/GrandStrategos/Command_Resources/assets/133597501/3fab4307-4dd8-4ea7-a792-4c375bfd11e7)

3. Repeat until every unit you want to add to the table is completed.

![patriot template 1](https://github.com/GrandStrategos/Command_Resources/assets/133597501/ae40e787-79fb-463a-a707-e5c14b137e6f)

4. Ensure that the Lua function section of the script is correct, i.e. the DBID and Side Name.

![patriot template 2](https://github.com/GrandStrategos/Command_Resources/assets/133597501/da8a1c25-bb2e-45d7-a4f3-fb12c7a3cbb9)

5. Open the Lua Script Console, under the Editor tab.

![lua script console](https://github.com/GrandStrategos/Command_Resources/assets/133597501/16b9d609-ff3f-412c-9674-b38ae497e78e)


6. Copy and paste the script into the Lua Script Console, click Run. Please note the space before and after the name, as noted above, either remove this manually or using a Notepad application, or else the names will be slightly spaced wrong.

![console](https://github.com/GrandStrategos/Command_Resources/assets/133597501/bf9c4bba-e3aa-46a1-8d92-2203c459da39)

7. Navigate to the area of your new units in Command, *et voilà.*

![japan patriot](https://github.com/GrandStrategos/Command_Resources/assets/133597501/4dc79b57-790d-4881-92b0-dd2d9f588b37)

##### Bulk Addition:

For Bulk Addition, the procedure from 2-7 is actually the same, the only difference is how you get your data.

###### Overpass Turbo and ChatGPT

Using [**Overpass Turbo**](https://overpass-turbo.eu/) (in coordination with [**ChatGPT**](https://chat.openai.com/) if you would like to efficient) is a good way of building out a scenario with additional targets, or "do not hit" elements (with scoring) to your scenario.

In this case, we want to get every diplomatic embassy in Београд/Belgrade.

1. Open ChatGPT and ask it for an Overpass Turbo query for embassies in Београд/Belgrade.

![chatgpt](https://github.com/GrandStrategos/Command_Resources/assets/133597501/546b0db0-7d77-4eb2-aeca-5d0aab23e506)

2. Run the query in Overpass Turbo.

![overpass](https://github.com/GrandStrategos/Command_Resources/assets/133597501/231543a1-a28a-4452-af30-6e4d25268f41)

3. Using the export menu, export the query as a GeoJSON.

![export](https://github.com/GrandStrategos/Command_Resources/assets/133597501/7d33d5b7-5bb2-49cb-b266-75de54d3f638)

###### Other Methods

Alternatively, you could mark everything in Google Earth Pro and save it as a KMZ/KML file, or make use of open-source maps that you can find online. In terms of open-source data, with enough time you can find map files for a lot of military sites.

##### QGIS

To continue with these files, you need [**QGIS**](https://qgis.org/en/site/) software, download this software before continuing.

4. Launch QGIS.

![qgis](https://github.com/GrandStrategos/Command_Resources/assets/133597501/0f6f499d-8076-41be-a395-1e80cbe78700)

5. Drag the map file into QGIS and open it. (Note: I have a map layer plugin.)

![belgrade](https://github.com/GrandStrategos/Command_Resources/assets/133597501/a55b9f4d-9973-4e5e-8be5-63b4bed6b056)

6. Right click the file, and click Export and then Save features as.

![export save features as](https://github.com/GrandStrategos/Command_Resources/assets/133597501/66127205-fae8-400f-8d76-f234cd109bb0)

7. This will open the Save Vector Layer as interface. Export the file as a GeoJSON and save somewhere you remember. Note to those confused by re-saving it as the same file type (in the case of the Overpass Turbo export process, you still put your KMZ/KML through this process and save it as a GeoJSON too), this is due to the arrangement of the file text being unwieldy to use as a pure Overpass Turbo export, whilst the QGIS process makes it uniform.

![save as](https://github.com/GrandStrategos/Command_Resources/assets/133597501/1a8cdbc9-659c-46b7-bbd3-b60bf4bd0191)

##### Office Excel

Next step is to use Microsoft Office Excel. If you don't have access to it, you'll have to find another software that allows you to separate the file into cells based on commas.

8. Drag the file into Office Excel.

![excel 1](https://github.com/GrandStrategos/Command_Resources/assets/133597501/78df3edd-1df9-4eb6-81c7-df28a30726b1)


