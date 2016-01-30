
include pimpminer-settings.cmd


put .pimpminerdisplay
put #setvariable keep-style stow
put #setvariable room-refresh Off

put #setvariable vit-warn 0
put #setvariable bleed-warn 0
put #setvariable autoheal 1
put #setvariable EmpathGuild 0
put #setvariable autoswapping 0
put info
     match Guild-Empath Guild: Empath
     match Guild-NonEmpath TDPs :
     matchwait
Guild-Empath:
put #setvariable EmpathGuild 1
Guild-NonEmpath:
     setvariable stuffilike gold|platinum|silver|electrum|damite|glaes|kertig|haralun|lumium|animite
      action put stand;put prospect when (You finally manage to clear away enough rubble|You peacefully awaken, feeling refreshed)
      setvariable minedout 0
     action instant setvariable stone $1 when (alabaster|andesite|basalt|breccia|dolomite|gabrro|granite|jade|limestone|marble|obsidian|onyx|pumice|quartzite|sandstone|schist|serpentine|soapstone|travertine|gabbro) can be mined here
     action instant setvariable metal $1 when (iron|copper|gold|platinum|lead|silver|electrum|damite|glaes|kertig|haralun|covellite|lumium|niniam|oravir|tin|nickel|zinc|coal|animite|muracite|darkstone) can be mined
     setvariable good-veins kertig|damite|haralun|glaes
     setvariable tools shovel|pickaxe
      setvariable room-track 0
      setvariable startup 1
      put #setvariable good-shit-found 0
      action goto exit-script when Exit Pimp Miner
      setvariable tracker 0
      action put prospect when You finally manage to clear away enough rubble to lever yourself free
      setvariable per-health-timer 0


      action setvariable repair-track 10 when (This tool looks recently cleaned and will resist damage for a time|Your excellent training in the ways of tool repair will keep this tool free from wear)
      setvariable repair-track 0

      setvariable universal-stuff kertig fist|glaes shard|kertig tear|damite lump|lumium shard|electrum nugget|platinum nugget|haralun lump|animite nugget|glaes fragment|silver nugget|gold nugget|copper nugget|tin nugget|lead nugget|nickel nugget|zinc nugget|coal nugget|iron nugget|darkstone fragment|muracite fragment|niniam fragment|niniam shard|oravir nugget|covellite nugget|alabaster stone|alabaster rock|alabaster boulder|alabaster pebble|andesite pebble|andesite stone|andesite rock|andesite boulder|basalt pebble|basalt stone|basalt rock|basalt boulder|breccia pebble|breccia stone|breccia rock|breccia boulder|dolomite pebble|dolomite stone|dolomite rock|dolomite boulder|gabbro pebble|gabbro stone|gabbro rock|gabbro boulder|granite pebble|granite rock|granite stone|granite boulder|jade pebble|jade stone|jade rock|jade boulder|limestone pebble|limestone stone|limestone rock|limestone boulder|marble pebble|marble rock|marble stone|marble boulder|obsidian pebble|obsidian stone|obsidian rock|obsidian boulder|onyx pebble|onyx rock|onyx stone|onyx boulder|pumice pebble|pumice stone|pumice rock|pumice boulder|quartzite pebble|quartzite stone|quartzite rock|quartzite boulder|sandstone pebble|sandstone stone|sandstone rock|sandstone boulder|schist pebble|schist stone|schist rock|schist boulder|serpentine pebble|serpentine stone|serpentine rock|serpentine boulder|soapstone pebble|soapstone stone|soapstone rock|soapstone boulder|travertine pebble|travertine stone|travertine rock|travertine boulder
      setvariable all-metal iron|copper|gold|platinum|lead|silver|electrum|damite|glaes|kertig|haralun|covellite|lumium|niniam|oravir|tin|nickel|zinc|coal|animite|muracite|darkstone
      setvariable all-stone alabaster|andesite|basalt|breccia|dolomite|gabrro|granite|jade|limestone|marble|obsidian|onyx|pumice|quartzite|sandstone|schist|serpentine|soapstone|travertine|gabbro
      setvariable room-track 0
      setvariable good-stuffs kertig fist|glaes shard|kertig tear|damite lump|lumium shard|electrum nugget|platinum nugget|haralun lump|animite nugget|glaes fragment|silver nugget|gold nugget

      action instant setvariable danger 1 when (Studying the geology, you are .* that continued mining will be .* dangerous|bitter smell seeps into the air|ground rumbles ominously|floor shudders briefly, causing pebbles and bits of stone to cascade to the ground)
      setvariable danger 0
      setvariable timer1 0
      setvariable timer2 0
      setvariable timer3 0
      setvariable timer4 0
      setvariable timer5 0
      setvariable timer6 0
      setvariable timer7 0
      setvariable timer8 0
      setvariable timer9 0
      setvariable priority1 kertig|glaes|haralun|damite
      setvariable priority2 platinum|gold|animite|electrum
      setvariable priority3 silver|lumium
      setvariable priority4 niniam|darkstone|muracite
     action instant setvariable careful-check 1 when scattering of resources remains to be found
     setvariable careful-check 0
     setvariable pc-room 0
