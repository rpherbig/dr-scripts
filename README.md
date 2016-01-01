# dr-scripts
A series of Lich (https://lichproject.org/) scripts for use in DragonRealms (http://www.play.net/dr/).

## Training scripts
These scripts are designed to train skill(s):
* combat-trainer (and combat-setup) - trains combat skills
* crossing-training (and crossing-setup) - trains non-combat skills
* theurgy - train theurgy by working up devotion and doing some simple communes
* training-manager - repeatedly trains non-combat and combat skills

## Miscellaneous manually run scripts
Does something specific and then exits, intended to be run by the user or another script:
* train - trains attributes
* circlecheck - reports your progress towards circling
* pick (and pick-setup) - disarms and unlocks boxes
* sell-loot - sells loot and deposits coin
* smelt - smelts an ingot
* forge - forges an item
* crossing-repair (and crossing-repair-setup) - repairs items
* favor - gets a favor from a given Immortal
* setupaliases - adds a useful selection of aliases to the global list
* gbox - gets all boxes from a container and gives them to a character

## Miscellaneous background scripts
These run in the background to provide functionality to you, the user:
* roomnumbers - appends the Lich room ID# to your in-game room title
* textsubs
* smartlisten - if someone teaches you an approved class you'll start listening
* moonwatch - populates UserVars.moons with data related to the moons
* afk - runs in the background to provide safety while you are afk
* tendme (and tendother) - automatic wound tender

## Helper scripts
These run in the background to provide functionality to other scripts:
* dependency
* drinfomon
* equipmanager
* events
* common
* spellmonitor

## Mapping assist scripts
* addroom - add a series of rooms to the lich map
* automap - attempts to record your movements through an area and update the map as you travel

## Empath-only scripts
* smarttransfer - safely transfer wounds from the target, avoiding useless injuries in fatal areas
* healme - basic self healing script

## create_symlinks.bat
Useful if you are doing development on Windows. Pass it an argument of the path to your lich\scripts\ directory

## create_symlinks.sh
Useful if you are doing development on OSX or Linux. Pass it an argument of the path to your lich/scripts/ directory
