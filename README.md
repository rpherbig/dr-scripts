# dr-scripts
A series of Lich (https://lichproject.org/) scripts for use in DragonRealms (http://www.play.net/dr/).

## combat-trainer.lic
This script trains a list of weapon skills, starting with whichever has the lowest amount of field experience.

## combat-trainer-setup.lic
This script sets up UserVars for use with combat-trainer.lic.

# Development - symlink on Windows
I found making a symlink made it easier to work on this script. To do this in Windows, open a command prompt with elevated privileges (run-as Administrator) and execute: `mklink /H C:\destination\combat-trainer.lic C:\source\combat-trainer.lic`

Note: if you use GitHub for Windows and discard changes to the combat-trainer.lic file, the symlink will be broken. Delete the "file" in the destination path (e.g. the Lich\scripts directory) and rerun the above command.