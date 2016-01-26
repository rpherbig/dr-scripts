## Modified by Azarael
## Modified by Hervean
## Orginal by Bluerider.

#debug 10

### User Defined Settings (0 = no, 1 = yes)
# Keeping stone?
var mine.stone $MINING_MINE.STONE

# Keeping metal?
var mine.metal $MINING_MINE.METAL

# Tracking volume?
var volume.track $MINING_VOLUME.TRACK

# Where to stow material when not deeded.
var mat.stow $MINING_MAT.STOW

# Which sizes of stone to deed
var StoneDeed $MINING_STONE.DEED

# List of metal to keep.
var MaterialKeepList.metal $MINING_METAL.KEEP
## var MaterialKeepList.metal (nickel|tin|covellite|silver|iron|zinc|copper|lead|oravir)

## List of stone to keep.
var MaterialKeepList.stone $MINING_STONE.KEEP
## var MaterialKeepList.stone (alabaster|andesite|basalt|breccia|dolomite|gabbro|granite|jade|limestone|marble|obsidian|onyx|pumice|quartzite|sandstone|schist|serpentine|soapstone|travertine)

# How long to wait after mining before mining again.
# Too small a value may cause dangers to happen before they can be corrected.
var SafetyPause 12

############################################################################
###Variable declaration.

var FoundStone 0
var FoundMetal 0
var MineFailure 0
var MaterialLevel 0
var TotalStone 0
var TotalMetal 0
var TotalDeed 0
var rare.found 0
var volume.found.stone 0
var volume.found.metal 0
var volume.found.rare 0
var total.volume 0
var have.pick 0
var have.shovel 0
var have.deeds 0
var miners.present 0
var need.coins 0
var warn.once 0
var analyzed.pick 0
var regular.metal.type None
var position |second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth
var sizes.metal (tiny|small|medium|large|huge|massive|enormous)
var volumes.metal (1|2|3|4|5|10|20)
var sizes.rare (tiny|small|medium|large|huge|massive|enormous)
var volumes.rare (1|2|3|4|5|10|20)
var sizes.stone (pebble|stone|small rock|large rock|boulder)
var volumes.stone (1|2|3|4|5)
var metal.materiallist (nickel|tin|covellite|silver|iron|zinc|copper|lead|oravir|coal) (\w+)
var stone.materiallist (alabaster|andesite|basalt|breccia|dolomite|gabbro|granite|jade|limestone|marble|obsidian|onyx|pumice|quartzite|sandstone|schist|serpentine|soapstone|travertine) (\w+)
var Rare.MetalList (animite|audrualm|damite|darkstone|electrum|glaes|gold|haralun|kertig|lumium|niniam|muracite|platinum) (\w+)
## Metal Keeplist with rares added.
eval MaterialKeepList.metal replacere("%MaterialKeepList.metal", "\)", "|animite|audrualm|damite|darkstone|electrum|glaes|gold|haralun|kertig|lumium|niniam|muracite|platinum)")

############################################################################
##Miner script overrides.

if_1 then 
	{
	var this.mat 0
	var override.mats %1
	var mine.stone 0
	var mine.metal 0
	var MaterialKeepList.metal
	var MaterialKeepList.stone
	eval override.count count("%override.mats","|")
	goto Parse.Override
	}
goto Triggers

Parse.Override:
	if matchre("%override.mats(%this.mat)","alabaster|andesite|basalt|breccia|dolomite|gabbro|granite|jade|limestone|marble|obsidian|onyx|pumice|quartzite|sandstone|schist|serpentine|soapstone|travertine") then
		{
		var mine.stone 1
		var MaterialKeepList.stone %MaterialKeepList.stone|%override.mats(%this.mat)
		}
	if matchre("%override.mats(%this.mat)","nickel|tin|covellite|silver|iron|zinc|copper|lead|oravir|coal") then
		{
		var mine.metal 1
		var MaterialKeepList.metal %MaterialKeepList.metal|%override.mats(%this.mat)
		}
	if %this.mat < %override.count then
		{
		math this.mat add 1
		goto Parse.Override
	  }
	eval MaterialKeepList.stone replacere("%MaterialKeepList.stone","^\|","")
	eval MaterialKeepList.metal replacere("%MaterialKeepList.metal","^\|","")
	var MaterialKeepList.stone (%MaterialKeepList.stone)
	var MaterialKeepList.metal (%MaterialKeepList.metal|animite|audrualm|damite|darkstone|electrum|glaes|gold|haralun|kertig|lumium|niniam|muracite|platinum)

