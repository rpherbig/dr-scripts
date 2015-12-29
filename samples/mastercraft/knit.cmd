#MasterCraft - by the player of Jaervin Ividen
# A crafting script suite...
#v 0.1.6
#
# Script Usage: .knit <item>					--knits the item
#				.knit <item> <no. of times>		--to knit more than one, assuming you have enough material
#
#   This script is used in conjunction with the mastercraft.cmd script, and is used to produce knitted items with needles and yarn. To use it,
#	hold the material to be used, study your instructions, then start the script. Be sure to have knitting needles in your outfitting bag, as
#	well as any parts to be assembled. If you have a Maker's Mark, be sure that it is also on you if your character profile in MC INCLUDE.cmd
#	is toggled to mark items.
#
#	If you have an unfinished item on your needles, this script will try to finish it for you.
#

var sew.repeat 0
if_2 var sew.repeat %2
if_1 put #var MC.order.noun %1
include mc_include.cmd


action var Action knit when ^push my needle|^turn my needle|^cast my needle|^knit my needle|^The .* need of more knitting
action var Action push when addition of some purl stitching|some purl stitches|^Some purl stitching
action var Action turn when add some ribbing|Some ribbing should be added|so ribbing can be added to the knitting process
action var Action cast when be cast off the needles
action (work) goto Retry when \.\.\.wait|type ahead
action goto done when ^Applying the final touches
action (work) off

if contains("$righthandnoun", "knitting needle") then send swap
pause .5
if !contains("$lefthandnoun", "knitting needle") then
	{
	 if contains("$lefthandnoun", "yarn") then send swap
	 if "$lefthandnoun" != "" then send put my $lefthandnoun in my %outfitting.storage
	 send get knitt need from my %outfitting.storage
	 waitforre ^You get
	}

unfinished:
	send look on my needle
	waitforre ^The knitting needles (.*)\.$
	pause 1
	if contains("$0", "unfinished") then
	{
	send analyze my needle
	waitforre ^You.*analyze
	if !contains("$lefthandnoun", "needle") then send swap
	pause 1
	goto Action
	}

first.cut:
	 var Action knit
	 matchre excess You carefully cut off the excess
	 matchre Action Roundtime: \d+
	 send knit my yarn with my needle
	matchwait

excess:
	 send put my yarn in my %outfitting.storage
	waitforre ^You put
	
Action:
	action (work) on
	save %Action
	send %Action my needle
	waitforre ^Roundtime:
	goto Action

Retry:
	pause 1
	var Action %s
	goto Action

repeat:
	math sew.repeat subtract 1
	send put my $MC.order.noun in my %outfitting.storage
	waitforre ^You put
	send get my tailor book
	send study my book
	waitforre Roundtime
	send put my book in my %outfitting.storage
	send get my yarn
	waitforre ^You get
	goto first.cut

done:
	 gosub mark
	 if %sew.repeat > 1 then goto repeat
	send put my needle in my %outfitting.storage
	waitforre ^You put
	put #parse KNITTING DONE
	exit