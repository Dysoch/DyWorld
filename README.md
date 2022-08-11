# Description:
DyWorld-Dynamics, the successor of DyTech and DyWorld, a mod for Factorio. This is its github page, this always holds the most recent version.
While most of the time working, keep in mind that changes are being done regularly, and might break your game! 
Playing with these is not recommended
### Please use at own risk!

## Features:
- A story that fits into both Factorio and Space Exploration.
- Massive technology tree (2500+ technologies to research).
- Great amount of items (1270+) to automate. Each step will require more and more steps.
- Massive change to fluid networks. Oil, Natural Gas, and Elemental Gasses are now used and much different then before.
- Many different enemies to fight.
- Many guns, ammo types and vehicles to fight the enemies with.
- Very complex RPG and Survival aspect. 




# Settings:
## DyCore:
Name | Description | Default Value | Allowed Value's
:--- | :--- | :-----: | :-----:
Enemy Health Multiplier | Will multiply enemy health by set value | 1 | 0.25, 0.5, 0.75, 1, 1.5, 2, 2.5, 3, 4, 5, 10
Loot Multiplier | Will multiply loot amount and chance by set value | 1 | 0.25, 0.5, 0.75, 1, 1.5, 2, 2.5, 3, 4, 5, 10
Player Health Multiplier | Will multiply player health by set value | 1 | 0.25, 0.5, 0.75, 1, 1.5, 2, 2.5, 3, 4, 5, 10
Stacksize Multiplier | Will multiply stacksize by set value | 1 | 0.25, 0.5, 0.75, 1, 1.5, 2, 2.5, 3, 4, 5, 10
## DyWorld-Dynamics:
### Startup Settings (Require a restart of the game)
Name | Description | Default Value | Allowed Value's
:--- | :--- | :-----: | :-----:
Combat Overhaul | makes bullets hit the first thing, travel in the world and make combat a lot harder, but more fun (EXPERIMENTAL!) | false | false, true
Debug Mode | Debug Mode: DO NOT USE UNLESS YOU KNOW WHAT YOU ARE DOING | false | false, true
DyWorld-Dynamics Difficulty | This defines the difficulty of the DyWorld-Dynamics mod. Content will change depending on setting | Easy | Easy, Normal, Hard
Expensive Recipe Modifier | Expensive recipe modifier. This number multiplies the normal recipes for the expensive recipes | 5 | 1 <-> 1000
Expensive Technology Modifier | Expensive technology modifier. This number multiplies the normal usage of science packs | 1 | 0.1 <-> 100000
Player Light Increase | Player Light Increase. Same as Afraid of the Dark mod, but internally added into DyWorld because AotD is incompatible | false | false, true
Realistic Recipes | A newly added feature that makes recipes more realistic.\nThis means every part in a machine has to be crafted and added.\nSo a stone furnace will require around 200 stone bricks, as it is build brick by brick. (Recipes that have not a realistic recipe set will follow the Expensive Recipe Modifier setting) | false | false, true
Show Building Resistances | Shows Building Resistances in their tooltip. Does clutter the screen a bit | false | false, true
Tech Upgrades | This will enable the upgrade tech for all DyWorld technologies, which makes the technology screen less cluttered. This will however make it harder to check the next technology in the same line without searching the actual technology tree (right side of the screen) | true | false, true
### Map Settings (Affects the current map and all its players, change anytime)
Name | Description | Default Value | Allowed Value's
:--- | :--- | :-----: | :-----:
Autosave after each phase (story mode) | Will autosave the game named according to phase it is moving to | true | false, true
Custom Difficulty (scripted attacks) | Custom Difficulty multiplier for scripted attacks | Easy | Peaceful, Easy, Medium, Hard, Death
Survival Difficulty | This governs everything coupled with survival (Food / Water / Temperature (WIP) / Radiation (WIP) / Oxygen (WIP) / Pollution (WIP)) | Normal | Off, Easy, Normal, Hard, Insane
### Player Settings (Different per player, change anytime)
Name | Description | Default Value | Allowed Value's
:--- | :--- | :-----: | :-----:
Attack Messages | Determines if the Attack messages are shown | true | false, true
Story Messages | Disabling this does not shows the new recipes unlocked message anymore | true | false, true