put #window add Miner
put #clear Miner
      setvariable startup 1
      setvariable RoomTrack 0
      setvariable pcopt 0
      setvariable tempitem none
      setvariable ekko-track 0

     if $autoswapping = 1 then setvariable tool pickaxe
     if $autoswapping = 0 then setvariable tool shovel

put glance
     matchre glance-tool (shovel|pickaxe)
     match empty-glance You glance down at your empty hands
     matchwait
glance-tool:
     setvariable tool $1
empty-glance:

Startup:
     timer stop
     timer clear
     TIMER START
      eval RoomCount count("%RoomNumbers","|")
      math RoomCount add 1

      var invItem 0
StartupSet:
      if %invItem = %RoomCount then goto Startup.1
      eval NextRoom element("%RoomNumbers", %invItem)
put #setvariable %NextRoom Unknown|Unknown
put #setvariable time-%NextRoom 86400
put #setvariable ppl-%NextRoom 0
      math invItem add 1
      goto StartupSet
Startup.1:
     setvariable setupItem 0
     eval MetalCount count("%all-metal","|")
     math MetalCount add 1
StartSetMetal:
     if %setupItem = %MetalCount then goto Startup.2
     eval TempMetal element("%all-metal", %setupItem)
     put #setvariable %TempMetal 0
     math setupItem add 1
     goto StartSetMetal
Startup.2:
     setvariable setupItem 0
     eval StoneCount count("%all-stone","|")
     math StoneCount add 1
StartSetStone:
     if %setupItem = %StoneCount then goto Startup.3
     eval TempStone element("%all-stone", %setupItem)
     put #setvariable %TempStone 0
     math setupItem add 1
     goto StartSetStone
Startup.3:
      put #setvariable temptime %t
      put #parse EKKO STATS

      var invItem 0
StartupResources:
      if %invItem = %RoomCount then goto StartupCheck
      eval NextRoom element("%RoomNumbers", %invItem)
      gosub move %NextRoom
      gosub Prospect
      math invItem add 1
      pause 0.5
      goto StartupResources
StartupCheck:
      setvariable invItem 0
StartupRares:
      if %invItem = %RoomCount then goto StartupDone
      eval Room element("%RoomNumbers", %invItem)
      gosub StartupRaresCheck %Room
      math invItem add 1
      goto StartupRares
 StartupRaresCheck:
      if matchre("%$1","%good-veins") then gosub move %Room
      return

StartupDone:
     pause 0.5
     setvariable lasthealtime 0
put #setvariable temptime %t
     put #parse EKKO STATS
     setvariable startup 0
     setvariable perhealtimer 0
     if $EmpathGuild = 1 then setvariable perhealtimer %t
     if $EmpathGuild = 0 then put #setvariable PerHeal 86400
     if $EmpathGuild = 1 then put #setvariable PerHeal 30
     setvariable avengertimer 86400
