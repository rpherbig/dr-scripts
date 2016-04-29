# dr-scripts
A series of Lich (https://lichproject.org/) scripts for use in DragonRealms (http://www.play.net/dr/).

## Getting started
See the setup guides on the wiki: https://github.com/rpherbig/dr-scripts/wiki

## Training scripts
These scripts are designed to train skills:
* combat-trainer - trains combat skills
* crossing-training - trains non-combat skills
* theurgy - train theurgy by working up devotion and doing some simple communes
* training-manager - repeatedly trains non-combat and combat skills
* hunting-buddy - trains combat skills (using combat-trainer) in defined hunting areas
* mining-buddy - mines in defined mining areas, up to once per room
* mining-manager - repeatedly mines in defined mining areas (using mining-buddy)

## Miscellaneous manually run scripts
Does something specific and then exits, intended to be run by the user or another script:
* train - trains attributes
* circlecheck - reports your progress towards circling
* pick - disarms and unlocks boxes
* sell-loot - sells loot and deposits coin
* smelt - smelts an ingot
* forge - forges an item
* crossing-repair - repairs items
* favor - gets a favor from a given Immortal
* setupaliases - adds a useful selection of aliases to the global list
* gbox - gets all boxes from a container and gives them to a character
* safe-room - heals at a PC or NPC empath and shares items between characters by dropping them in a safe room
* mine (and danger) - mines a room and watches for dangerous events
* smelt-deeds - combines deeds of like metals to save inventory space
* workorders - completes a workorder for the given discipline

## Miscellaneous background scripts
These run in the background to provide functionality to you, the user:
* roomnumbers - appends the Lich room ID# to your in-game room title
* textsubs - provides in-game text substitution capabilities; comes defaultly with numerical substitutions for appraisal and combat messages
* smartlisten - if someone teaches you an approved class you'll start listening
* moonwatch - populates UserVars.moons with data related to the moons
* afk - runs in the background to provide safety while you are afk
* tendme (and tendother) - automatic wound tender
* performance-monitor - logs combat data for later parsing

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

## Empath-only scripts
* smarttransfer - safely transfer wounds from the target, avoiding useless injuries in fatal areas
* healme - basic self healing script

## create_symlinks.bat
Useful if you are doing development on Windows. Set the LICH_SCRIPTS environment variable to the path to your lich/scripts/ directory.

## create_symlinks.sh
Useful if you are doing development on OSX or Linux. Pass it an argument of the path to your lich/scripts/ directory.
