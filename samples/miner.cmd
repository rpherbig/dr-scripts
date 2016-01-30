#Auto-mining Script v0.5
#
#Auto-searches rooms to mine for specified resource.
#
#Associated Globals:
#PREMIUM - YES/NO (do you have a premium account?)
#MINER_ENEMY - OFF/ON (do you want to mine in rooms where there may be enemies?)
#MINER_SWIM  - OFF/ON (do you want to try to swim to rooms?)
#MINER_CLIMB - OFF/ON (do you want to try to climb to rooms?)
#MINER_CYCLE - Value of time in second to wait for nodes to cycle if you haven't found what you're looking for.
#
#Movement uses Automapper. This may get you stuck on Swim/Climb rooms if you don't have enough Athletics.
#Mining is done utilizing the 'mining.cmd' script, you must have this in your script folders in order for this to
#work properly.
#The miner relies on your ability to effectively see what type of material is available in a room. You need
#sufficient skill in Outdoorsmanship and Perception for this to be consistent otherwise the script will skip rooms.
#
#
#Version History
# v0.1 : Initial script release, support for Wicked Burrow Mine only.
# v0.2 : Added in Abandoned Mine and Lairocott Branch Mine. Added in capability to change which rooms
#				 are searched by altering globals during run-time.
# v0.3 : Fixed issues with the Abandoned Mine variables. Fixed and added in the rooms for the Riverhaven
#				 mine. Credit to Extalis.
# v0.4 : Fixed an issue where the leading list separator wasn't being removed from the 'Rooms' before
#        evaluating the room count. Credit to Extalis.
# v0.5 : Fixed an issue with material type changes where the script would restart when finding a rare material.
#

#debug 10

##Room Lists
#Too add a mine's rooms, use the following format (for zone names that have a space, replace the space with a period).
#If zones don't have a room of a specific type, give that type a value of 'NONE'.
#
#var <zonename>.Rooms -> Basic rooms available to all with no other special conditions.
#var <zonename>.Rooms.Prem -> Rooms available only to Estate Holders (Premium).
#var <zonename>.Rooms.Enemy -> Rooms that have enemies associated with them.
#var <zonename>.Rooms.Swim -> Rooms that need Athetics for swimming to be accessed.
#var <zonename>.Rooms.Climb -> Rooms that need Athletics for climbing to be accessed.
#var <zonename>.Room.Cycle -> Room to wait in while the nodes cycle.
#

##Dirge##
var Dirge.Rooms 132|133|134|135|137|138|139|140|141|142|143
var Dirge.Rooms.Prem 154|155|156|157|158|159|161|160
var Dirge.Rooms.Enemy 145|146|147|148|149|150|151|152|153
var Dirge.Rooms.Swim 144|163|164|165|166|167|168|169|170|171|172|173|174
var Dirge.Rooms.Climb NONE
var Dirge.Room.Cycle 136

##Abandoned Mine and Lairocott Brach##
var Abandoned.Mine.and.Lairocott.Brach.Rooms
var Abandoned.Mine.and.Lairocott.Brach.Rooms.Prem NONE
var Abandoned.Mine.and.Lairocott.Brach.Rooms.Enemy 35|34|33|36|37|38|39|41|42|43|44|45|46|47|48|49|62|59|56|53|52|29
var Abandoned.Mine.and.Lairocott.Brach.Rooms.Swim NONE
var Abandoned.Mine.and.Lairocott.Brach.Rooms.Climb NONE
var Abandoned.Mine.and.Lairocott.Brach.Room.Cycle 32

##Dusk Ogre Tunnels##
var Riverhaven.West.Gate.Rooms
var Riverhaven.West.Gate.Rooms.Prem NONE
var Riverhaven.West.Gate.Rooms.Enemy 44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59|61|62|63|64|65|66|67|68|69|70|71|72|73
var Riverhaven.West.Gate.Rooms.Swim NONE
var Riverhaven.West.Gate.Room.Climb NONE
var Riverhaven.West.Gate.Room.Cycle 32

##Variables##
var Rare.MetalList animite|audrualm|damite|darkstone|electrum|glaes|gold|haralun|kertig|lumium|niniam|muracite|platinum
var mat.type %1|%Rare.MetalList
var this.room 0
var is.mat 0
var have.mined 0
var Room.Count 0
var prev.count 0

action (miner) var is.mat 1;var have.mined 1;var found.type $1 when (%mat.type) can be mined here\.$
action (mining) put #script mining.cmd stop;put #parse MATERIAL CHANGE when eval !matchre("%found.type","%mat.type")
action (mining) off
action goto Restart when ^MATERIAL CHANGE

if_1 then goto Check.List

echo Usage is: .miner <material type>
exit

##Script Start##
Check.List:
	eval zonename replacere("$zonename"," ",".")
	var Rooms %%zonename.Rooms
	if ("$PREMIUM" = "YES"  && "%%zonename.Rooms.Prem" != "NONE") then var Rooms %Rooms|%%zonename.Rooms.Prem
	if ("$MINER_ENEMY" = "ON" && "%%zonename.Rooms.Enemy" != "NONE") then var Rooms %Rooms|%%zonename.Rooms.Enemy
	if ("$MINER_SWIM" = "ON" && "%%zonename.Rooms.Swim" != "NONE") then var Rooms %Rooms|%%zonename.Rooms.Swim
	if ("$MINER_CLIMB" = "ON" && "%%zonename.Rooms.Climb" != "NONE") then var Rooms %Rooms.%%zonename.Rooms.Climb
	eval Rooms replacere("%Rooms","^\|","")
	eval Room.Count count("%Rooms","|")math Room.Count add 1
	if %Room.Count > %prev.count then goto Check.Room
	goto Cycle.Rooms
	
Check.Room:
	if (%this.room < %Room.Count && %have.mined = 0) then
		{
		gosub Next.Room
		goto Prospect
		}
	if (%this.room = %Room.Count && %have.mined = 0) then
		{
		var prev.count %Room.Count
		goto Check.List
		}
	if %have.mined = 1 then goto Check.More

Cycle.Rooms:
	var this.room 0
	put #goto %%zonename.Room.Cycle
	pause $MINER_CYCLE
	goto Check.Room
		
Next.Room:
	put #goto %Rooms(%this.room)
	waitforre ^YOU HAVE ARRIVED
	math this.room add 1
	return
	
Prospect:
	if "$roomplayers" = "" then
		{
		send pros
		pause
		if %is.mat = 1 then goto Mine.It
		}
	goto Check.Room

Mine.It:
	action (mining) on
	put .mining %mat.type
	waitforre ^MINING FINISHED
	action (mining) off
	goto Check.More

Check.More:
	if matchre("%found.type","%Rare.MetalList") then
		{
		echo This room was a rare vein of type: %found.type. Restarting script.
		goto Restart
		}
	matchre Restart ^You nod\.$
	matchre Done ^You shake your head\.$
	echo Do you want to mine more?
	echo Put 'nod' for yes or 'shake head' for no.
	matchwait
	
Restart:
	echo Mining again.
	var this.room 0
	var have.mined 0
	var is.mat 0
	goto Check.Room
	
Done:
	echo Finished mining.
	exit