put #setvariable AvengerSummon 0
     if $EmpathGuild = 1 then put #setvariable AvengerSummon 1
     if $EmpathGuild = 1 then setvariable avengertimer %t
     gosub verb stow my %tool
     gosub verb get my %tool
     gosub verb swap
     gosub check-room-timers
     goto mine

 mine.p:
      pause 0.5
 mine:
      setvariable pcopt 1
      setvariable check-room-timers 0
put #statusbar Room Contains [ Metal : %metal | Stone : %stone ] - - [ $good-shit-found Items Kept ] - - Current Room : $roomid
      if %tracker > 10 then setvariable tracker 0
      if matchre("$roomobjs","%stuff-to-keep") then gosub found.good $0
      if $EmpathGuild = 1 then gosub avenger-check
      if $EmpathGuild = 0 then setvariable tempperheal 0
      if $EmpathGuild = 1 then setvariable tempperheal %t
      if $EmpathGuild = 1 then math tempperheal subtract %perhealtimer
      if %tempperheal > $PerHeal then gosub verb per heal
      if %tempperheal > $PerHeal then setvariable perhealtimer %t
      setvariable timertemp %t
      if %timer1 > 0 then math timertemp subtract %timer1
      if %timer2 > 0 then if %timertemp > 300 then setvariable check-room-timers 1
      setvariable timertemp %t
      if %timer2 > 0 then math timertemp subtract %timer2
      if %timer2 > 0 then if %timertemp > 300 then setvariable check-room-timers 1
      setvariable timertemp %t
      if %timer3 > 0 then math timertemp subtract %timer3
      if %timer3 > 0 then if %timertemp > 300 then setvariable check-room-timers 1
      setvariable timertemp %t
      if %timer4 > 0 then math timertemp subtract %timer4
      if %timer4 > 0 then if %timertemp > 300 then setvariable check-room-timers 1
      setvariable timertemp %t
      if %timer5 > 0 then math timertemp subtract %timer5
      if %timer5 > 0 then if %timertemp > 300 then setvariable check-room-timers 1
      setvariable timertemp %t
      if %timer6 > 0 then math timertemp subtract %timer6
      if %timer6 > 0 then if %timertemp > 300 then setvariable check-room-timers 1
      setvariable timertemp %t
      if %timer7 > 0 then math timertemp subtract %timer7
      if %timer7 > 0 then if %timertemp > 300 then setvariable check-room-timers 1
      setvariable timertemp %t
      if %timer8 > 0 then math timertemp subtract %timer8
      if %timer8 > 0 then if %timertemp > 300 then setvariable check-room-timers 1
      setvariable timertemp %t
      if %timer9 > 0 then math timertemp subtract %timer9
      if %timer9 > 0 then if %timertemp > 300 then setvariable check-room-timers 1
      if %check-room-timers = 1 then gosub check-room-timers
      if "$room-refresh" = 15 then if %t > 900 then goto Startup
      if "$room-refresh" = 30 then if %t > 1800 then goto Startup
      if "$room-refresh" = 60 then if %t > 3600 then goto Startup
      if $standing != 1 then gosub verb stand;prospect
      if $bleeding = 1 then gosub bleeding
      if $health < 60 then gosub bleeding
      if %tracker = 0 then gosub Prospect
      math tracker add 1
      if %danger = 1 then goto danger
      setvariable tempA $roomid
      eval tempM element("$%tempA", 0)
      if "%metal" = "Empty" then gosub changerooms
      if "%tempM" = "Empty" then gosub changerooms
      if "%tempM" = "Empty" then setvariable tracker 0
      if "%tempM" = "Empty" then goto mine
 put mine
      match mine.p type ahead
      match mine.p ...wait
      match mine.p Roundtime
      matchwait
exit-script:
put #clear Miner
put #window remove Miner
put #parse EXIT DISPLAY
     exit

avenger-check:
     if $AvengerSummon = 0 then return
      setvariable tempavenger %t
      math tempavenger subtract %avengertimer
      if %avengertimer < 300 then return
      if matchre("$roomobjs","alfar avenger") then return
      pause 0.1
put prep gs 10
     waitfor fully prepared
