#MasterCraft - by the player of Jaervin Ividen
# A crafting script suite...
#v 0.1.6
#
# Script Usage: .spin			--spins thread with a wheel or distaff
#
#   Place material on wheel or distaff, adjust your thickness, then start script.
#

var spinner wheel
action var Action push when Slowly the fiber bundle begins to slide down the|One half of the fiber bundle begins to slip from the 
action var Action clean when The spun thread begins taking on a dull shade from grime trapped in the fiber.
action var Action turn when Individual strands of the fiber begin twisting apart unevenly|A counter-twist in the fiber strand threatens to unravel if not corrected
action var Action spin when ^clean wheel|^push wheel|^turn wheel|^clean distaff|^push distaff|^turn distaff
action goto Distaff when ^What were you referring to\?
action goto Retry when \.\.\.wait|type ahead
action goto End when You tie off the 

Spin:
	var Action spin
	goto Action

Action:
	save %Action
	send %Action %spinner
	waitforre ^Roundtime:
	goto Action

Retry:
	pause 1
	var Action %s
	goto Action

Distaff:
	var Action %s
	var spinner distaff
	goto Action

End:
	put #parse SPINNING DONE
	exit