############################################################################
###Trigger setup
Triggers:
# If roundtime wasn't up try sending the last command again.
action (Retry) pause, put $lastcommand when ...wait
action put #queue clear;put #send 1 $lastcommand when ^Sorry,|^\.\.\.wait|that while entangled in a web\.$

# Check if we find anything when mining
action (Mining) var FoundStone 1 when topples free\.
action (Mining) var FoundStone 1;var FoundMetal 1 when are visible on the ground\.
action (Mining) var FoundMetal 1 when falls to the ground\!

# Catch what we have mined and update totals.
action var stone.type $1;var result.type.stone $2;math TotalStone add 1;math minesuccess add 1 when %stone.materiallist (and|topples)
action var regular.metal.type $1;var result.type.metal $2;math TotalMetal add 1;math minesuccess add 1 when %metal.materiallist (falls|are)
action var rare.metal.type $1;math rare.found add 1 when %Rare.MetalList (falls|are)

# Update the amount of material left in the room when prospecting.
action (Prospect) var MaterialLevel 6 when enormous quantity remains to be found
action (Prospect) var MaterialLevel 5 when substantial quantity remains to be found
action (Prospect) var MaterialLevel 4 when good quantity remains to be found
action (Prospect) var MaterialLevel 3 when decent quantity remains to be found
action (Prospect) var MaterialLevel 2 when small quantity remains to be found
action (Prospect) var MaterialLevel 1 when scattering of resources remains to be found
action (Prospect) var MaterialLevel 0 when not suitable for mining

# Prospecting checks.
action (Prospect) var CarefulDone 1 when (shows the location of additional resources|pocket of hidden resources|no additional resources)

# Tool checks.
action (toolcheck) var have.pick 1;var stow.pickaxe $1 when tap a .* pickaxe .*inside your (\S+|\S+\s+\w+)\.$
action (toolcheck) var have.shovel 1;var stow.shovel $1 when tap a .* shovel .*inside your (\S+|\S+\s+\w+)\.$
action (toolcheck) var have.shovel 1;var is.tied 1 when tap a .* shovel .*atop your .* belt\.$

action (analyze) var tool $1 when analyze .* of the \S+ (\w+)
action (analyze) var condition.%tool $1 $2 when (pristine|mint|good|scuffed|minor|unsightly|badly|practically) (condition|up|scratches|notches|damaged|destroyed)
action (analyze) var condition.%tool $1 and $2 when (dents|scratched) and (dings|notched)

# Checks for deeds, miners and coins.
action (Prospect) var miners.present 1 when ^Miners stand ready
action (deedcheck) var have.deeds 1 when ^You tap a .* packet
action (deedcheck) var have.deeds 0;send tap my deed pack when deed packet appears out of deeds
action (coincheck) var need.coins 1 when you lack the money

# Collected volume counting.
action (volume) var this.size.stone $2 when %stone.materiallist (topples|and)
action (volume) var this.size.metal $1 when (\w+) %metal.materiallist (falls|are)
action (volume) var this.size.rare $1 when (\w+) %Rare.MetalList (falls|are)

############################################################################

Main:
	action (toolcheck) on
	action (deedcheck) on
	pause 1
	send tap my pick
	pause 1
	send tap my shovel
	pause 1
	if %mine.stone then send tap my deed pack
	pause 1
	if !%have.pick then
		{
		if !%have.shovel then
			{
			echo You need a pick or a shovel to mine with.
			echo Exiting script.
			exit
			}
		}
	action (deedcheck) off
	action (toolcheck) off
	action (Retry) off
	var CarefulDone 0
	pause 1
	if %mine.stone then
		{
		if %have.shovel then
			{
			if %is.tied = 1 then
				{
				send untie my shovel
				gosub Prospect
				} else{
				send get my shovel
				gosub Prospect
				}
			}
		}
	if !%have.pick then
		{
		if %is.tied = 1 then send untie my shovel
		else send get my shovel
		gosub Prospect
		}
	send get my pick
	gosub Prospect
	