put cast avenger
     pause 0.5
put release
     setvariable avengertimer %t
     pause 0.5
     return

check-room-timers:
     setvariable noneempty 0
     setvariable return-room $roomid
     setvariable timeitem 0
     if $PriorityLevel-$roomid < 5 then return
check-room-timers-loop:
     pause 0.1
     if %timeitem = %RoomCount then goto check-room-timers-done
     eval RoomCheck element("%RoomNumbers", %timeitem)
     setvariable timer-check %t
     math timer-check subtract $time-%RoomCheck
     if %timer-check < 300 then goto check-room-next-timer
     setvariable noneempty 1
     gosub move %RoomCheck
     if %timer1 = $time-$roomid then setvariable timer1 0
     if %timer2 = $time-$roomid then setvariable timer2 0
     if %timer3 = $time-$roomid then setvariable timer3 0
     if %timer4 = $time-$roomid then setvariable timer4 0
     if %timer5 = $time-$roomid then setvariable timer5 0
     if %timer6 = $time-$roomid then setvariable timer6 0
     if %timer7 = $time-$roomid then setvariable timer7 0
     if %timer8 = $time-$roomid then setvariable timer8 0
     if %timer9 = $time-$roomid then setvariable timer9 0
     gosub Prospect
     pause 0.5
check-room-next-timer:
     math timeitem add 1
     goto check-room-timers-loop
check-room-timers-done:
     if %noneempty = 1 then gosub move %return-room
     if "$roomplayers" != "" then gosub changerooms
     goto check-priority

check-priority:
     setvariable pitem 0
     setvariable priority 4
check-priority-loop:
     pause 0.1
     if %pitem = %RoomCount then math priority subtract 1
     if %pitem = %RoomCount then pause 0.1
     if %pitem = %RoomCount then setvariable pitem 0
     if %priority < 1 then goto check-priority-done
     eval RoomCheck element("%RoomNumbers", %pitem)
     if $PriorityLevel-%RoomCheck != %priority then goto check-priority-skip
     if $PriorityLevel-%RoomCheck >= $PriorityLevel-$roomid then goto check-priority-skip
     if $ppl-%RoomCheck = 1 then goto check-priority-skip
     if $roomid != %RoomCheck then gosub move %RoomCheck
check-priority-skip:
     math pitem add 1
     goto check-priority-loop
check-priority-done:
     if %noneempty = 1 then setvariable tracker 0
     return










 found.good:
      setvariable item $0
      if "$1" = "massive" then setvariable item $2 $3
      if "$1" = "huge" then setvariable item $2 $3
      if "$1" = "large" then setvariable item $2 $3
      if "$1" = "small" then setvariable item $2 $3
      if "$1" = "medium" then setvariable item $2 $3
      if "$1" = "tiny" then setvariable item $2 $3
      if matchre("%item","%all-metal") then put #math $0 add 1
      if matchre("%item","%all-stone") then put #math $0 add 1
      echo . [ Keeping %item ... ]
put #math good-shit-found add 1
put #setvariable temptime %t
put #parse EKKO STATS
     setvariable deedforsure boulder|rock
     if matchre("%item","%deedforsure") then if "%keep-style" = "stow" then goto secondarykeep
     if matchre("%item","%deedforsure") then if "%keep-style" = "stow" then goto skip-stow-1
      if "$keep-style" = "stow" then gosub verb stow %item
      if "$keep-style" = "stow" then return
      if "$keep-style" = "deed" then gosub verb push %item
      if "$keep-style" = "deed" then gosub verb stow my deed
      if "$keep-style" = "deed" then return
