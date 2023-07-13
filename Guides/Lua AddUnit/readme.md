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
