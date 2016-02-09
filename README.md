# dr-scripts
A series of Lich (https://lichproject.org/) scripts for use in DragonRealms (http://www.play.net/dr/).

## Getting started
Here are the instructions for getting started using our scripts. We hope to automate some of these steps soon. These should all be onetime steps.

1. ;repos download dependency.lic
  * 'dependency.lic' is the the script that will download and keep up-to-date all of the rest of our scripts
1. ;trust dependency
  * This lets the trusted script make files on your hard drive and download stuff from the internet - make sure you trust us before running this command
1. ;dependency
1. ;e migrate_scripts
  * Warning, if you have a shared gemstone 4 and DR lich install this migration will screw up your gemstone setups. You can manually perform this step by adding dependency to your autostart list for any DR characters and removing autostarts for any of our scripts. Then you'll want to use ;e get_script('name of script') for each of our scripts
1. ;e setup_profiles
  * This made a new folder called profiles and copied in some default character profiles
  * Profiles holds a collection of yaml files. Yaml is a flat file format for expressing data (like xml or json).
  * base.yaml is data that will be loaded in for every character you run
  * Yourname-setup.yaml is settings for a single specific character, specified by Yourname
  * Yourname-otherthing.yaml are settings that will be imported if you provide an extra argument to a script. e.g. ;crossing-training otherthing
1. We have some existing characters' config files in the same location as base.yaml. Make sure to rename the file to match your character if you'd like to use one:
  * Barbarian: Sheltim-setup.yaml
  * Bard: Thurmond-setup.yaml
  * Cleric: Menacra-setup.yaml
  * Empath: Selanas-setup.yaml
  * Moon Mage: Mooselurk-setup.yaml
  * Necromancer: Aevul-setup.yaml
  * Paladin: Tekronn-setup.yaml
  * Ranger: Etreu-setup.yaml
  * Thief: Evissam-setup.yaml
  * Trader: Cidemon-setup.yaml
  * Warrior Mage: Torgro-setup.yaml
1. Now you're ready to download and run any of our scripts. For each script you want (the full list is below), run:
  * ;e get_script('script-name')
1. You'll probably want to add some scripts you download to run automatically when you log in
  * ;e autostart('script-name') will start it for all of your characters
  * ;e autostart('script-name', false) will start it for only this character
  * ;e echo(list_autostarts) will show you the files being autostarted on a given character
  * ;e stop_autostart('script-name') will remove an autostarted file from the list
  * ;e autostart(['drinfomon', 'common', 'spellmonitor']) to add many scripts at once

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

## Miscellaneous background scripts
These run in the background to provide functionality to you, the user:
* roomnumbers - appends the Lich room ID# to your in-game room title
* textsubs - provides in-game text substitution capabilities; comes defaultly with numerical substitutions for appraisal and combat messages
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

## Empath-only scripts
* smarttransfer - safely transfer wounds from the target, avoiding useless injuries in fatal areas
* healme - basic self healing script

## create_symlinks.bat
Useful if you are doing development on Windows. Set the LICH_SCRIPTS environment variable to the path to your lich/scripts/ directory.

## create_symlinks.sh
Useful if you are doing development on OSX or Linux. Pass it an argument of the path to your lich/scripts/ directory.