skip-stow-1:
      setvariable temp-rhand nil
      setvariable temp-lhand nil
      if indexof ("$righthand" = "shovel") then setvariable temp-rhand shovel
      if indexof ("$righthand" = "pickaxe") then setvariable temp-rhand pickaxe
      if indexof ("$lefthand" = "shovel") then setvariable temp-lhand shovel
      if indexof ("$lefthand" = "pickaxe") then setvariable temp-lhand pickaxe
      if "%temp-lhand" != "nil" then gosub verb stow my %temp-lhand
      if "%temp-rhand" != "nil" then gosub verb stow my %temp-rhand
      if "$keep-style" = "packet" then gosub verb get my deed packet
      if "$keep-style" = "packet" then gosub verb push %item with my packet
      if "$keep-style" = "packet" then gosub verb stow my deed
      if "$keep-style" = "packet" then gosub verb stow my packet
      if "%temp-lhand" != "nil" then gosub verb get my %temp-lhand
      if "%temp-rhand" != "nil" then gosub verb get my %temp-rhand
     gosub verb swap
      if "%temp-rhand" != "nil" then return
      if "%temp-lhand" != "nil" then return
     if matchre("%item","%deedforsure") then gosub verb push %item
     if matchre("%item","%deedforsure") then gosub verb stow my deed
      return
secondarykeep:
      if indexof ("$righthand" = "shovel") then setvariable temp-rhand shovel
      if indexof ("$righthand" = "pickaxe") then setvariable temp-rhand pickaxe
      if indexof ("$lefthand" = "shovel") then setvariable temp-lhand shovel
      if indexof ("$lefthand" = "pickaxe") then setvariable temp-lhand pickaxe
      if "%temp-lhand" != "nil" then gosub verb stow my %temp-lhand
      if "%temp-rhand" != "nil" then gosub verb stow my %temp-rhand
     gosub verb get my deed packet
     gosub verb push %item with my packet
     gosub verb stow my deed
     gosub verb stow my packet
      if "%temp-lhand" != "nil" then gosub verb get my %temp-lhand
      if "%temp-rhand" != "nil" then gosub verb get my %temp-rhand
     gosub verb swap
     return



bleeding:
     if $bleeding = 0 then if $vitality < 60 then if $vit-warn = 1 then goto vit-warn
     action instant setvariable tend-$1 1 when (head|neck|chest|back|abdomen|tail) *(slight|light|moderate|bad|very|heavy|severe|profuse|gushing|massive|uncontrollable|unbelievable|beyond|death)
     action instant setvariable tend-$1$2 1 when (left|right) (hand|eye|arm|leg) *(slight|light|moderate|bad|very|heavy|severe|profuse|gushing|massive|uncontrollable|unbelievable|beyond|death)
     setvariable tend-head 0
     setvariable tend-lefteye 0
     setvariable tend-righteye 0
     setvariable tend-neck 0
     setvariable tend-chest 0
     setvariable tend-back 0
     setvariable tend-abdomen 0
     setvariable tend-leftarm 0
     setvariable tend-rightarm 0
     setvariable tend-lefthand 0
     setvariable tend-righthand 0
     setvariable tend-leftleg 0
     setvariable tend-rightleg 0
     setvariable tend-tail 0
