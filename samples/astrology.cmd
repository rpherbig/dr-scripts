## Astrology script by Haldrik 2010, 2012, revised in 2015
## Observe list, change to whichever constellations you want to observe
## This script is an included and standalone version.  Use %1 standalone.
#debuglevel 10

if "%1" = "standalone" then 
	{
	gosub routinecommon
		var castcamb 1
		var docharge 20
		var resonance roomrecovery
		var globalexp 33
	}

astro.initialize:
	setvar obs.list forge|er'qutra|dawgolesh|amlothi|morleena|welkin|merewalda|shark|durgaulda|brigantine|archer|toad|spider|raccoon|triquetra|magpie|wolverine|panther|yavash|xibar|katamba
	setvar day.obs.list dawgolesh|er'qutra|morleena|amlothi|merewalda|yavash|sun
	
	setvar def.list forge|dawgolesh|morleena|merewalda|welkin|toad|magpie|katamba
	setvar mag.list dawgolesh|amlothi|durgaulda|shrike|spider|yavash
	setvar lor.list forge|amlothi|brigantine|shrike|welkin|xibar
	setvar off.list forge|er'qutra|merewalda|triquetra|archer|raccoon|shark|wolverine|panther|sun
	setvar sur.list er'qutra|morleena|shrike|welkin|triquetra|durgaulda|brigantine|archer|toad|spider|raccoon|magpie|shark|wolverine|panther|sun|yavash

	action (astro) off
	action (astro) var redo 1 when ^You have not pondered
	action (astro) var fruit 1 when You peer at .+ panther|is too close to the sun to be properly viewed.
	action (astro) var fruit 1 when turns up fruitless.|foiled by the darkness\.
	action (astro) var cloud 1 when ^Clouds obscure the sky|^You see nothing regarding the future.
	action (astro) var skull 1;put #var stunned 1 when ^Suddenly your mind receives
	action (astro) var voicedone 1 when ^You sense the visions|^You see nothing|^You have not seen|^Suddenly
	action (astro) astrotime 99999 when ^You feel you have sufficiently pondered your latest observation.
	
	var astrobraid 0
	var tool mirror
if "%1" != "standalone" then goto astroend
		
astrotrain:
	action (astro) on
	var obs.list forge|er'qutra|dawgolesh|morleena|welkin|merewalda|amlothi|shark|durgaulda|brigantine|archer|toad|spider|raccoon|triquetra|magpie|wolverine|panther|yavash|xibar|katamba
	var astrotime 0
	var predanal 0
	setvar center 0
	setvar c 0
	setvar redo 0
	setvar cloud 0
	setvar pred.list
	var collect rock
	
	if "%Aura" = "off" then
	{
		gosub castbuff "Aura Sight" 30 99 20
		gosub spelldelay
	}
	if "%Clear" = "off" then
	{
		gosub castbuff "Clear Vision" 30 97 20
		gosub spelldelay
	}
	if "%Piercing" = "0" then
	{
		gosub castbuff "Piercing Gaze" 30 102 20
		gosub spelldelay
	}
	gosub emptyhands
	gosub get my telescope

## Finding a visible constellation
center:
	if $Time.isDay = 1 then var obs.list %day.obs.list
	setvar fruit 0
	gosub put.1 "center my tele on %obs.list(%c)" "^You put your eye"
	delay .5
	if %fruit = 1 then 
	{	
		math c add 1
		goto center
	}
	goto const

delay.obs:
	var redo 0
	gosub startcollect 1
	gosub put.1 "get my telescope" ".+"
	goto center

## Constellation found
const:
	var vis %obs.list(%c)
peer:
	var astrocounter 0
	gosub put.1 "peer my telescope" "^Roundtime:|^You peer"
	if %redo = 1 then goto delay.obs
	if ((%cloud = 1) && ("%Piercing" = "off")) then gosub castpg
	if %cloud = 1 then
	{
		setvar cloud 0
		goto peer
	}
	gosub put.1  "put my telescope in my tube" "^You put"
	put #var last.peer $gametime
	
## Calculating available pools for prediction
	if matchre("%vis",	"%off.list") then setvar pred.list %pred.list|offense
	if matchre("%vis", "%sur.list") then setvar pred.list %pred.list|survival
	if matchre("%vis", "%def.list") then setvar pred.list %pred.list|defense
	if matchre("%vis", "%mag.list") then setvar pred.list %pred.list|magic
	if matchre("%vis", "%lor.list") then setvar pred.list %pred.list|lore
	eval pred.size count("%pred.list", "|")

## Predicting with tools
	setvar c 1
	if "%tool" != "voice" then gosub get my %tool from my bag

align:
	#if "%tool" = "voice" then goto %tool
	gosub put.1 "align %pred.list(%c)" "^Roundtime"
	goto %tool

deck:
	gosub put shuffle deck
	gosub put cut deck 
	gosub put deal deck 3
	waitforre ^You collect the cards 
	gosub pause 1
	goto tool.end
 
bones:
	if "%humming" = "yes" then gosub put.1 "stop play" ".+"
	gosub put.1 "rub my bone" "^You run your fingers"
	gosub put.1 "throw my bones at stoh" "^Roundtime:|^You scoop"
	goto tool.end

mirror:
	gosub put.1 "gaze mirror" "^Roundtime"
	goto tool.end

voice:
	debuglevel 10
	var voicedone 0
	gosub put.1 "predict future stoh %pred.list(%c)" "^Roundtime"
	if %skull = 1 then goto skull.loop
	goto tool.end

voice.loop:
	gosub pause 5
	if %voicedone = 0 then goto voice.loop
	if %skull = 1 then goto skull.loop
	goto tool.end
	
skull.loop:
	var skull 0
	gosub pause 5
	if $stunned = 1 then goto skull.loop
	gosub put.1 "dance silly" "^You are still|^You leap"
	goto tool.end
	
tool.end:
	#debuglevel 0
	math c add 1
	if %c <= %pred.size then goto align
	put #var last.anal $gametime
	if %astrobraid = 0 then gosub put.1 "pred anal" "^Roundtime"
	if "%tool" != "voice" then gosub stow %tool
	
## Timer for predict analyze and predictions
timer:
	evalmath astrotime ($gametime - $last.peer)
	echo %astrotime
	if %astrotime > 180 then goto astrotrain
	if %astrobraid = 1 then
	{
		if %astroreturn = 1 then goto braidcont
			else gosub m.input braid grass dgd bin astro
		if "%1" != "standalone" then goto astroend
	}
	else
	{
		evalmath predanal ($gametime - $last.anal)
		echo %predanal
		if %predanal > 90 then
		{
			put #var last.anal $gametime
			gosub put.1 "predict anal"
		}
		if $Astrology.LearningRate > %globalexp then
		{
			if "%1" != "standalone" then goto astroend
			else exit
		}
		gosub ppcheck
		gosub startcollect 1
		goto timer
	}
astroend:
	action (astro) off
return
		
castpg:
	gosub prep pg 10
	gosub pause 5
	gosub cast
return

day:
	var obs.list %day.obs.list
	#eval obs.max count("%obs.list", "|")
	setvar day.adjust 1
	#setvar c %obs.max
	var c 0
	goto center
	
	
#if "%1" = "standalone" then include routinecommon.cmd