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
  * Warning, if you have a shared gemstone 4 and DR lich install this migration will screw up your gemstone setups. You can manually perform this step by adding dependency to your autostart list for any DR characters and removing autostarts for any of our scripts. Then you'll want to use ;e custom_require(['list', 'of', 'ourscripts']) that you want to monitor now.
1. Open up your lich install directory, then open the scripts folder (this is where your .lic files live)
1. Make a new folder in there named 'profiles'
  * Profiles holds a collection of yaml files. Yaml is a flat file format for expressing data (like xml or json).
  * base.yaml is data that will be loaded in for every character you run
  * Yourname-setup.yaml is settings for a single specific character, specified by Yourname
  * Yourname-otherthing.yaml are settings that will be imported if you provide an extra argument to a script. e.g. ;crossing-training otherthing
1. Navigate to https://github.com/rpherbig/dr-scripts/tree/master/profiles
  * Right-click on 'base.yaml'
  * Select 'Save target as...' (the exact text varies by browser)
  * Save it to the profiles directory you just created
1. We have some existing characters' config files in the same location as base.yaml. You can download them by repeating the same steps above if you would like to see sample config files for various guilds (make sure to rename the file to match your character!):
  * Barbarian: Sheltim-setup.yaml
  * Bard: Thurmond-setup.yaml
  * Cleric: Menacra-setup.yaml
  * Empath: Selanas-setup.yaml
  * Moon Mage: Mooselurk-setup.yaml
  * Necromancer: none yet, be the first by submitting your own!
  * Paladin: none yet, be the first by submitting your own!
  * Ranger: Etreu-setup.yaml
  * Thief: Evissam-setup.yaml
  * Trader: none yet, be the first by submitting your own!
  * Warrior Mage: Torgro-setup.yaml
1. ;e UserVars.use_yaml = true
  * If your UserVars become corrupted you'll need to reset this flag. We expect to remove this flag as soon as possible so hopefully this will not be an issue for long.
1. Now you're ready to download and run any of our scripts. For each script you want (the full list is below), run:
  * ;e custom_require('script-name')

## Migration to YAML configuration files
We're moving from our current .lic setup files to YAML files for a variety of reasons. We have a a helper ruby
file that can convert your existing settings over to the new yaml format. setupconvert.rb.
From a command prompt in the scripts directory run
ruby setupconvert.rb Yourname

Note that name is case sensitive. If you receive a message about ruby being an unrecognized command it is not in your path
you must instead provide the full path to ruby, for most installs this will be
C:\Ruby200\bin\ruby setupconvert.rb Yourname

## Training scripts
These scripts are designed to train skill(s):
* combat-trainer (and combat-setup) - trains combat skills
* crossing-training (and crossing-setup) - trains non-combat skills
* theurgy - train theurgy by working up devotion and doing some simple communes
* training-manager - repeatedly trains non-combat and combat skills
* hunting-buddy - trains combat skills (using combat-trainer) in defined hunting areas

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
Useful if you are doing development on Windows. Set the LICH_SCRIPTS environment variable to the path to your lich/scripts/ directory.

## create_symlinks.sh
Useful if you are doing development on OSX or Linux. Pass it an argument of the path to your lich/scripts/ directory.