put health
     waitfor Your spirit feels
     pause 0.1
     if %tend-head = 1 then gosub verb tend my head
     if %tend-lefteye = 1 then gosub verb tend my left eye
     if %tend-righteye = 1 then gosub verb tend my right eye
     if %tend-neck = 1 then gosub verb tend my neck
     if %tend-chest = 1 then gosub verb tend my chest
     if %tend-back = 1 then gosub verb tend my back
     if %tend-abdomen = 1 then gosub verb tend my abdomen
     if %tend-leftarm = 1 then gosub verb tend my left arm
     if %tend-rightarm = 1 then gosub verb tend my right arm
     if %tend-lefthand = 1 then gosub verb tend my left hand
     if %tend-righthand = 1 then gosub verb tend my right hand
     if %tend-leftleg = 1 then gosub verb tend my left leg
     if %tend-rightleg = 1 then gosub verb tend my right leg
     if %tend-tail = 1 then gosub verb tend my tail
     action remove (head|neck|chest|back|abdomen|tail) *(slight|light|moderate|bad|very|heavy|severe|profuse|gushing|massive|uncontrollable|unbelievable|beyond|death)
     action remove (left|right) (hand|eye|arm|leg) *(slight|light|moderate|bad|very|heavy|severe|profuse|gushing|massive|uncontrollable|unbelievable|beyond|death)
     if $autoheal = 0 then goto skip-auto-heal
     setvariable tempheal %t
     math tempheal subtract %lasthealtime
     if %tempheal < 300 then goto skip-auto-heal
     if %tend-head = 1 then gosub verb eat nem root
     if %tend-head = 1 then gosub verb drink egh pot
     setvariable eateye 0
     if %tend-lefteye = 1 then setvariable eateye 1
     if %tend-righteye = 1 then setvariable eateye 1
     if %eateye = 1 then gosub verb eat suf sap
     if %tend-neck = 1 then gosub verb eat georin grass
     if %tend-neck = 1 then gosub verb eat r leaf
     if %tend-chest = 1 then gosub verb eat p leaf
     if %tend-chest = 1 then gosub verb drink ith potion
     if %tend-back = 1 then gosub verb eat hul grass
     if %tend-back = 1 then gosub verb eat jun stem
     if %tend-abdomen = 1 then gosub verb eat nil grass
     if %tend-abdomen = 1 then gosub verb eat mul sap
     setvariable eatlimbs 0
     if %tend-leftarm = 1 then setvariable eatlimbs 1
     if %tend-rightarm = 1 then setvariable eatlimbs 1
     if %tend-lefthand = 1 then setvariable eatlimbs 1
     if %tend-righthand = 1 then setvariable eatlimbs 1
     if %tend-leftleg = 1 then setvariable eatlimbs 1
     if %tend-rightleg = 1 then setvariable eatlimbs 1
     if %tend-tail = 1 then setvariable eatlimbs 1
     if %eatlimbs = 1 then gosub verb eat jad flower
     if %eatlimbs = 1 then gosub verb eat yel root
     setvariable lasthealtime %t
skip-auto-heal:
     if $health < 60 then if $vit-warn = 1 then goto vit-warn
     if $bleeding = 1 then if $bleed-warn = 1 then goto bleed-warn
     return

bleed-warn:
 echo
 echo
 echo You're bleeding!
 echo
 echo
      pause 3
      if $bleeding = 1 then goto bleed-warn
      return
vit-warn:
 echo
 echo
 echo You're Vitality Has Slipped Below Acceptable Levels!
 echo
 echo
      pause 3
      if $health < 60 then goto vit-warn
      return

 danger:
       put #parse EKKO STATS
      setvariable dt 1
      goto danger-loop
 danger-p:
      pause
 danger-loop:
       put #setvariable temptime %t
 put #statusbar Attempting to avert danger. Attempt %dt ...
 put prospect danger
      match danger-p type ahead
      match danger-p ...wait
      match danger-fail Unfortunately, you are unable to find any way around the instability in the geology
      match danger-done Roundtime
      matchwait
 danger-fail:
      math dt add 1
      if %dt < 25 then goto danger-loop
      if matchre("%metal","%good-veins") then goto dp-start
      gosub changerooms
      setvariable tracker 0
      goto mine

 dp-start:
      setvariable dp-track 60
 dp-loop:
 put #statusbar Maximum attempts reached, retrying in %dp-track seconds...
      pause 5
      math dp-track subtract 5
      if %dp-track > 0 then goto dp-loop
      setvariable dt 1
      goto danger-loop
 danger-done:
      setvariable danger 0
      goto mine





changerooms:
      setvariable pcopt 0
      gosub repairs
      setvariable tracker 0
      if %RoomTrack = %RoomCount then setvariable RoomTrack 0
      eval NextRoom element("%RoomNumbers", %RoomTrack)
      math RoomTrack add 1
      gosub move %NextRoom
      gosub Prospect
      pause 0.5
     if "$roomplayers" != "" then gosub changerooms
     gosub check-priority
      return

 Prospect.P:
      pause 0.5
 Prospect:
     if $standing = 0 then gosub verb stand
     put #setvariable time-$roomid 86400
     put #setvariable ppl-$roomid 0
      put #setvariable PriorityLevel-$roomid 5
      setvariable careful-check 0
