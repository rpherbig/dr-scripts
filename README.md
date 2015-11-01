# dr-scripts
A series of Lich (https://lichproject.org/) scripts for use in DragonRealms (http://www.play.net/dr/).

## combat-trainer.lic
This script trains a list of weapon skills, starting with whichever has the lowest amount of field experience.

## combat-trainer-setup.lic
This script sets up UserVars for use with combat-trainer.lic.

## crossing-repair.lic
This script repairs leather and metal gear in The Crossing.

## crossing-training.lic
This script trains a list of non-combat skills, starting with whichever has the lowest amount of field experience.

## crossing-training-setup.lic
This script sets up UserVars for use with crossing-training.lic.

## events.lic
This script is a helper which adds support for Events and Flags to make scripting easier and more robust.

# Development - symlink on Windows
See create_symlinks.bat. Change the _Source and _Destination variables.

Note: if you use GitHub for Windows and discard changes to the combat-trainer.lic file, the symlink will be broken. Delete the "file" in the destination path (e.g. the Lich\scripts directory) and rerun the above command.