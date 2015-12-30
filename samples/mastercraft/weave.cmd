#MasterCraft - by the player of Jaervin Ividen
# A crafting script suite...
#v 0.1.6
#
# Script Usage: .weave			--weaves cloth on a loom
#
#   Place thread on loom and start script.
#

action var Action clean when dust and debris obstructing the pirn
action var Action push when and needs pushing together|and need pushing together
action var Action turn when a tight turn in the fabric|bunching up from excessive tension
action var Action weave when ^push loom|^clean loom|^turn loom|^weave loom
action goto Retry when \.\.\.wait|type ahead
action goto End when You snip off the bolt of fabric and 

Weave:
	var Action weave
	goto Action

Action:
	save %Action
	send %Action loom
	waitforre ^Roundtime:
	goto Action

Retry:
	pause 1
	var Action %s
	goto Action

End:
	put #parse WEAVING DONE
	exit