setvariable stone Empty
setvariable metal Empty
 put prospect
      match RecordMaterials can be mined here
      match RoomEmpty Roundtime
      match Prospect.P type ahead
      match Prospect.P ...wait
      match RoomEmpty You find it impossible to make out any useful details amongst
      matchwait
RecordMaterials:
     if %careful-check = 1 then goto ProspectCareful
RoomEmpty:
     gosub checkshit
     return
checkshit:
      if matchre("%metal","%stuffilike") then gosub swapcheckrare
      if matchre("%metal","%jankystuff") then gosub swapchecknonrare
      put #setvariable $roomid %metal|%stone
      if "%metal" = "Empty" then put #setvariable time-$roomid %t
      if matchre("%metal","%priority1") then put #setvariable PriorityLevel-$roomid 1
      if matchre("%metal","%priority2") then put #setvariable PriorityLevel-$roomid 2
      if matchre("%metal","%priority3") then put #setvariable PriorityLevel-$roomid 3
      if matchre("%metal","%priority4") then put #setvariable PriorityLevel-$roomid 4
     if "%metal" = "Empty" then if %timer1 = 0 then setvariable timer1 $time-$roomid
     if "%metal" = "Empty" then if %timer2 = 0 then setvariable timer2 $time-$roomid
     if "%metal" = "Empty" then if %timer3 = 0 then setvariable timer3 $time-$roomid
     if "%metal" = "Empty" then if %timer4 = 0 then setvariable timer4 $time-$roomid
     if "%metal" = "Empty" then if %timer5 = 0 then setvariable timer5 $time-$roomid
     if "%metal" = "Empty" then if %timer6 = 0 then setvariable timer6 $time-$roomid
     if "%metal" = "Empty" then if %timer7 = 0 then setvariable timer7 $time-$roomid
     if "%metal" = "Empty" then if %timer8 = 0 then setvariable timer8 $time-$roomid
     if "%metal" = "Empty" then if %timer9 = 0 then setvariable timer9 $time-$roomid
      if "$roomplayers" != "" then put #setvariable ppl-$roomid 1
      put #setvariable temptime %t
      put #parse EKKO STATS
      return
ProspectCareful.P:
     pause 0.5
ProspectCareful:
     gosub checkshit
     if %pcopt = 0 then return
     if %pc-room = 1 then return
put prospect careful
     matchre ProspectCareful.P (type ahead|...wait)
     matchre ProspectCareful.D (Roundtime|Your analysis has revealed no additional resources)
     matchwait
swapcheckrare:
     if $autoswapping = 0 then return
     setvariable temphand $righthand|$lefthand
     setvariable tooltypes shovel|pickaxe
     setvariable stowstuff none
     if matchre("%temphand","%tooltypes") then setvariable stowstuff $0
     if "%stowstuff" = "pickaxe" then gosub verb stow left
     if "%stowstuff" = "pickaxe" then gosub verb get my shovel
     if "%stowstuff" = "pickaxe" then gosub verb swap
     return
swapchecknonrare:
     if $autoswapping = 0 then return
     setvariable temphand $righthand|$lefthand
     setvariable tooltypes shovel|pickaxe
     setvariable stowstuff none
     if matchre("%temphand","%tooltypes") then setvariable stowstuff $0
     if "%stowstuff" = "shovel" then gosub verb stow left
     if "%stowstuff" = "shovel" then gosub verb get my pickaxe
     if "%stowstuff" = "shovel" then gosub verb swap
     return

ProspectCareful.D:
     setvariable careful-check 0
     setvariable pc-room 1
      put #setvariable temptime %t
      put #parse EKKO STATS
     return

 Resources:
      var recItem 0
 Resources.Loop:
      if %recItem = %RoomCount then goto Resources.Done
      eval Room element("%RoomNumbers", %recItem)
      if matchre("$%Room","%good-veins") then gosub move %Room
      math recItem add 1
      goto Resources.Loop


 repairs.p:
      pause 0.5
 repairs:
      if %repair-track > 0 then math repair-track subtract 1
      if %repair-track > 0 then goto repair-done
