#MasterCraft - by the player of Jaervin Ividen
# A crafting script suite...
#v 0.1.6
#
# Script Usage: .grind <item>			--grinds the item in hand.
#
#   This script is used in conjunction with the mastercraft.cmd script, and is used to grind weapons at a grindstone. To use it, hold the
#	item to be processed in either hand, and be sure to have oil in your forging bag. If you have a Maker's Mark, be sure that it is also
#	on you if your character profile in MC INCLUDE.cmd is toggled to mark items.
#

if_1 put #var $MC.order.noun %1
include mc_include.cmd


action var action turn when ^It seems to be picking up speed now but is still rather slow.|^Straining a bit less you add force to the grindstone, making it spin even faster
action var action push when ^Straining a bit less you maintain force to the grindstone, keeping it spinning fast.
action var action oil when ^With grinding complete, the metal now needs protection by pouring oil on it.
action var action Done when Applying the final touches, you complete working

if "$lefthandnoun" != "$MC.order.noun" && "$righthandnoun" != "$MC.order.noun" then
	{
	 send put $lefthandnoun in my %forging.storage
	 send put $righthandnoun in my %forging.storage
	 pause .5
	 send get $MC.order.noun
	}

pause .5	
	var action turn
	
Action:
	pause .5
	gosub %action
	goto Action

turn:
	pause .5
	send turn grindstone
	return

push:
	pause .5
	send push grindstone with my $MC.order.noun
	return

oil:
	pause .5
	 send get my oil
	 send pour my oil on my $MC.order.noun
	 pause .5
	return

lack.coin:
	 if contains("$scriptlist", "mastercraft.cmd") then put #parse LACK COIN
	 else echo *** You need some startup coin to purchase stuff! Go to the bank and try again!
	exit

done:
	pause .5
	 send put my oil in my %forging.storage
	 gosub mark
	 pause .5
	 send #parse GRINDING DONE
	exit