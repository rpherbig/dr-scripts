#MasterCraft - by the player of Jaervin Ividen
# A crafting script suite...
#v 0.1.6
#
# Script Usage: .sew <item>						--sews the item
#				.sew <item> <no. of times>		--to sew more than one, assuming you have enough material
#
#   This script is used in conjunction with the mastercraft.cmd script, and is used to produce cloth and leather items. To use it, hold the
#	material to be used, study your instructions, then start the script. Be sure to have all the relevant tailoring tools in your outfitting bag,
#	as well as any parts to be assembled. If you have a Maker's Mark, be sure that it is also on you if your character profile in MC INCLUDE.cmd
#	is toggled to mark items.
#
#	If you are holding an unfinished item instead, this script will try to finish it for you.
#

var sew.repeat 0
var current.lore Outfitting
if_2 var sew.repeat %2
if_1 put #var MC.order.noun %1
var tool needle
var pins.gone 0
include mc_include.cmd


action var tool yardstick when could benefit from some remeasuring.*|be benefited by remeasuring
action var tool scissors when now it is time to cut away more of the \S+ with scissors.*|appears ready for further cutting with some scissors.
action var tool pins when could use some pins to.*|is in need of pinning
action var tool slickstone when ^A deep crease develops along the fabric.*|The fabric develops wrinkles from.*|RUB
action var tool awl when needs holes punched.*|requires some holes punched
action var tool assemble when ASSEMBLE Ingredient1 WITH Ingredient2
action var tool done when Applying the final touches, you complete working
action var tool needle when ^measure my \S+ with my yardstick|^rub my \S+ with my slickstone|poke my \S+ with my pins|^poke my \S+ with my awl|^cut my \S+ with my scissors|pushing it with a needle and thread
action (work) goto Retry when \.\.\.wait|type ahead
action (work) off

action (order) var thread.order $1 when (\d+)\)\..*yards of cotton thread.*(Lirums|Kronars|Dokoras)
action (order) var pins.order $1 when (\d+)\)\..*some straight iron pins.*(Lirums|Kronars|Dokoras)
action var pins.gone 1 when ^The pins is all used up, so you toss it away.
action var thread.gone 1 when ^The last of your thread is used up with the sewing.|^The needles need to have thread put on them
action (order) off

action var assemble $1 padding when another finished (small|large) cloth padding 
action var assemble $1 when another finished \S+ shield (handle)
action var assemble $1 $2 when another finished (long|short|small|large) leather (cord|backing)

unfinished:
	send glance
	waitforre ^You glance down (.*)\.$
	pause 1
	if contains("$0", "unfinished") then
	{
		send analyze my $MC.order.noun
		waitforre ^You.*analyze
		if !contains("$righthandnoun", "$MC.order.noun") then send swap
		pause 1
		goto work
	}

first.cut:
	if (contains("$righthandnoun", "cloth") || contains("$lefthandnoun", "cloth")) then var material cloth
	if (contains("$righthandnoun", "leather") || contains("$lefthandnoun", "leather")) then var material leather
	pause 1
	if !contains("leather|cloth", "$righthandnoun") then send swap
	pause 1
 	if !contains("$lefthandnoun", "scissors") then
	{
		if "$lefthandnoun" != "" then send put my $lefthandnoun in my %outfitting.storage
		send get my scissors
		waitforre ^You get
	}
	matchre excess You carefully cut off the excess material and set it on the ground.
	matchre work Roundtime: \d+
	send cut my %material with my scissor
	matchwait

excess:
	pause 1
	if "$lefthandnoun" != "" then send put my $lefthandnoun in my %outfitting.storage
	waitforre ^You put
	send get %material
	send put %material in my %outfitting.storage
	waitforre ^You put

work:
	action (work) on
	save %tool
	if "%tool" = "done" then goto done
	gosub %tool
	goto work

needle:
	if %thread.gone = 1 then gosub new.tool
	if !contains("$lefthandnoun", "needles") then
	{
		if "$lefthandnoun" != "" then send put my $lefthandnoun in my %outfitting.storage
		send get my sewing needle
		waitforre ^You get
	}
	send push my $MC.order.noun with my needle
	pause 1
	return

yardstick:
	if !contains("$lefthandnoun", "yardstick") then
	{
		if "$lefthandnoun" != "" then send put my $lefthandnoun in my %outfitting.storage
		send get my yardstick from my %outfitting.storage
		waitforre ^You get
	}
	send measure my $MC.order.noun with my yardstick
	pause 1
	return

slickstone:
	if !contains("$lefthandnoun", "slickstone") then
	{
		if "$lefthandnoun" != "" then send put my $lefthandnoun in my %outfitting.storage
		send get my slickstone
		waitforre ^You get
	}
	send rub my $MC.order.noun with my slickstone
	pause 1
	return

pins:
	if %pins.gone = 1 then gosub new.tool
	if !contains("$lefthandnoun", "pins") then
	{
		if "$lefthandnoun" != "" then send put my $lefthandnoun in my %outfitting.storage
		send get my pins
		waitforre ^You get
	}
	send poke my $MC.order.noun with my pins
	pause 1
	return
	
scissors:
	if !contains("$lefthandnoun", "scissors") then
	{
		if "$lefthandnoun" != "" then send put my $lefthandnoun in my %outfitting.storage
		send get my scissors
		waitforre ^You get
	}
	send cut my $MC.order.noun with my scissors
	pause 1
	return

awl:
	if !contains("$lefthandnoun", "awl") then
	{
		if "$lefthandnoun" != "" then send put my $lefthandnoun in my %outfitting.storage
		send get my awl
		waitforre ^You get
	}
	send poke my $MC.order.noun with my awl
	pause 1
	return
	
assemble:
	if "$lefthandnoun" != "%assemble" then
	{
		pause 1
		if "$lefthandnoun" != "" then send put my $lefthandnoun in my %outfitting.storage
		send get my %assemble
		waitforre ^You get
	}
	send assemble my $MC.order.noun with my %assemble
	pause 1
	#send analyze my $MC.order.noun
	var tool needle
	pause 1
	return

new.tool:
if contains("$scriptlist", "mastercraft.cmd") then
	{
	action (work) off
	var temp.room $roomid
	if $zoneid = 150 then var temp.room portal
	gosub check.location
	if %pins.gone = 1 then
	{
		if $zoneid = 150 then move go portal
		gosub automove %tool.room
		if !("$righthand" = "Empty" || "$lefthand" = "Empty") then send put my $MC.order.noun in my %outfitting.storage
		action (order) on
		send order
		waitfor You may purchase
		action (order) off
		gosub purchase order %pins.order
		send put my pins in my %outfitting.storage
		if "$righthandnoun" != "$MC.order.noun" && "$lefthandnoun" != "$MC.order.noun" then send get my $MC.order.noun from my %outfitting.storage
		pause .5
		var pins.gone 0
	}
	if %thread.gone = 1 then
	{
		if $zoneid = 150 then move go portal
		gosub automove %supply.room
		if !("$righthand" = "Empty" || "$lefthand" = "Empty") then send put my $MC.order.noun in my %outfitting.storage
		action (order) on
		pause 1
		send order
		waitfor You may purchase
		action (order) off
		gosub purchase order %thread.order
		pause 1
		send put my thread on my needles
		waitforre ^You carefully thread
		if "$righthandnoun" != "$MC.order.noun" && "$lefthandnoun" != "$MC.order.noun" then send get my $MC.order.noun from my %outfitting.storage
		var thread.gone 0
	}
	gosub automove %temp.room
	pause 0.5
	put go portal
	unvar temp.room
	action (work) on
	return
	}
else
{
echo *** Out of pins or thread! Go get more!
put #parse SEWING DONE
exit
} 

purchase:
	var purchase $0
	goto purchase2
purchase.p:
    pause 0.5
purchase2:
		matchre purchase.p type ahead|...wait|Just order it again
		matchre lack.coin you don't have enough coins|you don't have that much
		matchre return pay the sales clerk|takes some coins from you
		put %purchase
    matchwait

lack.coin:
	if "%get.coin" = "off" then goto lack.coin.exit
	action (withdrawl) goto lack.coin.exit when (^The clerk flips through her ledger|^The clerk tells you)
	gosub automove teller
	send withd 5 gold
	waitfor The clerk counts
	gosub automove %temp.room
	var need.coin 0
	action remove (^The clerk flips through her ledger|^The clerk tells you)
	pause 1
	goto %purchaselabel

lack.coin.exit:
	echo You need some startup coin to purchase stuff! Go to the bank and try again!
	put #parse Need coin
	exit

return:
return

Retry:
	pause 1
	var tool %s
	goto work
	
repeat:
	math sew.repeat subtract 1
	send put my $MC.order.noun in my %outfitting.storage
	waitforre ^You put
	send get my tailor book
	send study my book
	waitforre Roundtime
	send put my book in my %outfitting.storage
	send get my %material
	waitforre ^You get
	var tool needle
	goto first.cut


done:
	if %pins.gone = 1 then gosub new.tool
	if %thread.gone = 1 then gosub new.tool
	send put my $lefthandnoun in my %outfitting.storage
	wait
	gosub mark
	pause 1
	if %sew.repeat > 1 then goto repeat
	put #parse SEWING DONE
	exit