MainLoop:
	if %MaterialLevel > 0 then
		{
		gosub Mine
		}
	else
		{
		if ( %MineFailure > 3 ) then
			{
			gosub Prospect
			}
		else
			{
			gosub Mine
			}
		}
	goto MainLoop
	

Prospect:
	var MineFailure 0
	action (Prospect) on
	action (Retry) on
	matchre ProspectContinue Studying the geology 
	matchre Prospect this area contains mineable resources
	matchre RoomEmpty Roundtime\:|not suitable
	send prospect
	matchwait

ProspectContinue:
	pause
	pause 1
	action (Prospect) off
	action (Retry) off
	goto mine

# Perform mine action
Mine:
	action (Mining) on
	action (Retry) on
	if %volume.track then action (volume) on
	var FoundStone 0
	var FoundMetal 0
	pause 1
	put mine
	waitforre Roundtime
	action (Mining) off
	action (Retry) off
	if %volume.track then action (volume) off
  gosub Danger
	if %FoundStone = 1 then
		{
		var MineFailure 0
		if %volume.track then gosub volume.add stone
		if %mine.stone then gosub Mine.Found stone
		}
	if %FoundMetal = 1 then
		{
		var MineFailure 0
		pause .5
		if matchre("$roomobjs", "%Rare.MetalList") then
			{
			if %volume.track then gosub volume.add rare
			}
		else
			{
			if %volume.track then gosub volume.add metal
			}
		if %mine.metal then gosub Mine.Found metal
		}
	else
		{
		math MineFailure add 1
		}
	if %MineFailure > 4 then gosub prospect
	goto mine

Mine.Found:
	var type $1
	if $righthandnoun = pickaxe then
		{
		if !%analyzed.pick then
			{
			action (analyze) on
			pause 1
			send analyze pick
			waitforre Roundtime
			var analyzed.pick 1
			action (analyze) off
			if %have.shovel then
				{
				send stow pick in my %stow.pickaxe
				pause 1
				if %is.tied = 1 then send untie my shovel
				else send get my shovel
				pause 1
				}
			}
		}
	gosub Collect
	return

## Collect items.
Collect:
	if matchre("$roomobjs", "%MaterialKeepList.%type (\w+)") then
		{
		if matchre("$roomobjs", "%Rare.MetalList") then
			{
			var rare.form $2
			send get %rare.form
			waitforre ^You pick up
			send stow %rare.form in my %mat.stow
			waitforre ^You put
			if matchre("$roomobjs", "%MaterialKeepList.%type (\w+)") then
				{
				goto Collect
				}
			return
			}
		if %mine.%type then
			{
			if %type = stone then
				{
				if matchre("%result.type.%type", "%StoneDeed") then
					{
					if %have.deeds then
						{
						action (deedcheck) on
						send get my deed pack
						send push %result.type.%type with pack
						pause 1
						action (deedcheck) off
						if %have.deeds then
							{
							send stow pack in my %mat.stow
							pause 1
							send get deed
							waitforre ^You pick up
							send stow deed in my %mat.stow
							}
						else
							{
							send stow deed in my %mat.stow
							}
						waitforre ^You put
						math deeds add 1
						if matchre("$roomobjs", "%MaterialKeepList.%type (\w+)") then
							{
							var result.type.%type $2
							goto Collect
							}
						return
						}
					if %miners.present then
						{
						if !%need.coins then
							{
							action (coincheck) on
							send push %result.type.%type
							pause 1
							action (coincheck) off
							if !%need.coins then
								{
								math deeds add 1
								send stow deed in my %mat.stow
								waitforre ^You put
								if matchre("$roomobjs", "%MaterialKeepList.%type (\w+)") then
									{
									var result.type.%type $2
									goto Collect
									}
								return
								}
							}
						if !%warn.once then
							{
							echo No coins and no deeds. Can't collect the %stone.type %result.type.%type.
							var warn.once 1
							}
						}
					if !%warn.once then
						{
						echo No deeds and no miners. Can't collect the %stone.type %result.type.%type.
						var warn.once 1
						}
					return
					}
				}
			action (Retry) on
			action (volume) on
			send take %result.type.%type
			waitforre ^You pick up
			send stow %result.type.%type in my %mat.stow
			waitforre ^You put
			action (Retry) off
			pause 1
			if matchre("$roomobjs", "%MaterialKeepList.%type (\w+)") then
				{
				var result.type.%type $2
				goto Collect
				}
			return
			}
		}
	return
	