put #statusbar Repairing ...
      setvariable temp-rhand nil
      setvariable temp-lhand nil
      if indexof ("$righthand" = "shovel") then setvariable temp-rhand shovel
      if indexof ("$righthand" = "pickaxe") then setvariable temp-rhand pickaxe
      if indexof ("$lefthand" = "shovel") then setvariable temp-lhand shovel
      if indexof ("$lefthand" = "pickaxe") then setvariable temp-lhand pickaxe
      if "%temp-lhand" != "nil" then put analyze my %temp-lhand
      if "%temp-rhand" != "nil" then put analyze my %temp-rhand
      matchre repairs.p (type ahead|...wait)
      match repair-done it is in pristine condition
      match repair-brush Roundtime
      matchwait
 repair-brush:
      if $monstercount > 0 then gosub retreat
      gosub verb get my brush
      if $monstercount > 0 then gosub retreat
      if "%temp-lhand" != "nil" then gosub verb rub my %temp-lhand with my brush
      if "%temp-rhand" != "nil" then gosub verb rub my %temp-rhand with my brush
      gosub verb stow my brush
      if $monstercount > 0 then gosub retreat
      gosub verb get my oil
      if $monstercount > 0 then gosub retreat
      if "%temp-lhand" != "nil" then gosub verb pour oil on my %temp-lhand
      if "%temp-rhand" != "nil" then gosub verb pour oil on my %temp-rhand
      gosub verb stow my oil
 repair-done:
      return



 verb:
      setvariable verb $0
      if "%verb" = "per health" then setvariable per-health-timer %t
      goto verb.a
 verb.p:
      pause 0.5
 verb.a:
 put %verb
      match verb.p type ahead
      match verb.p ...wait
      match verb-k You cannot collect anything while in combat
      matchre verb.d (cannot figure out how to do that|That area is not bleeding|You take a step back|could not find what|You strain, but cannot focus your mind|You attempt to relax your mind|You get|You put|STOW HELP|You push|think pushing that would have any effect|You move|You're already using the Sight|You have not recovered from your previous use|careful focus, you adjust your eyes to see in shadow as they|You close your eyes, drawing all your thoughts inward|You're not ready to do that again|was just recently mined by someone else|Roundtime|area has already been tended to|work carefully at tending your wound|The spell pattern collapses|You are unable to control|not damaged enough to warrant repair|cannot figure out how to do that|You're not ready to do that|Drink what|What were you referring|You eat|You drink|You cannot do that while)
      matchwait
 verb-k:
      setvariable antikick 1
 verb.d:
      return

 retreat.p:
      pause 0.5
 retreat:
     if "$monsterlist" = "an ethereal alfar warrior" then return
put #statusbar Retreating...
 put retreat
      matchre retreat.p (type ahead|...wait)
      match retreat.p You retreat back to pole range
      match retreat.p Roundtime
      matchre retreat.d (You retreat from combat|You are already as far away)
      matchwait
 retreat.d:
      return

 goto move.end
 move.retry:
         math move.retry add 1
         if %move.retry > 3 then goto move.fail
         echo ***
         echo *** Retrying move to $1 $2 in %move.retry second(s).
         echo ***
         pause %move.retry
         goto move.goto
move:
if $standing != 1 then gosub verb stand
put #setvariable temptime %t
     put #parse EKKO STATS
     gosub verb stow left
      if $monstercount > 0 then gosub retreat
put #statusbar Traveling to room $0 ...
         var move.skip 0
         var move.retry 0
         var move.fail 0
         var move.room $0
move.goto:
         matchre move.return ^YOU HAVE ARRIVED
         matchre move.skip ^SHOP CLOSED
         matchre move.retry ^MOVE FAILED
         matchre move.fail ^DESTINATION NOT FOUND
         put #goto %move.room
         matchwait
move.fail:
         var move.fail 1
         goto move.return
move.skip:
         var move.skip 1
move.return:
     if $autoswapping = 1 then gosub verb get my pickaxe
     if $autoswapping = 0 then gosub verb get my shovel
     gosub verb swap
         return
move.end: