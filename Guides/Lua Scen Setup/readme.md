
#### Command: Modern Operations - Events
Events in Command Modern Operations play a crucial role in adding dynamism to scenarios. They offer the flexibility to customize and even create scenarios from scratch. This is made possible through the integration of Lua scripting. In this guide, we will walk you through the initial steps of setting up a scenario where you can begin writing your own Lua code.

The first step is to create a new scenario and add two sides via Editor->Add/Edit Sides. Then we add the sides RED and BLUE

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/62eed23f-0390-425b-98bc-6e13de2695f2)


![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/bbecb6b1-f196-4e80-986e-6c92b43bea29)


Good, let's start doing the two most important events for a Lua Scenario. 

The first it's the Lua Init event. This event is called every time the scenario starts.

Open the Event Menu in Editor->Event Editor-> Events

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/384aed8a-10d6-477a-bc1b-0cadcc5354c1)


Create a New Event, in the description field type LuaInit. Below the description you can see three boxes, Event is repeatable, Event is active and Event is shown in the log. Leave it as is. 

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/d0f88d02-bdbf-49be-af31-817d9897f7fd)


Then you see three tables: triggers, conditions and actions. You can learn more about each of them in the manual.

Now we're going to create a new trigger, from this window, click on Edit Triggers, on the new window right to the button Create New trigger, there is a dropdown menu with all the different triggers CMO has. 

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/7fc44bc8-0abf-4e14-88f4-d0e2618de466)


Select a "Scenario is Loaded" and click on Create New Trigger. You can see how the new trigger is added to the trigger events window. 

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/f1bdc849-5248-4d92-ac4b-5a3aa62a035c)



Now in the Event window, you can select your new trigger in the dropdown menu next to the button Add Trigger. Select the Scenario is Loaded trigger and click to Add Trigger.

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/8e15c8a8-1821-47b7-95e6-7c8408d274c2)


Now headed to the Actions section. Click on Edit actions, and as same with triggers you have a dropdown menu with all the actions available. 

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/1c429df5-aa8d-444b-b090-764cee730ca2)


Create a new "Lua Action", in this case a new window pop-up. In the description you can set "LuaInit-lua" to indicate that this action belongs to the LuaInit event and is a lua action. 



In the settings for the action panel, you need to write what action needs to be performed when the scenario is loaded. Here you start to write your lua init function, but since this editor is ruthless, the best for scenario testing and developing its create a call to run an external script. There's a function in the CMO Lua API that allows you to run external lua scripts. These scripts have to be placed under YourCMOSetupFolder/Lua/. 

So type in the settings the following: ScenEdit_RunScript('/Development/FirstScen/LuaInit.lua'). 

This code is telling Lua to run a script placed under the folder YourCMOSetupFolder/Lua/Development/FirstScen/ and here execute the LuaInit.lua file. 

So let's go to create this folder. My recommendation it's create a folder on the CMO Lua folder named Development/ and in this folder create all the folders related to each of your scenarios. So let's move to our Windows filesystem, go to your CMO folder installation, click on Lua Folder and inside the Lua folder create a new Folder named Development. Inside this new folder create a new Folder called FirstScen. In this folder called FirstScen we are going to create our LuaInit.lua file. Open you're favorite editor (Sublime or VSCode is highly recommended for writing Lua) and text ScenEdit_SpecialMessage('playerside',"Hey my Lua Init is working!!"), save this file as LuaInit.lua

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/64c36123-652f-4c48-bed4-c8ec4c981227)

Go back to Command click OK and add the event to the actions event panel. Your LuaInit event window must look like this

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/d0be40e1-3f80-42f9-9bc1-b7e52eb2cd40)

And your event window:

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/776f12aa-6001-4b36-a6b6-b702fd03b86f)


Yeah, you now have your Event set to be launched every time your scen starts.

Save the scen with the name you want, and now open you're scen. If you follow all the steps you can see how a special message pop's up when you start your scenario. You need to allow pop-up messages for Special Messages, you can set this in Game->Game Options, go to the tab Message Log, search for Special Messages, and assures that Raise Pop Up is ticked.

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/feb7fd74-1abe-4942-ba08-e076b13f308a)


![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/18f5a45c-eae6-4dfc-9b3d-d45b59e45bd0)


Great, now that you have your LuaInit working you can add functions to this file to be performed by the different events around the game. Here is a good place to aux functions, game logic, functions that execute regularly from other scripts etc.


Now let's create the second Event that allows you to setup all the scenario, the GameSetup event.

The GameSetup event in comparison with the LuaInit only must be executed at the first second of the scen and not every time the scen is loaded. So it's executed once for each gameplay.

First you need to setup the start time of your scen, let's say that our scen time will be 14/05/2019 14:00:00

Go to Editor -> Scenario Times + Duration

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/761af842-9e4c-4d4c-8ed1-d46e937cdcac)


Set the current time to this time, and the start time to this time.

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/c0f53b50-7d2f-42dc-8b0d-13edf963aedd)

Ok, let's go again to the Event Window, Editor->Event Editor-> Events.

Let's create another event, named it GameSetup and click on Editing Triggers to create a new trigger.

This time as we need to execute this event only once, create a Time trigger. A window open and set the time to 12:00:01. Click on set time, and click OK. Then add the trigger to the event.

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/0740b07f-96e2-49b2-87b1-074f9e151a40)

Go to the actions menu and as same before, create a new Lua Action named it as GameSetup-lua and this time you need to point to the GameSetup file in your game folder development
So the code will be: ScenEdit_RunScript('/Development/FirstScen/GameSetup.lua'). 
![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/11f10766-27e5-4812-94e5-591430fa4242)

In your GameSetup.lua file you can write another ScenEdit_SpecialMessage with a different text to note that the Game Setup Event is working.

Back to CMO, save the action and add the action to the event, click OK. Your Game Setup Event must look like this:

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/1c6a8798-eab3-4195-9fdf-3322479eb4ae)

In your event window you can see how LuaInit is not active. This occurs always that you start a game. Every time you need to save the scenario you need to assure that LuaEvent is active. A thing that I do it's include this little lua code in my LuaInit to assure every time I saved the game LuaInit is Active:

ScenEdit_SetEvent('LuaInit',{isActive=true})

Now that you have LuaInit and GameSetup active, save your scenario.

Open your scen, you must see the lua init pop up at scenario starts. Now press space and start your scenario, you must see another pop-up in the first second of your scen with your game setup special message.

![imagen](https://github.com/GrandStrategos/Command_Resources/assets/92254994/57490ecd-64cd-4b9d-80b2-2689f30902d4)


Great you now can start to write your scenario using Lua!
