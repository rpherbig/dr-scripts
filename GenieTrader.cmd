#Genie file for adaptation at some point.

setvariable storage haversack
setvariable jugglies lizard
setvariable coin-to-carry 800 silver
setvariable origami-instructions star instructions in my primer
setvariable origami-completed star
setvariable appraisal.tool gem pou
setvariable train.climb off
setvariable commodities off
setvariable interior off
setvariable caravan caravan
setvariable compendium on
setvariable train.vocals off
setvariable song-1 jig conf
setvariable song-2 jig conf
setvariable song-3 jig conf


#%_____________________________________________________________________________________________________________
#%_____________________________________________________________________________________________________________
#%
#%                                    IMPORTANT! PLEASE READ !
#%
#%_____________________________________________________________________________________________________________
#%_____________________________________________________________________________________________________________
#% If using an appraisal knife, appraisal.tool must be set to skinnning or carving knife. Example : setvariable appraisal.tool skinning knife
#% If using an appraisal knife, must have app knife as a KNIFE when script is started (not in scraper or shaper form)
#% You CAN NOT use an appraisal knife unless you have enough appraisal to get ROUNDTIME when appraising the knife. if you do not get ROUNDTIME for appraising the knife then you can not use a knife for appraisal yet. (minimum 70 ranks to app knife)
#% Must be wearing origami envelope, having a couple of spares in your %storage is a good idea too. Do not wear more than 1 envelope, only wear 1.
#% If origami instructions are in primer, set variable to IN PRIMER, for example 'setvariable origami-instructions flower instruction in primer'
#% Must be wearing a feedbag with grass in it, I suggest 30 or 40 grass in it when starting. COUNT GRASS IN MY FEEDBAG to check :)
#% Must have coin in Leth, Dirge and Crossings banks, at least 5 plat in each bank is reccomended. If running commodities also I'd suggest 10 plat in each bank just to be safe.
#% Must start with both hands empty.
#% Start in any outpost or guild by the shipping/shipment clerk.
#% Start with caravan parked out side, please tell the caravan to WAIT while its parked outside before starting.
#% It is not suggested that a low level trader run commodities, please be at least 15th circle or so to ensure you have room for cargo.
#% If you want to run commodities at the same time as contracts, set commodities to on, if not set it to off. Example : setvariable commodities on
#% If you want to train climbing, set train.climb to on, if not set it to off. Example : setvariable train.climbing on
#% If your caravan has an Interior and you want to use it, set the interior variable to on.
#% If you want to quit, you can type 'echo toggle finish on' in game at any point in time and Trader AI will turn in its existing contracts, stable your caravan, then log out. EXAMPLE :  echo toggle finish on
#% If you change your mind and want to turn finish mode off, you can type 'echo toggle finish off' to restore trader ai to normal run mode. EXAMPLE : echo toggle finish off
#% To turn on teacher mode, make sure the student is joined to your party. at any point in time during the script you can type 'echo toggle teacher SUBJECT STUDENT' and it will teach SUBJECT to STUDENT. If class is lost for any reason (while in the bank, or any other reason) Trader AI will restart the class to the student. EXAMPLE: echo toggle teacher evasion to Gavinne
#% To turn on student mode, make sure the teacher is joined to your party. at any point in time during the script you can type 'echo toggle student TEACHER' and it will listen to TEACHER anytime TEACHER offers to teach. EXAMPLE : echo toggle student Gavinne
#% To turn off student mode, type 'echo toggle student off'
#% To turn off teacher mode, type 'echo toggle teacher off'
#% To use a compendium with multiple charts in it, simply set compendium to on. Example : setvariable compendium on
#% To use a single chart, simply set compendium to chart. Example : setvariable compendium chart
#% To not use any compendium or chart, set compendium to off. Example : setvariable compendium off
#%
#% REAL TIME TOGGLES...
#%--------------------------------------------------------------------------------------------------------
#% COMMAND                      | Definition                    | Examples                               |
#%--------------------------------------------------------------------------------------------------------
#% finish on                    | turns finish on               | echo toggle finish on                  |
#% finish off                   | turns finish off              | echo toggle finish off                 |
#% compendium on                | use compendium                | echo toggle compendium on              |
#% compendium chart             | use chart                     | echo toggle compendium chart           |
#% compendium off               | don't use compendium or chart | echo toggle compendium off             |
#% student off                  | student mode off              | echo toggle student off                |
#% teacher off                  | teaching mode off             | echo toggle teacher off                |
#% climb on                     | climbing training on          | echo toggle climb on                   |
#% climb off                    | climbing training off         | echo toggle climb off                  |
#% vocals on                    | vocals training on            | echo toggle vocals on                  |
#% vocals off                   | vocals training off           | echo toggle vocals off                 |
#% student TEACHER              | listen to TEACHER if taught   | echo toggle student Gavinne            |
#% teacher SUBJECT to STUDENT   | teach SUBJECT to STUDENT      | echo toggle teacher Evasion to Gavinne |
#%--------------------------------------------------------------------------------------------------------
#% USAGE : echo toggle COMMAND
#%
#%
#% DON'T TOUCH ANYTHING BELOW HERE !!!   DON'T TOUCH ANYTHING BELOW HERE !!!   DON'T TOUCH ANYTHING BELOW HERE !!!
#%_____________________________________________________________________________________________________________
#%_____________________________________________________________________________________________________________

     if "%origami-instructions" = "off" then echo . [ You can not turn origami off. ]
     if "%origami-completed" = "off" then echo . [ You can not turn origami off. ]
     if "%jugglies" = "off" then echo . [ You can not turn juggling off. ]
     if "%appraisal.tool" = "off" then echo . [ You can not turn appraisal off. ]
     if "%origami-instructions" = "off" then exit
     if "%origami-completed" = "off" then exit
     if "%appraisal.tool" = "off" then exit
     if "%jugglies" = "off" then exit
     setvariable going-fast 0
     setvariable humming 0
     if "%train.vocals" = "on" then action setvariable humming 0 when (You stop playing your song|Your song comes to an end|You decide that now isn't the best time to be playing|You finish humming)
     if "%train.vocals" != "on" then setvariable humming 1
     action setvariable caravan-there 1 when (^Your .* following you|^The .* following you)
     setvariable teacher off
     setvariable student off
     action setvariable student listen to $1 when toggle student (\w+)
     action setvariable teacher teach $1 to $2 when toggle teacher (\w+) (\w+)
     action setvariable $1 off when toggle (student|teacher) off
     action setvariable compendium $1 when toggle compendium (off|on|chart)
     action setvariable train.climb $1 when toggle climb (on|off)
     action setvariable train.vocals $1 when toggle vocals (on|off)
     setvariable teaching 0
     setvariable listening 0
     action setvariable listen 1 when begins to lecture you on the proper usage of
     action setvariable teaching 0 when You stop teaching so as not to disturb the aura of quiet here
     action setvariable teaching 1 when (begins to listen to you teach|You continue to instruct your student)
     action setvariable gender $1 when Gender: (Female|Male)
     if "%interior" = "on" then action setvariable arrived 1 when feel the momentum of the room shift and then hear a voice from outsite announce, "We have arrived!"
     setvariable minimum.profit.per.unit 35
     setvariable true-profit 0
     setvariable avg-profit 0
     setvariable app.knife 0
     setvariable finish.mode 0
     action setvariable finish.mode 1 when toggle finish on
     action setvariable finish.mode 0 when toggle finish off
     if "%appraisal.tool" = "skinning knife" then setvariable app.knife 1
     if "%appraisal.tool" = "carving knife" then setvariable app.knife 1
     action setvariable circle $1 when Circle: *(\d+)
     action setvariable race $1 when Race: *(\S+)
     action setvariable intel $1 when Intelligence : (\d+)
     action setvariable charisma $1 when Charisma : (\d+)
     action setvariable agil $1 when Agility : (\d+)
     action setvariable scholarship $1 when Scholarship: *(\d+)
     action setvariable mech $1 when Mechanical Lore: *(\d+)
     action setvariable perception $1 when Perception: *(\d+)
     action setvariable trading $1 when Trading: *(\d+)
     action setvariable app-ranks $1 when Appraisal: *(\d+)
     action setvariable poked 1 when You poke a piece of paper, and realizing it has no value whatsoever, toss it away

     gosub startup-prices Crossing
     gosub startup-prices Leth
     gosub startup-prices Arthe

     pause 0.5

put info
     waitfor Encumbrance
     action remove Gender: (Female|Male)
put exp 1
     waitfor EXP HELP
     pause 0.1
     setvariable suggest.origami Too Low For Origami
math111:
     setvariable applied.mech %agil
     math applied.mech multiply 2
     math applied.mech add %mech
     setvariable applied.scholarship %intel
     math applied.scholarship multiply 5
     math applied.scholarship add %scholarship

setvariable dragon.first No         -
if %applied.scholarship > 50 then setvariable dragon.first Yes        -
setvariable hat.first No         -
if %applied.scholarship > 75 then setvariable hat.first Yes        -
setvariable bird.first No         -
if %applied.scholarship > 100 then setvariable bird.first Yes        -
setvariable star.first No         -
if %applied.scholarship > 125 then setvariable star.first Yes        -
setvariable goblin.first No         -
if %applied.scholarship > 150 then setvariable goblin.first Yes        -
setvariable flower.first No         -
if %applied.scholarship > 175 then setvariable flower.first Yes        -
setvariable jackal.first No         -
if %applied.scholarship > 200 then setvariable jackal.first Yes        -
setvariable fish.first No         -
if %applied.scholarship > 225 then setvariable fish.first Yes        -
setvariable dolphin.first No         -
if %applied.scholarship > 250 then setvariable dolphin.first Yes        -
setvariable ship.first No         -
if %applied.scholarship > 275 then setvariable ship.first Yes        -
setvariable silverfish.first No         -
if %applied.scholarship > 300 then setvariable silverfish.first Yes        -
setvariable medallion.first No         -
if %applied.scholarship > 325 then setvariable medallion.first Yes        -
setvariable gryphon.first No         -
if %applied.scholarship > 350 then setvariable gryphon.first Yes        -
setvariable cat.first No         -
if %applied.scholarship > 375 then setvariable cat.first Yes        -
setvariable horse.first No         -
if %applied.scholarship > 400 then setvariable horse.first Yes        -
setvariable mask.first No         -
if %applied.scholarship > 425 then setvariable mask.first Yes        -
setvariable phoenix.first No         -
if %applied.scholarship > 450 then setvariable phoenix.first Yes        -
setvariable mouse.first No         -
if %applied.scholarship > 475 then setvariable mouse.first Yes        -
setvariable yak.first No         -
if %applied.scholarship > 500 then setvariable yak.first Yes        -
setvariable raven.first No         -
if %applied.scholarship > 525 then setvariable raven.first Yes        -
setvariable crown.first No         -
if %applied.scholarship > 550 then setvariable crown.first Yes        -
setvariable vulture.first No         -
if %applied.scholarship > 575 then setvariable vulture.first Yes        -

if %applied.mech > 14 then setvariable dragon.complete Sticky        -
if %applied.mech > 29 then setvariable dragon.complete Probably      -
if %applied.mech > 39 then setvariable dragon.complete Pretty Sure   -
if %applied.mech > 44 then setvariable dragon.complete Eyes Closed   -

if %applied.mech > 39 then setvariable hat.complete Sticky        -
if %applied.mech > 54 then setvariable hat.complete Probably      -
if %applied.mech > 64 then setvariable hat.complete Pretty Sure   -
if %applied.mech > 69 then setvariable hat.complete Eyes Closed   -

if %applied.mech > 64 then setvariable bird.complete Sticky        -
if %applied.mech > 79 then setvariable bird.complete Probably      -
if %applied.mech > 89 then setvariable bird.complete Pretty Sure   -
if %applied.mech > 94 then setvariable bird.complete Eyes Closed   -

if %applied.mech > 89 then setvariable bird.complete Sticky


     setvariable test-number 14
     gosub test dragon
     math test-number add 25
     gosub test hat
     math test-number add 25
     gosub test bird
     math test-number add 25
     gosub test star
     math test-number add 25
     gosub test goblin
     math test-number add 25
     gosub test flower
     math test-number add 25
     gosub test jackal
     math test-number add 25
     gosub test fish
     math test-number add 25
     gosub test dolphin
     math test-number add 25
     gosub test ship
     math test-number add 25
     gosub test silverfish
     math test-number add 25
     gosub test medallion
     math test-number add 25
     gosub test gryphon
     math test-number add 25
     gosub test cat
     math test-number add 25
     gosub test horse
     math test-number add 25
     gosub test mask
     math test-number add 25
     gosub test phoenix
     math test-number add 25
     gosub test mouse
     math test-number add 25
     gosub test yak
     math test-number add 25
     gosub test raven
     math test-number add 25
     gosub test crown
     math test-number add 25
     gosub test vulture
     goto jugglie-calc


test:
     setvariable $1.fold Too Hard
     setvariable $1.complete No Way        -
     setvariable check %test-number
     if %applied.mech > %check then setvariable $1.complete Sticky        -
     math check add 15
     if %applied.mech > %check then setvariable $1.complete Probably      -
     math check add 10
     if %applied.mech > %check then setvariable $1.complete Pretty Sure   -
     math check add 5
     if %applied.mech > %check then setvariable $1.complete Eyes Closed   -

     if "%$1.first" = "Yes        -" then if "%$1.complete" = "Probably      -" then setvariable $1.fold Perfect
     if "%$1.first" = "Yes        -" then if "%$1.complete" = "Pretty Sure   -" then setvariable $1.fold Perfect
     if "%$1.first" = "Yes        -" then if "%$1.complete" = "Eyes Closed   -" then setvariable $1.fold Too Easy
     if "%$1.fold" = "Too Easy" then setvariable suggest.origami $1
     if "%$1.fold" = "Perfect" then setvariable suggest.origami $1
     return

jugglie-calc:
     math perception divide 12
     setvariable suggest.jugglie half stone (barrel pebbles, shark teeth)
     if %perception >= 1 then setvariable suggest.jugglie 1 stone
     if %perception >= 2 then setvariable suggest.jugglie 2 stones
     if %perception >= 5 then setvariable suggest.jugglie 5 stones
     if %perception >= 7 then setvariable suggest.jugglie 7 stones
     if %perception >= 10 then setvariable suggest.jugglie 10 stones
     if %perception >= 12 then setvariable suggest.jugglie 12 stones
     if %perception >= 15 then setvariable suggest.jugglie 15 stones
     if %perception >= 20 then setvariable suggest.jugglie 20 stones
     if %perception >= 25 then setvariable suggest.jugglie 25 stones
     if %perception >= 30 then setvariable suggest.jugglie 30 stones
     if %perception >= 35 then setvariable suggest.jugglie 35 stones
     if %perception >= 40 then setvariable suggest.jugglie 40 stones
     if %perception >= 45 then setvariable suggest.jugglie 45 stones
     if %perception >= 50 then setvariable suggest.jugglie 50 stones
     if %perception >= 55 then setvariable suggest.jugglie 55 stones (granite turnips)
     if %perception >= 65 then setvariable suggest.jugglie 65 stones (lead turnips)
     if %perception >= 75 then setvariable suggest.jugglie 75 stones (scythes)

     setvariable commodity-spent 0
     setvariable commodity-intake 0
     setvariable contracts-delivered 0
     setvariable coin-intake 0
     action math coin-intake add $1 when handing you your payment of (\d+)
     action math coin-intake add $1 when nods, "I can pay you (\d+) kronars for your
     setvariable coin-spent 0
     action math coin-spent add $1 when dues which are owed to this guild,  for a total of (\d+)
     action math coin-spent add $1 when total fee for transportation additions is (\d+) copper
     action math coin-spent add $1 when to the guild, bringing the total to (\d+)
     action math coin-spent add $1 when a (\d+) copper kronar fee for the transportation additions
     setvariable ranks-gained 0
     setvariable tdps-gained 0
     setvariable to-Dirge 0
     setvariable from-Dirge 0
     setvariable to-Arthe 0
     setvariable from-Arthe 0
     setvariable to-Crossing 0
     setvariable from-Crossing 0
     setvariable to-Stone 0
     setvariable from-Stone 0
     setvariable to-Wolf 0
     setvariable from-Wolf 0
     setvariable to-Tiger 0
     setvariable from-Tiger 0
     setvariable to-Leth 0
     setvariable from-Leth 0
     setvariable balance-Crossing Unknown
     setvariable balance-Leth Unknown
     setvariable balance-Dirge Unknown

action math to-$1 add 1 when The guild office at.*(Leth|Tiger|Wolf|Dirge|Crossing|Arthe|Stone).*requires
action setvariable temp-from $1 when Trading Contract Issued by:.*(Dirge|Leth|Crossing|Tiger|Wolf|Arthe|Stone)
action setvariable expired 1 when The contract is now useless since it has expired

     gosub start-test Dirge
     gosub start-test Arthe
     gosub start-test Crossing
     gosub start-test Stone
     gosub start-test Wolf
     gosub start-test Tiger
     gosub start-test Leth

action remove The guild office at.*(Leth|Tiger|Wolf|Dirge|Crossing|Arthe|Stone).*requires
action remove Trading Contract Issued by:.*(Dirge|Leth|Crossing|Tiger|Wolf|Arthe|Stone)
action remove The contract is now useless since it has expired

     goto self-test-done

     gosub self-test %your-name
     goto self-test-done
self-test:
     setvariable name1 $1
     setvariable name2 $2
     pause 0.5
put look %name1
     match self-pass-1 You are
     match self-test-2 could not find
     matchwait
self-pass-1:
     setvariable your-name %name1
     setvariable last-name %name2
     return
self-test-2:
     pause 0.5
put look %name2
put exp
     match self-pass-2 You are
     match self-test-3 could not find
     match self-test-3 Obvious path
     match self-test-3 Obvious exit
     match self-test-3 EXP HELP
     matchwait
self-pass-2:
     setvariable your-name %name2
     setvariable last-name No Last Name
     return
self-test-3:
echo . [ Name Unknown ]
     setvariable your-name Unknown
     return

self-test-done:
     if "%commodities" != "on" then goto no.commods-start
action setvariable Diamonds-loaded $1 when diamonds *(\d+)
action setvariable Pearls-loaded $1 when pearls *(\d+)
action setvariable Gold-loaded $1 when gold *(\d+)
action setvariable Silver-loaded $1 when silver *(\d+)
action setvariable IronOre-loaded $1 when iron ore *(\d+)
action setvariable Charcoal-loaded $1 when charcoal *(\d+)
action setvariable Amber-loaded $1 when amber *(\d+)
action setvariable Saffron-loaded $1 when saffron *(\d+)
action setvariable Cinnamon-loaded $1 when cinnamon *(\d+)
action setvariable Papyrus-loaded $1 when papyrus *(\d+)
action setvariable Oranges-loaded $1 when oranges *(\d+)
action setvariable Limes-loaded $1 when limes *(\d+)
action setvariable Slate-loaded $1 when slate *(\d+)
action setvariable Brass-loaded $1 when brass *(\d+)
action setvariable Lead-loaded $1 when lead *(\d+)
action setvariable Copper-loaded $1 when copper *(\d+)
action setvariable Bronze-loaded $1 when bronze *(\d+)
action setvariable Silk-loaded $1 when silk *(\d+)
action setvariable Cotton-loaded $1 when cotton *(\d+)
action setvariable Wool-loaded $1 when wool *(\d+)
action setvariable Lace-loaded $1 when lace *(\d+)
action setvariable Velvet-loaded $1 when velvet *(\d+)
action setvariable Deobar Oil-loaded $1 when deobar oil *(\d+)
action setvariable Myrrh-loaded $1 when myrrh *(\d+)
action setvariable Salt-loaded $1 when salt *(\d+)
action setvariable Indigo-loaded $1 when indigo *(\d+)
action setvariable PurpleDye-loaded $1 when purple dye *(\d+)
action setvariable Barley-loaded $1 when barley *(\d+)
action setvariable Wheat-loaded $1 when wheat *(\d+)
action setvariable Oats-loaded $1 when oats *(\d+)
action setvariable Corn-loaded $1 when corn *(\d+)
action setvariable Acanth-loaded $1 when acanth *(\d+)
action setvariable Taffelberries-loaded $1 when taffelberries *(\d+)
action setvariable Apples-loaded $1 when apples *(\d+)

     gosub verb get my ledger
     gosub verb open my ledger
     gosub verb turn my ledger to chapter 5
     gosub verb turn my ledger to page 1
put read my ledger
     waitforre (You feel that further study might reveal more details|Have not begun trading with this guild|with this guild)
     gosub verb close my ledger
     gosub verb put my ledger in my %storage

action remove diamonds *(\d+)
action remove pearls *(\d+)
action remove gold *(\d+)
action remove silver *(\d+)
action remove iron ore *(\d+)
action remove charcoal *(\d+)
action remove amber *(\d+)
action remove saffron *(\d+)
action remove cinnamon *(\d+)
action remove papyrus *(\d+)
action remove oranges *(\d+)
action remove limes *(\d+)
action remove slate *(\d+)
action remove brass *(\d+)
action remove lead *(\d+)
action remove copper *(\d+)
action remove bronze *(\d+)
action remove silk *(\d+)
action remove cotton *(\d+)
action remove wool *(\d+)
action remove lace *(\d+)
action remove velvet *(\d+)
action remove deobar oil *(\d+)
action remove myrrh *(\d+)
action remove salt *(\d+)
action remove indigo *(\d+)
action remove purple dye *(\d+)
action remove barley *(\d+)
action remove wheat *(\d+)
action remove oats *(\d+)
action remove corn *(\d+)
action remove acanth *(\d+)
action remove taffelberries *(\d+)
action remove apples *(\d+)


no.commods-start:

put skill trading
     waitforre Time Development Points: *(\d+)
     setvariable start-tdps $1
     pause 0.5
     gosub echo
     setvariable applied-trading %charisma
     math applied-trading add %charisma
     math app-ranks multiply 0.33
     math applied-trading add %app-ranks
     math applied-trading add %trading
echo .
echo . [ Trader AI ]
if "%gender" = "Male" then echo . [ Welcome to Trader-AI, Sir ! I will try to train you and profit as much as I can.
if "%gender" = "Female" then echo . [ Welcome to Trader-AI, Madam ! I will try to train you and profit as much as I can.
echo . [ Information : Circle %circle %gender %race Trader
echo . [ Your Applied Trading Is %applied-trading
echo . [ I have adjusted my settings to best fit your needs. ]
echo . [ Suggested Origami  : %suggest.origami
echo . [ Suggested Jugglies : %suggest.jugglie
echo .
     pause 3

     action math ranks-gained add 1 when You've gained a new rank in
     action setvariable get-contract 1 when (Have a delinquent contract|Have no contracts pending|Have not begun trading)
     action setvariable get-contract 0 when still have another contract we issued for you that needs to be completed
     action setvariable delivery $1 when The guild office at.*(Tiger|Wolf|Arthe|Dirge|Crossing|Stone|Leth).*requires
     action setvariable knifey $1 when click it snaps into place leaving you with .* (scraper|shaper)
     action math coin-spent add $1 when stops you and requests a transportation fee of (\d+)
     action setvariable spec-finesse 1 when You focus yourself on presenting your best appearance, and feel your confidence grow as you realize you are able to act with greater finesse
     setvariable spec-finesse 0


start-look:
	match Tiger-outpost the shipping clerk and the Tiger Clan trade minister
	match Tiger-outpost Tiger Clan, Trader's Guild Outpost
	match Crossing-outpost Traders' Guild, Shipment Center
	match Arthe-outpost Swotting Hall, Trader's Center
	match Stone-outpost Stone Clan, Trader's Guild Outpost
	match Dirge-outpost Darkstone Inn, Stables
	match Leth-outpost Eshar's Trading Post, Main Room
	match Wolf-outpost Wolf Clan Trader Outpost
	match Crossing-stable [Haldofurd's Barn
	match Arthe-stable [Arthe Hollow Inn, Caravan Stable]
put look
	matchwait

start-test:
     setvariable $1-to-Leth 0
     setvariable $1-to-Crossing 0
     setvariable $1-to-Arthe 0
     setvariable $1-to-Stone 0
     setvariable $1-to-Dirge 0
     setvariable $1-to-Tiger 0
     setvariable $1-to-Wolf 0
     setvariable contract $1
     setvariable expired 0
     goto start-tap
start-tap.p:
     pause 0.5
start-tap:
put read my %contract contract
     matchre start-tap.p (type ahead|...wait)
     match start-tap1.Set You estimate these goods
     match start-tap1.Expired The contract is now useless
     match start-tap.d could not find
     matchwait
start-tap1.Set:
     setvariable from-%temp-from 1
start-tap1.Expired:
     setvariable temp-from nil
start-tap.R2.p:
     pause 0.5
start-tap.R2:
put read my second %contract contract
     matchre start-tap.R2.p (type ahead|...wait)
     match start-tap2.Set You estimate these goods
     match start-tap2.Expired The contract is now useless
     match start-tap.d could not find
     matchwait
start-tap2.Set:
     setvariable from-%temp-from 1
start-tap2.Expired:
     setvariable temp-from nil
start-tap.d:
     pause 0.1
     return

Crossing-stable:
     gosub verb tell caravan to follow
     gosub verb tell caravan to go fast
     gosub move-c out
     gosub move-c e
     gosub move-c s
     gosub move-c s
     gosub move-c s
     gosub move-c s
     gosub move-c s
     gosub move-c s
     gosub verb tell caravan to wait
     gosub move go door
Crossing-outpost:
     setvariable current-location Crossing
     setvariable contract Crossing
     if %to-Crossing > 0 then goto turn-in-contracts
     setvariable to-Crossing 0
     gosub Crossing-bank
     if %finish.mode = 1 then goto Crossing-finish
     setvariable bought-commods-here 0
     if "%commodities" = "on" then gosub move south
     if "%commodities" = "on" then setvariable return read-Crossing-commods
     if "%commodities" = "on" then goto read-commods
read-Crossing-commods:
     if "%commodities" = "on" then gosub set-commods-board Crossing
     if "%commodities" = "on" then gosub move north
     if "%commodities" = "on" then setvariable return sell-Crossing-commods
     if "%commodities" = "on" then goto loaded-commods
sell-Crossing-commods:
     if "%commodities" = "on" then setvariable return compare-Crossing-commods
     if "%commodities" = "on" then goto Crossing-commods
compare-Crossing-commods:
     if "%commodities" = "on" then gosub move south
     if "%commodities" = "on" then setvariable return buy-Crossing-commods
     if "%commodities" = "on" then goto buying-commods
buy-Crossing-commods:
     if "%commodities" = "on" then gosub verb pay clerk
     if "%commodities" = "on" then gosub move north
     if %bought-commods-here = 1 then gosub Crossing-bank
     setvariable get-contract 0
     gosub verb get my ledger
     gosub verb open my ledger
     gosub verb turn ledger to chapter 1
     gosub verb turn ledger to page 1
     gosub verb read ledger
     gosub verb close my ledger
     gosub verb put my ledger in my %storage
     if %get-contract = 1 then gosub move e
     if %get-contract = 1 then gosub verb spec finesse
     if %get-contract = 1 then gosub verb ask minist for contract
     if %get-contract = 1 then gosub move w
     pause 0.1
     if %get-contract = 1 then gosub verb give clerk
     if %get-contract = 1 then gosub verb pay clerk
     if %get-contract = 1 then gosub verb read my contract
     if %get-contract = 1 then gosub verb put my contract in my %storage
     if %spec-finesse = 1 then gosub verb spec fin stop
     if %spec-finesse = 1 then setvariable spec-finesse 0
     if %get-contract = 1 then math to-%delivery add 1
     if %get-contract = 1 then setvariable Crossing-to-%delivery 1
     if %get-contract = 1 then setvariable from-Crossing 1
     gosub reset-to Crossing
     gosub echo
     move out
     goto leave-Crossing

Crossing-finish:
     gosub move out
     echo . [ Finish Enabled ]
     echo . [ Thinking ... ]
     if %to-Leth > 0 then goto Crossing-to-Leth
     if %to-Arthe > 0 then goto Ride-to-Arthe
     if %to-Stone > 0 then goto Ride-to-Stone
     if %to-Dirge > 0 then goto Ride-to-Dirge
     if %to-Tiger > 0 then goto Crossing-to-Tiger
     if %to-Wolf > 0 then goto Crossing-to-Wolf
     gosub verb tell caravan to follow
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub move-c w
     gosub move-c go stable
put pay 400
     pause
     gosub echo
put quit
     exit

Crossing-bank:
move e
move go stair
move e
move s
move down
move out
move e
move e
move e
move se
move e
move s
move s
move go bridge
move ne
move go bank
move go window
put dep all
	pause 0.5
put with %coin-to-carry
	pause 0.5
     gosub balance Crossing
move out
move out
move sw
move go bridge
move n
move w
move nw
move w
move w
move w
move w
move n
move e
move go guild
move climb stair
move n
move w
move down
move w
     return

Dirge-outpost:
     setvariable contract Dirge
     if %to-Dirge > 0 then goto turn-in-contracts
     setvariable to-Dirge 0
     setvariable get-contract 0
     if %finish.mode = 1 then goto Dirge-finish
     gosub verb get my ledger
     gosub verb open my ledger
     gosub verb turn ledger to chapter 1
     gosub verb turn ledger to page 2
     gosub verb read ledger
     gosub verb close my ledger
     gosub verb put my ledger in my %storage
     if %get-contract = 1 then gosub move climb stair
     if %get-contract = 1 then gosub verb spec finesse
     if %get-contract = 1 then gosub verb ask minist for contract
     if %get-contract = 1 then gosub move climb stair
     pause 0.1
     if %get-contract = 1 then gosub verb give clerk
     if %get-contract = 1 then gosub verb pay clerk
     if %get-contract = 1 then gosub verb read my contract
     if %get-contract = 1 then gosub verb put my contract in my %storage
     if %spec-finesse = 1 then gosub verb spec fin stop
     if %spec-finesse = 1 then setvariable spec-finesse 0
     if %get-contract = 1 then math to-%delivery add 1
     if %get-contract = 1 then setvariable Dirge-to-%delivery 1
     if %get-contract = 1 then setvariable from-Dirge 1
     gosub reset-to Dirge
     gosub echo
     move out
     gosub verb tell caravan to wait
     move n
     move go bank
put dep all
     pause 0.5
put withdraw %coin-to-carry
     pause 0.5
     gosub balance Dirge
     if %balance-Dirge > 200000 then put withdraw 500 silver
     if %balance-Dirge > 200000 then pause 0.5
     if %balance-Dirge > 200000 then gosub balance Dirge
     move out
     move south
     gosub verb tell caravan to follow
     gosub move-c go gate
     gosub move-c s
     gosub move-c s
     gosub move-c s
     gosub move-c e
     gosub move-c ne
     gosub move-c se
     gosub move-c e
     gosub move-c sw
     gosub move-c w
     gosub move-c sw
     gosub move-c w
     gosub move-c go road
     goto leave-Dirge

Dirge-finish:
     gosub echo
     gosub move out
     gosub verb tell caravan to wait
     gosub move n
     gosub move go bank
put dep all
     pause 0.5
put withdraw %coin-to-carry
     pause 0.5
     gosub balance Dirge
     if %balance-Dirge > 200000 then put withdraw 500 silver
     if %balance-Dirge > 200000 then pause 0.5
     if %balance-Dirge > 200000 then gosub balance Dirge
     move out
     move south
     gosub verb tell caravan to follow
     gosub move-c go gate
     gosub move-c s
     gosub move-c s
     gosub move-c s
     gosub move-c e
     gosub move-c ne
     gosub move-c se
     gosub move-c e
     gosub move-c sw
     gosub move-c w
     gosub move-c sw
     gosub move-c w
     gosub move-c go road
     echo . [ Finish Enabled ]
     echo . [ Thinking ... ]
     if %to-Stone > 0 then goto Ride-to-Stone
     if %to-Arthe > 0 then goto Ride-to-Arthe
     goto Ride-to-Crossing

Wolf-outpost:
     setvariable contract Wolf
     if %to-Wolf > 0 then goto turn-in-contracts
     setvariable to-Wolf 0
     setvariable get-contract 0
     if %finish.mode = 1 then goto Wolf-finish
     gosub verb get my ledger
     gosub verb open my ledger
     gosub verb turn ledger to chapter 1
     gosub verb turn ledger to page 3
     gosub verb read ledger
     gosub verb close my ledger
     gosub verb put my ledger in my %storage
     if %get-contract = 1 then gosub verb spec finesse
     if %get-contract = 1 then gosub verb ask minist for contract
     pause 0.1
     if %get-contract = 1 then gosub verb give clerk
     if %get-contract = 1 then gosub verb pay clerk
     if %get-contract = 1 then gosub verb read my contract
     if %get-contract = 1 then gosub verb put my contract in my %storage
     if %spec-finesse = 1 then gosub verb spec fin stop
     if %spec-finesse = 1 then setvariable spec-finesse 0
     if %get-contract = 1 then math to-%delivery add 1
     if %get-contract = 1 then setvariable Wolf-to-%delivery 1
     if %get-contract = 1 then setvariable from-Wolf 1
     gosub reset-to Wolf
Wolf-finish:
     gosub echo
     move out
     gosub feed-caravan
     gosub move-c n
     gosub move-c ne
     gosub move-c n
     gosub move-c go bush
     gosub move-c w
     gosub move-c n
     gosub move-c n
     gosub move-c ne
     gosub move-c e
     gosub move-c ne
     gosub move-c e
     gosub move-c go brook
     gosub feed-caravan
     gosub move-c e
	pause
	if "%teacher" != "off" then pause 2
	if "%student" != "off" then pause 2
     gosub move-c e
	pause
	if "%teacher" != "off" then pause 2
	if "%student" != "off" then pause 2
     gosub move-c e
     gosub move-c e
     gosub move-c se
     gosub move-c e
     goto Tiger-Entrance


Leth-outpost:
     setvariable contract Leth
     setvariable current-location Leth
     if %to-Leth > 0 then goto turn-in-contracts
     setvariable to-Leth 0
     if %finish.mode = 1 then goto Leth-finish
     if "%commodities" = "on" then gosub move west
     if "%commodities" = "on" then setvariable return read-Leth-commods
     if "%commodities" = "on" then goto read-commods
read-Leth-commods:
     if "%commodities" = "on" then gosub set-commods-board Leth
     if "%commodities" = "on" then gosub move east
     if "%commodities" = "on" then setvariable return sell-Leth-commods
     if "%commodities" = "on" then goto loaded-commods
sell-Leth-commods:
     if "%commodities" = "on" then setvariable return compare-Leth-commods
     if "%commodities" = "on" then goto Leth-Commods
compare-Leth-commods:
     if "%commodities" = "on" then gosub move west
     if "%commodities" = "on" then setvariable return buy-Leth-commods
     if "%commodities" = "on" then goto buying-commods
buy-Leth-commods:
     if "%commodities" = "on" then gosub verb pay clerk
     if "%commodities" = "on" then gosub move east
     setvariable get-contract 0
     gosub verb get my ledger
     gosub verb open my ledger
     gosub verb turn ledger to chapter 1
     gosub verb turn ledger to page 4
     gosub verb read ledger
     gosub verb close my ledger
     gosub verb put my ledger in my %storage
     if %get-contract = 1 then gosub verb spec finesse
     if %get-contract = 1 then gosub verb ask minist for contract
     pause 0.1
     if %get-contract = 1 then gosub verb give clerk
     if %get-contract = 1 then gosub verb pay clerk
     if %get-contract = 1 then gosub verb read my contract
     if %get-contract = 1 then gosub verb put my contract in my %storage
     if %spec-finesse = 1 then gosub verb spec fin stop
     if %spec-finesse = 1 then setvariable spec-finesse 0
     if %get-contract = 1 then math to-%delivery add 1
     if %get-contract = 1 then setvariable Leth-to-%delivery 1
     if %get-contract = 1 then setvariable from-Leth 1
     gosub reset-to Leth
Leth-finish:
     gosub echo
     move out
put tell cara to follow
	 pause 0.5
     gosub move-c nw
put tell cara to wait
     pause 0.5
     move e
     move e
     move go dep
     move up
     pause 0.1
put tap envelop in my %storage
     match no-buy.envelope You tap
     matchre buy-envelope (could not find|What were you)
     matchwait
buy-envelope:
put withdraw 3 plat
     pause 0.1
move down
move out
move w
move w
move w
move w
move w
move se
move go tent
     pause 0.1
put shop envelope on table
     match buy.first.envelope black "100" painted with a fat brush
     match shop.second.envelope how many sheets the envelope originally held
     matchwait
shop.second.envelope:
     pause 0.1
put shop second envelope on table
     match buy.second.envelope black "100" painted with a fat brush
     match shop.third.envelope how many sheets the envelope originally held
     matchwait
shop.third.envelope:
     pause 0.1
put shop third envelope on table
     match buy.third.envelope black "100" painted with a fat brush
     match buy.fourth.envelope how many sheets the envelope originally held
     matchwait
buy.first.envelope:
     pause 0.1
put buy envelope on table
     pause 0.1
     gosub verb put my envelope in my %storage
     pause 0.1
put buy envelope on table
     pause 0.1
     gosub verb put my envelope in my %storage
     goto leave-origami
buy.second.envelope:
     pause 0.1
put buy second envelope on table
     pause 0.1
     gosub verb put my envelope in my %storage
     pause 0.1
put buy second envelope on table
     pause 0.1
     gosub verb put my envelope in my %storage
     goto leave-origami
buy.third.envelope:
     pause 0.1
put buy third envelope on table
     pause 0.1
     gosub verb put my envelope in my %storage
     pause 0.1
put buy third envelope on table
     pause 0.1
     gosub verb put my envelope in my %storage
     goto leave-origami
buy.fourth.envelope:
     pause 0.1
put buy fourth envelope on table
     pause 0.1
     gosub verb put my envelope in my %storage
     pause 0.1
put buy fourth envelope on table
     pause 0.1
     gosub verb put my envelope in my %storage
     goto leave-origami
leave-origami:
     math coin-spent add 12500
     math coin-spent add 12500
     move out
     move nw
     move e
     move e
     move e
     move e
     move e
     move go dep
     move up
no-buy.envelope:
put dep all
     pause 0.5
put withdraw 2000 copper
     pause 0.5
     gosub balance Leth
     if %balance-Leth > 200000 then put withdraw 500 silver
     if %balance-Leth > 200000 then pause 0.5
     if %balance-Leth > 200000 then gosub balance Dirge
     gosub balance Leth
     move down
     move out
     move w
     move w
put tell cara to follow
    pause 0.5
     gosub move-c nw
     gosub move-c nw
     gosub move-c nw
     gosub move-c nw
     gosub move-c nw
     gosub move-c nw
     gosub move-c nw
     gosub move-c go gate
	goto leave-Leth

Arthe-stable:
     gosub verb tell caravan to follow
     gosub verb tell caravan to go fast
     gosub move-c out
     gosub move-c w
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub move-c w
     move go door
     move go door

Arthe-outpost:
     setvariable contract Arthe
     setvariable current-location Arthe
     if %to-Arthe > 0 then goto turn-in-contracts
     setvariable to-Arthe 0
     if %finish.mode = 1 then goto Arthe-finish
     if "%commodities" = "on" then gosub move west
     if "%commodities" = "on" then setvariable return read-Arthe-commods
     if "%commodities" = "on" then goto read-commods
read-Arthe-commods:
     if "%commodities" = "on" then gosub set-commods-board Arthe
     if "%commodities" = "on" then gosub move east
     if "%commodities" = "on" then setvariable return sell-Arthe-commods
     if "%commodities" = "on" then goto loaded-commods
sell-Arthe-commods:
     if "%commodities" = "on" then setvariable return compare-Arthe-commods
     if "%commodities" = "on" then goto Arthe-Commods
compare-Arthe-commods:
     if "%commodities" = "on" then gosub move west
     if "%commodities" = "on" then setvariable return buy-Arthe-commods
     if "%commodities" = "on" then goto buying-commods
buy-Arthe-commods:
     if "%commodities" = "on" then gosub verb pay clerk
     if "%commodities" = "on" then gosub move east
     setvariable get-contract 0
     gosub verb get my ledger
     gosub verb open my ledger
     gosub verb turn ledger to chapter 1
     gosub verb turn ledger to page 5
     gosub verb read ledger
     gosub verb close my ledger
     gosub verb put my ledger in my %storage
     if %get-contract = 1 then gosub verb spec finesse
     if %get-contract = 1 then gosub verb ask minist for contract
     pause 0.1
     if %get-contract = 1 then gosub verb give clerk
     if %get-contract = 1 then gosub verb pay clerk
     if %get-contract = 1 then gosub verb read my contract
     if %get-contract = 1 then gosub verb put my contract in my %storage
     if %spec-finesse = 1 then gosub verb spec fin stop
     if %spec-finesse = 1 then setvariable spec-finesse 0
     if %get-contract = 1 then math to-%delivery add 1
     if %get-contract = 1 then setvariable from-Arthe 1
     if %get-contract = 1 then setvariable Arthe-to-%delivery 1
     gosub reset-to Arthe
     gosub echo
     move go door
     move out
     goto leave-Arthe
Arthe-finish:
     gosub echo
     move go door
     move out
     echo . [ Finish Enabled ]
     echo . [ Thinking ... ]
     if %to-Stone > 0 then goto Ride-to-Stone
     if %to-Dirge > 0 then goto Ride-to-Dirge
     goto Ride-to-Crossing

Tiger-outpost:
     setvariable contract Tiger
     if %to-Tiger > 0 then goto turn-in-contracts
     setvariable to-Tiger 0
     setvariable get-contract 0
     if %finish.mode = 1 then goto Tiger-finish
     gosub verb get my ledger
     gosub verb open my ledger
     gosub verb turn ledger to chapter 1
     gosub verb turn ledger to page 6
     gosub verb read ledger
     gosub verb close my ledger
     gosub verb put my ledger in my %storage
     if %get-contract = 1 then gosub verb spec finesse
     if %get-contract = 1 then gosub verb ask minist for contract
     pause 0.1
     if %get-contract = 1 then gosub verb give clerk
     if %get-contract = 1 then gosub verb pay clerk
     if %get-contract = 1 then gosub verb read my contract
     if %get-contract = 1 then gosub verb put my contract in my %storage
     if %spec-finesse = 1 then gosub verb spec fin stop
     if %spec-finesse = 1 then setvariable spec-finesse 0
     if %get-contract = 1 then math to-%delivery add 1
     if %get-contract = 1 then setvariable from-Tiger 1
     if %get-contract = 1 then setvariable Tiger-to-%delivery 1
     gosub reset-to Tiger
Tiger-finish:
     gosub echo
     move out
put tell carav follow
	pause
put tell carav to go fast
	pause
	gosub feed-caravan
     gosub move-c se
     gosub move-c se
     gosub move-c ne
     gosub move-c n
     gosub move-c nw
     gosub move-c n
     gosub move-c go gate
	goto Tiger-Entrance

Stone-outpost:
     setvariable contract Stone
     if %to-Stone > 0 then goto turn-in-contracts
     setvariable to-Stone 0
     setvariable get-contract 0
     if %finish.mode = 1 then goto Stone-finish
     gosub verb get my ledger
     gosub verb open my ledger
     gosub verb turn ledger to chapter 1
     gosub verb turn ledger to page 7
     gosub verb read ledger
     gosub verb close my ledger
     gosub verb put my ledger in my %storage
     if %get-contract = 1 then gosub verb spec finesse
     if %get-contract = 1 then gosub verb ask minist for contract
     pause 0.1
     if %get-contract = 1 then gosub verb give clerk
     if %get-contract = 1 then gosub verb pay clerk
     if %get-contract = 1 then gosub verb read my contract
     if %get-contract = 1 then gosub verb put my contract in my %storage
     if %spec-finesse = 1 then gosub verb spec fin stop
     if %spec-finesse = 1 then setvariable spec-finesse 0
     if %get-contract = 1 then math to-%delivery add 1
     if %get-contract = 1 then setvariable from-Stone 1
     if %get-contract = 1 then setvariable Stone-to-%delivery 1
     gosub reset-to Stone
     gosub echo
     move out
     goto leave-Stone
Stone-finish:
     gosub echo
     gosub move out
     echo . [ Finish Enabled ]
     echo . [ Thinking ... ]
     if %to-Dirge > 0 then goto Ride-to-Dirge
     if %to-Arthe > 0 then goto Ride-to-Arthe
     goto Ride-to-Crossing

reset-to:
     setvariable Arthe-to-$1 0
     setvariable Dirge-to-$1 0
     setvariable Stone-to-$1 0
     setvariable Wolf-to-$1 0
     setvariable Tiger-to-$1 0
     setvariable Leth-to-$1 0
     setvariable Crossing-to-$1 0
     return

leave-Crossing:
     echo . [ Thinking ... ]
     if %to-Leth > 1 then goto Crossing-to-Leth
     setvariable west 0
     setvariable east 0
     if %to-Tiger > 0 then math west add %to-Tiger
     if %to-Wolf > 0 then math west add %to-Wolf
     if %to-Arthe > 0 then math east add %to-Arthe
     if %to-Dirge > 0 then math east add %to-Dirge
     if %to-Stone > 0 then math east add %to-Stone
     if %east > %west then goto leave-Crossing-east
     if %west > %east then goto leave-Crossing-west
     goto Ride-to-Arthe
leave-Crossing-east:
     if %from-Arthe = 0 then goto Ride-to-Arthe
     if %to-Arthe > 0 then goto Ride-to-Arthe
     if %from-Stone = 0 then goto Ride-to-Stone
     if %to-Stone > 0 then goto Ride-to-Stone
     if %from-Dirge = 0 then goto Ride-to-Dirge
     if %to-Dirge > 0 then goto Ride-to-Dirge
     goto Ride-to-Arthe
leave-Crossing-west:
     if %to-Tiger > 0 then goto Crossing-to-Tiger
     if %to-Wolf > 0 then goto Crossing-to-Wolf
     if %from-Tiger = 0 then goto Crossing-to-Tiger
     if %from-Wolf = 0 then goto Crossing-to-Wolf
     goto Crossing-to-Tiger

leave-Dirge:
     echo . [ Thinking ... ]
     if %from-Stone = 0 then goto Ride-to-Stone
     if %to-Stone > 0 then goto Ride-to-Stone
     if %from-Arthe = 0 then goto Ride-to-Arthe
     if %to-Arthe > 0 then goto Ride-to-Arthe
     goto Ride-to-Crossing

leave-Wolf:
     echo . [ Thinking ... ]
     if %from-Tiger = 0 then goto Wolf-to-Tiger
     if %to-Tiger > 0 then goto Wolf-to-Tiger
     goto Wolf-to-Crossing

leave-Leth:
     goto Ride-to-Ferry

leave-Arthe:
     echo . [ Thinking ... ]
     if %to-Leth > 1 then goto Ride-to-Crossing
     if %from-Stone = 0 then goto Ride-to-Stone
     if %to-Stone > 0 then goto Ride-to-Stone
     if %from-Dirge = 0 then goto Ride-to-Dirge
     if %to-Dirge > 0 then goto Ride-to-Dirge
     goto Ride-to-Crossing

leave-Tiger:
     echo . [ Thinking ... ]
     if %from-Wolf = 0 then goto Tiger-to-Wolf
     if %to-Wolf > 0 then goto Tiger-to-Wolf
     goto Tiger-to-Crossing

leave-Stone:
     echo . [ Thinking ... ]
     if %to-Leth > 1 then if %from-Arthe = 0 then goto Ride-to-Arthe
     if %to-Leth > 1 then if %to-Arthe > 0 then goto Ride-to-Arthe
     if %to-Leth > 1 then goto Ride-to-Crossing
     if %from-Dirge = 0 then goto Ride-to-Dirge
     if %to-Dirge > 0 then goto Ride-to-Dirge
     if %from-Arthe = 0 then goto Ride-to-Arthe
     if %to-Arthe > 0 then goto Ride-to-Arthe
     goto Ride-to-Crossing

Ride-to-Crossing:
     echo . [ Decision Made : Going To Crossing ]
     action setvariable arrived 1 when Northeast Wilds, Outside Northeast Gate
     gosub verb tell caravan to lead to crossing
     if %going-fast = 0 then gosub verb tell caravan to go fast
     setvariable return Crossing-Continue
     goto ride.to.location

Ride-to-Arthe:
     echo . [ Decision Made : Going To Arthe Dale ]
     action setvariable arrived 1 when Valley, Village Gate
     gosub verb tell caravan to lead to arthe dale
     if %going-fast = 0 then gosub verb tell caravan to go fast
     setvariable return Arthe-Continue
     goto ride.to.location

Ride-to-Stone:
     echo . [ Decision Made : Going To Stone Clan ]
     action setvariable arrived 1 when Lairocott Brach, Entrance
     gosub verb tell caravan to lead to stone clan
     if %going-fast = 0 then gosub verb tell caravan to go fast
     setvariable return Stone-Continue
     goto ride.to.location

Ride-to-Dirge:
     echo . [ Decision Made : Going To Dirge ]
     action setvariable arrived 1 when A narrow path branches off to the east following a rough line of hills while another section continues southeast.
     gosub verb tell caravan to lead to dirge
     if %going-fast = 0 then gosub verb tell caravan to go fast
     setvariable return Dirge-Continue
     goto ride.to.location

Ride-to-Leth:
     action setvariable arrived 1 when Southern Trade Route, Outside Leth Deriel
     gosub verb tell caravan to lead to leth deriel
     if %going-fast = 0 then gosub verb tell caravan to go fast
     setvariable return Leth-Continue
     goto ride.to.location

Ride-to-Ferry:
     action setvariable arrived 1 when To the northeast lie the outskirts of Chelsea Overlook, a small community overlooking the south bank of the Segoltha
     gosub verb tell caravan to lead to crossing
     if %going-fast = 0 then gosub verb tell caravan to go fast
     setvariable return Leth-Ferry
     goto ride.to.location


move:
     setvariable dir $0
     goto move.a
move.p:
     pause 0.5
move.a:
     if %listen = 1 then gosub listen
     if "%teacher" != "off" then gosub teach
     if %humming = 0 then gosub hum
put %dir
     match move.p type ahead
     match move.p ...wait
     match move-retreat You are engaged
     match move-stand You can't do that while sitting
     match move-stand You can't do that while lying down
     match move-stand You must be standing
     matchre move.d (Obvious path|Obvious exit)
     matchwait
move-stand.p:
     pause 0.5
move-stand:
put stand
     match move-stand.p type ahead
     match move-stand.p ...wait
     match move.a You stand back up
     match move-stand.p Roundtime
     matchwait
move-retreat.p:
     pause 0.5
move-retreat:
put retreat
     match move-retreat.p type ahead
     match move-retreat.p ...wait
     match move-retreat.p Roundtime
     match move-retreat You retreat back
     match move.a You retreat from combat
     match move.a You are already as far away
     matchwait
move.d:
     random 1 6
     if %r = 1 then put #statusbar Contracts Destined For ... Dirge : %to-Dirge     Stone Clan : %to-Stone     Crossing : %to-Crossing     Leth : %to-Leth     Wolf Clan : %to-Wolf     Tiger Clan : %to-Tiger     Arthe : %to-Arthe
     if %r = 2 then put #statusbar Contracts Received From ... Dirge : %from-Dirge     Stone Clan : %from-Stone     Crossing : %from-Crossing     Leth : %from-Leth     Wolf Clan : %from-Wolf     Tiger Clan : %from-Tiger     Arthe : %from-Arthe
     if %r = 3 then put #statusbar Total Coin Spent : %coin-spent    Total Coin Intake : %coin-intake   True Real Profit : %true-profit
     if %r = 4 then put #statusbar Total Contracts Delivered : %contracts-delivered   Avg. Profit Per Contract  : %avg-profit
     if %r = 5 then put #statusbar Ranks Gained : %ranks-gained   TDP's Gained : %tdps-gained
     if %r = 6 then put #statusbar Bank Balances ... Crossing : %balance-Crossing   Dirge : %balance-Dirge   Leth : %balance-Leth
     pause 0.1
     return


move-c:
     setvariable dir $0
     setvariable caravan-there 0
     goto move-c.a
move-c.p:
     pause 0.5
move-c.a:
     if %listen = 1 then gosub listen
     if "%teacher" != "off" then gosub teach
     if %humming = 0 then gosub hum
put %dir
     match move-c.p type ahead
     match move-c.p ...wait
     match move-c-retreat You are engaged
     match move-c-stand You can't do that while sitting
     match move-c-stand You can't do that while lying down
     match move-c-stand You must be standing
     matchre move-c.d (Obvious path|Obvious exit)
     matchwait
move-c-stand.p:
     pause 0.5
move-c-stand:
put stand
     match move-c-stand.p type ahead
     match move-c-stand.p ...wait
     match move-c.a You stand back up
     match move-c-stand.p Roundtime
     matchwait
move-c-retreat.p:
     pause 0.5
move-c-retreat:
put retreat
     match move-c-retreat.p type ahead
     match move-c-retreat.p ...wait
     match move-c-retreat.p Roundtime
     match move-c-retreat You retreat back
     match move-c.a You retreat from combat
     match move-c.a You are already as far away
     matchwait
move-c.d:
     if %caravan-there = 1 then goto move-c.r
     pause 0.5
     goto move-c.d
move-c.r:
     random 1 6
     if %r = 1 then put #statusbar Contracts Destined For ... Dirge : %to-Dirge     Stone Clan : %to-Stone     Crossing : %to-Crossing     Leth : %to-Leth     Wolf Clan : %to-Wolf     Tiger Clan : %to-Tiger     Arthe : %to-Arthe
     if %r = 2 then put #statusbar Contracts Received From ... Dirge : %from-Dirge     Stone Clan : %from-Stone     Crossing : %from-Crossing     Leth : %from-Leth     Wolf Clan : %from-Wolf     Tiger Clan : %from-Tiger     Arthe : %from-Arthe
     if %r = 3 then put #statusbar Total Coin Spent : %coin-spent    Total Coin Intake : %coin-intake   True Real Profit : %true-profit
     if %r = 4 then put #statusbar Total Contracts Delivered : %contracts-delivered   Avg. Profit Per Contract  : %avg-profit
     if %r = 5 then put #statusbar Ranks Gained : %ranks-gained   TDP's Gained : %tdps-gained
     if %r = 6 then put #statusbar Bank Balances ... Crossing : %balance-Crossing   Dirge : %balance-Dirge   Leth : %balance-Leth
     return
east-gate:
     gosub verb tell caravan to wait
     gosub move go stair
east-embrasure1p:
     pause 0.5
east-embrasure1:
put climb embrasure
     matchre east-embrasure1p (type ahead|...wait)
     match east-embrasure1-climbed Obvious path
     match east-embrasure1-fail Roundtime
     matchwait
east-embrasure1-climbed:
     gosub move go gate
     gosub move go stair
east-embrasure1-fail:
     gosub verb stand
     gosub move north
east-embrasure2p:
     pause 0.5
east-embrasure2:
put climb embrasure
     matchre east-embrasure2p (type ahead|...wait)
     match east-embrasure2-climbed Obvious path
     match east-embrasure2-fail Roundtime
     matchwait
east-embrasure2-climbed:
     gosub move s
     gosub move s
     gosub move go gate
     gosub move go stair
     gosub move n
east-embrasure2-fail:
     gosub verb stand
east-break.p:
     pause 0.5
east-break:
put climb break
     matchre east-break.p (type ahead|...wait)
     match east-break-climbed Obvious path
     match east-break-fail Roundtime
     matchwait
east-break-climbed:
     gosub move s
     gosub move go gate
     gosub move go stair
     gosub move n
east-break-fail:
     gosub verb stand
     gosub move s
     gosub move go stair
     gosub move go gate
east-wall1.p:
     pause 0.5
east-wall1:
put climb wall
     matchre east-wall1.p (type ahead|...wait)
     match east-wall1-climbed Obvious path
     match east-wall1-fail Roundtime
     matchwait
east-wall1-climbed:
     gosub move go stair
     gosub move go gate
east-wall1-fail:
     gosub verb stand
     gosub move go bush
east-wall2.p:
     pause 0.5
east-wall2:
put climb wall
     matchre east-wall2.p (type ahead|...wait)
     match east-wall2-climbed Obvious path
     match east-wall2-fail Roundtime
     matchwait
east-wall2-climbed:
     gosub move s
     gosub move go stair
     gosub move go gate
     gosub move go bush
east-wall2-fail:
     gosub verb stand
     gosub move n
east-wall3.p:
     pause 0.5
east-wall3:
put climb wall
     matchre east-wall3.p (type ahead|...wait)
     match east-wall3-climbed Obvious path
     match east-wall3-fail Roundtime
     matchwait
east-wall3-climbed:
     gosub move s
     gosub move go stair
     goto done-climb-east-gate
east-wall3-fail:
     gosub verb stand
     gosub move s
     gosub move s
     gosub move go gate
done-climb-east-gate:
     gosub verb tell caravan to follow
     goto east-gate-finished


turn-in-contracts:
     goto get.contract
get.contract.p:
     pause 0.5
get.contract:
put get my %contract contract
     match give.contract You get
     matchre turn-in-contracts-done (could not find|What were you)
     matchwait
give.contract.p:
     pause 0.5
give.contract:
     gosub read-turn-in
put give clerk
     matchre contract-math (shipment clerk finds everything in order|shipping clerk finds everything in order with your)
     matchre contract-bunk (sure this is the right|shipment clerk shakes his head and|shipping clerk shakes his head)
     matchwait
contract-bunk:
put drop my contract
     pause 0.5
     goto get.contract
contract-math:
     math contracts-delivered add 1
     goto get.contract
turn-in-contracts-done:
     setvariable to-%contract 0
     goto %contract-outpost


read-turn-in.p:
     pause 0.5
read-turn-in:
put read my contract
     matchre read-turn-in.p (type ahead|...wait)
     matchre read-turn-in.d Trading Contract Issued by:.*(Stone|Dirge|Crossing|Tiger|Wolf|Arthe|Leth)
     matchwait
read-turn-in.d:
     setvariable from-$1 0
     setvariable $1-to-%contract 0
     return


Ferry-Wait-Leth:
     action setvariable ferry-docked 1 when (The ferry .* pulls into the dock|You hear a bell ring out and a voice calling)
Ferry-Grass-Check:
put count grass in my feedbag
     matchre good.grass (There's|There are|There is) (thirty|fourty|fifty|sixty|seventy|eighty|ninety|one hundred)
     matchre bad.grass (parts left of the grass|could not find)
     matchwait
good.grass:
     goto Ferry-Collect
bad.grass:
     gosub verb forage grass
     gosub verb put my grass in my feedbag
     if %ferry-docked = 1 then goto Board-Ferry
     goto Ferry-Grass-Check
Ferry-Collect:
     gosub verb collect grass
     gosub verb kick pile
     if %ferry-docked = 1 then goto Board-Ferry
     goto Ferry-Collect

Ferry-Wait-Crossing:
     action setvariable ferry-docked 1 when (The ferry .* pulls into the dock|You hear a bell ring out and a voice calling)
     setvariable pebbles 1
     if "%jugglies" != "pebbles" then setvariable pebbles 0
     if "%jugglies" != "pebble" then setvariable pebbles 0
     if %pebbles = 0 then gosub verb get my %jugglies
     setvariable ferry-docked 0
Ferry-Wait-Juggle:
     gosub verb juggle my %jugglies
     if %ferry-docked = 1 then goto pre-board-ferry
     goto Ferry-Wait-Juggle

pre-board-ferry:
     setvariable pebbles 1
     if "%jugglies" != "pebbles" then setvariable pebbles 0
     if "%jugglies" != "pebble" then setvariable pebbles 0
     if %pebbles = 0 then gosub verb put my %jugglies in my %storage
Board-Ferry:
     action remove (The ferry .* pulls into the dock|You hear a bell ring out and a voice calling)
     setvariable ferry-docked 0
     action setvariable ferry-docked 1 when The ferry .* reaches the dock and its crew ties the ferry off
     gosub move-c go ferry
     gosub feed-caravan
     gosub verb get my %jugglies
Ride-Ferry-Juggling:
     gosub verb juggle my %jugglies
     if %ferry-docked = 1 then gosub move-c go dock
     if %ferry-docked = 1 then goto Done-Ferry-Ride
     goto Ride-Ferry-Juggling
Done-Ferry-Ride:
     setvariable pebbles 1
     if "%jugglies" != "pebbles" then setvariable pebbles 0
     if "%jugglies" != "pebble" then setvariable pebbles 0
     if %pebbles = 0 then gosub verb put my %jugglies in my %storage
     action remove The ferry .* reaches the dock and its crew ties the ferry off
     goto %return

Leth-Ferry:
     action remove To the northeast lie the outskirts of Chelsea Overlook, a small community overlooking the south bank of the Segoltha
     gosub move-c n
     setvariable return Dock-to-Crossing
     goto Ferry-Wait-Leth

Dock-to-Crossing:
     gosub move-c go square
     gosub move-c ne
     gosub move-c nw
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub verb tell caravan to wait
     move go door
     goto Crossing-outpost

Crossing-Continue:
     action remove Northeast Wilds, Outside Northeast Gate
     if "%train.climb" != "on" then goto Crossing-northeasterngate-1
     setvariable return Crossing-northeasterngate-1
     goto northeast-gate
Crossing-northeasterngate-1:
     gosub verb tell caravan to follow
     gosub move-c go footpath
     gosub move-c south
     gosub move-c down
     gosub move-c south
     gosub move-c south
     gosub move-c sw
     gosub move-c south
     gosub move-c south
     gosub move-c go gate
     if "%train.climb" != "on" then goto east-gate-finished
     goto east-gate

east-gate-finished:
    gosub move-c w
    gosub move-c w
    gosub move-c w
    gosub move-c w
    gosub move-c sw
    gosub move-c go bridge
    gosub move-c n
    gosub move-c w
    gosub move-c nw
    gosub move-c w
    gosub move-c w
    gosub move-c w
    gosub move-c w
    gosub move-c n
    gosub move-c n
    gosub verb tell caravan to wait
    move go door
    goto Crossing-outpost

Arthe-Continue:
     action remove Valley, Village Gate
     gosub verb tell caravan to follow
     gosub move-c go gate
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub move-c w
     move go door
     move go door
     goto Arthe-outpost

Leth-Continue:
     action remove Southern Trade Route, Outside Leth Deriel
     gosub verb tell caravan to follow
     gosub move-c go gate
     gosub move-c se
     gosub move-c se
     gosub move-c se
     gosub move-c se
     gosub move-c se
     gosub move-c se
     gosub move-c se
     gosub move-c se
     gosub verb tell cara to wait
move nw
move e
move e
move go dep
move up
put dep all
     pause 0.5
put withdraw %coin-to-carry
     pause 0.5
     gosub balance Leth
move down
move out
move w
move w
move se
put tell cara to follow
     pause 0.5
     move go shanty
     goto Leth-outpost

Dirge-Continue:
     action remove A narrow path branches off to the east following a rough line of hills while another section continues southeast.
     gosub verb tell caravan to follow
     gosub move-c go track
     gosub move-c e
     gosub move-c ne
     gosub move-c e
     gosub move-c ne
     gosub move-c w
     gosub move-c nw
     gosub move-c sw
     gosub move-c w
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub move-c go gate
move go stable
	goto Dirge-outpost

Stone-Continue:
     action remove Lairocott Brach, Entrance
     gosub verb tell caravan to follow
     gosub move-c down
     gosub move-c climb trail
move go outpost
     goto Stone-outpost


Crossing-to-Tiger:
Crossing-to-Wolf:
     gosub verb tell caravan to follow
     if %going-fast = 0 then gosub verb tell caravan to go fast
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub move-c n
     gosub move-c w
     gosub move-c w
     gosub move-c w
     if "%train.climb" != "on" then goto Crossing-westerngate-1
     setvariable return Crossing-westerngate-1
     goto west-gate
Crossing-westerngate-1:
     gosub move-c go gate
     gosub move-c go path
     gosub move-c w
     gosub move-c w
     gosub move-c nw
     gosub move-c w
     gosub move-c w
     gosub move-c nw
     gosub move-c w
     gosub move-c w
     gosub move-c sw
     gosub move-c w
     gosub move-c w
     gosub move-c nw
     gosub move-c nw
     gosub move-c w
	goto Tiger-Entrance


Tiger-Entrance:
     echo . [ Thinking ... ]
     if %finish.mode = 1 then goto Tiger-Wolf-finish
	if %to-Tiger > 0 then goto Tiger-Gate
	if %from-Tiger = 0 then goto Tiger-Gate
	if %to-Wolf > 0 then goto Tiger-to-Wolf
	if %from-Wolf = 0 then goto Tiger-to-Wolf
	goto Tiger-to-Crossing

Tiger-Wolf-finish:
     echo . [ Finish Enabled ]
	if %to-Tiger > 0 then goto Tiger-Gate
	if %to-Wolf > 0 then goto Tiger-to-Wolf
	goto Tiger-to-Crossing

Tiger-Gate:
     echo . [ Decision Made : Going To Tiger Clan ]
     gosub move-c go gate
     gosub move-c s
     gosub move-c se
     gosub move-c s
     gosub move-c sw
     gosub move-c nw
     gosub move-c nw
	move go outpost
	goto Tiger-outpost

Tiger-to-Wolf:
     echo . [ Decision Made : Going To Wolf Clan ]
     gosub move-c w
     gosub move-c nw
     gosub move-c w
     gosub move-c w
     gosub move-c go brook
     gosub feed-caravan
     gosub move-c w
	pause
	if "%teacher" != "off" then pause 2
	if "%student" != "off" then pause 2
     gosub move-c w
	pause
	if "%teacher" != "off" then pause 2
	if "%student" != "off" then pause 2
     gosub move-c w
     gosub move-c sw
     gosub move-c w
     gosub move-c sw
     gosub move-c s
     gosub move-c s
     gosub move-c e
     gosub move-c go bush
     gosub move-c s
     gosub move-c sw
     gosub move-c s
move go outpost
     goto Wolf-outpost

Tiger-to-Crossing:
     echo . [ Decision Made : Going To Crossing ]
     gosub move-c e
     gosub move-c se
     gosub move-c se
     gosub move-c e
     gosub move-c e
     gosub move-c ne
     gosub move-c e
     gosub move-c e
     gosub move-c se
     gosub move-c e
     gosub move-c e
     gosub move-c se
     gosub move-c e
     gosub move-c e
     gosub move-c go path
     gosub move-c go gate
     if "%train.climb" != "on" then goto Crossing-westerngate-2
     setvariable return Crossing-westerngate-2
     goto west-gate
Crossing-westerngate-2:
     gosub move-c e
     gosub move-c e
     gosub move-c e
     gosub move-c s
     gosub move-c s
     gosub move-c s
     gosub move-c s
     gosub move-c s
     gosub move-c s
     gosub verb tell caravan to wait
     move go door
     goto Crossing-outpost

northeast-gate:
     gosub verb tell caravan to wait
     gosub move go gate
     gosub move w
     gosub move go stair
     gosub move s
northeast-embrasure1p:
     pause 0.5
northeast-embrasure1:
put climb embrasure
     matchre northeast-embrasure1p (type ahead|...wait)
     match northeast-embrasure1-climbed Obvious path
     match northeast-embrasure1-fail Roundtime
     matchwait
northeast-embrasure1-climbed:
     gosub move go gate
     gosub move w
     gosub move go stair
     gosub move s
northeast-embrasure1-fail:
     gosub verb stand
     goto northeast-break
northeast-break.p:
     pause 0.5
northeast-break:
put climb break
     matchre northeast-break.p (type ahead|...wait)
     match northeast-break-climbed Obvious path
     match northeast-break-fail Roundtime
     matchwait
northeast-break-climbed:
     gosub move n
     goto northeast-wall1
northeast-break-fail:
     gosub move n
     gosub move go stair
     gosub move e
     gosub move go gate
northeast-wall1.p:
     pause 0.5
northeast-wall1:
put climb wall
     matchre northeast-wall1.p (type ahead|...wait)
     match northeast-wall1-climbed Obvious path
     match northeast-wall1-fail Roundtime
     matchwait
northeast-wall1-climbed:
     gosub move go stair
     gosub move e
     gosub move go gate
northeast-wall1-fail:
     gosub move go footpath
northeast-wall2.p:
     pause 0.5
northeast-wall2:
put climb wall
     matchre northeast-wall2.p (type ahead|...wait)
     match northeast-wall2-climbed Obvious path
     match northeast-wall2-fail Roundtime
     matchwait
northeast-wall2-climbed:
     gosub move n
     gosub move go stair
     gosub move e
     gosub move go gate
     gosub move go footpath
northeast-wall2-fail:
     gosub move n
     goto %return


west-gate:
     gosub verb tell caravan to wait
     gosub move go stair
west-embrasure1p:
     pause 0.5
west-embrasure1:
put climb embrasure
     matchre west-embrasure1p (type ahead|...wait)
     match west-embrasure1-climbed Obvious path
     match west-embrasure1-fail Roundtime
     matchwait
west-embrasure1-climbed:
     gosub move go gate
     gosub move go stair
west-embrasure1-fail:
     gosub move south
west-embrasure2p:
     pause 0.5
     gosub verb stand
west-embrasure2:
put climb embrasure
     matchre west-embrasure2p (type ahead|...wait)
     match west-embrasure2p Stand up first
     match west-embrasure2-climbed Obvious path
     match west-embrasure2-fail Roundtime
     matchwait
west-embrasure2-climbed:
     gosub move se
     gosub move go gate
     gosub move go stair
     gosub move s
west-embrasure2-fail:
     gosub move n
     gosub move e
west-break.p:
     pause 0.5
west-break:
put climb break
     matchre west-break.p (type ahead|...wait)
     match west-break-climbed Obvious path
     match west-break-fail Roundtime
     matchwait
west-break-climbed:
     gosub move s
     gosub move go gate
     gosub move go stair
     gosub move e
west-break-fail:
west-embrasure3p:
     pause 0.5
     gosub verb stand
west-embrasure3:
put climb embrasure
     matchre west-embrasure3p (type ahead|...wait)
     match west-embrasure3p Stand up first
     match west-embrasure3-climbed Obvious path
     match west-embrasure3-fail Roundtime
     matchwait
west-embrasure3-climbed:
     gosub move sw
     gosub move s
     goto west-wall1
west-embrasure3-fail:
     gosub move w
     gosub move go stair
     gosub move go gate
west-wall1.p:
     pause 0.5
west-wall1:
put climb wall
     matchre west-wall1.p (type ahead|...wait)
     match west-wall1-climbed Obvious path
     match west-wall1-fail Roundtime
     matchwait
west-wall1-climbed:
     gosub move go stair
     gosub move go gate
west-wall1-fail:
     gosub move nw
west-wall2.p:
     pause 0.5
west-wall2:
put climb wall
     matchre west-wall2.p (type ahead|...wait)
     match west-wall2-climbed Obvious path
     match west-wall2-fail Roundtime
     matchwait
west-wall2-climbed:
     gosub move n
     gosub move go stair
     gosub move go gate
     gosub move nw
west-wall2-fail:
     gosub move se
     gosub move go trail
west-wall3.p:
     pause 0.5
west-wall3:
put climb wall
     matchre west-wall3.p (type ahead|...wait)
     match west-wall3-climbed Obvious path
     match west-wall3-fail Roundtime
     matchwait
west-wall3-climbed:
     gosub move w
     gosub move go stair
     goto done-climb-west-gate
west-wall3-fail:
     gosub move s
     gosub move go gate
done-climb-west-gate:
     gosub verb tell caravan to follow
     goto %return

Crossing-to-Leth:
     echo . [ Decision Made : Going To Leth Deriel ]
     gosub verb tell caravan to wait
     move go door
move e
move go stair
move e
move s
move down
move out
move e
move e
move e
move se
move e
move s
move s
move go bridge
move ne
move go bank
move go window
put dep all
	pause 0.5
put with 2000 copper
	pause 0.5
	gosub balance Crossing
move out
move out
move sw
move go bridge
move n
move w
move nw
move w
move w
move w
move w
move n
move e
move go guild
move climb stair
move n
move w
move down
move w
     move out
     gosub verb tell caravan to follow
     gosub move-c s
     gosub move-c s
     gosub move-c s
     gosub move-c se
     gosub move-c sw
     gosub move-c go pier
     setvariable return Ride-to-Leth
     goto Ferry-Wait-Crossing


feed-caravan:
     gosub verb remove feedbag
     gosub verb give caravan
     gosub verb wear feedbag
     return


ride.to.location:
     if %ferry = 1 then pause 3
     setvariable arrived 0
     setvariable ferry-docked 0
     gosub feed-caravan
     if "%interior" = "on" then gosub verb go %caravan
     if %app.knife = 1 then gosub verb get knife in my %storage
     if %app.knife = 1 then gosub verb app my knife careful
     if %app.knife = 1 then pause 0.1
     if %app.knife = 1 then gosub verb turn my knife
     if %app.knife = 1 then pause 0.1
     if %app.knife = 1 then gosub verb app my %knifey
     if %app.knife = 1 then pause 0.1
     if %app.knife = 1 then gosub verb turn my %knifey
     if %app.knife = 1 then gosub verb put my knif in my %storage
     if %app.knife = 0 then gosub verb get my %appraisal.tool in my %storage
     if %app.knife = 0 then gosub verb app my %appraisal.tool quick
     if %app.knife = 0 then gosub verb app my %appraisal.tool
     if %app.knife = 0 then gosub verb app my %appraisal.tool careful
     if %app.knife = 0 then gosub verb put my %appraisal.tool in my %storage
     if "%compendium" = "off" then goto origami
     if "%compendium" = "chart" then goto compendium-chart
     gosub verb get my compendium
     setvariable ridestudy 0
ride.study:
     gosub verb turn my compendium
     gosub verb study my compendium
     math ridestudy add 1
     if %ridestudy < 2 then goto ride.study
     gosub verb put my compendium in my %storage
     goto origami
compendium-chart:
     gosub verb get chart in my %storage
     gosub verb study my chart
     gosub verb study my chart
     gosub verb put my chart in my %storage
origami:
     goto pull
pull.p:
     pause 0.5
pull:
     if %arrived = 1 then goto done-origami-2
put pull my envelope
     match newenvelope is empty
	match study You get
	match pull.p type ahead
	match pull.p ...wait
	matchwait
newenvelope:
     gosub verb rem my envel
     gosub verb poke my envel
     gosub verb get my envel
     gosub verb wear my env
     goto pull
study:
     if %arrived = 1 then goto done-origami
     gosub verb study %origami-instructions
fold.p:
     pause 0.5
fold:
     if %arrived = 1 then goto done-origami
     if %ferry-docked = 1 then goto done-origami
     match fold.p type ahead
     match fold.p ...wait
     match exhale gaze proudly
     match exhale You make the final fold
     match fold Roundtime
put fold my paper
     matchwait
exhale:
     gosub verb exhale my %origami-completed
     goto pull
done-origami:
     setvariable poked 0
     gosub verb poke my paper
     if %poked = 0 then gosub verb exhale my %origami-completed
done-origami-2:
     if "%interior" = "on" then gosub move go door
     setvariable ferry 0
     goto %return


verb:
     setvariable verb $0
     goto verb.a
verb.p:
     pause 0.5
verb.a:
     if "%verb" = "tell caravan to go fast" then setvariable going-fast 1
     if %listen = 1 then gosub listen
     if "%teacher" != "off" then gosub teach
     if %humming = 0 then gosub hum
put %verb
     match verb.p type ahead
     match verb.p ...wait
     match verb.p You are overburdened and cannot manage to stand
     match verb.d You try to concentrate on presenting your best appearance, but an idle thought catches your attention
     matchre verb.d (You get|You put|You remove|You attach|STOW HELP|Roundtime|chart again|You turn|toss it away|You offer|You place|find a hole|The driver takes the feedbag|You exhale into your|find a hole|You take a step back|could not find|doesn't seem to do much|You aren't wearing that|Pressing firmly on a recessed|You open|You flip|You close|The minister plucks a contract|You can't seem to concentrate|The shipment clerk accepts|You pass on the order|already standing|You stand|You focus yourself|But you are already|You count out some|You estimate these goods|You feel your concentration|But you aren't focussing|the clerk says, grinning, and goes back to work|The shipping clerk finds everything in order|The shipping clerk shakes his head|You tell your driver|create a smoke image from one of your known images|You don't know how to do that|Interior]|You do not owe dues|with this guild|have another contract we issued)
     match verb.drop You blow gently
     matchwait
verb.drop:
put drop my %origami-completed
     pause 0.1
verb.d:
     pause 0.1
     random 1 6
     if %r = 1 then put #statusbar Contracts Destined For ... Dirge : %to-Dirge     Stone Clan : %to-Stone     Crossing : %to-Crossing     Leth : %to-Leth     Wolf Clan : %to-Wolf     Tiger Clan : %to-Tiger     Arthe : %to-Arthe
     if %r = 2 then put #statusbar Contracts Received From ... Dirge : %from-Dirge     Stone Clan : %from-Stone     Crossing : %from-Crossing     Leth : %from-Leth     Wolf Clan : %from-Wolf     Tiger Clan : %from-Tiger     Arthe : %from-Arthe
     if %r = 3 then put #statusbar Total Coin Spent : %coin-spent     Total Coin Intake : %coin-intake     True Real Profit : %true-profit
     if %r = 4 then put #statusbar Total Contracts Delivered : %contracts-delivered     Avg. Profit Per Contract  : %avg-profit
     if %r = 5 then put #statusbar Ranks Gained : %ranks-gained     TDP's Gained : %tdps-gained
     if %r = 6 then put #statusbar Bank Balances ... Crossing : %balance-Crossing     Dirge : %balance-Dirge     Leth : %balance-Leth
     return

teach.p:
     pause 0.5
teach:
     if "%teacher" = "off" then goto teach.d
put %teacher
     match teach.p ...wait
     match teach.p type ahead
     match teach.d You begin to lecture
     match teach.f could not find who you were referring
     matchwait
teach.f:
     setvariable teacher off
teach.d:
     return

listen.p:
     pause 0.5
listen:
     if "%student" = "off" then goto listen.d
put %student
     match listen.p type ahead
     match listen.p ...wait
     match listen.d You being to listen to
     match listen.d You are already listening
     match listen.f could not find who you
     matchwait
listen.f:
     setvariable student off
listen.d:
     setvariable listen 0
     return

hum.p3:
     pause 2
     goto hum
hum.p:
     pause 0.5
hum:
     random 1 3
     if %r = 1 then put hum %song-1
     if %r = 2 then put hum %song-2
     if %r = 3 then put hum %song-3
     match hum.p3 You can't muster the strength to perform
     match hum.p type ahead
     match hum.p ...wait
     matchre hum.done (You are already performing something|You begin to hum|You fumble slightly as you begin to hum|You effortlessly begin to hum|You struggle to begin to hum)
     matchwait
hum.done:
     setvariable humming 1
     return


balance:
     setvariable bank $1
     action setvariable platinum $1 when (\d+) platinum
     action setvariable gold $1 when (\d+) gold
     action setvariable silver $1 when (\d+) silver
     action setvariable bronze $1 when (\d+) bronze
     action setvariable copper $1 when (\d+) copper
     setvariable platinum 0
     setvariable gold 0
     setvariable silver 0
     setvariable bronze 0
     setvariable copper 0
     goto balance-a
balance.p:
     pause 0.5
balance-a:
put balance
     matchre balance.p (type ahead|...wait)
     match balance.d Kronars.
     matchwait
balance.d:
     pause 0.1
     math platinum multiply 10000
     math gold multiply 1000
     math silver multiply 100
     math bronze multiply 10
     setvariable balance %copper
     math balance add %bronze
     math balance add %silver
     math balance add %gold
     math balance add %platinum
     setvariable balance-%bank %balance
     action remove (\d+) platinum
     action remove (\d+) gold
     action remove (\d+) silver
     action remove (\d+) bronze
     action remove (\d+) copper
     return

set-commods-board:
setvariable $1-Diamonds-price %Diamonds-price
setvariable $1-Pearls-price %Pearls-price
setvariable $1-Gold-price %Gold-price
setvariable $1-Silver-price %Silver-price
setvariable $1-IronOre-price %IronOre-price
setvariable $1-Charcoal-price %Charcoal-price
setvariable $1-Amber-price %Amber-price
setvariable $1-Saffron-price %Saffron-price
setvariable $1-Cinnamon-price %Cinnamon-price
setvariable $1-Papyrus-price %Papyrus-price
setvariable $1-Oranges-price %Oranges-price
setvariable $1-Limes-price %Limes-price
setvariable $1-Slate-price %Slate-price
setvariable $1-Brass-price %Brass-price
setvariable $1-Lead-price %Lead-price
setvariable $1-Copper-price %Copper-price
setvariable $1-Bronze-price %Bronze-price
setvariable $1-Silk-price %Silk-price
setvariable $1-Cotton-price %Cotton-price
setvariable $1-Wool-price %Wool-price
setvariable $1-Lace-price %Lace-price
setvariable $1-Velvet-price %Velvet-price
setvariable $1-DeobarOil-price %DeobarOil-price
setvariable $1-Myrrh-price %Myrrh-price
setvariable $1-Salt-price %Salt-price
setvariable $1-Indigo-price %Indigo-price
setvariable $1-PurpleDye-price %PurpleDye-price
setvariable $1-Barley-price %Barley-price
setvariable $1-Wheat-price %Wheat-price
setvariable $1-Oats-price %Oats-price
setvariable $1-Corn-price %Corn-price
setvariable $1-Acanth-price %Acanth-price
setvariable $1-Taffelberries-price %Taffelberries-price
setvariable $1-Apples-price %Apples-price

setvariable $1-Diamonds-demand %Diamonds-demand
setvariable $1-Pearls-demand %Pearls-demand
setvariable $1-Gold-demand %Gold-demand
setvariable $1-Silver-demand %Silver-demand
setvariable $1-IronOre-demand %IronOre-demand
setvariable $1-Charcoal-demand %Charcoal-demand
setvariable $1-Amber-demand %Amber-demand
setvariable $1-Saffron-demand %Saffron-demand
setvariable $1-Cinnamon-demand %Cinnamon-demand
setvariable $1-Papyrus-demand %Papyrus-demand
setvariable $1-Oranges-demand %Oranges-demand
setvariable $1-Limes-demand %Limes-demand
setvariable $1-Slate-demand %Slate-demand
setvariable $1-Brass-demand %Brass-demand
setvariable $1-Lead-demand %Lead-demand
setvariable $1-Copper-demand %Copper-demand
setvariable $1-Bronze-demand %Bronze-demand
setvariable $1-Silk-demand %Silk-demand
setvariable $1-Cotton-demand %Cotton-demand
setvariable $1-Wool-demand %Wool-demand
setvariable $1-Lace-demand %Lace-demand
setvariable $1-Velvet-demand %Velvet-demand
setvariable $1-DeobarOil-demand %DeobarOil-demand
setvariable $1-Myrrh-demand %Myrrh-demand
setvariable $1-Salt-demand %Salt-demand
setvariable $1-Indigo-demand %Indigo-demand
setvariable $1-PurpleDye-demand %PurpleDye-demand
setvariable $1-Barley-demand %Barley-demand
setvariable $1-Wheat-demand %Wheat-demand
setvariable $1-Oats-demand %Oats-demand
setvariable $1-Corn-demand %Corn-demand
setvariable $1-Acanth-demand %Acanth-demand
setvariable $1-Taffelberries-demand %Taffelberries-demand
setvariable $1-Apples-demand %Apples-demand
     return

startup-prices:
setvariable $1-Diamonds-price 0
setvariable $1-Pearls-price 0
setvariable $1-Gold-price 0
setvariable $1-Silver-price 0
setvariable $1-IronOre-price 0
setvariable $1-Charcoal-price 0
setvariable $1-Amber-price 0
setvariable $1-Saffron-price 0
setvariable $1-Cinnamon-price 0
setvariable $1-Papyrus-price 0
setvariable $1-Oranges-price 0
setvariable $1-Limes-price 0
setvariable $1-Slate-price 0
setvariable $1-Brass-price 0
setvariable $1-Lead-price 0
setvariable $1-Copper-price 0
setvariable $1-Bronze-price 0
setvariable $1-Silk-price 0
setvariable $1-Cotton-price 0
setvariable $1-Wool-price 0
setvariable $1-Lace-price 0
setvariable $1-Velvet-price 0
setvariable $1-DeobarOil-price 0
setvariable $1-Myrrh-price 0
setvariable $1-Salt-price 0
setvariable $1-Indigo-price 0
setvariable $1-PurpleDye-price 0
setvariable $1-Barley-price 0
setvariable $1-Wheat-price 0
setvariable $1-Oats-price 0
setvariable $1-Corn-price 0
setvariable $1-Acanth-price 0
setvariable $1-Taffelberries-price 0
setvariable $1-Apples-price 0
     return

read-commods:

action setvariable Diamonds-price $1 when Diamonds *(\d+)
action setvariable Pearls-price $1 when Pearls *(\d+)
action setvariable Gold-price $1 when Gold *(\d+)
action setvariable Silver-price $1 when Silver *(\d+)
action setvariable IronOre-price $1 when Iron Ore *(\d+)
action setvariable Charcoal-price $1 when Charcoal *(\d+)
action setvariable Amber-price $1 when Amber *(\d+)
action setvariable Saffron-price $1 when Saffron *(\d+)
action setvariable Cinnamon-price $1 when Cinnamon *(\d+)
action setvariable Papyrus-price $1 when Papyrus *(\d+)
action setvariable Oranges-price $1 when Oranges *(\d+)
action setvariable Limes-price $1 when Limes *(\d+)
action setvariable Slate-price $1 when Slate *(\d+)
action setvariable Brass-price $1 when Brass *(\d+)
action setvariable Lead-price $1 when Lead *(\d+)
action setvariable Copper-price $1 when Copper *(\d+)
action setvariable Bronze-price $1 when Bronze *(\d+)
action setvariable Silk-price $1 when Silk *(\d+)
action setvariable Cotton-price $1 when Cotton *(\d+)
action setvariable Wool-price $1 when Wool *(\d+)
action setvariable Lace-price $1 when Lace *(\d+)
action setvariable Velvet-price $1 when Velvet *(\d+)
action setvariable DeobarOil-price $1 when Deobar Oil *(\d+)
action setvariable Myrrh-price $1 when Myrrh *(\d+)
action setvariable Salt-price $1 when Salt *(\d+)
action setvariable Indigo-price $1 when Indigo *(\d+)
action setvariable PurpleDye-price $1 when Purple Dye *(\d+)
action setvariable Barley-price $1 when Barley *(\d+)
action setvariable Wheat-price $1 when Wheat *(\d+)
action setvariable Oats-price $1 when Oats *(\d+)
action setvariable Corn-price $1 when Corn *(\d+)
action setvariable Acanth-price $1 when Acanth *(\d+)
action setvariable Taffelberries-price $1 when Taffelberries *(\d+)
action setvariable Apples-price $1 when Apples *(\d+)

put read board
     waitfor Apples
     pause 0.1

action remove Diamonds *(\d+)
action remove Pearls *(\d+)
action remove Gold *(\d+)
action remove Silver *(\d+)
action remove Iron Ore *(\d+)
action remove Charcoal *(\d+)
action remove Amber *(\d+)
action remove Saffron *(\d+)
action remove Cinnamon *(\d+)
action remove Papyrus *(\d+)
action remove Oranges *(\d+)
action remove Limes *(\d+)
action remove Slate *(\d+)
action remove Brass *(\d+)
action remove Lead *(\d+)
action remove Copper *(\d+)
action remove Bronze *(\d+)
action remove Silk *(\d+)
action remove Cotton *(\d+)
action remove Wool *(\d+)
action remove Lace *(\d+)
action remove Velvet *(\d+)
action remove Deobar Oil *(\d+)
action remove Myrrh *(\d+)
action remove Salt *(\d+)
action remove Indigo *(\d+)
action remove Purple Dye *(\d+)
action remove Barley *(\d+)
action remove Wheat *(\d+)
action remove Oats *(\d+)
action remove Corn *(\d+)
action remove Acanth *(\d+)
action remove Taffelberries *(\d+)
action remove Apples *(\d+)

action setvariable Diamonds-demand $2 when Diamonds *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Pearls-demand $2 when Pearls *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Gold-demand $2 when Gold *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Silver-demand $2 when Silver *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable IronOre-demand $2 when Iron Ore *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Charcoal-demand $2 when Charcoal *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Amber-demand $2 when Amber *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Saffron-demand $2 when Saffron *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Cinnamon-demand $2 when Cinnamon *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Papyrus-demand $2 when Papyrus *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Oranges-demand $2 when Oranges *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Limes-demand $2 when Limes *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Slate-demand $2 when Slate *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Brass-demand $2 when Brass *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Lead-demand $2 when Lead *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Copper-demand $2 when Copper *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Bronze-demand $2 when Bronze *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Silk-demand $2 when Silk *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Cotton-demand $2 when Cotton *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Wool-demand $2 when Wool *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Lace-demand $2 when Lace *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Velvet-demand $2 when Velvet *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable DeobarOil-demand $2 when Deobar Oil *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Myrrh-demand $2 when Myrrh *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Salt-demand $2 when Salt *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Indigo-demand $2 when Indigo *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable PurpleDye-demand $2 when Purple Dye *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Barley-demand $2 when Barley *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Wheat-demand $2 when Wheat *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Oats-demand $2 when Oats *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Corn-demand $2 when Corn *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Acanth-demand $2 when Acanth *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Taffelberries-demand $2 when Taffelberries *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action setvariable Apples-demand $2 when Apples *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)


put read board
     waitfor Apples
     pause 0.1

action remove Diamonds *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Pearls *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Gold *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Silver *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Iron Ore *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Charcoal *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Amber *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Saffron *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Cinnamon *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Papyrus *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Oranges *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Limes *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Slate *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Brass *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Lead *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Copper *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Bronze *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Silk *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Cotton *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Wool *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Lace *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Velvet *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Deobar Oil *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Myrrh *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Salt *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Indigo *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Purple Dye *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Barley *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Wheat *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Oats *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Corn *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Acanth *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Taffelberries *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)
action remove Apples *(\d+) *(Surplus|Going|Good|Nearly|\*SOLD)

goto %return

Leth-Commods:
     math Diamonds-price add %minimum.profit.per.unit
     if %Diamonds-price < %Arthe-Diamonds-price then gosub compare-commods Diamonds %Leth-Diamonds-demand %Arthe-Diamonds-demand
     if %Diamonds-price < %Crossing-Diamonds-price then gosub compare-commods Diamonds %Leth-Diamonds-demand %Crossing-Diamonds-demand
     math Pearls-price add %minimum.profit.per.unit
     if %Pearls-price < %Arthe-Pearls-price then gosub compare-commods Pearls %Leth-Pearls-demand %Arthe-Pearls-demand
     if %Pearls-price < %Crossing-Pearls-price then gosub compare-commods Pearls %Leth-Pearls-demand %Crossing-Pearls-demand
     math Gold-price add %minimum.profit.per.unit
     if %Gold-price < %Arthe-Gold-price then gosub compare-commods Gold %Leth-Gold-demand %Arthe-Gold-demand
     if %Gold-price < %Crossing-Gold-price then gosub compare-commods Gold %Leth-Gold-demand %Crossing-Gold-demand
     math Copper-price add %minimum.profit.per.unit
     if %Copper-price < %Arthe-Copper-price then gosub compare-commods Copper %Leth-Copper-demand %Arthe-Copper-demand
     if %Copper-price < %Crossing-Copper-price then gosub compare-commods Copper %Leth-Copper-demand %Crossing-Copper-demand
     math Wool-price add %minimum.profit.per.unit
     if %Wool-price < %Arthe-Wool-price then gosub compare-commods Wool %Leth-Wool-demand %Arthe-Wool-demand
     if %Wool-price < %Crossing-Wool-price then gosub compare-commods Wool %Leth-Wool-demand %Crossing-Wool-demand
     math Myrrh-price add %minimum.profit.per.unit
     if %Myrrh-price < %Arthe-Myrrh-price then gosub compare-commods Myrrh %Leth-Myrrh-demand %Arthe-Myrrh-demand
     if %Myrrh-price < %Crossing-Myrrh-price then gosub compare-commods Myrrh %Leth-Myrrh-demand %Crossing-Myrrh-demand
     math Barley-price add %minimum.profit.per.unit
     if %Barley-price < %Arthe-Barley-price then gosub compare-commods Barley %Leth-Barley-demand %Arthe-Barley-demand
     if %Barley-price < %Crossing-Barley-price then gosub compare-commods Barley %Leth-Barley-demand %Crossing-Barley-demand
     math Acanth-price add %minimum.profit.per.unit
     if %Acanth-price < %Arthe-Acanth-price then gosub compare-commods Acanth %Leth-Acanth-demand %Arthe-Acanth-demand
     if %Acanth-price < %Crossing-Acanth-price then gosub compare-commods Acanth %Leth-Acanth-demand %Crossing-Acanth-demand
     math Silver-price add %minimum.profit.per.unit
     if %Silver-price < %Arthe-Silver-price then gosub compare-commods Silver %Leth-Silver-demand %Arthe-Silver-demand
     if %Silver-price < %Crossing-Silver-price then gosub compare-commods Silver %Leth-Silver-demand %Crossing-Silver-demand
     math IronOre-price add %minimum.profit.per.unit
     if %IronOre-price < %Arthe-IronOre-price then gosub compare-commods IronOre %Leth-IronOre-demand %Arthe-IronOre-demand
     if %IronOre-price < %Crossing-IronOre-price then gosub compare-commods IronOre %Leth-IronOre-demand %Crossing-IronOre-demand
     math Charcoal-price add %minimum.profit.per.unit
     if %Charcoal-price < %Arthe-Charcoal-price then gosub compare-commods Charcoal %Leth-Charcoal-demand %Arthe-Charcoal-demand
     if %Charcoal-price < %Crossing-Charcoal-price then gosub compare-commods Charcoal %Leth-Charcoal-demand %Crossing-Charcoal-demand
     math Amber-price add %minimum.profit.per.unit
     if %Amber-price < %Arthe-Amber-price then gosub compare-commods Amber %Leth-Amber-demand %Arthe-Amber-demand
     if %Amber-price < %Crossing-Amber-price then gosub compare-commods Amber %Leth-Amber-demand %Crossing-Amber-demand
     math Saffron-price add %minimum.profit.per.unit
     if %Saffron-price < %Arthe-Saffron-price then gosub compare-commods Saffron %Leth-Saffron-demand %Arthe-Saffron-demand
     if %Saffron-price < %Crossing-Saffron-price then gosub compare-commods Saffron %Leth-Saffron-demand %Crossing-Saffron-demand
     math Cinnamon-price add %minimum.profit.per.unit
     if %Cinnamon-price < %Arthe-Cinnamon-price then gosub compare-commods Cinnamon %Leth-Cinnamon-demand %Arthe-Cinnamon-demand
     if %Cinnamon-price < %Crossing-Cinnamon-price then gosub compare-commods Cinnamon %Leth-Cinnamon-demand %Crossing-Cinnamon-demand
     math Papyrus-price add %minimum.profit.per.unit
     if %Papyrus-price < %Arthe-Papyrus-price then gosub compare-commods Papyrus %Leth-Papyrus-demand %Arthe-Papyrus-demand
     if %Papyrus-price < %Crossing-Papyrus-price then gosub compare-commods Papyrus %Leth-Papyrus-demand %Crossing-Papyrus-demand
     math Oranges-price add %minimum.profit.per.unit
     if %Oranges-price < %Arthe-Oranges-price then gosub compare-commods Oranges %Leth-Oranges-demand %Arthe-Oranges-demand
     if %Oranges-price < %Crossing-Oranges-price then gosub compare-commods Oranges %Leth-Oranges-demand %Crossing-Oranges-demand
     math Limes-price add %minimum.profit.per.unit
     if %Limes-price < %Arthe-Limes-price then gosub compare-commods Limes %Leth-Limes-demand %Arthe-Limes-demand
     if %Limes-price < %Crossing-Limes-price then gosub compare-commods Limes %Leth-Limes-demand %Crossing-Limes-demand
     math Brass-price add %minimum.profit.per.unit
     if %Brass-price < %Arthe-Brass-price then gosub compare-commods Brass %Leth-Brass-demand %Arthe-Brass-demand
     if %Brass-price < %Crossing-Brass-price then gosub compare-commods Brass %Leth-Brass-demand %Crossing-Brass-demand
     math Cotton-price add %minimum.profit.per.unit
     if %Cotton-price < %Arthe-Cotton-price then gosub compare-commods Cotton %Leth-Cotton-demand %Arthe-Cotton-demand
     if %Cotton-price < %Crossing-Cotton-price then gosub compare-commods Cotton %Leth-Cotton-demand %Crossing-Cotton-demand
     math Salt-price add %minimum.profit.per.unit
     if %Salt-price < %Arthe-Salt-price then gosub compare-commods Salt %Leth-Salt-demand %Arthe-Salt-demand
     if %Salt-price < %Crossing-Salt-price then gosub compare-commods Salt %Leth-Salt-demand %Crossing-Salt-demand
     math Oats-price add %minimum.profit.per.unit
     if %Oats-price < %Arthe-Oats-price then gosub compare-commods Oats %Leth-Oats-demand %Arthe-Oats-demand
     if %Oats-price < %Crossing-Oats-price then gosub compare-commods Oats %Leth-Oats-demand %Crossing-Oats-demand
     math Slate-price add %minimum.profit.per.unit
     if %Slate-price < %Arthe-Slate-price then gosub compare-commods Slate %Leth-Slate-demand %Arthe-Slate-demand
     if %Slate-price < %Crossing-Slate-price then gosub compare-commods Slate %Leth-Slate-demand %Crossing-Slate-demand
     math Lead-price add %minimum.profit.per.unit
     if %Lead-price < %Arthe-Lead-price then gosub compare-commods Lead %Leth-Lead-demand %Arthe-Lead-demand
     if %Lead-price < %Crossing-Lead-price then gosub compare-commods Lead %Leth-Lead-demand %Crossing-Lead-demand
     math Bronze-price add %minimum.profit.per.unit
     if %Bronze-price < %Arthe-Bronze-price then gosub compare-commods Bronze %Leth-Bronze-demand %Arthe-Bronze-demand
     if %Bronze-price < %Crossing-Bronze-price then gosub compare-commods Bronze %Leth-Bronze-demand %Crossing-Bronze-demand
     math Silk-price add %minimum.profit.per.unit
     if %Silk-price < %Arthe-Silk-price then gosub compare-commods Silk %Leth-Silk-demand %Arthe-Silk-demand
     if %Silk-price < %Crossing-Silk-price then gosub compare-commods Silk %Leth-Silk-demand %Crossing-Silk-demand
     math Lace-price add %minimum.profit.per.unit
     if %Lace-price < %Arthe-Lace-price then gosub compare-commods Lace %Leth-Lace-demand %Arthe-Lace-demand
     if %Lace-price < %Crossing-Lace-price then gosub compare-commods Lace %Leth-Lace-demand %Crossing-Lace-demand
     math Velvet-price add %minimum.profit.per.unit
     if %Velvet-price < %Arthe-Velvet-price then gosub compare-commods Velvet %Leth-Velvet-demand %Arthe-Velvet-demand
     if %Velvet-price < %Crossing-Velvet-price then gosub compare-commods Velvet %Leth-Velvet-demand %Crossing-Velvet-demand
     math DeobarOil-price add %minimum.profit.per.unit
     if %DeobarOil-price < %Arthe-DeobarOil-price then gosub compare-commods DeobarOil %Leth-DeobarOil-demand %Arthe-DeobarOil-demand
     if %DeobarOil-price < %Crossing-DeobarOil-price then gosub compare-commods DeobarOil %Leth-DeobarOil-demand %Crossing-DeobarOil-demand
     math Indigo-price add %minimum.profit.per.unit
     if %Indigo-price < %Arthe-Indigo-price then gosub compare-commods Indigo %Leth-Indigo-demand %Arthe-Indigo-demand
     if %Indigo-price < %Crossing-Indigo-price then gosub compare-commods Indigo %Leth-Indigo-demand %Crossing-Indigo-demand
     math PurpleDye-price add %minimum.profit.per.unit
     if %PurpleDye-price < %Arthe-PurpleDye-price then gosub compare-commods PurpleDye %Leth-PurpleDye-demand %Arthe-PurpleDye-demand
     if %PurpleDye-price < %Crossing-PurpleDye-price then gosub compare-commods PurpleDye %Leth-PurpleDye-demand %Crossing-PurpleDye-demand
     math Wheat-price add %minimum.profit.per.unit
     if %Wheat-price < %Arthe-Wheat-price then gosub compare-commods Wheat %Leth-Wheat-demand %Arthe-Wheat-demand
     if %Wheat-price < %Crossing-Wheat-price then gosub compare-commods Wheat %Leth-Wheat-demand %Crossing-Wheat-demand
     math Corn-price add %minimum.profit.per.unit
     if %Corn-price < %Arthe-Corn-price then gosub compare-commods Corn %Leth-Corn-demand %Arthe-Corn-demand
     if %Corn-price < %Crossing-Corn-price then gosub compare-commods Corn %Leth-Corn-demand %Crossing-Corn-demand
     math Taffelberries-price add %minimum.profit.per.unit
     if %Taffelberries-price < %Arthe-Taffelberries-price then gosub compare-commods Taffelberries %Leth-Taffelberries-demand %Arthe-Taffelberries-demand
     if %Taffelberries-price < %Crossing-Taffelberries-price then gosub compare-commods Taffelberries %Leth-Taffelberries-demand %Crossing-Taffelberries-demand
     math Apples-price add %minimum.profit.per.unit
     if %Apples-price < %Arthe-Apples-price then gosub compare-commods Apples %Leth-Apples-demand %Arthe-Apples-demand
     if %Apples-price < %Crossing-Apples-price then gosub compare-commods Apples %Leth-Apples-demand %Crossing-Apples-demand
     goto %return

Crossing-Commods:
     math Diamonds-price add %minimum.profit.per.unit
     if %Diamonds-price < %Arthe-Diamonds-price then gosub compare-commods Diamonds %Crossing-Diamonds-demand %Arthe-Diamonds-demand
     if %Diamonds-price < %Leth-Diamonds-price then gosub compare-commods Diamonds %Crossing-Diamonds-demand %Leth-Diamonds-demand
     math Pearls-price add %minimum.profit.per.unit
     if %Pearls-price < %Arthe-Pearls-price then gosub compare-commods Pearls %Crossing-Pearls-demand %Arthe-Pearls-demand
     if %Pearls-price < %Leth-Pearls-price then gosub compare-commods Pearls %Crossing-Pearls-demand %Leth-Pearls-demand
     math Gold-price add %minimum.profit.per.unit
     if %Gold-price < %Arthe-Gold-price then gosub compare-commods Gold %Crossing-Gold-demand %Arthe-Gold-demand
     if %Gold-price < %Leth-Gold-price then gosub compare-commods Gold %Crossing-Gold-demand %Leth-Gold-demand
     math Copper-price add %minimum.profit.per.unit
     if %Copper-price < %Arthe-Copper-price then gosub compare-commods Copper %Crossing-Copper-demand %Arthe-Copper-demand
     if %Copper-price < %Leth-Copper-price then gosub compare-commods Copper %Crossing-Copper-demand %Leth-Copper-demand
     math Wool-price add %minimum.profit.per.unit
     if %Wool-price < %Arthe-Wool-price then gosub compare-commods Wool %Crossing-Wool-demand %Arthe-Wool-demand
     if %Wool-price < %Leth-Wool-price then gosub compare-commods Wool %Crossing-Wool-demand %Leth-Wool-demand
     math Myrrh-price add %minimum.profit.per.unit
     if %Myrrh-price < %Arthe-Myrrh-price then gosub compare-commods Myrrh %Crossing-Myrrh-demand %Arthe-Myrrh-demand
     if %Myrrh-price < %Leth-Myrrh-price then gosub compare-commods Myrrh %Crossing-Myrrh-demand %Leth-Myrrh-demand
     math Barley-price add %minimum.profit.per.unit
     if %Barley-price < %Arthe-Barley-price then gosub compare-commods Barley %Crossing-Barley-demand %Arthe-Barley-demand
     if %Barley-price < %Leth-Barley-price then gosub compare-commods Barley %Crossing-Barley-demand %Leth-Barley-demand
     math Acanth-price add %minimum.profit.per.unit
     if %Acanth-price < %Arthe-Acanth-price then gosub compare-commods Acanth %Crossing-Acanth-demand %Arthe-Acanth-demand
     if %Acanth-price < %Leth-Acanth-price then gosub compare-commods Acanth %Crossing-Acanth-demand %Leth-Acanth-demand
     math Silver-price add %minimum.profit.per.unit
     if %Silver-price < %Arthe-Silver-price then gosub compare-commods Silver %Crossing-Silver-demand %Arthe-Silver-demand
     if %Silver-price < %Leth-Silver-price then gosub compare-commods Silver %Crossing-Silver-demand %Leth-Silver-demand
     math IronOre-price add %minimum.profit.per.unit
     if %IronOre-price < %Arthe-IronOre-price then gosub compare-commods IronOre %Crossing-IronOre-demand %Arthe-IronOre-demand
     if %IronOre-price < %Leth-IronOre-price then gosub compare-commods IronOre %Crossing-IronOre-demand %Leth-IronOre-demand
     math Charcoal-price add %minimum.profit.per.unit
     if %Charcoal-price < %Arthe-Charcoal-price then gosub compare-commods Charcoal %Crossing-Charcoal-demand %Arthe-Charcoal-demand
     if %Charcoal-price < %Leth-Charcoal-price then gosub compare-commods Charcoal %Crossing-Charcoal-demand %Leth-Charcoal-demand
     math Amber-price add %minimum.profit.per.unit
     if %Amber-price < %Arthe-Amber-price then gosub compare-commods Amber %Crossing-Amber-demand %Arthe-Amber-demand
     if %Amber-price < %Leth-Amber-price then gosub compare-commods Amber %Crossing-Amber-demand %Leth-Amber-demand
     math Saffron-price add %minimum.profit.per.unit
     if %Saffron-price < %Arthe-Saffron-price then gosub compare-commods Saffron %Crossing-Saffron-demand %Arthe-Saffron-demand
     if %Saffron-price < %Leth-Saffron-price then gosub compare-commods Saffron %Crossing-Saffron-demand %Leth-Saffron-demand
     math Cinnamon-price add %minimum.profit.per.unit
     if %Cinnamon-price < %Arthe-Cinnamon-price then gosub compare-commods Cinnamon %Crossing-Cinnamon-demand %Arthe-Cinnamon-demand
     if %Cinnamon-price < %Leth-Cinnamon-price then gosub compare-commods Cinnamon %Crossing-Cinnamon-demand %Leth-Cinnamon-demand
     math Papyrus-price add %minimum.profit.per.unit
     if %Papyrus-price < %Arthe-Papyrus-price then gosub compare-commods Papyrus %Crossing-Papyrus-demand %Arthe-Papyrus-demand
     if %Papyrus-price < %Leth-Papyrus-price then gosub compare-commods Papyrus %Crossing-Papyrus-demand %Leth-Papyrus-demand
     math Oranges-price add %minimum.profit.per.unit
     if %Oranges-price < %Arthe-Oranges-price then gosub compare-commods Oranges %Crossing-Oranges-demand %Arthe-Oranges-demand
     if %Oranges-price < %Leth-Oranges-price then gosub compare-commods Oranges %Crossing-Oranges-demand %Leth-Oranges-demand
     math Limes-price add %minimum.profit.per.unit
     if %Limes-price < %Arthe-Limes-price then gosub compare-commods Limes %Crossing-Limes-demand %Arthe-Limes-demand
     if %Limes-price < %Leth-Limes-price then gosub compare-commods Limes %Crossing-Limes-demand %Leth-Limes-demand
     math Brass-price add %minimum.profit.per.unit
     if %Brass-price < %Arthe-Brass-price then gosub compare-commods Brass %Crossing-Brass-demand %Arthe-Brass-demand
     if %Brass-price < %Leth-Brass-price then gosub compare-commods Brass %Crossing-Brass-demand %Leth-Brass-demand
     math Cotton-price add %minimum.profit.per.unit
     if %Cotton-price < %Arthe-Cotton-price then gosub compare-commods Cotton %Crossing-Cotton-demand %Arthe-Cotton-demand
     if %Cotton-price < %Leth-Cotton-price then gosub compare-commods Cotton %Crossing-Cotton-demand %Leth-Cotton-demand
     math Salt-price add %minimum.profit.per.unit
     if %Salt-price < %Arthe-Salt-price then gosub compare-commods Salt %Crossing-Salt-demand %Arthe-Salt-demand
     if %Salt-price < %Leth-Salt-price then gosub compare-commods Salt %Crossing-Salt-demand %Leth-Salt-demand
     math Oats-price add %minimum.profit.per.unit
     if %Oats-price < %Arthe-Oats-price then gosub compare-commods Oats %Crossing-Oats-demand %Arthe-Oats-demand
     if %Oats-price < %Leth-Oats-price then gosub compare-commods Oats %Crossing-Oats-demand %Leth-Oats-demand
     math Slate-price add %minimum.profit.per.unit
     if %Slate-price < %Arthe-Slate-price then gosub compare-commods Slate %Crossing-Slate-demand %Arthe-Slate-demand
     if %Slate-price < %Leth-Slate-price then gosub compare-commods Slate %Crossing-Slate-demand %Leth-Slate-demand
     math Lead-price add %minimum.profit.per.unit
     if %Lead-price < %Arthe-Lead-price then gosub compare-commods Lead %Crossing-Lead-demand %Arthe-Lead-demand
     if %Lead-price < %Leth-Lead-price then gosub compare-commods Lead %Crossing-Lead-demand %Leth-Lead-demand
     math Bronze-price add %minimum.profit.per.unit
     if %Bronze-price < %Arthe-Bronze-price then gosub compare-commods Bronze %Crossing-Bronze-demand %Arthe-Bronze-demand
     if %Bronze-price < %Leth-Bronze-price then gosub compare-commods Bronze %Crossing-Bronze-demand %Leth-Bronze-demand
     math Silk-price add %minimum.profit.per.unit
     if %Silk-price < %Arthe-Silk-price then gosub compare-commods Silk %Crossing-Silk-demand %Arthe-Silk-demand
     if %Silk-price < %Leth-Silk-price then gosub compare-commods Silk %Crossing-Silk-demand %Leth-Silk-demand
     math Lace-price add %minimum.profit.per.unit
     if %Lace-price < %Arthe-Lace-price then gosub compare-commods Lace %Crossing-Lace-demand %Arthe-Lace-demand
     if %Lace-price < %Leth-Lace-price then gosub compare-commods Lace %Crossing-Lace-demand %Leth-Lace-demand
     math Velvet-price add %minimum.profit.per.unit
     if %Velvet-price < %Arthe-Velvet-price then gosub compare-commods Velvet %Crossing-Velvet-demand %Arthe-Velvet-demand
     if %Velvet-price < %Leth-Velvet-price then gosub compare-commods Velvet %Crossing-Velvet-demand %Leth-Velvet-demand
     math DeobarOil-price add %minimum.profit.per.unit
     if %DeobarOil-price < %Arthe-DeobarOil-price then gosub compare-commods DeobarOil %Crossing-DeobarOil-demand %Arthe-DeobarOil-demand
     if %DeobarOil-price < %Leth-DeobarOil-price then gosub compare-commods DeobarOil %Crossing-DeobarOil-demand %Leth-DeobarOil-demand
     math Indigo-price add %minimum.profit.per.unit
     if %Indigo-price < %Arthe-Indigo-price then gosub compare-commods Indigo %Crossing-Indigo-demand %Arthe-Indigo-demand
     if %Indigo-price < %Leth-Indigo-price then gosub compare-commods Indigo %Crossing-Indigo-demand %Leth-Indigo-demand
     math PurpleDye-price add %minimum.profit.per.unit
     if %PurpleDye-price < %Arthe-PurpleDye-price then gosub compare-commods PurpleDye %Crossing-PurpleDye-demand %Arthe-PurpleDye-demand
     if %PurpleDye-price < %Leth-PurpleDye-price then gosub compare-commods PurpleDye %Crossing-PurpleDye-demand %Leth-PurpleDye-demand
     math Wheat-price add %minimum.profit.per.unit
     if %Wheat-price < %Arthe-Wheat-price then gosub compare-commods Wheat %Crossing-Wheat-demand %Arthe-Wheat-demand
     if %Wheat-price < %Leth-Wheat-price then gosub compare-commods Wheat %Crossing-Wheat-demand %Leth-Wheat-demand
     math Corn-price add %minimum.profit.per.unit
     if %Corn-price < %Arthe-Corn-price then gosub compare-commods Corn %Crossing-Corn-demand %Arthe-Corn-demand
     if %Corn-price < %Leth-Corn-price then gosub compare-commods Corn %Crossing-Corn-demand %Leth-Corn-demand
     math Taffelberries-price add %minimum.profit.per.unit
     if %Taffelberries-price < %Arthe-Taffelberries-price then gosub compare-commods Taffelberries %Crossing-Taffelberries-demand %Arthe-Taffelberries-demand
     if %Taffelberries-price < %Leth-Taffelberries-price then gosub compare-commods Taffelberries %Crossing-Taffelberries-demand %Leth-Taffelberries-demand
     math Apples-price add %minimum.profit.per.unit
     if %Apples-price < %Arthe-Apples-price then gosub compare-commods Apples %Crossing-Apples-demand %Arthe-Apples-demand
     if %Apples-price < %Leth-Apples-price then gosub compare-commods Apples %Crossing-Apples-demand %Leth-Apples-demand
     goto %return

Arthe-Commods:
     math Diamonds-price add %minimum.profit.per.unit
     if %Diamonds-price < %Crossing-Diamonds-price then gosub compare-commods Diamonds %Arthe-Diamonds-demand %Crossing-Diamonds-demand
     if %Diamonds-price < %Leth-Diamonds-price then gosub compare-commods Diamonds %Arthe-Diamonds-demand %Leth-Diamonds-demand
     math Pearls-price add %minimum.profit.per.unit
     if %Pearls-price < %Crossing-Pearls-price then gosub compare-commods Pearls %Arthe-Pearls-demand %Crossing-Pearls-demand
     if %Pearls-price < %Leth-Pearls-price then gosub compare-commods Pearls %Arthe-Pearls-demand %Leth-Pearls-demand
     math Gold-price add %minimum.profit.per.unit
     if %Gold-price < %Crossing-Gold-price then gosub compare-commods Gold %Arthe-Gold-demand %Crossing-Gold-demand
     if %Gold-price < %Leth-Gold-price then gosub compare-commods Gold %Arthe-Gold-demand %Leth-Gold-demand
     math Copper-price add %minimum.profit.per.unit
     if %Copper-price < %Crossing-Copper-price then gosub compare-commods Copper %Arthe-Copper-demand %Crossing-Copper-demand
     if %Copper-price < %Leth-Copper-price then gosub compare-commods Copper %Arthe-Copper-demand %Leth-Copper-demand
     math Wool-price add %minimum.profit.per.unit
     if %Wool-price < %Crossing-Wool-price then gosub compare-commods Wool %Arthe-Wool-demand %Crossing-Wool-demand
     if %Wool-price < %Leth-Wool-price then gosub compare-commods Wool %Arthe-Wool-demand %Leth-Wool-demand
     math Myrrh-price add %minimum.profit.per.unit
     if %Myrrh-price < %Crossing-Myrrh-price then gosub compare-commods Myrrh %Arthe-Myrrh-demand %Crossing-Myrrh-demand
     if %Myrrh-price < %Leth-Myrrh-price then gosub compare-commods Myrrh %Arthe-Myrrh-demand %Leth-Myrrh-demand
     math Barley-price add %minimum.profit.per.unit
     if %Barley-price < %Crossing-Barley-price then gosub compare-commods Barley %Arthe-Barley-demand %Crossing-Barley-demand
     if %Barley-price < %Leth-Barley-price then gosub compare-commods Barley %Arthe-Barley-demand %Leth-Barley-demand
     math Acanth-price add %minimum.profit.per.unit
     if %Acanth-price < %Crossing-Acanth-price then gosub compare-commods Acanth %Arthe-Acanth-demand %Crossing-Acanth-demand
     if %Acanth-price < %Leth-Acanth-price then gosub compare-commods Acanth %Arthe-Acanth-demand %Leth-Acanth-demand
     math Silver-price add %minimum.profit.per.unit
     if %Silver-price < %Crossing-Silver-price then gosub compare-commods Silver %Arthe-Silver-demand %Crossing-Silver-demand
     if %Silver-price < %Leth-Silver-price then gosub compare-commods Silver %Arthe-Silver-demand %Leth-Silver-demand
     math IronOre-price add %minimum.profit.per.unit
     if %IronOre-price < %Crossing-IronOre-price then gosub compare-commods IronOre %Arthe-IronOre-demand %Crossing-IronOre-demand
     if %IronOre-price < %Leth-IronOre-price then gosub compare-commods IronOre %Arthe-IronOre-demand %Leth-IronOre-demand
     math Charcoal-price add %minimum.profit.per.unit
     if %Charcoal-price < %Crossing-Charcoal-price then gosub compare-commods Charcoal %Arthe-Charcoal-demand %Crossing-Charcoal-demand
     if %Charcoal-price < %Leth-Charcoal-price then gosub compare-commods Charcoal %Arthe-Charcoal-demand %Leth-Charcoal-demand
     math Amber-price add %minimum.profit.per.unit
     if %Amber-price < %Crossing-Amber-price then gosub compare-commods Amber %Arthe-Amber-demand %Crossing-Amber-demand
     if %Amber-price < %Leth-Amber-price then gosub compare-commods Amber %Arthe-Amber-demand %Leth-Amber-demand
     math Saffron-price add %minimum.profit.per.unit
     if %Saffron-price < %Crossing-Saffron-price then gosub compare-commods Saffron %Arthe-Saffron-demand %Crossing-Saffron-demand
     if %Saffron-price < %Leth-Saffron-price then gosub compare-commods Saffron %Arthe-Saffron-demand %Leth-Saffron-demand
     math Cinnamon-price add %minimum.profit.per.unit
     if %Cinnamon-price < %Crossing-Cinnamon-price then gosub compare-commods Cinnamon %Arthe-Cinnamon-demand %Crossing-Cinnamon-demand
     if %Cinnamon-price < %Leth-Cinnamon-price then gosub compare-commods Cinnamon %Arthe-Cinnamon-demand %Leth-Cinnamon-demand
     math Papyrus-price add %minimum.profit.per.unit
     if %Papyrus-price < %Crossing-Papyrus-price then gosub compare-commods Papyrus %Arthe-Papyrus-demand %Crossing-Papyrus-demand
     if %Papyrus-price < %Leth-Papyrus-price then gosub compare-commods Papyrus %Arthe-Papyrus-demand %Leth-Papyrus-demand
     math Oranges-price add %minimum.profit.per.unit
     if %Oranges-price < %Crossing-Oranges-price then gosub compare-commods Oranges %Arthe-Oranges-demand %Crossing-Oranges-demand
     if %Oranges-price < %Leth-Oranges-price then gosub compare-commods Oranges %Arthe-Oranges-demand %Leth-Oranges-demand
     math Limes-price add %minimum.profit.per.unit
     if %Limes-price < %Crossing-Limes-price then gosub compare-commods Limes %Arthe-Limes-demand %Crossing-Limes-demand
     if %Limes-price < %Leth-Limes-price then gosub compare-commods Limes %Arthe-Limes-demand %Leth-Limes-demand
     math Brass-price add %minimum.profit.per.unit
     if %Brass-price < %Crossing-Brass-price then gosub compare-commods Brass %Arthe-Brass-demand %Crossing-Brass-demand
     if %Brass-price < %Leth-Brass-price then gosub compare-commods Brass %Arthe-Brass-demand %Leth-Brass-demand
     math Cotton-price add %minimum.profit.per.unit
     if %Cotton-price < %Crossing-Cotton-price then gosub compare-commods Cotton %Arthe-Cotton-demand %Crossing-Cotton-demand
     if %Cotton-price < %Leth-Cotton-price then gosub compare-commods Cotton %Arthe-Cotton-demand %Leth-Cotton-demand
     math Salt-price add %minimum.profit.per.unit
     if %Salt-price < %Crossing-Salt-price then gosub compare-commods Salt %Arthe-Salt-demand %Crossing-Salt-demand
     if %Salt-price < %Leth-Salt-price then gosub compare-commods Salt %Arthe-Salt-demand %Leth-Salt-demand
     math Oats-price add %minimum.profit.per.unit
     if %Oats-price < %Crossing-Oats-price then gosub compare-commods Oats %Arthe-Oats-demand %Crossing-Oats-demand
     if %Oats-price < %Leth-Oats-price then gosub compare-commods Oats %Arthe-Oats-demand %Leth-Oats-demand
     math Slate-price add %minimum.profit.per.unit
     if %Slate-price < %Crossing-Slate-price then gosub compare-commods Slate %Arthe-Slate-demand %Crossing-Slate-demand
     if %Slate-price < %Leth-Slate-price then gosub compare-commods Slate %Arthe-Slate-demand %Leth-Slate-demand
     math Lead-price add %minimum.profit.per.unit
     if %Lead-price < %Crossing-Lead-price then gosub compare-commods Lead %Arthe-Lead-demand %Crossing-Lead-demand
     if %Lead-price < %Leth-Lead-price then gosub compare-commods Lead %Arthe-Lead-demand %Leth-Lead-demand
     math Bronze-price add %minimum.profit.per.unit
     if %Bronze-price < %Crossing-Bronze-price then gosub compare-commods Bronze %Arthe-Bronze-demand %Crossing-Bronze-demand
     if %Bronze-price < %Leth-Bronze-price then gosub compare-commods Bronze %Arthe-Bronze-demand %Leth-Bronze-demand
     math Silk-price add %minimum.profit.per.unit
     if %Silk-price < %Crossing-Silk-price then gosub compare-commods Silk %Arthe-Silk-demand %Crossing-Silk-demand
     if %Silk-price < %Leth-Silk-price then gosub compare-commods Silk %Arthe-Silk-demand %Leth-Silk-demand
     math Lace-price add %minimum.profit.per.unit
     if %Lace-price < %Crossing-Lace-price then gosub compare-commods Lace %Arthe-Lace-demand %Crossing-Lace-demand
     if %Lace-price < %Leth-Lace-price then gosub compare-commods Lace %Arthe-Lace-demand %Leth-Lace-demand
     math Velvet-price add %minimum.profit.per.unit
     if %Velvet-price < %Crossing-Velvet-price then gosub compare-commods Velvet %Arthe-Velvet-demand %Crossing-Velvet-demand
     if %Velvet-price < %Leth-Velvet-price then gosub compare-commods Velvet %Arthe-Velvet-demand %Leth-Velvet-demand
     math DeobarOil-price add %minimum.profit.per.unit
     if %DeobarOil-price < %Crossing-DeobarOil-price then gosub compare-commods DeobarOil %Arthe-DeobarOil-demand %Crossing-DeobarOil-demand
     if %DeobarOil-price < %Leth-DeobarOil-price then gosub compare-commods DeobarOil %Arthe-DeobarOil-demand %Leth-DeobarOil-demand
     math Indigo-price add %minimum.profit.per.unit
     if %Indigo-price < %Crossing-Indigo-price then gosub compare-commods Indigo %Arthe-Indigo-demand %Crossing-Indigo-demand
     if %Indigo-price < %Leth-Indigo-price then gosub compare-commods Indigo %Arthe-Indigo-demand %Leth-Indigo-demand
     math PurpleDye-price add %minimum.profit.per.unit
     if %PurpleDye-price < %Crossing-PurpleDye-price then gosub compare-commods PurpleDye %Arthe-PurpleDye-demand %Crossing-PurpleDye-demand
     if %PurpleDye-price < %Leth-PurpleDye-price then gosub compare-commods PurpleDye %Arthe-PurpleDye-demand %Leth-PurpleDye-demand
     math Wheat-price add %minimum.profit.per.unit
     if %Wheat-price < %Crossing-Wheat-price then gosub compare-commods Wheat %Arthe-Wheat-demand %Crossing-Wheat-demand
     if %Wheat-price < %Leth-Wheat-price then gosub compare-commods Wheat %Arthe-Wheat-demand %Leth-Wheat-demand
     math Corn-price add %minimum.profit.per.unit
     if %Corn-price < %Crossing-Corn-price then gosub compare-commods Corn %Arthe-Corn-demand %Crossing-Corn-demand
     if %Corn-price < %Leth-Corn-price then gosub compare-commods Corn %Arthe-Corn-demand %Leth-Corn-demand
     math Taffelberries-price add %minimum.profit.per.unit
     if %Taffelberries-price < %Crossing-Taffelberries-price then gosub compare-commods Taffelberries %Arthe-Taffelberries-demand %Crossing-Taffelberries-demand
     if %Taffelberries-price < %Leth-Taffelberries-price then gosub compare-commods Taffelberries %Arthe-Taffelberries-demand %Leth-Taffelberries-demand
     math Apples-price add %minimum.profit.per.unit
     if %Apples-price < %Crossing-Apples-price then gosub compare-commods Apples %Arthe-Apples-demand %Crossing-Apples-demand
     if %Apples-price < %Leth-Apples-price then gosub compare-commods Apples %Arthe-Apples-demand %Leth-Apples-demand
     goto %return

loaded-commods:
     if %Diamonds-loaded > 0 then gosub check-loaded-commod Diamonds
     if %Pearls-loaded > 0 then gosub check-loaded-commod Pearls
     if %Gold-loaded > 0 then gosub check-loaded-commod Gold
     if %Silver-loaded > 0 then gosub check-loaded-commod Silver
     if %IronOre-loaded > 0 then gosub check-loaded-commod IronOre
     if %Charcoal-loaded > 0 then gosub check-loaded-commod Charcoal
     if %Amber-loaded > 0 then gosub check-loaded-commod Amber
     if %Saffron-loaded > 0 then gosub check-loaded-commod Saffron
     if %Cinnamon-loaded > 0 then gosub check-loaded-commod Cinnamon
     if %Papyrus-loaded > 0 then gosub check-loaded-commod Papyrus
     if %Oranges-loaded > 0 then gosub check-loaded-commod Oranges
     if %Limes-loaded > 0 then gosub check-loaded-commod Limes
     if %Slate-loaded > 0 then gosub check-loaded-commod Slate
     if %Brass-loaded > 0 then gosub check-loaded-commod Brass
     if %Lead-loaded > 0 then gosub check-loaded-commod Lead
     if %Copper-loaded > 0 then gosub check-loaded-commod Copper
     if %Bronze-loaded > 0 then gosub check-loaded-commod Bronze
     if %Silk-loaded > 0 then gosub check-loaded-commod Silk
     if %Cotton-loaded > 0 then gosub check-loaded-commod Cotton
     if %Wool-loaded > 0 then gosub check-loaded-commod Wool
     if %Lace-loaded > 0 then gosub check-loaded-commod Lace
     if %Velvet-loaded > 0 then gosub check-loaded-commod Velvet
     if %DeobarOil-loaded > 0 then gosub check-loaded-commod DeobarOil
     if %Myrrh-loaded > 0 then gosub check-loaded-commod Myrrh
     if %Salt-loaded > 0 then gosub check-loaded-commod Salt
     if %Indigo-loaded > 0 then gosub check-loaded-commod Indigo
     if %PurpleDye-loaded > 0 then gosub check-loaded-commod PurpleDye
     if %Barley-loaded > 0 then gosub check-loaded-commod Barley
     if %Wheat-loaded > 0 then gosub check-loaded-commod Wheat
     if %Oats-loaded > 0 then gosub check-loaded-commod Oats
     if %Corn-loaded > 0 then gosub check-loaded-commod Corn
     if %Acanth-loaded > 0 then gosub check-loaded-commod Acanth
     if %Taffelberries-loaded > 0 then gosub check-loaded-commod Taffelberries
     if %Apples-loaded > 0 then gosub check-loaded-commod Apples
     if %sell-Diamonds = 1 then gosub sell-commod Diamonds
     if %sell-Pearls = 1 then gosub sell-commod Pearls
     if %sell-Gold = 1 then gosub sell-commod Gold
     if %sell-Silver = 1 then gosub sell-commod Silver
     if %sell-IronOre = 1 then gosub sell-commod IronOre
     if %sell-Charcoal = 1 then gosub sell-commod Charcoal
     if %sell-Amber = 1 then gosub sell-commod Amber
     if %sell-Saffron = 1 then gosub sell-commod Saffron
     if %sell-Cinnamon = 1 then gosub sell-commod Cinnamon
     if %sell-Papyrus = 1 then gosub sell-commod Papyrus
     if %sell-Oranges = 1 then gosub sell-commod Oranges
     if %sell-Limes = 1 then gosub sell-commod Limes
     if %sell-Slate = 1 then gosub sell-commod Slate
     if %sell-Brass = 1 then gosub sell-commod Brass
     if %sell-Lead = 1 then gosub sell-commod Lead
     if %sell-Copper = 1 then gosub sell-commod Copper
     if %sell-Bronze = 1 then gosub sell-commod Bronze
     if %sell-Silk = 1 then gosub sell-commod Silk
     if %sell-Cotton = 1 then gosub sell-commod Cotton
     if %sell-Wool = 1 then gosub sell-commod Wool
     if %sell-Lace = 1 then gosub sell-commod Lace
     if %sell-Velvet = 1 then gosub sell-commod Velvet
     if %sell-DeobarOil = 1 then gosub sell-commod DeobarOil
     if %sell-Myrrh = 1 then gosub sell-commod Myrrh
     if %sell-Salt = 1 then gosub sell-commod Salt
     if %sell-Indigo = 1 then gosub sell-commod Indigo
     if %sell-PurpleDye = 1 then gosub sell-commod PurpleDye
     if %sell-Barley = 1 then gosub sell-commod Barley
     if %sell-Wheat = 1 then gosub sell-commod Wheat
     if %sell-Oats = 1 then gosub sell-commod Oats
     if %sell-Corn = 1 then gosub sell-commod Corn
     if %sell-Acanth = 1 then gosub sell-commod Acanth
     if %sell-Taffelberries = 1 then gosub sell-commod Taffelberries
     if %sell-Apples = 1 then gosub sell-commod Apples
     setvariable sell-Diamonds 0
     setvariable sell-Pearls 0
     setvariable sell-Gold 0
     setvariable sell-Silver 0
     setvariable sell-IronOre 0
     setvariable sell-Charcoal 0
     setvariable sell-Amber 0
     setvariable sell-Saffron 0
     setvariable sell-Cinnamon 0
     setvariable sell-Papyrus 0
     setvariable sell-Oranges 0
     setvariable sell-Limes 0
     setvariable sell-Slate 0
     setvariable sell-Brass 0
     setvariable sell-Lead 0
     setvariable sell-Copper 0
     setvariable sell-Bronze 0
     setvariable sell-Silk 0
     setvariable sell-Cotton 0
     setvariable sell-Wool 0
     setvariable sell-Lace 0
     setvariable sell-Velvet 0
     setvariable sell-DeobarOil 0
     setvariable sell-Myrrh 0
     setvariable sell-Salt 0
     setvariable sell-Indigo 0
     setvariable sell-PurpleDye 0
     setvariable sell-Barley 0
     setvariable sell-Wheat 0
     setvariable sell-Oats 0
     setvariable sell-Corn 0
     setvariable sell-Acanth 0
     setvariable sell-Taffelberries 0
     setvariable sell-Apples 0
     goto %return

check-loaded-commod:
     setvariable temp-price %$1-loaded
     setvariable temp-compare %$1-price
     if %temp-price < %temp-compare then setvariable sell-$1 1
     return


compare-commods:
     setvariable buy-$1 0
     if %$1-loaded > 0 then goto done-compare-commods
     setvariable commod $1
     setvariable demand-here $2
     setvariable demand-there $3
     if "%demand-here" = "*SOLD" then goto done-compare-commods
     if "%demand-there" = "Surplus" then goto done-compare-commods
     if "%demand-here" = "Nearly" then setvariable buy 3
     if "%demand-here" = "Going" then setvariable buy 4
     if "%demand-here" = "Good" then setvariable buy 5
     if "%demand-here" = "Surplus" then setvariable buy 6

     if "%demand-there" = "Good" then math buy multiply 3
     if "%demand-there" = "Going" then math buy multiply 4
     if "%demand-there" = "Nearly" then math buy multiply 5
     if "%demand-there" = "*SOLD" then math buy multiply 6
     if "%demand-here" = "Nearly" then setvariable buy 9
     setvariable buy-%commod %buy
done-compare-commods:
     pause 0.1
     return

buying-commods:
     if %buy-Diamonds > 0 then gosub buy-commod Diamonds %buy-Diamonds
     if %buy-Pearls > 0 then gosub buy-commod Pearls %buy-Pearls
     if %buy-Gold > 0 then gosub buy-commod Gold %buy-Gold
     if %buy-Silver > 0 then gosub buy-commod Silver %buy-Silver
     if %buy-IronOre > 0 then gosub buy-commod IronOre %buy-IronOre
     if %buy-Charcoal > 0 then gosub buy-commod Charcoal %buy-Charcoal
     if %buy-Amber > 0 then gosub buy-commod Amber %buy-Amber
     if %buy-Saffron > 0 then gosub buy-commod Saffron %buy-Saffron
     if %buy-Cinnamon > 0 then gosub buy-commod Cinnamon %buy-Cinnamon
     if %buy-Papyrus > 0 then gosub buy-commod Papyrus %buy-Papyrus
     if %buy-Oranges > 0 then gosub buy-commod Oranges %buy-Oranges
     if %buy-Limes > 0 then gosub buy-commod Limes %buy-Limes
     if %buy-Slate > 0 then gosub buy-commod Slate %buy-Slate
     if %buy-Brass > 0 then gosub buy-commod Brass %buy-Brass
     if %buy-Lead > 0 then gosub buy-commod Lead %buy-Lead
     if %buy-Copper > 0 then gosub buy-commod Copper %buy-Copper
     if %buy-Bronze > 0 then gosub buy-commod Bronze %buy-Bronze
     if %buy-Silk > 0 then gosub buy-commod Silk %buy-Silk
     if %buy-Cotton > 0 then gosub buy-commod Cotton %buy-Cotton
     if %buy-Wool > 0 then gosub buy-commod Wool %buy-Wool
     if %buy-Lace > 0 then gosub buy-commod Lace %buy-Lace
     if %buy-Velvet > 0 then gosub buy-commod Velvet %buy-Velvet
     if %buy-DeobarOil > 0 then gosub buy-commod DeobarOil %buy-DeobarOil
     if %buy-Myrrh > 0 then gosub buy-commod Myrrh %buy-Myrrh
     if %buy-Salt > 0 then gosub buy-commod Salt %buy-Salt
     if %buy-Indigo > 0 then gosub buy-commod Indigo %buy-Indigo
     if %buy-PurpleDye > 0 then gosub buy-commod PurpleDye %buy-PurpleDye
     if %buy-Barley > 0 then gosub buy-commod Barley %buy-Barley
     if %buy-Wheat > 0 then gosub buy-commod Wheat %buy-Wheat
     if %buy-Oats > 0 then gosub buy-commod Oats %buy-Oats
     if %buy-Corn > 0 then gosub buy-commod Corn %buy-Corn
     if %buy-Acanth > 0 then gosub buy-commod Acanth %buy-Acanth
     if %buy-Taffelberries > 0 then gosub buy-commod Taffelberries %buy-Taffelberries
     if %buy-Apples > 0 then gosub buy-commod Apples %buy-Apples
     setvariable buy-Diamonds 0
     setvariable buy-Pearls 0
     setvariable buy-Gold 0
     setvariable buy-Silver 0
     setvariable buy-IronOre 0
     setvariable buy-Charcoal 0
     setvariable buy-Amber 0
     setvariable buy-Saffron 0
     setvariable buy-Cinnamon 0
     setvariable buy-Papyrus 0
     setvariable buy-Oranges 0
     setvariable buy-Limes 0
     setvariable buy-Slate 0
     setvariable buy-Brass 0
     setvariable buy-Lead 0
     setvariable buy-Copper 0
     setvariable buy-Bronze 0
     setvariable buy-Silk 0
     setvariable buy-Cotton 0
     setvariable buy-Wool 0
     setvariable buy-Lace 0
     setvariable buy-Velvet 0
     setvariable buy-DeobarOil 0
     setvariable buy-Myrrh 0
     setvariable buy-Salt 0
     setvariable buy-Indigo 0
     setvariable buy-PurpleDye 0
     setvariable buy-Barley 0
     setvariable buy-Wheat 0
     setvariable buy-Oats 0
     setvariable buy-Corn 0
     setvariable buy-Acanth 0
     setvariable buy-Taffelberries 0
     setvariable buy-Apples 0
     goto %return


buy-commod:
     setvariable temp-price %$1-price
     math temp-price subtract %minimum.profit.per.unit
     setvariable temp-loaded $1-loaded
     setvariable commod $1
     setvariable buy $2
     if "%current-location" = "Crossing" then setvariable profit-1 %Leth-$1-price
     if "%current-location" = "Crossing" then setvariable profit-2 %Arthe-$1-price
     if "%current-location" = "Crossing" then setvariable profit-1p Leth
     if "%current-location" = "Crossing" then setvariable profit-2p Arthe
     if "%current-location" = "Crossing" then math profit-1 subtract %$1-price
     if "%current-location" = "Crossing" then math profit-2 subtract %$1-price


     if "%current-location" = "Arthe" then setvariable profit-1 %Leth-$1-price
     if "%current-location" = "Arthe" then setvariable profit-2 %Crossing-$1-price
     if "%current-location" = "Arthe" then setvariable profit-1p Leth
     if "%current-location" = "Arthe" then setvariable profit-2p Crossing
     if "%current-location" = "Arthe" then math profit-1 subtract %$1-price
     if "%current-location" = "Arthe" then math profit-2 subtract %$1-price

     if "%current-location" = "Leth" then setvariable profit-1 %Crossing-$1-price
     if "%current-location" = "Leth" then setvariable profit-2 %Arthe-$1-price
     if "%current-location" = "Leth" then setvariable profit-1p Crossing
     if "%current-location" = "Leth" then setvariable profit-2p Arthe
     if "%current-location" = "Leth" then math profit-1 subtract %$1-price
     if "%current-location" = "Leth" then math profit-2 subtract %$1-price

     if %profit-1 > %profit-2 then setvariable estimated-profit %profit-1p for a gain of %profit-1 Kronars per unit.
     if %profit-2 > %profit-1 then setvariable estimated-profit %profit-2p for a gain of %profit-2 Kronars per unit.
     if %profit-1 = %profit-2 then setvariable estimated-profit %profit-1p or %profit-2p for a gain of %profit-1 Kronars per unit.
     if %profit-1 > %profit-2 then setvariable test-profit %profit-1
     if %profit-2 > %profit-1 then setvariable test-profit %profit-2
     if %test-profit < %minimum.profit.per.unit then goto buy-commod-false

     if "%commod" = "PurpleDye" then setvariable commod Purple Dye
     if "%commod" = "IronOre" then setvariable commod Iron Ore
     if "%commod" = "DeobarOil" then setvariable commod Deobar Oil

     echo . [ Buying %commod, planning on selling %commod in %estimated-profit
     goto buy-commod-a
buy-commod-p:
     pause 0.5
buy-commod-a:
put buy %buy %commod
     matchre buy-commod-p (type ahead|...wait)
     matchre buy-commod-true bringing the total to (\d+)
     matchre buy-commod-false (sorry, we only have .* left that I could sell|don't seem to have enough to complete the transaction)
     matchwait
buy-commod-true:
     math commodity-spent add $1
     setvariable %temp-loaded %temp-price
     setvariable bought-commods-here 1
buy-commod-false:
     return


sell-commod:
     setvariable commod $0
     setvariable figure-profit1 %$1-price
     math figure-profit1 subtract %$1-loaded
     if "%commod" = "PurpleDye" then setvariable commod Purple Dye
     if "%commod" = "IronOre" then setvariable commod Iron Ore
     if "%commod" = "DeobarOil" then setvariable commod Deobar Oil
     if %figure-profit1 < %minimum.profit.per.unit then goto sell-commod-false
     echo . [ Selling %commod for an estimated profit of %figure-profit1 Kronars per unit.
     goto sell-commod-a
sell-commod-p:
     pause 0.5
sell-commod-a:
put sell all %commod
     matchre sell-commod-p (type ahead|...wait)
     matchre sell-commod-true I can pay you (\d+) kronars for your
     matchre sell-commod-false (you just bought that here not long|you don't seem to have any|Trying to cheat me|can only afford to buy|we just can't afford to buy any)
     matchwait
sell-commod-true:
     math commodity-intake add $1
     if "%commod" = "Purple Dye" then setvariable commod PurpleDye
     if "%commod" = "Iron Ore" then setvariable commod IronOre
     if "%commod" = "Deobar Oil" then setvariable commod DeobarOil
     setvariable %commod-loaded 0
sell-commod-false:
     return

echo:
random 1 9
if %r = 1 then put skill trading
if %r = 2 then put skill mech
if %r = 3 then put skill perc
if %r = 4 then put skill scholar
if %r = 5 then put skill animal
if %r = 6 then put skill fa
if %r = 7 then put skill forag
if %r = 8 then put skill climb
if %r = 9 then put skill swim
     waitforre Time Development Points: *(\d+)
     setvariable current-tdps $1
     setvariable tdps-gained %current-tdps
     math tdps-gained subtract %start-tdps
echo
echo . ~ Genie Trader  AI V2.023 ~
echo .
echo . ---------------------------
echo . Contracts Destined For ...
echo . ---------------------------
echo . Dirge       : %to-Dirge   Stone Clan  : %to-Stone
echo . Crossing    : %to-Crossing   Leth Deriel : %to-Leth
echo . Wolf Clan   : %to-Wolf   Tiger Clan  : %to-Tiger
echo . Arthe Dale  : %to-Arthe
echo . ---------------------------
echo . Contracts Recieved From ...
echo . ---------------------------
echo . Dirge       : %from-Dirge   Stone Clan  : %from-Stone
echo . Crossing    : %from-Crossing   Leth Deriel : %from-Leth
echo . Wolf Clan   : %from-Wolf   Tiger Clan  : %from-Tiger
echo . Arthe Dale  : %from-Arthe
echo . ---------------------------
echo . Miscellaneous Data ...
echo . ---------------------------
echo . Total Coin Spent          : %coin-spent
echo . Total Coin Intake         : %coin-intake
     setvariable temp-1 %coin-intake
     if %temp-1 > 0 then math temp-1 subtract %coin-spent
echo . True Real Profit          : %temp-1
     setvariable true-profit %temp-1
     if %temp-1 > 0 then math temp-1 divide %contracts-delivered
echo . Total Contracts Delivered : %contracts-delivered
echo . Avg. Profit Per Contract  : %temp-1
     setvariable avg-profit %temp-1
echo . ---------------------------
echo . Ranks Gained : %ranks-gained   TDP's Gained : %tdps-gained
echo . ---------------------------
echo . Bank Balances ...
echo . ---------------------------
echo . Crossing : %balance-Crossing    Dirge : %balance-Dirge    Leth Deriel : %balance-Leth
echo . ---------------------------
     if "%commodities" != "on" then goto done-echo
echo . Commodities Currently Loaded ...
echo . ---------------------------
echo .   Commodity     - Price Payed
     if %Diamonds-loaded > 0 then echo . [ Diamonds      - %Diamonds-loaded
     if %Pearls-loaded > 0 then echo . [ Pearls        - %Pearls-loaded
     if %Gold-loaded > 0 then echo . [ Gold          - %Gold-loaded
     if %Silver-loaded > 0 then echo . [ Silver        - %Silver-loaded
     if %IronOre-loaded > 0 then echo . [ Iron Ore      - %IronOre-loaded
     if %Charcoal-loaded > 0 then echo . [ Charcoal      - %Charcoal-loaded
     if %Amber-loaded > 0 then echo . [ Amber         - %Amber-loaded
     if %Saffron-loaded > 0 then echo . [ Saffron       - %Saffron-loaded
     if %Cinnamon-loaded > 0 then echo . [ Cinnamon      - %Cinnamon-loaded
     if %Papyrus-loaded > 0 then echo . [ Papyrus       - %Papyrus-loaded
     if %Oranges-loaded > 0 then echo . [ Oranges       - %Oranges-loaded
     if %Limes-loaded > 0 then echo . [ Limes         - %Limes-loaded
     if %Slate-loaded > 0 then echo . [ Slate         - %Slate-loaded
     if %Brass-loaded > 0 then echo . [ Brass         - %Brass-loaded
     if %Lead-loaded > 0 then echo . [ Lead          - %Lead-loaded
     if %Copper-loaded > 0 then echo . [ Copper        - %Copper-loaded
     if %Bronze-loaded > 0 then echo . [ Bronze        - %Bronze-loaded
     if %Silk-loaded > 0 then echo . [ Silk          - %Silk-loaded
     if %Cotton-loaded > 0 then echo . [ Cotton        - %Cotton-loaded
     if %Wool-loaded > 0 then echo . [ Wool          - %Wool-loaded
     if %Lace-loaded > 0 then echo . [ Lace          - %Lace-loaded
     if %Velvet-loaded > 0 then echo . [ Velvet        - %Velvet-loaded
     if %DeobarOil-loaded > 0 then echo . [ Deobar Oil    - %DeobarOil-loaded
     if %Myrrh-loaded > 0 then echo . [ Myrrh         - %Myrrh-loaded
     if %Salt-loaded > 0 then echo . [ Salt          - %Salt-loaded
     if %Indigo-loaded > 0 then echo . [ Indigo        - %Indigo-loaded
     if %PurpleDye-loaded > 0 then echo . [ Purple Dye    - %PurpleDye-loaded
     if %Barley-loaded > 0 then echo . [ Barley        - %Barley-loaded
     if %Wheat-loaded > 0 then echo . [ Wheat         - %Wheat-loaded
     if %Oats-loaded > 0 then echo . [ Oats          - %Oats-loaded
     if %Corn-loaded > 0 then echo . [ Corn          - %Corn-loaded
     if %Acanth-loaded > 0 then echo . [ Acanth        - %Acanth-loaded
     if %Taffelberries-loaded > 0 then echo . [ Taffelberries - %Taffelberries-loaded
     if %Apples-loaded > 0 then echo . [ Apples        - %Apples-loaded
echo .
echo . Total Coin Spent On Commodities            : %commodity-spent
echo . Total Coin Gained From Selling Commodities : %commodity-intake
     setvariable temp-commod %commodity-intake
     math temp-commod subtract %commodity-spent
echo . Total Profit Gained From Commodities       : %temp-commod
echo . ---------------------------
done-echo:
echo
     return