Volume.Add:
	var type $1
	if %this.size.%type = rock then
		{
		action (taprock) on
		action (taprock) var this.size.%type $1 rock when ^You tap a (\w+)
		pause 1
		send tap %stone.type rock
		pause 1
		action (taprock) off
		}
	gosub parse.array "%sizes.%type" "%this.size.%type"
	eval this.volume element("%volumes.%type", "%array.index")
	math volume.found.%type add %this.volume
	return

Danger:
	action (Prospect) on
	matchre Danger Unfortunately\, you are unable to find any way around the instability in the geology\.
	matchre dangerclean adjusting the angle of mining
	matchre RETURN You scan the area for danger and find nothing of concern lurking within the nearby geology\.
	put prospect danger
	matchwait
	
DangerClean:
	put #queue clear
	pause
	if %FoundStone = 1 then
		{
		if %volume.track then gosub volume.add stone
		gosub Collect stone
		}
	if %FoundMetal = 1 then
		{
		if matchre("$roomobjs", "%Rare.MetalList") then if %volume.track then gosub volume.add rare
		else
			{
			if %volume.track then gosub volume.add metal
			}
		gosub Collect metal
		}
	goto prospect

RoomEmpty:
	if %MaterialLevel = 0 then
		{
		Echo Room not minable.
		} else {
		if !%CarefulDone then
			{
			action (prospect) on
			send prospect careful
			pause
			pause 1
			action (prospect) off
			goto prospect
			}
		}
	if %minesuccess > 0 then
		{
		evalmath total.volume %volume.found.stone + %volume.found.metal + %volume.found.rare
		action (analyze) on
		pause 1
		send analyze shovel
		waitforre Roundtime
		if %is.tied = 1 then send tie shovel to my forger's belt
		else send stow shovel in my %stow.shovel
		action (analyze) off
		pause 1
		if %mine.stone then 
			{
			echo ===Stone type: %stone.type
			echo ===Total stone mined: %TotalStone
			if %volume.track then echo ===Total stone volume: %volume.found.stone
			if %deeds > 0 then echo ===Total stone deeded: %deeds
			}
		if %mine.metal then
			{
			echo ===Metal type: %regular.metal.type
			echo ===Total metal mined: %TotalMetal
			if %volume.track then echo ===Total metal volume: %volume.found.metal
			}
		echo ===Total material mined (inclusive): %minesuccess
		if %volume.track then echo ===Total volume mined (inclusive): %total.volume
		if %mine.stone then
			{ 
			if !%have.shovel then echo ===Pick condition: %condition.pickaxe
			}
		else
			{
			if %have.pick then echo ===Pick condition: %condition.pickaxe
			}
		if %have.shovel then echo ===Shovel condition: %condition.shovel
		if %rare.found > 0 then
			{
			echo ===Rare type: %rare.metal.type
			echo ===Total rare: %rare.found
			echo ===Total rare volume: %volume.found.rare
			}
		}
	if !($righthand = Empty) then 
		{
		if %is.tied = 1 then send tie my shov to my forger's belt
		else send stow $righthandnoun in %stow.$righthandnoun
		}
	put #parse MINING FINISHED
	exit

RETURN:
	return
	
exit
var array.index

parse.array:
	var this.array $1
	var search.str $2
	eval this.array tolower("%this.array")
	eval this.array replacere("%this.array", "\(|\)", "")
	eval search.str tolower("%search.str")
	if !matchre("%this.array", "(.*(?:\||^)%search.str)(?:\||$)") then
		{
		var array.index Null
		echo String %search.str does not exist in array.
		}
	else
		{
		var substring_element $1
		eval array.index count("%substring_element","|")
		}
	return
