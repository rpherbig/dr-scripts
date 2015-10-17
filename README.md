# dr-combat-trainer
A script for Lich (https://lichproject.org/) that will train combat skills in DragonRealms (http://www.play.net/dr/)

# Development - symlink on Windows
I found making a symlink made it easier to work on this script. To do this in Windows, open a command prompt with elevated privileges (run-as Administrator) and execute: `mklink /H C:\destination\combat-trainer.lic C:\source\combat-trainer.lic`

Note: if you use GitHub for Windows and discard changes to the combat-trainer.lic file, the symlink will be broken. Delete the "file" in the destination path (e.g. the Lich\scripts directory) and rerun the above command.