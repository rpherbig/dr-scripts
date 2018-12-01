#SFtrader - Hands free trading for Crossing and Interprovince.
put set status
waitfor Ok.
put echo /on
waitfor echo
echo
echo ***********************************************
echo **  [|][|]   [|]  []   [][] []|[] [][]  [][] **
echo ** [] [] [] [] [] []    []  []     []  []    **
echo ** [] [] [] []|[] []    []  [][]   []  []    **
echo ** [] [] [] [] [] [][] [][] []    [][]  [][] **
echo ***********************************************
echo
put echo /off
waitfor echo
echo SFtrader
echo Last tweak 11/16/2010 12:26AM
echo
echo SITE:  http://www.malific.com/ or http://www.geocities.com/malificdr/
echo AIM:   Malific Drockmur
echo EMAIL: drockmali@hotmail.com
echo
echo ** First time use:
echo **    .SFtrader SET <jugglies> <App1> <App2> <origami instructions name> <# of coins> <silver/bronze/copper> <instrument> <song> <mood> (name of weapon for teacher - This is used only when the master tells the teacher to "teach weapon") (skill to teach)
echo
put stow left
wait
put stow right
wait
IF_1 goto %1
ZTSET:
IF_1 goto 1%1
echo
echo ************************************************************
echo ** Features:
echo **
echo ** Trading for Crossing and Interprovential.
echo ** Trains Appraisal by apping Variables zTapp1 and zTapp2.
echo ** Trains Mech Lore by Origami, Stones, of Vine braiding.
echo ** Trains Scholarship by studying embroidery patterns and ledger.
echo ** Trains Perception by juggling variable zTjugglies.
echo ** Trains Music Lore by playing variable zTplay.
echo ** Runs to the bank every time it's in Crossing/Shard/Riverhaven. (below for details)
echo ** Ability to support Partner traders. (below for syntaxes)
echo ** Ability to support non-trader teachers. (below for details)
echo ** If main trader drops, partners will begin trading on their own.
echo ************************************************************
echo
echo ************************************************************
echo ** You can start this script from:
echo **
echo ** Inside or outside any outpost (clerk rooms only inside).
echo ** On any Ferry/Gondola room.
echo ** Anyplace a caravan says it has "arrived at its destination"
echo ** Inside or outside Crossing, Leth, Dirge, Shard and Riverhaven banks.
echo ** If you have a caravan - anywhere that a caravan can be given a "lead to"
echo ************************************************************
echo
USAGE:
echo
echo ************************************************************
echo ** Usage:
echo ** VERY IMPORTANT! If you are running SFtrader for your very first time
echo ** you MUST run it as ".SFtrader SET" in order to store required
echo ** viarables in SF. Remember to do this for EACH character that will use
echo ** the script.
echo **
echo ** First time use =
echo **    .SFtrader SET <jugglies> <App1> <App2> <origami instructions name> <# of coins> <type of coins> <instrument> <song> <mood> (name of weapon teaching) (skill to teach)
echo **
echo ** To trade interproventially, put INTER as your first option.
echo ** Interprovintial trade does NOT support Teachers or Partners.
echo **
echo ** 1 trader solo trading =
echo **              .SFtrader MASTER
echo **
echo **  When partnering ALWAYS start the script on partners and teachers FIRST!
echo **
echo ** 2 traders =
echo ** Main trader: .SFtrader MASTER <partner's name>
echo ** Partner:     .SFtrader PARTNER <main's name>
echo **
echo ** 1 Trader + 1 teacher = Teacher's Name Must be twice!!
echo ** Main trader: .SFtrader MASTER <teacher's name> <teacher's name>
echo ** Teacher:     .SFtrader TEACHER <main's name> (student) (student) etc.
echo **
echo ** 2 Traders + 1 teacher =
echo ** Main trader: .SFtrader MASTER <partner's name> <teacher's name>
echo ** Partner:     .SFtrader PARTNER <main's name> <caravan> <teacher's name>
echo ** Teacher:     .SFtrader TEACHER <main's name> (student) (student) etc.
echo **
echo ** 3 Traders =
echo ** Main trader: .SFtrader MASTER <partner's name>
echo ** Partner 1:   .SFtrader PARTNER <main's name>
echo ** Partner 2:   .SFtrader PARTNER <main's name> <caravan>
echo **
echo ** 3 Traders + 1 teacher =
echo ** Main trader: .SFtrader MASTER <partner's name> <teacher's name>
echo ** Partner 1:   .SFtrader PARTNER <main's name> <caravan> <teacher's name>
echo ** Partner 2:   .SFtrader PARTNER <main's name> <caravan> <teacher's name>
echo ** Teacher:     .SFtrader TEACHER <main's name> (student) (student) etc.
echo **
echo ** Finishing a Route =
echo ** All traders: .SFtrader FINISH
echo **
echo ** VARIABLE Descriptions:
echo ** <main's name> = the FULL first name of the trader not running as a partner or teacher
echo ** <partner's name> = the FULL first name of your primary partner
echo ** <teacher's name> = the FULL first name of a non-trader teacher
echo ** <caravan> = Which caravan in the group you own. Example: second/third/fourth etc
echo ** (student) = The name of any person the Teacher is supposed to teach.
echo ************************************************************
echo
echo
echo **********************************************************
echo ** Please restart the script following the above usages!
echo **********************************************************
echo
goto LABELERROR


SET:
setvariable zTSET 1
shift
IF_1 setvariable zTjugglies %1
IF_1 shift
IF_1 setvariable zTapp1 %1
IF_1 shift
IF_1 setvariable zTapp2 %1
IF_1 shift
IF_1 setvariable zTorigami %1
IF_1 shift
IF_1 setvariable zTcoin %1
IF_1 shift
IF_1 setvariable zTcurrency %1
IF_1 shift
IF_1 setvariable zTplay %1
IF_1 shift
IF_1 setvariable zTsong %1
IF_1 shift
IF_1 setvariable zTmood %1
IF_1 shift
IF_1 setvariable zTweapteach %1
IF_1 setvariable zTteach teach
IF_1 shift
IF_1 setvariable zTteach %1

SET_DONE:
echo
echo **********************
echo ** SET-UP Complete! **
echo **********************
echo
exit
INT:
INTE:
INTER:
INTERP:
INTERPR:
INTERPRO:
INTERPROV:
	echo
	echo INTERPROV:
	echo
I_I_SHIFT:
shift
IF_1 goto I_I_SHIFT
goto I_CARA_CHECK

M:
MA:
MAS:
MAST:
MASTE:
MASTER:
goto MASTER%zTSET
1M:
1MA:
1MAS:
1MAST:
1MASTE:
1MASTER:
MASTER1:
echo MASTER:
echo
echo ********************************
echo ** Beginning as Master Trader **
echo ********************************
echo
shift

START:
put set Inac
waitfor Ok.
IF_1 put avoid all
IF_1 wait
IF_1 put avoid !join
IF_1 waitfor You're now
goto CARA_CHECK

IDLE:
IF_1 shift
IF_1 goto IDLE
CARA_CHECK:
	echo
	echo CARA_CHECK:
	echo
setvariable zTRagad HAVE_CARA
	match RAGAD_STURDY for your sturdy caravan.
	match RAGAD_IRON for your iron-banded caravan.
	match RAGAD_WEATHERED for your weathered caravan.
	match RAGAD_MULE for your two mule caravan.
	match RAGAD_RICKETY for your rickety caravan.
	match RAGAD_STEEL for your steel-wheeled caravan.
	match RAGAD_BLACK for your sleek black caravan.
	match RAGAD_BLUE for your deep blue caravan.
	match RAGAD_COVERED for your covered caravan.
	match RAGAD_RED for your bright red caravan.
	match RAGAD_OX for your oxen drawn caravan.
	match RAGAD_CLAD for your ironclad caravan.
	match RAGAD_GILT for your gilt-edged caravan.
	match RAGAD_WOOD for your polished wood caravan.
	match RAGAD_SITH for your sithannik caravan.
	match BEGIN referring
	match OTHER_CHECK belonging to
put look caravan
	match QUIT [You're
	matchwait

OTHER_CHECK:
pause
	match RAGAD_STURDY for your sturdy caravan.
	match RAGAD_IRON for your iron-banded caravan.
	match RAGAD_WEATHERED for your weathered caravan.
	match RAGAD_MULE for your two mule caravan.
	match RAGAD_RICKETY for your rickety caravan.
	match RAGAD_STEEL for your steel-wheeled caravan.
	match RAGAD_BLACK for your sleek black caravan.
	match RAGAD_BLUE for your deep blue caravan.
	match RAGAD_COVERED for your covered caravan.
	match RAGAD_RED for your bright red caravan.
	match RAGAD_OX for your oxen drawn caravan.
	match RAGAD_CLAD for your ironclad caravan.
	match RAGAD_GILT for your gilt-edged caravan.
	match RAGAD_WOOD for your polished wood caravan.
	match RAGAD_SITH for your sithannik caravan.
	match BEGIN referring
	match OTHER_CHECK1 belonging to
put look other caravan
	match QUIT [You're
	matchwait

OTHER_CHECK1:
pause
	match RAGAD_STURDY for your sturdy caravan.
	match RAGAD_IRON for your iron-banded caravan.
	match RAGAD_WEATHERED for your weathered caravan.
	match RAGAD_MULE for your two mule caravan.
	match RAGAD_RICKETY for your rickety caravan.
	match RAGAD_STEEL for your steel-wheeled caravan.
	match RAGAD_BLACK for your sleek black caravan.
	match RAGAD_BLUE for your deep blue caravan.
	match RAGAD_COVERED for your covered caravan.
	match RAGAD_RED for your bright red caravan.
	match RAGAD_OX for your oxen drawn caravan.
	match RAGAD_CLAD for your ironclad caravan.
	match RAGAD_GILT for your gilt-edged caravan.
	match RAGAD_WOOD for your polished wood caravan.
	match RAGAD_SITH for your sithannik caravan.
	match BEGIN referring
	match OTHER_CHECK2 belonging to
put look third caravan
	match QUIT [You're
	matchwait

OTHER_CHECK2:
pause
	match RAGAD_STURDY for your sturdy caravan.
	match RAGAD_IRON for your iron-banded caravan.
	match RAGAD_WEATHERED for your weathered caravan.
	match RAGAD_MULE for your two mule caravan.
	match RAGAD_RICKETY for your rickety caravan.
	match RAGAD_STEEL for your steel-wheeled caravan.
	match RAGAD_BLACK for your sleek black caravan.
	match RAGAD_BLUE for your deep blue caravan.
	match RAGAD_COVERED for your covered caravan.
	match RAGAD_RED for your bright red caravan.
	match RAGAD_OX for your oxen drawn caravan.
	match RAGAD_CLAD for your ironclad caravan.
	match RAGAD_GILT for your gilt-edged caravan.
	match RAGAD_WOOD for your polished wood caravan.
	match RAGAD_SITH for your sithannik caravan.
	match BEGIN referring
	match OTHER_CHECK3 belonging to
put look fourth caravan
	match QUIT [You're
	matchwait

OTHER_CHECK3:
pause
	match RAGAD_STURDY for your sturdy caravan.
	match RAGAD_IRON for your iron-banded caravan.
	match RAGAD_WEATHERED for your weathered caravan.
	match RAGAD_MULE for your two mule caravan.
	match RAGAD_RICKETY for your rickety caravan.
	match RAGAD_STEEL for your steel-wheeled caravan.
	match RAGAD_BLACK for your sleek black caravan.
	match RAGAD_BLUE for your deep blue caravan.
	match RAGAD_COVERED for your covered caravan.
	match RAGAD_RED for your bright red caravan.
	match RAGAD_OX for your oxen drawn caravan.
	match RAGAD_CLAD for your ironclad caravan.
	match RAGAD_GILT for your gilt-edged caravan.
	match RAGAD_WOOD for your polished wood caravan.
	match RAGAD_SITH for your sithannik caravan.
	match BEGIN referring
	match OTHER_CHECK4 belonging to
put look fifth caravan
	match QUIT [You're
	matchwait

OTHER_CHECK4:
pause
	match RAGAD_STURDY for your sturdy caravan.
	match RAGAD_IRON for your iron-banded caravan.
	match RAGAD_WEATHERED for your weathered caravan.
	match RAGAD_MULE for your two mule caravan.
	match RAGAD_RICKETY for your rickety caravan.
	match RAGAD_STEEL for your steel-wheeled caravan.
	match RAGAD_BLACK for your sleek black caravan.
	match RAGAD_BLUE for your deep blue caravan.
	match RAGAD_COVERED for your covered caravan.
	match RAGAD_RED for your bright red caravan.
	match RAGAD_OX for your oxen drawn caravan.
	match RAGAD_CLAD for your ironclad caravan.
	match RAGAD_GILT for your gilt-edged caravan.
	match RAGAD_WOOD for your polished wood caravan.
	match RAGAD_SITH for your sithannik caravan.
	match BEGIN referring
	match OTHER_CHECK5 belonging to
put look sixth caravan
	match QUIT [You're
	matchwait

OTHER_CHECK5:
pause
	match RAGAD_STURDY for your sturdy caravan.
	match RAGAD_IRON for your iron-banded caravan.
	match RAGAD_WEATHERED for your weathered caravan.
	match RAGAD_MULE for your two mule caravan.
	match RAGAD_RICKETY for your rickety caravan.
	match RAGAD_STEEL for your steel-wheeled caravan.
	match RAGAD_BLACK for your sleek black caravan.
	match RAGAD_BLUE for your deep blue caravan.
	match RAGAD_COVERED for your covered caravan.
	match RAGAD_RED for your bright red caravan.
	match RAGAD_OX for your oxen drawn caravan.
	match RAGAD_CLAD for your ironclad caravan.
	match RAGAD_GILT for your gilt-edged caravan.
	match RAGAD_WOOD for your polished wood caravan.
	match RAGAD_SITH for your sithannik caravan.
	match BEGIN referring
	match OTHER_CHECK6 belonging to
put look seventh caravan
	match QUIT [You're
	matchwait

OTHER_CHECK6:
pause
	match RAGAD_STURDY for your sturdy caravan.
	match RAGAD_IRON for your iron-banded caravan.
	match RAGAD_WEATHERED for your weathered caravan.
	match RAGAD_MULE for your two mule caravan.
	match RAGAD_RICKETY for your rickety caravan.
	match RAGAD_STEEL for your steel-wheeled caravan.
	match RAGAD_BLACK for your sleek black caravan.
	match RAGAD_BLUE for your deep blue caravan.
	match RAGAD_COVERED for your covered caravan.
	match RAGAD_RED for your bright red caravan.
	match RAGAD_OX for your oxen drawn caravan.
	match RAGAD_CLAD for your ironclad caravan.
	match RAGAD_GILT for your gilt-edged caravan.
	match RAGAD_WOOD for your polished wood caravan.
	match RAGAD_SITH for your sithannik caravan.
	match BEGIN referring
	match OTHER_CHECK7 belonging to
put look eighth caravan
	match QUIT [You're
	matchwait

OTHER_CHECK7:
pause
	match RAGAD_STURDY for your sturdy caravan.
	match RAGAD_IRON for your iron-banded caravan.
	match RAGAD_WEATHERED for your weathered caravan.
	match RAGAD_MULE for your two mule caravan.
	match RAGAD_RICKETY for your rickety caravan.
	match RAGAD_STEEL for your steel-wheeled caravan.
	match RAGAD_BLACK for your sleek black caravan.
	match RAGAD_BLUE for your deep blue caravan.
	match RAGAD_COVERED for your covered caravan.
	match RAGAD_RED for your bright red caravan.
	match RAGAD_OX for your oxen drawn caravan.
	match RAGAD_CLAD for your ironclad caravan.
	match RAGAD_GILT for your gilt-edged caravan.
	match RAGAD_WOOD for your polished wood caravan.
	match RAGAD_SITH for your sithannik caravan.
	match BEGIN referring
	match BEGIN belonging to
put look ninth caravan
	match QUIT [You're
	matchwait

RAGAD_OX:
setvariable zTcaravan oxen drawn caravan
goto %zTRagad

RAGAD_CLAD:
setvariable zTcaravan ironclad caravan
goto %zTRagad

RAGAD_GILT:
setvariable zTcaravan gilt-edged caravan
goto %zTRagad

RAGAD_WOOD:
setvariable zTcaravan polished wood caravan
goto %zTRagad

RAGAD_SITH:
setvariable zTcaravan sithannik caravan
goto %zTRagad

RAGAD_BLACK:
setvariable zTcaravan sleek black caravan
goto %zTRagad

RAGAD_BLUE:
setvariable zTcaravan deep blue caravan
goto %zTRagad

RAGAD_COVERED:
setvariable zTcaravan covered caravan
goto %zTRagad

RAGAD_RED:
setvariable zTcaravan bright red caravan
goto %zTRagad

RAGAD_WHEELED:
setvariable zTcaravan four-wheeled caravan
goto %zTRagad

RAGAD_STEEL:
setvariable zTcaravan steel-wheeled caravan
goto %zTRagad

RAGAD_RICKETY:
setvariable zTcaravan rickety caravan
goto %zTRagad

RAGAD_MULE:
setvariable zTcaravan two mule caravan
goto %zTRagad

RAGAD_WEATHERED:
setvariable zTcaravan weathered caravan
goto %zTRagad

RAGAD_IRON:
setvariable zTcaravan iron-banded caravan
goto %zTRagad

RAGAD_STURDY:
setvariable zTcaravan sturdy caravan
goto %zTRagad

HAVE_CARA:
	echo
	echo HAVE_CARA:
	echo
put tell caravan to follow
waitfor you
	match AT_DIRGE North Roads Caravansary
	match DIRGE_BANK_OUT_CARA Dirge, Crossroads
	match DIRGE_OUT Dirge, Gateway Road
	match AT_STONE_ARTHE Lairocott Brach, Entrance
	match STONE_OUT Guild outpost sits alongside
	match CLIMB_TRAIL_PAUSE Foothills, Stony Incline
	match AT_ARTHE_CROSS Valley, Village Gate
	match ARTHE_OUT Arthe Dale, Cul-de-sac
	match AT_CROSS Northeast Wilds, Outside Northeast Gate
	match CROSS_OUT The Crossing, Commerce Avenue
	match WOLF_OUT Wolf Clan Home, Dirt Road
	match TIGER_OUT Tiger Clan Home, Dirt Pathway
	match GO_FERRY_CARA The Crossing, Alfren's Ferry
	match GO_FERRY_CARA1 Sparse grass, weeds and a few hardy shrubs
	match GO_FERRY_CARA Southern Trade Route, Segoltha South Bank
	match AT_LETH_CARA Southern Trade Route, Outside Leth Deriel
	match LETH_OUT Leth Deriel, Oakenheart Circle
	match GO_FERRY_CARA ferry
	match UNKNOWN_CARA obvious
put look
	match QUIT [You're
	matchwait

GO_FERRY_CARA1:
put tell caravan follow
pause 2
put tell caravan follow
put tell caravan go fast
wait
move n
waitfor following you
save L_FERRY
goto FERRY

GO_FERRY_CARA:
put tell caravan follow
pause 2
put tell caravan follow
put tell caravan go fast
wait
save L_FERRY
goto FERRY

ACCEPT:
put accept
waitfor you
put stow right
wait
goto DES_CHECK

TIP:
put accept tip
goto DES_CHECK

UNKNOWN_CARA:
save HAVE_CARA
	match NO_GO go next and it stops.
	match HIDE acknowledges the order.
put tell caravan lead to crossing
	match QUIT [You're
	matchwait

BEGIN:
IF_1 put whis group go
	echo
	echo BEGIN:
	echo
	match HOME_IN Malific's Home
	match HOME_OUT Willow Walk, Garden Path
	match DIRGE_ROAD North Roads Caravansary
	match DIRGE_BANK_OUT Dirge, Crossroads
	match DIRGE_BANK_IN Dirge, Traveller's Bank
	match DIRGE_OUT Dirge, Gateway Road
	match DIRGE_IN Darkstone Inn, Stables
	match STONE_TRAIL Lairocott Brach, Entrance
	match STONE_OUT Guild outpost sits alongside
	match STONE_IN Stone Clan, Trader's Guild Outpost
	match ARTHE_GATE Valley, Village Gate
	match ARTHE_OUT Arthe Dale, Cul-de-sac
	match ARTHE_IN2 Swotting Hall, Public Foyer
	match ARTHE_IN Swotting Hall, Trader's Center
	match CROSS_GATE Northeast Wilds, Outside Northeast Gate
	match CROSS_BANK_OUT The Crossing, Hodierna Way
	match CROSS_BANK_IN First Provincial Bank
	match CROSS_BANK_IN2 Provincial Bank, Teller
	match CROSS_OUT The Crossing, Commerce Avenue
	match CROSS_IN Traders' Guild, Shipment Center
	match WOLF_OUT Wolf Clan Home, Dirt Road
	match WOLF_IN Wolf Clan Trader Outpost
	match TIGER_OUT Tiger Clan Home, Dirt Pathway
	match TIGER_IN Tiger Clan, Trader's Guild Outpost
	match LETH_GATE Leth Deriel, Alder Bower Gate
	match LETH_BANK_OUT Leth Deriel, Dragon Tree Road
	match LETH_BANK_IN Imperial Depository, Lobby
	match LETH_BANK_IN1 Imperial Depository, Domestic Branch
	match LETH_BANK_IN2 Imperial Depository, Foreign Branch
	match LETH_OUT Leth Deriel, Oakenheart Circle
	match LETH_IN Eshar's Trading Post, Main Room
Put look
	match QUIT [You're
	matchwait

HOME_IN:
put stand
wait
put unlock door
wait
put open door
wait
move go door
put close red cot
wait
put lock red cot
wait
HOME_OUT:
move w
put w
move w
put w
move go gate
put s
move e
put s
move w
put w
move s
put s
move s
put s
move s
put s
move se
put go bank
move go wind
put with %zTcoin %zTcurrency
wait
goto CROSS_BANK_IN3

CROS_CARA:
setvariable zTRagad CROSS
	echo
	echo CROS_CARA:
	echo
	match NEED_MONEYC don't have enough money
	match RAGAD pay the clerk
	match CROSS the clerk says.
put rent caravan
	match QUIT [You're
	matchwait

LETH_CARA:
setvariable zTRagad LETH
	echo
	echo LETH_CARA:
	echo
	match NEED_MONEY don't have enough money
	match RAGAD pay the clerk
	match LETH the clerk says.
put rent caravan
	match QUIT [You're
	matchwait

RENT_CARAVAN:
setvariable zTRagad %s
	echo
	echo RENT_CARAVAN:
	echo
	match NEED_MONEY don't have enough money
	match RAGAD pay the clerk
	match %s the clerk says.
put rent caravan
	match QUIT [You're
	matchwait

RAGAD:
	match RAGAD_STURDY your sturdy caravan
	match RAGAD_IRON your iron-banded caravan
	match RAGAD_WEATHERED your weathered caravan
	match RAGAD_MULE your two mule caravan
	match RAGAD_RICKETY your rickety caravan
	match RAGAD_STEEL your steel-wheeled caravan
	match RAGAD_BLACK your sleek black caravan
	match RAGAD_BLUE your deep blue caravan
	match RAGAD_COVERED your covered caravan
	match RAGAD_RED your bright red caravan
	match RAGAD_OX your oxen drawn caravan
	match RAGAD_CLAD your ironclad caravan
	match RAGAD_GILT your gilt-edged caravan
	match RAGAD_WOOD your polished wood caravan
	match RAGAD_SITH your sithannik caravan
put tell caravan follow
	matchwait

NEED_MONEYC:
move e
put e
move go side door
move go foyer
move out
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
move go wind
put with 400 cop
goto CROSS_BANK_IN3

CROSS_BANK_OUT:
move go bank
CROSS_BANK_IN:
move go window
CROSS_BANK_IN2:
put with %zTcoin %zTcurrency
CROSS_BANK_IN3:
move out
put out
move sw
move go bri
move sw
move w
move w
move w
move w
move nw
move n
move n
move n
move go door
save CROSS_LETH_WOLF_CHECK
goto CROS_CARA

AT_CROSS:
	echo
	echo AT_CROSS:
	echo
put tell caravan follow
waitfor you
IF_1 move e
IF_1 waitfor following you
IF_1 put belch
IF_1 wait
IF_1 put nod
IF_1 pause 2
IF_1 put whisper group feed
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
pause
	IF_1 match AT_CROSS_F group, "ready
	IF_1 match AT_CROSS_F_SHIFT YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	IF_1 match QUIT [You're
IF_1 put whisper group done
	IF_1 matchwait

goto AT_CROSS_F
AT_CROSS_F_SHIFT:
IF_1 shift
IF_1 goto AT_CROSS_F_SHIFT

AT_CROSS_F:
IF_1 move w
IF_1 waitfor following you
	match NOT_CROSS obvious
	match NOT_CROSS1 can't
	match NOT_CROSS1 referring
	match AT_CROSS2 The Crossing, Northeast Customs
put go gate
	match QUIT [You're
	matchwait

NOT_CROSS:
waitfor following you
put go gate
waitfor following you
NOT_CROSS1:
put tell caravan lead to crossing
waitfor you
goto HIDE


AT_CROSS2:
waitfor following you
IF_1 goto NE_GATE_CLIMB_DONE
NE_GATE_CLIMB:
put tell caravan to wait
wait
put go gate
put climb wall
CLIMB1_PAUSE:
pause
	match CLIMB1_PAUSE roundtime
	match CLIMB1_PAUSE ...wait
	match CLIMB1_PAUSE type ahead
	match CLIMB1 you stand
	match CLIMB1 already standing
	match QUIT [You're
put stand
	matchwait
CLIMB1:
move go gate
move w
move go stair
put climb embrasure
CLIMB2_PAUSE:
pause
	match CLIMB2_PAUSE roundtime
	match CLIMB2_PAUSE ...wait
	match CLIMB2_PAUSE type ahead
	match CLIMB2 you stand
	match CLIMB2 already standing
	match QUIT [You're
put stand
	matchwait
CLIMB2:
	match CLIMB2B You can't go there.
	match CLIMB3_PAUSE a break in the crenellation
	match CLIMB2_PAUSE ...wait
put s
	matchwait
CLIMB2B:
move go gate
move w
move go stair
move s
CLIMB3_PAUSE:
pause
	match CLIMB3_PAUSE roundtime
	match CLIMB3_PAUSE ...wait
	match CLIMB3_PAUSE type ahead
	match CLIMB3 you stand
	match CLIMB3 already standing
	match QUIT [You're
put stand
	matchwait
CLIMB3:
move n
move go stair
move e
move go gate
move go footp
put climb wall
CLIMB4_PAUSE:
pause 2
	match CLIMB4_PAUSE roundtime
	match CLIMB4_PAUSE ...wait
	match CLIMB4_PAUSE type ahead
	match CLIMB4 you stand
	match CLIMB4 already standing
	match QUIT [You're
put stand
	matchwait
CLIMB4:
	match CLIMB4B stone stairway
	match CLIMB4_DONE Outside Northeast
	match CLIMB4_PAUSE ...wait
put n
	matchwait
CLIMB4B:
move go stair
move east
goto CLIMB4_DONE2
CLIMB4_DONE:
put go gate
CLIMB4_DONE2:
put tell caravan follow
wait
NE_GATE_CLIMB_DONE:
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move s
waitfor following you
move s
waitfor following you
move w
waitfor following you
move s
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move go bri
waitfor following you
move s
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move w
waitfor following you
move go door
save CROSS_LETH_DIRGE_CHECK
goto CROSS

CROSS_GATE:
	echo
	echo CROSS_GATE:
	echo
move go gate
put w
move w
move w
move s
move s
move w
move s
move w
move w
move w
move w
move w
move w
move go bri
move s
move se
move sw
move s
move s
move s
move w
CROSS_OUT:
move go door
CROSS_IN:
save CROSS_LETH_WOLF_CHECK
goto CROS_CARA

CROSS:
	echo
	echo CROSS:
	echo
IF_1 match CROSS1 nods to you
IF_1 match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
IF_1 matchwait
CROSS1:
pause
	match CROSS_GIVE_CON you get
	match CROSS_GET_CON1 referring
put get my cross contract
	match QUIT [You're
	matchwait

CROSS_GIVE_CON:
	echo
	echo CROSS_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto CROSS1

CROSS_GET_CON1:
pause
put pay clerk gold
wait
CROSS_E:
	match CROSS_STAND can't do that
	match CROSS_GET_CON obvious
put e
	matchwait

CROSS_GET_CON:
	echo
	echo CROSS_GET_CON:
	echo
	match CROSS_GOT_CON minister says.
	match CROSS_GOT_CON The minister reminds you
	match CROSS_GOT_CON The minister plucks a contract
	match CROSS_E referring
	match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
put ask minister for contract
	match QUIT [You're
	matchwait

CROSS_STAND_PAUSE:
pause
CROSS_STAND:
	match CROSS_STAND_PAUSE roundtime
	match CROSS_E You stand back up.
	match CROSS_STAND_PAUSE ...wait
	match CROSS_STAND_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

CROSS_GOT_CON:
	echo
	echo CROSS_GOT_CON:
	echo
move w
pause
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto CON_CHECK


CROSS_LETH_WOLF_CHECK:
	echo
	echo CROSS_LETH_WOLF_CHECK:
	echo
save CROSS_ARTHE_CHECK
	IF_1 match CROSS_TO_LETH1 I have three for Leth.
	IF_1 match CROSS_LETH_WOLF_CHECK1 nods to you.
	IF_1 match CROSS_LETH_WOLF_CHECK4 head at you.
IF_1 put whisper group Anyone for Leth?
	IF_1 matchwait
CROSS_LETH_WOLF_CHECK4:
	match CROSS_ARTHE_CHECK referring
	match CROSS_ARTHE_CHECK_DROP3 expired
	match CROSS_LETH_WOLF_CHECK3 andaen
	match CROSS_LETH_WOLF_CHECK3 andu
	match CROSS_LETH_WOLF_CHECK3 11 anlaen
	match CROSS_LETH_WOLF_CHECK3 10 anlaen
	match CROSS_LETH_WOLF_CHECK3 9 anlaen
	match CROSS_LETH_WOLF_CHECK3 8 anlaen
	match CROSS_LETH_WOLF_CHECK3 7 anlaen
	match CROSS_LETH_WOLF_CHECK3 6 anlaen
	match CROSS_LETH_WOLF_CHECK3 5 anlaen
	match CROSS_LETH_WOLF_CHECK3 4 anlaen
	match CROSS_LETH_WOLF_CHECK3 3 anlaen
	match CROSS_TO_LETH1 2 anlaen
	match CROSS_TO_LETH1 anlas
put read my leth contract
	match QUIT [You're
	matchwait

CROSS_LETH_WOLF_CHECK1:
	match CROSS_ARTHE_CHECK referring
	match CROSS_ARTHE_CHECK_DROP expired
	match CROSS_TO_LETH1 andaen
	match CROSS_TO_LETH1 andu
	match CROSS_TO_LETH1 11 anlaen
	match CROSS_TO_LETH1 10 anlaen
	match CROSS_TO_LETH1 9 anlaen
	match CROSS_TO_LETH1 8 anlaen
	match CROSS_TO_LETH1 7 anlaen
	match CROSS_TO_LETH1 6 anlaen
	match CROSS_TO_LETH1 5 anlaen
	match CROSS_TO_LETH1 4 anlaen
	match CROSS_TO_LETH1 3 anlaen
	match CROSS_TO_LETH1 2 anlaen
	match CROSS_TO_LETH1 anlas
put read my leth contract
	match QUIT [You're
	matchwait

CROSS_LETH_WOLF_CHECK3:
	match CROSS_ARTHE_CHECK referring
	match CROSS_ARTHE_CHECK_DROP2 expired
	match CROSS_LETH_WOLF_CHECK2 andaen
	match CROSS_LETH_WOLF_CHECK2 andu
	match CROSS_LETH_WOLF_CHECK2 11 anlaen
	match CROSS_LETH_WOLF_CHECK2 10 anlaen
	match CROSS_LETH_WOLF_CHECK2 9 anlaen
	match CROSS_LETH_WOLF_CHECK2 8 anlaen
	match CROSS_LETH_WOLF_CHECK2 7 anlaen
	match CROSS_LETH_WOLF_CHECK2 6 anlaen
	match CROSS_LETH_WOLF_CHECK2 5 anlaen
	match CROSS_LETH_WOLF_CHECK2 4 anlaen
	match CROSS_LETH_WOLF_CHECK2 3 anlaen
	match CROSS_TO_LETH1 2 anlaen
	match CROSS_TO_LETH1 anlas
put read my second leth contract
	match P_QUIT [You're
	matchwait

CROSS_ARTHE_CHECK_DROP3:
put get my first leth con
wait
put drop my leth con
goto CROSS_LETH_WOLF_CHECK

CROSS_ARTHE_CHECK_DROP:
put get my first leth con
wait
put drop my leth con
goto CROSS_LETH_WOLF_CHECK1

CROSS_ARTHE_CHECK_DROP2:
put get my second leth con
wait
put drop my leth con
goto CROSS_LETH_WOLF_CHECK3

CROSS_LETH_WOLF_CHECK2:
	match CROSS_ARTHE_CHECK referring
	match CROSS_TO_LETH1 The contract is printed
put look my third leth contract
	match QUIT [You're
	matchwait

CROSS_LETH_DIRGE_CHECK:
	echo
	echo CROSS_LETH_DIRGE_CHECK:
	echo
save CROSS_TIGER_CHECK
	IF_1 match CROSS_TO_LETH2 I have three for Leth.
	IF_1 match CROSS_LETH_DIRGE_CHECK1 nods to you.
	IF_1 match CROSS_LETH_DIRGE_CHECK4 head at you.
IF_1 put whisper group Anyone for Leth?
	IF_1 matchwait
CROSS_LETH_DIRGE_CHECK4:
	match CROSS_TIGER_CHECK referring
	match CROSS_TIGER_CHECK_DROP3 expired
	match CROSS_LETH_DIRGE_CHECK3 andaen
	match CROSS_LETH_DIRGE_CHECK3 andu
	match CROSS_LETH_DIRGE_CHECK3 11 anlaen
	match CROSS_LETH_DIRGE_CHECK3 10 anlaen
	match CROSS_LETH_DIRGE_CHECK3 9 anlaen
	match CROSS_LETH_DIRGE_CHECK3 8 anlaen
	match CROSS_LETH_DIRGE_CHECK3 7 anlaen
	match CROSS_LETH_DIRGE_CHECK3 6 anlaen
	match CROSS_LETH_DIRGE_CHECK3 5 anlaen
	match CROSS_LETH_DIRGE_CHECK3 4 anlaen
	match CROSS_LETH_DIRGE_CHECK3 3 anlaen
	match CROSS_TO_LETH1 2 anlaen
	match CROSS_TO_LETH1 anlas
put read my leth contract
	match QUIT [You're
	matchwait

CROSS_LETH_DIRGE_CHECK1:
	match CROSS_TIGER_CHECK referring
	match CROSS_TIGER_CHECK_DROP expired
	match CROSS_TO_LETH1 andaen
	match CROSS_TO_LETH1 andu
	match CROSS_TO_LETH1 11 anlaen
	match CROSS_TO_LETH1 10 anlaen
	match CROSS_TO_LETH1 9 anlaen
	match CROSS_TO_LETH1 8 anlaen
	match CROSS_TO_LETH1 7 anlaen
	match CROSS_TO_LETH1 6 anlaen
	match CROSS_TO_LETH1 5 anlaen
	match CROSS_TO_LETH1 4 anlaen
	match CROSS_TO_LETH1 3 anlaen
	match CROSS_TO_LETH1 2 anlaen
	match CROSS_TO_LETH1 anlas
put read my leth contract
	match QUIT [You're
	matchwait

CROSS_LETH_DIRGE_CHECK3:
	match CROSS_TIGER_CHECK referring
	match CROSS_TIGER_CHECK_DROP2 expired
	match CROSS_LETH_DIRGE_CHECK2 andaen
	match CROSS_LETH_DIRGE_CHECK2 andu
	match CROSS_LETH_DIRGE_CHECK2 11 anlaen
	match CROSS_LETH_DIRGE_CHECK2 10 anlaen
	match CROSS_LETH_DIRGE_CHECK2 9 anlaen
	match CROSS_LETH_DIRGE_CHECK2 8 anlaen
	match CROSS_LETH_DIRGE_CHECK2 7 anlaen
	match CROSS_LETH_DIRGE_CHECK2 6 anlaen
	match CROSS_LETH_DIRGE_CHECK2 5 anlaen
	match CROSS_LETH_DIRGE_CHECK2 4 anlaen
	match CROSS_LETH_DIRGE_CHECK2 3 anlaen
	match CROSS_TO_LETH1 2 anlaen
	match CROSS_TO_LETH1 anlas
put read my second leth contract
	match P_QUIT [You're
	matchwait

CROSS_TIGER_CHECK_DROP3:
put get my first leth con
wait
put drop my leth con
goto CROSS_LETH_DIRGE_CHECK

CROSS_TIGER_CHECK_DROP:
put get my first leth con
wait
put drop my leth con
goto CROSS_LETH_DIRGE_CHECK1

CROSS_TIGER_CHECK_DROP2:
put get my first leth con
wait
put drop my leth con
goto CROSS_LETH_DIRGE_CHECK3

CROSS_LETH_DIRGE_CHECK2:
	match CROSS_TIGER_CHECK referring
	match CROSS_TO_LETH1 The contract is printed
put look my third leth contract
	match QUIT [You're
	matchwait

CROSS_TIGER_CHECK:
	echo
	echo CROSS_TIGER_CHECK:
	echo
put get my ledger
wait
put open my ledger
wait
put turn my ledger to chapter 1
waitfor entitled
put turn my ledger to page 6
waitfor entitled
	match CROSS_CON_TIGER Have a contracted trade
	match CROSS_TO_TIGER1 Have a delinquent
	match CROSS_TO_TIGER1 Have no contracts
put read ledge
	match QUIT [You're
	matchwait

CROSS_CON_TIGER:
	echo
	echo CROSS_CON_TIGER:
	echo
	match CROSS_WOLF_CHECK referring
	match CROSS_TO_TIGER1 The contract is printed
put look my tiger contract
	match QUIT [You're
	matchwait

CROSS_WOLF_CHECK:
	echo
	echo CROSS_WOLF_CHECK:
	echo
put turn my ledger to page 3
waitfor entitled
	match CROSS_CON_WOLF Have a contracted trade
	match CROSS_TO_WOLF1 Have no contracts
	match CROSS_TO_WOLF1 Have a delinquent
put read ledge
	match QUIT [You're
	matchwait

CROSS_CON_WOLF:
	echo
	echo CROSS_CON_WOLF:
	echo
	match CROSS_ARTHE_CHECK referring
	match CROSS_TO_WOLF1 The contract is printed
put look my second wolf contract
	match QUIT [You're
	matchwait

CROSS_ARTHE_CHECK:
	echo
	echo CROSS_ARTHE_CHECK:
	echo
put get my ledger
wait
put open my ledger
wait
put turn my ledger to chapter 1
waitfor entitled
CROSS_ARTHE_CHECK1:
put turn my ledger to page 5
waitfor entitled
	match CROSS_CON_ARTHE Have a contracted trade
	match CROSS_TO_ARTHE1 Have no contracts
	match CROSS_TO_ARTHE1 Have a delinquent
put read ledge
	match QUIT [You're
	matchwait

CROSS_CON_ARTHE:
	echo
	echo CROSS_CON_ARTHE:
	echo
	match CROSS_STONE_CHECK referring
	match CROSS_TO_ARTHE1 The contract is printed
put look my arthe contract
	match QUIT [You're
	matchwait

CROSS_STONE_CHECK:
	echo
	echo CROSS_STONE_CHECK:
	echo
put turn my ledger to page 7
waitfor entitled
	match CROSS_CON_STONE Have a contracted trade
	match CROSS_TO_STONE1 Have no contracts
	match CROSS_TO_STONE1 Have a delinquent
put read ledge
	match QUIT [You're
	matchwait

CROSS_CON_STONE:
	echo
	echo CROSS_CON_STONE:
	echo
	match CROSS_DIRGE_CHECK referring
	match CROSS_TO_STONE1 The contract is printed
put look my stone contract
	match QUIT [You're
	matchwait

CROSS_DIRGE_CHECK:
	echo
	echo CROSS_DIRGE_CHECK:
	echo
put turn my ledger to page 2
waitfor entitled
	match CROSS_CON_DIRGE Have a contracted trade
	match CROSS_TO_DIRGE1 Have no contracts
	match CROSS_TO_DIRGE1 Have a delinquent
put read ledge
	match QUIT [You're
	matchwait

CROSS_CON_DIRGE:
	echo
	echo CROSS_CON_DIRGE:
	echo
	match CROSS_TIGER_CHECK referring
	match CROSS_TO_DIRGE1 The contract is printed
put look my second dirge contract
	match QUIT [You're
	matchwait

CROSS_TO_ARTHE1:
save CROSS_TO_ARTHE
goto CROSS_TO_BANK

CROSS_TO_DIRGE1:
save CROSS_TO_DIRGE
goto CROSS_TO_BANK

CROSS_TO_LETH1:
save CROSS_TO_LETH3
goto CROSS_TO_BANK

CROSS_TO_LETH2:
save CROSS_TO_LETH4
goto CROSS_TO_BANK

CROSS_TO_TIGER1:
save CROSS_TO_TIGER
goto CROSS_TO_BANK

CROSS_TO_STONE1:
save CROSS_TO_STONE
goto CROSS_TO_BANK

CROSS_TO_WOLF1:
save CROSS_TO_WOLF
goto CROSS_TO_BANK

CROSS_T_BANK_PAUSE:
pause
CROSS_T_BANK_STAND:
	match CROSS_T_BANK_PAUSE roundtime
	match CROSS_T_BANK1 You stand back up.
	match CROSS_T_BANK_PAUSE ...wait
	match CROSS_T_BANK_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

CROSS_TO_BANK:
IF_1 put whisper group bank run
IF_1 waitfor whisper
CROSS_T_BANK1:
	match CROSS_T_BANK_STAND can't do that
	match CROSS_T_BANK obvious
put e
	matchwait
CROSS_T_BANK:
move e
put go side door
move go foyer
move out
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
put go wind
IF_1 waitfor group, "done
IF_1 pause 2
put dep all
waitfor you
put bala
waitfor you
counter set %zTcoin
goto WITHDRAW

WITHDRAW_PAUSE:
counter subtract 25
pause
WITHDRAW:
	match BANK_DONE and hands them over
	match BANK_DONE The clerk asks
	match BANK_DONE The clerk exclaims
	match WITHDRAW_PAUSE The clerk tells you,
put withdraw %c %zTcurrency
	match QUIT [You're
	matchwait

BANK_DONE:
move out
put out
move sw
move go bri
move n
move n
move w
move nw
move w
move w
move w
move go guild
move go auction foyer
move go hall
move go side door
IF_2 put whisper group You notice a thick, steel door just peeking
	IF_2 match BANK_LISTEN you must LISTEN
	IF_2 match BANK_DONE1 %2 nods to you
	IF_2 match IDLE2 YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	IF_2 matchwait
BANK_LISTEN:
IF_2 put listen to %2
IF_2 waitfor %2 nods to you
goto BANK_DONE1

IDLE2:
shift

BANK_DONE1:
move w
move w
goto %s


CROSS_TO_ARTHE:
	echo
	echo CROSS_TO_ARTHE:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
goto CROSS_TO_ARTHE_OUT
CROSS_TO_ARTHE_OUT_PAUSE:
pause
CROSS_TO_ARTHE_OUT:
	match CROSS_TO_ARTHE_STAND can't do that
	match CROSS_TO_ARTHE_OUT2 obvious
	match CROSS_TO_ARTHE_OUT_PAUSE ...wait
	match CROSS_TO_ARTHE_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
CROSS_TO_ARTHE_PAUSE:
pause
CROSS_TO_ARTHE_STAND:
	match CROSS_TO_ARTHE_PAUSE roundtime
	match CROSS_TO_ARTHE_OUT You stand back up.
	match CROSS_TO_ARTHE_PAUSE ...wait
	match CROSS_TO_ARTHE_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

CROSS_TO_ARTHE_OUT2:
IF_1 pause
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
put tell caravan lead to arthe dale
waitfor you
save AT_ARTHE_CROSS
counter set 5
goto PATTERN


CROSS_TO_STONE:
	echo
	echo CROSS_TO_STONE:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
goto CROSS_TO_STONE_OUT
CROSS_TO_STONE_OUT_PAUSE:
pause
CROSS_TO_STONE_OUT:
	match CROSS_TO_STONE_STAND can't do that
	match CROSS_TO_STONE_OUT2 obvious
	match CROSS_TO_STONE_OUT_PAUSE ...wait
	match CROSS_TO_STONE_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
CROSS_TO_STONE_PAUSE:
pause
CROSS_TO_STONE_STAND:
	match CROSS_TO_STONE_PAUSE roundtime
	match CROSS_TO_STONE_OUT You stand back up.
	match CROSS_TO_STONE_PAUSE ...wait
	match CROSS_TO_STONE_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

CROSS_TO_STONE_OUT2:
IF_1 pause
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
put tell caravan lead to stone clan
waitfor you
save J_CROSS_TO_STONE_OUT2
goto PATTERN

J_CROSS_TO_STONE_OUT2:
save AT_STONE_ARTHE

goto ORIGAMI


CROSS_TO_DIRGE:
	echo
	echo CROSS_TO_DIRGE:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
goto CROSS_TO_DIRGE_OUT
CROSS_TO_DIRGE_OUT_PAUSE:
pause
CROSS_TO_DIRGE_OUT:
	match CROSS_TO_DIRGE_STAND can't do that
	match CROSS_TO_DIRGE_OUT2 obvious
	match CROSS_TO_DIRGE_OUT_PAUSE ...wait
	match CROSS_TO_DIRGE_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
CROSS_TO_DIRGE_PAUSE:
pause
CROSS_TO_DIRGE_STAND:
	match CROSS_TO_DIRGE_PAUSE roundtime
	match CROSS_TO_DIRGE_OUT You stand back up.
	match CROSS_TO_DIRGE_PAUSE ...wait
	match CROSS_TO_DIRGE_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

CROSS_TO_DIRGE_OUT2:
IF_1 pause
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
put tell caravan lead to dirge
waitfor you
save J_CROSS_TO_DIRGE_OUT2
goto PATTERN

J_CROSS_TO_DIRGE_OUT2:
SAVE AT_DIRGE
IF_1 goto ORIGAMI
goto HIDE





CROSS_TO_TIGER:
	echo
	echo CROSS_TO_TIGER:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
goto CROSS_TO_TIGER_OUT
CROSS_TO_TIGER_OUT_PAUSE:
pause
CROSS_TO_TIGER_OUT:
	match CROSS_TO_TIGER_STAND can't do that
	match CROSS_TO_TIGER_OUT2 obvious
	match CROSS_TO_TIGER_OUT_PAUSE ...wait
	match CROSS_TO_TIGER_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
CROSS_TO_TIGER_PAUSE:
pause
CROSS_TO_TIGER_STAND:
	match CROSS_TO_TIGER_PAUSE roundtime
	match CROSS_TO_TIGER_OUT You stand back up.
	match CROSS_TO_TIGER_PAUSE ...wait
	match CROSS_TO_TIGER_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

CROSS_TO_TIGER_OUT2:
IF_1 pause
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move go gate
waitfor following you
goto GOB_CROSS_TIGER1

GOB_CROSS_TIGER_PAUSE:
pause
GOB_CROSS_TIGER_SUBTRACT:
counter subtract 1
goto GOB_CROSS_TIGER%c


GOB_CROSS_TIGER_RP:
pause
GOB_CROSS_TIGER_RETREAT:
	match GOB_CROSS_TIGER%c You retreat from combat.
	match GOB_CROSS_TIGER%c already as far
	match GOB_CROSS_TIGER_P roundtime
	match GOB_CROSS_TIGER_RP ...wait
	match GOB_CROSS_TIGER_RP type ahead
	match GOB_CROSS_TIGER_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_CROSS_TIGER_P:
pause
	match GOB_CROSS_TIGER%c You retreat from combat.
	match GOB_CROSS_TIGER%c already as far
	match GOB_CROSS_TIGER_Q roundtime
	match GOB_CROSS_TIGER_P ...wait
	match GOB_CROSS_TIGER_P type ahead
	match GOB_CROSS_TIGER_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_CROSS_TIGER_RP1:
pause
GOB_CROSS_TIGER_RETREAT1:
	match GOB_CROSS_TIGER%c You retreat from combat.
	match GOB_CROSS_TIGER%c already as far
	match GOB_CROSS_TIGER_P1 roundtime
	match GOB_CROSS_TIGER_RP1 ...wait
	match GOB_CROSS_TIGER_RP1 type ahead
	match GOB_CROSS_TIGER_RP1 You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_CROSS_TIGER_P1:
pause
	match GOB_CROSS_TIGER%c You retreat from combat.
	match GOB_CROSS_TIGER%c already as far
	match GOB_CROSS_TIGER_Q roundtime
	match GOB_CROSS_TIGER_P1 ...wait
	match GOB_CROSS_TIGER_P1 type ahead
	match GOB_CROSS_TIGER_RP1 You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_CROSS_TIGER_Q:
pause
	match GOB_CROSS_TIGER%c You retreat from combat.
	match GOB_CROSS_TIGER%c already as far
	match QUIT roundtime
	match GOB_CROSS_TIGER_Q ...wait
	match GOB_CROSS_TIGER_Q type ahead
	match GOB_CROSS_TIGER_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_CROSS_TIGER1:
counter set 2
put go path
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT what were you
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T2:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER2:
counter set 3
put w
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T3:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER3:
counter set 4
put w
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T4:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER4:
counter set 5
put nw
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T5:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER5:
counter set 6
put w
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T6:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER6:
counter set 7
put w
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T7:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER7:
counter set 8
put nw
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T8:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER8:
counter set 9
put w
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T9:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER9:
counter set 10
put w
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T10:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER10:
counter set 11
put sw
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T11:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER11:
counter set 12
put w
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T12:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER12:
counter set 13
put w
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T13:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER13:
counter set 14
put nw
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T14:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER14:
counter set 15
put nw
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T15:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER15:
counter set 16
put w
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T16:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER16:
counter set 17
put go gate
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT what were you
	match GOB_CROSS_T%c obvious
	matchwait

GOB_CROSS_T17:
	match GOB_CROSS_TIGER%c following you
	match GOB_CROSS_TIGER_RETREAT [You're
	match GOB_CROSS_TIGER_RETREAT1 You are engaged
	match GOB_CROSS_TIGER_SUBTRACT you can't
	match GOB_CROSS_TIGER_PAUSE type ahead
	match GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


GOB_CROSS_TIGER17:
move s
waitfor following you
move se
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move go outpost
save TIGER_WOLF_CHECK
goto TIGER

CROSS_TO_WOLF:
	echo
	echo CROSS_TO_WOLF:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
goto CROSS_TO_WOLF_OUT
CROSS_TO_WOLF_OUT_PAUSE:
pause
CROSS_TO_WOLF_OUT:
	match CROSS_TO_WOLF_STAND can't do that
	match CROSS_TO_WOLF_OUT2 obvious
	match CROSS_TO_WOLF_OUT_PAUSE ...wait
	match CROSS_TO_WOLF_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
CROSS_TO_WOLF_PAUSE:
pause
CROSS_TO_WOLF_STAND:
	match CROSS_TO_WOLF_PAUSE roundtime
	match CROSS_TO_WOLF_OUT You stand back up.
	match CROSS_TO_WOLF_PAUSE ...wait
	match CROSS_TO_WOLF_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

CROSS_TO_WOLF_OUT2:
IF_1 pause
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move go gate
waitfor following you
goto GOB_CROSS_WOLF1

GOB_CROSS_WOLF_PAUSE:
pause
GOB_CROSS_WOLF_SUBTRACT:
counter subtract 1
goto GOB_CROSS_WOLF%c

GOB_CROSS_WOLF_RP:
pause
GOB_CROSS_WOLF_RETREAT:
	match GOB_CROSS_WOLF%c You retreat from combat.
	match GOB_CROSS_WOLF%c already as far
	match GOB_CROSS_WOLF_P roundtime
	match GOB_CROSS_WOLF_RP ...wait
	match GOB_CROSS_WOLF_RP type ahead
	match GOB_CROSS_WOLF_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_CROSS_WOLF_P:
pause
	match GOB_CROSS_WOLF%c You retreat from combat.
	match GOB_CROSS_WOLF%c already as far
	match GOB_CROSS_WOLF_Q roundtime
	match GOB_CROSS_WOLF_P ...wait
	match GOB_CROSS_WOLF_P type ahead
	match GOB_CROSS_WOLF_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_CROSS_WOLF_RP1:
pause
GOB_CROSS_WOLF_RETREAT1:
	match GOB_CROSS_WOLF%c You retreat from combat.
	match GOB_CROSS_WOLF%c already as far
	match GOB_CROSS_WOLF_P1 roundtime
	match GOB_CROSS_WOLF_RP1 ...wait
	match GOB_CROSS_WOLF_RP1 type ahead
	match GOB_CROSS_WOLF_RP1 You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_CROSS_WOLF_P1:
pause
	match GOB_CROSS_WOLF%c You retreat from combat.
	match GOB_CROSS_WOLF%c already as far
	match GOB_CROSS_WOLF_Q roundtime
	match GOB_CROSS_WOLF_P1 ...wait
	match GOB_CROSS_WOLF_P1 type ahead
	match GOB_CROSS_WOLF_RP1 You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_CROSS_WOLF_Q:
pause
	match GOB_CROSS_WOLF%c You retreat from combat.
	match GOB_CROSS_WOLF%c already as far
	match QUIT roundtime
	match GOB_CROSS_WOLF_Q ...wait
	match GOB_CROSS_WOLF_Q type ahead
	match GOB_CROSS_WOLF_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_CROSS_WOLF1:
counter set 2
put go path
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT what were you
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W2:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF2:
counter set 3
put w
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W3:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF3:
counter set 4
put w
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W4:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF4:
counter set 5
put nw
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W5:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF5:
counter set 6
put w
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W6:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF6:
counter set 7
put w
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W7:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF7:
counter set 8
put nw
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W8:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF8:
counter set 9
put w
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W9:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF9:
counter set 10
put w
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W10:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF10:
counter set 11
put sw
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W11:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF11:
counter set 12
put w
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W12:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF12:
counter set 13
put w
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W13:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF13:
counter set 14
put nw
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W14:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF14:
counter set 15
put nw
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W15:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


GOB_CROSS_WOLF15:
counter set 16
put w
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_W%c obvious
	matchwait

GOB_CROSS_W16:
	match GOB_CROSS_WOLF%c following you
	match GOB_CROSS_WOLF_RETREAT [You're
	match GOB_CROSS_WOLF_RETREAT1 You are engaged
	match GOB_CROSS_WOLF_SUBTRACT you can't
	match GOB_CROSS_WOLF_PAUSE type ahead
	match GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


TIGER_OUT:
move go outpost
TIGER_IN:
save TIGER_RENT
goto RENT_CARAVAN


TIGER_RENT:
save TIGER_WOLF_CHECK

TIGER:
	echo
	echo TIGER:
	echo
IF_1 match TIGER1 nods to you
IF_1 match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
IF_1 matchwait
TIGER1:
	match TIGER_GIVE_CON you get
	match TIGER_GET_CON1 referring
put get my tiger contract
	match QUIT [You're
	matchwait

TIGER_GIVE_CON:
	echo
	echo TIGER_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto TIGER1

TIGER_GET_CON1:
put pay clerk gold
wait
TIGER_GET_CON:
	echo
	echo TIGER_GET_CON:
	echo
	match TIGER_GOT_CON minister says.
	match TIGER_GOT_CON The minister reminds you
	match TIGER_GOT_CON The minister plucks a contract
put ask minister for contract
	match QUIT [You're
	matchwait

TIGER_GOT_CON:
	echo
	echo TIGER_GOT_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you

goto CON_CHECK


TIGER_WOLF_CHECK:
	echo
	echo TIGER_WOLF_CHECK:
	echo
Put get my ledger
waitfor you
put open my ledger
waitfor open
put turn my ledger to chapter 1
waitfor "Zoluren Outposts"
put turn my ledger to page 3
waitfor entitled
	match TIGER_CON_WOLF Have a contracted trade
	match TIGER_TO_WOLF Have no contracts
	match TIGER_TO_WOLF Have a delinquent
put read ledge
	match QUIT [You're
	matchwait

TIGER_CON_WOLF:
	echo
	echo TIGER_CON_WOLF:
	echo
	match TIGER_TO_CROSS referring
	match TIGER_TO_WOLF The contract is printed
put look my wolf contract
	match QUIT [You're
	matchwait

TIGER_TO_CROSS_LEDGER:
put get my ledger
wait
put open my ledger
wait
TIGER_TO_CROSS:
	echo
	echo TIGER_TO_CROSS:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
goto TIGER_TO_CROSS_OUT
TIGER_TO_CROSS_OUT_PAUSE:
pause
TIGER_TO_CROSS_OUT:
	match TIGER_TO_CROSS_STAND can't do that
	match TIGER_TO_CROSS_OUT2 obvious
	match TIGER_TO_CROSS_OUT_PAUSE ...wait
	match TIGER_TO_CROSS_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
TIGER_TO_CROSS_PAUSE:
pause
TIGER_TO_CROSS_STAND:
	match TIGER_TO_CROSS_PAUSE roundtime
	match TIGER_TO_CROSS_OUT You stand back up.
	match TIGER_TO_CROSS_PAUSE ...wait
	match TIGER_TO_CROSS_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

TIGER_TO_CROSS_OUT2:
IF_1 pause
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
move se
waitfor following you
move se
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move nw
waitfor following you
move n
waitfor following you
goto GOB_TIGER_CROSS1

GOB_TIGER_CROSS_PAUSE:
pause
GOB_TIGER_CROSS_SUBTRACT:
counter subtract 1
goto GOB_TIGER_CROSS%c


GOB_TIGER_CROSS_RP:
pause
GOB_TIGER_CROSS_RETREAT:
	match GOB_TIGER_CROSS%c You retreat from combat.
	match GOB_TIGER_CROSS%c already as far
	match GOB_TIGER_CROSS_P roundtime
	match GOB_TIGER_CROSS_RP ...wait
	match GOB_TIGER_CROSS_RP type ahead
	match GOB_TIGER_CROSS_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_TIGER_CROSS_P:
pause
	match GOB_TIGER_CROSS%c You retreat from combat.
	match GOB_TIGER_CROSS%c already as far
	match GOB_TIGER_CROSS_Q roundtime
	match GOB_TIGER_CROSS_P ...wait
	match GOB_TIGER_CROSS_P type ahead
	match GOB_TIGER_CROSS_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_TIGER_CROSS_RP1:
pause
GOB_TIGER_CROSS_RETREAT1:
	match GOB_TIGER_CROSS%c You retreat from combat.
	match GOB_TIGER_CROSS%c already as far
	match GOB_TIGER_CROSS_P1 roundtime
	match GOB_TIGER_CROSS_RP1 ...wait
	match GOB_TIGER_CROSS_RP1 type ahead
	match GOB_TIGER_CROSS_RP1 You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_TIGER_CROSS_P1:
pause
	match GOB_TIGER_CROSS%c You retreat from combat.
	match GOB_TIGER_CROSS%c already as far
	match GOB_TIGER_CROSS_Q roundtime
	match GOB_TIGER_CROSS_P1 ...wait
	match GOB_TIGER_CROSS_P1 type ahead
	match GOB_TIGER_CROSS_RP1 You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_TIGER_CROSS_Q:
pause
	match GOB_TIGER_CROSS%c You retreat from combat.
	match GOB_TIGER_CROSS%c already as far
	match QUIT roundtime
	match GOB_TIGER_CROSS_Q ...wait
	match GOB_TIGER_CROSS_Q type ahead
	match GOB_TIGER_CROSS_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_TIGER_CROSS1:
put go gate
counter set 2
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT What were you
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C2:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

	
GOB_WOLF_CROSS15:
GOB_TIGER_CROSS2:
put e
IF_1 put whisper group roundtime
counter set 3
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C3:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS3:
put se
counter set 4
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C4:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS4:
put se
counter set 5
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C5:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS5:
put e
counter set 6
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C6:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS6:
put e
counter set 7
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C7:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS7:
put ne
IF_1 put whisper group roundtime
counter set 8
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C8:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS8:
put e
counter set 9
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C9:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS9:
put e
counter set 10
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C10:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS10:
put se
counter set 11
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C11:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS11:
put e
counter set 12
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C12:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS12:
put e
counter set 13
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C13:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS13:
put se
counter set 14
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C14:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS14:
put e
counter set 15
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C15:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS15:
put e
counter set 16
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C16:
	match GOB_TIGER_CROSS%c following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS16:
put go path
counter set 17
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT what were you
	match GOB_TIGER_C%c obvious
	matchwait

GOB_TIGER_C17:
	match CROSS_WEST_GATE following you
	match GOB_TIGER_CROSS_RETREAT [You're
	match GOB_TIGER_CROSS_RETREAT1 You are engaged
	match GOB_TIGER_CROSS_SUBTRACT you can't
	match GOB_TIGER_CROSS_PAUSE type ahead
	match GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

GOB_TIGER_CROSS17:
CROSS_WEST_GATE:
move go gate
waitfor following you
IF_1 goto WEST_GATE_CLIMB_DONE

WEST_GATE_CLIMB:
put tell caravan to wait
move go stairs
put climb embrasure
CLIMB5_PAUSE:
pause
	match CLIMB5_PAUSE roundtime
	match CLIMB5_PAUSE ...wait
	match CLIMB5_PAUSE type ahead
	match CLIMB5 you stand
	match CLIMB5 already standing
	match QUIT [You're
put stand
	matchwait
CLIMB5:
	match CLIMB5B You can't go there
	match CLIMB5_DONE enclosed lean-to
	match CLIMB5_PAUSE ...wait
put s
	matchwait
CLIMB5B:
move go gate
move go stairs
goto CLIMB5
CLIMB5_DONE:
put climb embrasure
CLIMB6_PAUSE:
pause
	match CLIMB6_PAUSE roundtime
	match CLIMB6_PAUSE ...wait
	match CLIMB6_PAUSE type ahead
	match CLIMB6 you stand
	match CLIMB6 already standing
	match QUIT [You're
put stand
	matchwait
CLIMB6:
	match CLIMB9B You can't go there.
	match CLIMB6A The fitted stone of the town walls intersects
	match CLIMB6_PAUSE ...wait
put n
	matchwait

CLIMB6A:
move e
put climb embrasure
CLIMB7_PAUSE:
pause
	match CLIMB7_PAUSE roundtime
	match CLIMB7_PAUSE ...wait
	match CLIMB7_PAUSE type ahead
	match CLIMB7 you stand
	match CLIMB7 already standing
	match QUIT [You're
put stand
	matchwait
CLIMB7:
	match CLIMB7B You can't go there.
	match CLIMB7A Like a puppeteer
	match CLIMB7_PAUSE ...wait
put sw
	matchwait
CLIMB7A:
move s
move go gate
move go stair
move e
CLIMB7B:
put climb break

CLIMB8_PAUSE:
pause
	match CLIMB8_PAUSE roundtime
	match CLIMB8_PAUSE ...wait
	match CLIMB8_PAUSE type ahead
	match CLIMB8 you stand
	match CLIMB8 already standing
	match QUIT [You're
put stand
	matchwait

CLIMB8:
	match CLIMB8B You can't go there
	match CLIMB8A some stone stairs leading to the roadway below
put w
	matchwait
CLIMB8B:
move s
goto CLIMB8_DONE

CLIMB8A:
move go stairs
move go gate
CLIMB8_DONE:
put climb wall
CLIMB9_PAUSE:
pause
	match CLIMB9_PAUSE roundtime
	match CLIMB9_PAUSE ...wait
	match CLIMB9_PAUSE type ahead
	match CLIMB9 you stand
	match CLIMB9 already standing
	match QUIT [You're
put stand
	matchwait

CLIMB9:
move nw
CLIMB9B:
put climb wall
CLIMB10_PAUSE:
pause
	match CLIMB10_PAUSE roundtime
	match CLIMB10_PAUSE ...wait
	match CLIMB10_PAUSE type ahead
	match CLIMB10 you stand
	match CLIMB10 already standing
	match QUIT [You're
put stand
	matchwait

CLIMB10:
	match CLIMB10B You can't go there
	match CLIMB10A in The Crossing's western wall.
put se
	matchwait

CLIMB10B:
move n
move go stairs
goto CLIMB10C

CLIMB10A:
move go gate
CLIMB10C:
put tell caravan follow
wait
WEST_GATE_CLIMB_DONE:
move e
waitfor following you
move e
waitfor following you
move e
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move go door
save CROSS_LETH_WOLF_CHECK
goto CROSS

TIGER_TO_WOLF:
	echo
	echo TIGER_TO_WOLF:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
goto TIGER_TO_WOLF_OUT
TIGER_TO_WOLF_OUT_PAUSE:
pause
TIGER_TO_WOLF_OUT:
	match TIGER_TO_WOLF_STAND can't do that
	match TIGER_TO_WOLF_OUT2 obvious
	match TIGER_TO_WOLF_OUT_PAUSE ...wait
	match TIGER_TO_WOLF_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
TIGER_TO_WOLF_PAUSE:
pause
TIGER_TO_WOLF_STAND:
	match TIGER_TO_WOLF_PAUSE roundtime
	match TIGER_TO_WOLF_OUT You stand back up.
	match TIGER_TO_WOLF_PAUSE ...wait
	match TIGER_TO_WOLF_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

TIGER_TO_WOLF_OUT2:
IF_1 pause
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
move se
waitfor following you
move se
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move nw
waitfor following you
move n
waitfor following you
goto GOB_TIGER_WOLF1

GOB_TIGER_WOLF_PAUSE:
pause
GOB_TIGER_WOLF_SUBTRACT:
counter subtract 1
goto GOB_TIGER_WOLF%c

GOB_TIGER_WOLF_SUBTRACT2:
counter subtract 2
goto GOB_TIGER_WOLF%c

GOB_TIGER_WOLF_RP:
pause
GOB_TIGER_WOLF_RETREAT:
	match GOB_TIGER_WOLF%c You retreat from combat.
	match GOB_TIGER_WOLF%c already as far
	match GOB_TIGER_WOLF_P roundtime
	match GOB_TIGER_WOLF_RP ...wait
	match GOB_TIGER_WOLF_RP type ahead
	match GOB_TIGER_WOLF_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait



GOB_TIGER_WOLF_P:
pause
	match GOB_TIGER_WOLF%c You retreat from combat.
	match GOB_TIGER_WOLF%c already as far
	match GOB_TIGER_WOLF_Q roundtime
	match GOB_TIGER_WOLF_P ...wait
	match GOB_TIGER_WOLF_P type ahead
	match GOB_TIGER_WOLF_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_TIGER_WOLF_RP1:
pause
GOB_TIGER_WOLF_RETREAT1:
	match GOB_TIGER_WOLF%c You retreat from combat.
	match GOB_TIGER_WOLF%c already as far
	match GOB_TIGER_WOLF_P1 roundtime
	match GOB_TIGER_WOLF_RP1 ...wait
	match GOB_TIGER_WOLF_RP1 type ahead
	match GOB_TIGER_WOLF_RP1 You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_TIGER_WOLF_P1:
pause
	match GOB_TIGER_WOLF%c You retreat from combat.
	match GOB_TIGER_WOLF%c already as far
	match GOB_TIGER_WOLF_Q roundtime
	match GOB_TIGER_WOLF_P1 ...wait
	match GOB_TIGER_WOLF_P1 type ahead
	match GOB_TIGER_WOLF_RP1 You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_TIGER_WOLF_Q:
pause
	match GOB_TIGER_WOLF%c You retreat from combat.
	match GOB_TIGER_WOLF%c already as far
	match QUIT roundtime
	match GOB_TIGER_WOLF_Q ...wait
	match GOB_TIGER_WOLF_Q type ahead
	match GOB_TIGER_WOLF_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_TIGER_WOLF1:
counter set 2
put go gate
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT what were you
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W2:
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait
	
GOB_CROSS_WOLF16:
GOB_TIGER_WOLF2:
GOB_TIGER_WOLF3:
counter set 4
put w
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W4:
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT2 you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


GOB_TIGER_WOLF4:
counter set 5
put nw
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W5:
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


GOB_TIGER_WOLF5:
counter set 6
put w
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W6:
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


GOB_TIGER_WOLF6:
counter set 7
put w
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W7:
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


GOB_TIGER_WOLF7:
counter set 8
put go brook
IF_1 put whisper group brook
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT what were you
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W8:
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


GOB_TIGER_WOLF8:
counter set 9
put w
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF%c roundtime
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait

GOB_TIGER_WOLF9_PAUSE:
pause
GOB_TIGER_WOLF9:
IF_1 goto TWW1
	match TWW1 inventory report
	match GOB_TIGER_WOLF9_PAUSE referring
	match GOB_TIGER_WOLF9_PAUSE belonging to
	match QUIT [You're
	match GOB_TIGER_WOLF9_PAUSE ...wait
put look cara
	matchwait

TWW1_PAUSE:
pause
TWW1:
	echo
	echo TWW1:
	echo
IF_1 waitfor group, "ready
counter set 10
IF_1 pause 3
IF_1 put w
IF_1 goto TWW2
	match TWW21 obvious
	match TWW1_PAUSE ...wait
	match QUIT [You're
put w
	matchwait

TWW21_PAUSE:
pause 2
TWW21:
	match TWW2 inventory report
	match TWW21_PAUSE referring
	match TWW21_PAUSE belonging to
	match QUIT [You're
	match TWW21_PAUSE ...wait
put look cara
	matchwait

TWW2_PAUSE:
pause
TWW2:
	echo
	echo TWW2:
	echo
IF_1 waitfor group, "ready
IF_1 pause 2
IF_1 put w
IF_1 waitfor following you
IF_1 goto TWW3
	match TWW31 obvious
	match TWW2_PAUSE ...wait
	match QUIT [You're
put w
	matchwait

TWW31_PAUSE:
pause 2
TWW31:
	match TWW3 inventory report
	match TWW31_PAUSE referring
	match TWW31_PAUSE belonging to
	match QUIT [You're
	match TWW31_PAUSE ...wait
put look cara
	matchwait

TWW3:
GOB_TIGER_WOLF10:
counter set 11
	echo
	echo TWW3:
	echo
put sw
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W11:
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


GOB_TIGER_WOLF11:
counter set 12
put w
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W12:
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


GOB_TIGER_WOLF12:
counter set 13
put sw
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W13:
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


GOB_TIGER_WOLF13:
counter set 14
put s
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W14:
IF_1 put whisper group roundtime
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


GOB_TIGER_WOLF14:
counter set 15
put s
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W15:
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


GOB_TIGER_WOLF15:
counter set 16
put e
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W16:
IF_1 put whisper group roundtime
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


GOB_TIGER_WOLF16:
counter set 17
put go bush
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT what were you
	match GOB_TIGER_W%c obvious
	matchwait

GOB_TIGER_W17:
	match GOB_TIGER_WOLF%c following you
	match GOB_TIGER_WOLF_RETREAT [You're
	match GOB_TIGER_WOLF_RETREAT1 You are engaged
	match GOB_TIGER_WOLF_SUBTRACT you can't
	match GOB_TIGER_WOLF_PAUSE type ahead
	match GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


GOB_TIGER_WOLF17:
WOLF_BUSH:
save WOLF_BUSH2
goto 2FORAGE

WOLF_BUSH2:
move s
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move go out
goto WOLF

WOLF_OUT:
move go out
WOLF_IN:
save WOLF
goto RENT_CARAVAN


WOLF:
save WOLF_TIGER_CHECK
	echo
	echo WOLF:
	echo
IF_1 match WOLF1 nods to you
IF_1 match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
IF_1 matchwait
WOLF1:
	match WOLF_GIVE_CON you get
	match WOLF_GET_CON1 referring
put get my wolf contract
	match QUIT [You're
	matchwait

WOLF_GIVE_CON:
	echo
	echo WOLF_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto WOLF1

WOLF_GET_CON1:
put pay clerk gold
wait
WOLF_GET_CON:
	echo
	echo WOLF_GET_CON:
	echo
put speculate finesse
wait
	match WOLF_GOT_CON minister says.
	match WOLF_GOT_CON The minister reminds you
	match WOLF_GOT_CON The minister plucks a contract
put ask minister for contract
	match QUIT [You're
	matchwait

WOLF_GOT_CON:
	echo
	echo WOLF_GOT_CON:
	echo
put speculate finesse stop
wait
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you

goto CON_CHECK


WOLF_TIGER_CHECK:
	echo
	echo WOLF_TIGER_CHECK:
	echo
put get my ledger
waitfor you
put open my ledger
waitfor open
put turn my ledger to chapter 1
waitfor entitled
put turn my ledger to page 6
waitfor entitled
	match WOLF_CON_TIGER Have a contracted trade
	match WOLF_TO_TIGER Have no contracts
	match WOLF_TO_TIGER Have a delinquent
put read ledge
	match QUIT [You're
	matchwait

WOLF_CON_TIGER:
	echo
	echo WOLF_CON_TIGER:
	echo
	match WOLF_TO_CROSS referring
	match WOLF_TO_TIGER The contract is printed
put look my tiger contract
	match QUIT [You're
	matchwait


WOLF_TO_CROSS:
	echo
	echo WOLF_TO_CROSS:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
goto WOLF_TO_CROSS_OUT
WOLF_TO_CROSS_OUT_PAUSE:
pause
WOLF_TO_CROSS_OUT:
	match WOLF_TO_CROSS_STAND can't do that
	match WOLF_TO_CROSS_OUT2 obvious
	match WOLF_TO_CROSS_OUT_PAUSE ...wait
	match WOLF_TO_CROSS_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
WOLF_TO_CROSS_PAUSE:
pause
WOLF_TO_CROSS_STAND:
	match WOLF_TO_CROSS_PAUSE roundtime
	match WOLF_TO_CROSS_OUT You stand back up.
	match WOLF_TO_CROSS_PAUSE ...wait
	match WOLF_TO_CROSS_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

WOLF_TO_CROSS_OUT2:
IF_1 pause
put tell caravan to follow
waitfor you
put tell caravan go fast
waitfor you
move n
waitfor following you
move ne
waitfor following you
move n
waitfor following you
goto GOB_WOLF_CROSS1

GOB_WOLF_CROSS_PAUSE:
pause
GOB_WOLF_CROSS_SUBTRACT:
counter subtract 1
goto GOB_WOLF_CROSS%c


GOB_WOLF_CROSS_RP:
pause
GOB_WOLF_CROSS_RETREAT:
	match GOB_WOLF_CROSS%c You retreat from combat.
	match GOB_WOLF_CROSS%c already as far
	match GOB_WOLF_CROSS_P roundtime
	match GOB_WOLF_CROSS_RP ...wait
	match GOB_WOLF_CROSS_RP type ahead
	match GOB_WOLF_CROSS_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_WOLF_CROSS_P:
pause
	match GOB_WOLF_CROSS%c You retreat from combat.
	match GOB_WOLF_CROSS%c already as far
	match GOB_WOLF_CROSS_Q roundtime
	match GOB_WOLF_CROSS_P ...wait
	match GOB_WOLF_CROSS_P type ahead
	match GOB_WOLF_CROSS_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_WOLF_CROSS_RP1:
pause
GOB_WOLF_CROSS_RETREAT1:
	match GOB_WOLF_CROSS%c You retreat from combat.
	match GOB_WOLF_CROSS%c already as far
	match GOB_WOLF_CROSS_P1 roundtime
	match GOB_WOLF_CROSS_RP1 ...wait
	match GOB_WOLF_CROSS_RP1 type ahead
	match GOB_WOLF_CROSS_RP1 You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_WOLF_CROSS_P1:
pause
	match GOB_WOLF_CROSS%c You retreat from combat.
	match GOB_WOLF_CROSS%c already as far
	match GOB_WOLF_CROSS_Q roundtime
	match GOB_WOLF_CROSS_P1 ...wait
	match GOB_WOLF_CROSS_P1 type ahead
	match GOB_WOLF_CROSS_RP1 You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_WOLF_CROSS_Q:
pause
	match GOB_WOLF_CROSS%c You retreat from combat.
	match GOB_WOLF_CROSS%c already as far
	match QUIT roundtime
	match GOB_WOLF_CROSS_Q ...wait
	match GOB_WOLF_CROSS_Q type ahead
	match GOB_WOLF_CROSS_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait


GOB_WOLF_CROSS1:
counter set 2
put go bush
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT what were you
	match GOB_WOLF_C%c obvious
	matchwait

GOB_WOLF_C2:
	match GOB_WOLF_CROSS%c following you
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait

GOB_WOLF_CROSS2:
counter set 3
put w
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_C%c obvious
	matchwait

GOB_WOLF_C3:
	match GOB_WOLF_CROSS%c following you
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


GOB_WOLF_CROSS3:
counter set 4
put n
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_C%c obvious
	matchwait

GOB_WOLF_C4:
	match GOB_WOLF_CROSS%c following you
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


GOB_WOLF_CROSS4:
counter set 5
put n
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_C%c obvious
	matchwait

GOB_WOLF_C5:
	match GOB_WOLF_CROSS%c following you
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


GOB_WOLF_CROSS5:
counter set 6
put ne
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_C%c obvious
	matchwait

GOB_WOLF_C6:
	match GOB_WOLF_CROSS%c following you
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


GOB_WOLF_CROSS6:
counter set 7
put e
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_C%c obvious
	matchwait

GOB_WOLF_C7:
	match GOB_WOLF_CROSS%c following you
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


GOB_WOLF_CROSS7:
counter set 8
put ne
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_C%c obvious
	matchwait

GOB_WOLF_C8:
	match GOB_WOLF_CROSS%c following you
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


GOB_WOLF_CROSS8:
counter set 9
put e
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_C%c obvious
	matchwait

GOB_WOLF_C9:
	match GOB_WOLF_CROSS%c following you
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


GOB_WOLF_CROSS9:
counter set 10
put go brook
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT what were you
	match GOB_WOLF_C%c obvious
	matchwait

GOB_WOLF_C10:
IF_1 put whisper group brook
	match GOB_WOLF_CROSS%c following you
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


GOB_WOLF_CROSS10:
counter set 11
put e
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS%c roundtime
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait

GOB_WOLF_CROSS11_PAUSE:
pause
GOB_WOLF_CROSS11:
IF_1 goto WTC1
	match WTC1 inventory report
	match GOB_WOLF_CROSS11_PAUSE referring
	match GOB_WOLF_CROSS11_PAUSE belonging to
	match QUIT [You're
	match GOB_WOLF_CROSS11_PAUSE ...wait
put look cara
	matchwait

WTC1_PAUSE:
pause
WTC1:
	echo
	echo WTC1:
	echo
IF_1 waitfor group, "ready
counter set 12
IF_1 pause 3
IF_1 put e
IF_1 goto WTC2
	match WTC21 obvious
	match WTC1_PAUSE ...wait
	match QUIT [You're
put e
	matchwait

WTC21_PAUSE:
pause
WTC21:
	match WTC2 inventory report
	match WTC21_PAUSE referring
	match WTC21_PAUSE belonging to
	match QUIT [You're
put look cara
	matchwait

WTC2_PAUSE:
pause
WTC2:
	echo
	echo WTC2:
	echo
	IF_1 match WTC3 group, "ready
	IF_1 match QUIT [You're
	IF_1 matchwait
	match WTC31 obvious
	match WTC2_PAUSE ...wait
	match QUIT [You're
put e
	matchwait

WTC31_PAUSE:
pause
WTC31:
	match WTC3 inventory report
	match WTC31_PAUSE referring
	match WTC31_PAUSE belonging to
	match QUIT [You're
put look cara
	matchwait

WTC_RP:
pause
WTC_RETREAT:
	match WTC3 You retreat from combat.
	match WTC3 already as far
	match WTC_P roundtime
	match WTC_RP ...wait
	match WTC_RP type ahead
	match WTC_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

WTC_P:
pause
	match WTC3 You retreat from combat.
	match WTC3 already as far
	match WTC_Q roundtime
	match WTC_P ...wait
	match WTC_P type ahead
	match WTC_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait


WTC_Q:
pause
	match WTC3 You retreat from combat.
	match WTC3 already as far
	match QUIT roundtime
	match WTC_Q ...wait
	match WTC_Q type ahead
	match WTC_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

WTC3_PAUSE:
pause
WTC3:
IF_1 pause 2
	IF_1 match WTC4 following you
	IF_1 match WTC_RETREAT [You're
	IF_1 match WTC3_PAUSE ...wait
IF_1 put e
	IF_1 matchwait
WTC4:
GOB_WOLF_CROSS12:
counter set 13
put e
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_C%c obvious
	matchwait

GOB_WOLF_C13:
	match GOB_WOLF_CROSS%c following you
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


GOB_WOLF_CROSS13:
counter set 14
put se
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_C%c obvious
	matchwait

GOB_WOLF_C14:
	match GOB_WOLF_CROSS%c following you
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


GOB_WOLF_CROSS14:
counter set 15
put e
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_C%c obvious
	matchwait

GOB_WOLF_C15:
	match GOB_WOLF_CROSS%c following you
	match GOB_WOLF_CROSS_RETREAT [You're
	match GOB_WOLF_CROSS_RETREAT1 You are engaged
	match GOB_WOLF_CROSS_SUBTRACT you can't
	match GOB_WOLF_CROSS_PAUSE type ahead
	match GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


WOLF_TO_TIGER:
	echo
	echo WOLF_TO_TIGER:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
goto WOLF_TO_TIGER_OUT
WOLF_TO_TIGER_OUT_PAUSE:
pause
WOLF_TO_TIGER_OUT:
	match WOLF_TO_TIGER_STAND can't do that
	match WOLF_TO_TIGER_OUT2 obvious
	match WOLF_TO_TIGER_OUT_PAUSE ...wait
	match WOLF_TO_TIGER_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
WOLF_TO_TIGER_PAUSE:
pause
WOLF_TO_TIGER_STAND:
	match WOLF_TO_TIGER_PAUSE roundtime
	match WOLF_TO_TIGER_OUT You stand back up.
	match WOLF_TO_TIGER_PAUSE ...wait
	match WOLF_TO_TIGER_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

WOLF_TO_TIGER_OUT2:
IF_1 pause
put tell caravan to follow
waitfor you
put tell caravan go fast
waitfor you
move n
waitfor following you
move ne
waitfor following you
move n
waitfor following you
goto GOB_WOLF_TIGER1


GOB_WOLF_TIGER_PAUSE:
pause
GOB_WOLF_TIGER_SUBTRACT:
counter subtract 2
goto GOB_WOLF_TIGER%c


GOB_WOLF_TIGER_RP:
pause
GOB_WOLF_TIGER_RETREAT:
	match GOB_WOLF_TIGER%c You retreat from combat.
	match GOB_WOLF_TIGER%c already as far
	match GOB_WOLF_TIGER_P roundtime
	match GOB_WOLF_TIGER_RP ...wait
	match GOB_WOLF_TIGER_RP type ahead
	match GOB_WOLF_TIGER_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_WOLF_TIGER_P:
pause
	match GOB_WOLF_TIGER%c You retreat from combat.
	match GOB_WOLF_TIGER%c already as far
	match GOB_WOLF_TIGER_Q roundtime
	match GOB_WOLF_TIGER_P ...wait
	match GOB_WOLF_TIGER_P type ahead
	match GOB_WOLF_TIGER_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_WOLF_TIGER_RP1:
pause
GOB_WOLF_TIGER_RETREAT1:
	match GOB_WOLF_TIGER%c You retreat from combat.
	match GOB_WOLF_TIGER%c already as far
	match GOB_WOLF_TIGER_P1 roundtime
	match GOB_WOLF_TIGER_RP1 ...wait
	match GOB_WOLF_TIGER_RP1 type ahead
	match GOB_WOLF_TIGER_RP1 You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_WOLF_TIGER_P1:
pause
	match GOB_WOLF_TIGER%c You retreat from combat.
	match GOB_WOLF_TIGER%c already as far
	match GOB_WOLF_TIGER_Q roundtime
	match GOB_WOLF_TIGER_P1 ...wait
	match GOB_WOLF_TIGER_P1 type ahead
	match GOB_WOLF_TIGER_RP1 You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

GOB_WOLF_TIGER_Q:
pause
	match GOB_WOLF_TIGER%c You retreat from combat.
	match GOB_WOLF_TIGER%c already as far
	match QUIT roundtime
	match GOB_WOLF_TIGER_Q ...wait
	match GOB_WOLF_TIGER_Q type ahead
	match GOB_WOLF_TIGER_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait


GOB_WOLF_TIGER1:
counter set 2
put go bush
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT what were you
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T2:
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait

GOB_WOLF_TIGER2:
counter set 3
put w
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T3:
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait

GOB_WOLF_TIGER3:
GOB_WOLF_TIGER4:
counter set 5
put n
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T5:
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


GOB_WOLF_TIGER5:
counter set 6
put n
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T6:
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


GOB_WOLF_TIGER6:
counter set 7
put ne
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T7:
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


GOB_WOLF_TIGER7:
counter set 8
put e
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T8:
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


GOB_WOLF_TIGER8:
counter set 9
put ne
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T9:
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


GOB_WOLF_TIGER9:
counter set 10
put e
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T10:
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


GOB_WOLF_TIGER10:
counter set 11
put go brook
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT what were you
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T11:
IF_1 put whisper group brook
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


GOB_WOLF_TIGER11:
counter set 12
put e
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	match GOB_WOLF_TIGER%c roundtime
	matchwait

GOB_WOLF_TIGER12_PAUSE:
pause
GOB_WOLF_TIGER12:
IF_1 goto WTT1
	match WTT1 inventory report
	match GOB_WOLF_TIGER12_PAUSE referring
	match GOB_WOLF_TIGER12_PAUSE belonging to
	match QUIT [You're
	match GOB_WOLF_TIGER12_PAUSE ...wait
put look cara
	matchwait

WTT1_PAUSE:
pause
WTT1:
	echo
	echo WTT1:
	echo
IF_1 waitfor group, "ready
counter set 13
IF_1 pause 3
IF_1 put e
IF_1 goto WTT2
	match WTT21 obvious
	match WTT1_PAUSE ...wait
	match QUIT [You're
put e
	matchwait

WTT21_PAUSE:
pause
WTT21:
	match WTT2 inventory report
	match WTT21_PAUSE referring
	match WTT21_PAUSE belonging to
	match WTT21_PAUSE ...wait
	match QUIT [You're
put look cara
	matchwait

WTT2_PAUSE:
pause
WTT2:
	echo
	echo WTT2:
	echo
	IF_1 match WTT3 group, "ready
	IF_1 match QUIT [You're
	IF_1 matchwait
	match WTT31 obvious
	match WTT2_PAUSE ...wait
	match QUIT [You're
put e
	matchwait

WTT31_PAUSE:
pause
WTT31:
	match WTT3 inventory report
	match WTT31_PAUSE referring
	match WTT31_PAUSE belonging to
	match WTT31_PAUSE ...wait
	match QUIT [You're
put look cara
	matchwait

WTT_RP:
pause
WTT_RETREAT:
	match WTT3 You retreat from combat.
	match WTT3 already as far
	match WTT_P roundtime
	match WTT_RP ...wait
	match WTT_RP type ahead
	match WTT_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

WTT_P:
pause
	match WTT3 You retreat from combat.
	match WTT3 already as far
	match WTT_Q roundtime
	match WTT_P ...wait
	match WTT_P type ahead
	match WTT_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

WTT_Q:
pause
	match WTT3 You retreat from combat.
	match WTT3 already as far
	match QUIT roundtime
	match WTT_Q ...wait
	match WTT_Q type ahead
	match WTT_RP You stop advancing
	match QUIT You are still stunned
put retreat
put retreat
	matchwait

WTT3_PAUSE:
pause
WTT3:
IF_1 pause 2
	IF_1 match WTT4 following you
	IF_1 match WTT_RETREAT [You're
	IF_1 match WTT3_PAUSE ...wait
IF_1 put e
	IF_1 matchwait
WTT4:
GOB_WOLF_TIGER13:
counter set 14
put e
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T14:
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


GOB_WOLF_TIGER14:
counter set 15
put se
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T15:
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


GOB_WOLF_TIGER15:
counter set 16
put e
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T16:
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait

GOB_WOLF_TIGER16:
counter set 17
put go gate
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT what were you
	match GOB_WOLF_T%c obvious
	matchwait

GOB_WOLF_T17:
	match GOB_WOLF_TIGER%c following you
	match GOB_WOLF_TIGER_RETREAT [You're
	match GOB_WOLF_TIGER_RETREAT1 You are engaged
	match GOB_WOLF_TIGER_SUBTRACT you can't
	match GOB_WOLF_TIGER_PAUSE type ahead
	match GOB_WOLF_TIGER_PAUSE ...wait
	matchwait

GOB_WOLF_TIGER17:
IF_1 put whisper group roundtime
move s
waitfor following you
move se
IF_1 put whisper group roundtime
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move go out
save TIGER_TO_CROSS_LEDGER
goto TIGER

CROSS_TO_LETH4:
save CROSS_TIGER_CHECK
goto CROSS_TO_LETH

CROSS_TO_LETH3:
save CROSS_ARTHE_CHECK
goto CROSS_TO_LETH

CROSS_TO_LETH:
IF_1 pause 5
	echo
	echo CROSS_TO_LETH:
	echo
put get my Ledger
wait
put open my ledger
wait
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
goto CROSS_TO_LETH_OUT

CROSS_TO_LETH_OUT_PAUSE:
pause
CROSS_TO_LETH_OUT:
	match CROSS_TO_LETH_STAND can't do that
	match CROSS_TO_LETH_OUT2 obvious
	match CROSS_TO_LETH_OUT_PAUSE ...wait
	match CROSS_TO_LETH_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
CROSS_TO_LETH_PAUSE:
pause
CROSS_TO_LETH_STAND:
	match CROSS_TO_LETH_PAUSE roundtime
	match CROSS_TO_LETH_OUT You stand back up.
	match CROSS_TO_LETH_PAUSE ...wait
	match CROSS_TO_LETH_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

CROSS_TO_LETH_OUT2:
put tell caravan to follow
waitfor you
put tell caravan go fast
waitfor you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move go pier
waitfor following you
save L_FERRY
goto FERRY

FERRY_PAUSE:
pause
FERRY:
IF_1 put belch
IF_1 wait
IF_1 put nod
IF_1 pause
IF_1 put whisper group ferry
IF_1 waitfor whisper
	echo
	echo FERRY:
	echo
	match FERRY_PAUSE ...wait
	match FERRY_PAUSE type ahead
	match FERRY_JUGGLE and climb aboard.
	match HIDE_FERRY You will have to wait
	match HIDE_FERRY stuck here
	match HIDE_FERRY ferry here to go aboard
	match FERRY_STAND you must be standing
	match OFF_FERRY referring
put go ferry
	match KELPIE_CHECK [You're
	matchwait

KELPIE_CHECK:
	echo
	echo KELPIE_CHECK:
	echo
	match KELPIE kelpie
	match QUIT obvious
put look
	matchwait

KELPIE_PAUSE:
pause
KELPIE:
	match FERRY You retreat from combat.
	match FERRY already as far
	match KELPIE_PAUSE roundtime
	match KELPIE_PAUSE ...wait
	match KELPIE_PAUSE type ahead
	match KELPIE_PAUSE You stop advancing
	match QUIT You are still stunned
put retreat
put reateat
	matchwait


FERRY_STAND_PAUSE:
pause
FERRY_STAND:
	match FERRY_STAND_PAUSE roundtime
	match FERRY you stand back up
put stand
	matchwait

FERRY_JUGGLE:
IF_1 put belch
pause 2
IF_1 put whis group app hide
IF_1 pause 2
put get my %zTjugglies
waitfor you
counter set 1
goto FERRY_JUGGLE%c
FERRY_JUGGLE_PAUSE:
pause
goto FERRY_JUGGLE_PAUSE1
FERRY_JUGGLE1:
FERRY_JUGGLE2:
FERRY_JUGGLE3:
FERRY_JUGGLE4:
FERRY_JUGGLE5:
FERRY_JUGGLE6:
FERRY_JUGGLE7:
FERRY_JUGGLE8:
FERRY_JUGGLE9:
FERRY_JUGGLE10:
counter add 1
FERRY_JUGGLE_PAUSE1:
	match FERRY_JUGGLE_PAUSE type ahead
	match FERRY_JUGGLE_PAUSE ...wait
	match FERRY_JUGGLE%c roundtime
	match FERRY_JUGGLE11 heal
	match FERRY_ referring
	match FERRY_ Please rephrase that command
put Juggle my %zTjugglies
	matchwait


FERRY_JUGGLE11:
pause
	match FERRY_JUGGLE11 type ahead
	match FERRY_JUGGLE11 ...wait
	match FERRY_ Stow What?
	match FERRY_ you put
	match FERRY_ referring
put stow my %zTjugglies
	match QUIT [You're
	matchwait



FERRY__PAUSE:
pause
FERRY_:
put open my gem pouch
wait
IF_2 goto FERRY_APP_HIDE
IF_1 goto APP_FERRY
FERRY_APP_HIDE:
	echo
	echo FERRY_APP_HIDE:
	echo
	match APP_FERRY Eh?
	match APP_FERRY You blend
	match APP_FERRY You melt into the background
	match APP_FERRY glance at you as you hide.
	match APP_FERRY ruining your hiding place!
	match FERRY__PAUSE roundtime
	match FERRY__PAUSE ...wait
	match FERRY__PAUSE type ahead
	match %s its crew ties the ferry off.
put hide
	match QUIT [You're
	matchwait

HIDE_FERRY_PAUSE:
pause
HIDE_:
IF_1 put whis group hide
IF_2 goto HIDE_FERRYLETH
IF_1 goto WAIT_FERRY
HIDE_FERRY:
	echo
	echo HIDE_FERRY:
	echo
	match WAIT_FERRY Eh?
	match WAIT_FERRY You blend
	match WAIT_FERRY You melt into the background
	match WAIT_FERRY glance at you as you hide.
	match WAIT_FERRY ruining your hiding place!
	match HIDE_FERRY_PAUSE roundtime
	match HIDE_FERRY_PAUSE ...wait
	match HIDE_FERRY_PAUSE type ahead
	match FERRY pulls into the dock
put hide
	match QUIT [You're
	matchwait

FERRY1:
IF_1 put belch
IF_1 wait
IF_1 put nod
IF_1 pause
IF_1 put whisper group ferry
IF_1 waitfor whisper
	echo
	echo FERRY1:
	echo
	match FERRY_JUGGLE and climb aboard.
	match HIDE_FERRY You will have to wait
	match HIDE_FERRY stuck here
	match HIDE_FERRY ferry here to go aboard
	match FERRY_STAND you must be standing
	match OFF_FERRY referring
put go ferry
	match QUIT [You're
	matchwait

WAIT_FERRY:
	echo
	echo WAIT_FERRY:
	echo
	match FERRY pulls into the dock
	match FERRY You hear a bell ring out
	match FERRY pulls up to the dock
	match FERRY A great clanging bell
	match QUIT [You're
	matchwait

APP_FERRY_PAUSE:
pause
APP_FERRY:
	match APP_POUCH_F Appraise what?
	matchre APP_POUCH_F /roundtime|inside something|can't appraise/i
	match APP_FERRY_PAUSE ...wait
	match APP_FERRY_PAUSE type ahead
put app my %zTapp1 careful
	match QUIT [You're
	matchwait

APP_POUCH_F_PAUSE:
pause
APP_POUCH_F:
	match APP_BUN_F Appraise what?
	matchre APP_BUN_F /roundtime|inside something|can't appraise/i
	match APP_POUCH_F_PAUSE ...wait
	match APP_POUCH_F_PAUSE type ahead
put app my %zTapp2 careful
	match QUIT [You're
	matchwait

APP_BUN_F_PAUSE:
pause
APP_BUN_F:
	match APP_POUCH1_F Appraise what?
	matchre APP_POUCH1_F /roundtime|inside something|can't appraise/i
	match APP_BUN_F_PAUSE ...wait
	match APP_BUN_F_PAUSE type ahead
put app my %zTapp1 careful
	match QUIT [You're
	matchwait


APP_POUCH1_F_PAUSE:
pause
APP_POUCH1_F:
	match APP_BUN1_F Appraise what?
	matchre APP_BUN1_F /roundtime|inside something|can't appraise/i
	match APP_POUCH1_F_PAUSE ...wait
	match APP_POUCH1_F_PAUSE type ahead
put app my %zTapp2 careful
	match QUIT [You're
	matchwait

APP_BUN1_F_PAUSE:
pause
APP_BUN1_F:
	match FERRY_CLOSE Appraise what?
	matchre FERRY_CLOSE /roundtime|inside something|can't appraise/i
	match APP_BUN1_F_PAUSE ...wait
	match APP_BUN1_F_PAUSE type ahead
put app my %zTapp1 careful
	match QUIT [You're
	matchwait


APP_POUCH2_F_PAUSE:
pause
APP_POUCH2_F:
	match APP_BUN2_F Appraise what?
	matchre APP_BUN2_F /roundtime|inside something|can't appraise/i
	match APP_POUCH2_F_PAUSE ...wait
	match APP_POUCH2_F_PAUSE type ahead
put app my %zTapp2 careful
	match QUIT [You're
	matchwait

APP_BUN2_F_PAUSE:
pause
APP_BUN2_F:
	match FERRY_CLOSE Appraise what?
	matchre FERRY_CLOSE /roundtime|inside something|can't appraise/i
	match APP_BUN2_F_PAUSE ...wait
	match APP_BUN2_F_PAUSE type ahead
put app my %zTapp1 careful
	match QUIT [You're
	matchwait

FERRY_CLOSE_PAUSE:
pause
FERRY_CLOSE:
	match STUDY_FERRY close
	match STUDY_FERRY referring
	match FERRY_CLOSE_PAUSE ...wait
	match FERRY_CLOSE_PAUSE type ahead
put close my gem pouch
	match QUIT [You're
	matchwait

STUDY_FERRY:
	match PATTERN_FERRY referring
	match STUDY_COM1_FERRY you get
	match STUDY_COM1_FERRY you open
	match QUIT [You're
put get my compendium
put open my compendium
	matchwait

STUDY_COM1_TURN_FERRY:
pause
	match STUDY_COM1_TURN_FERRY ...wait
	match STUDY_COM1_TURN_FERRY type ahead
	match STUDY_COM1_FERRY You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM1_PAUSE_FERRY:
pause
STUDY_COM1_FERRY:
echo
echo STUDY_COM1_FERRY:
echo
	match STUDY_COM2_TURN_FERRY Why do you need to study this chart again?
	match STUDY_COM2_TURN_FERRY sudden moment of clarity
	match STUDY_COM5_TURN_FERRY difficult time
	match STUDY_COM5_TURN_FERRY impossible
	match STUDY_COM2_PAUSE_FERRY gradually absorbing
	match STUDY_COM1_PAUSE_FERRY ...wait
	match STUDY_COM1_PAUSE_FERRY type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM2_TURN_FERRY:
pause
	match STUDY_COM2_TURN_FERRY ...wait
	match STUDY_COM2_TURN_FERRY type ahead
	match STUDY_COM2_FERRY You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM2_PAUSE_FERRY:
pause
STUDY_COM2_FERRY:
echo
echo STUDY_COM2_FERRY:
echo
	match STUDY_COM3_TURN_FERRY Why do you need to study this chart again?
	match STUDY_COM3_TURN_FERRY sudden moment of clarity
	match STUDY_COM_STOW_FERRY difficult time
	match STUDY_COM_STOW_FERRY impossible
	match STUDY_COM3_PAUSE_FERRY gradually absorbing
	match STUDY_COM2_PAUSE_FERRY ...wait
	match STUDY_COM2_PAUSE_FERRY type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM3_TURN_FERRY:
pause
	match STUDY_COM3_TURN_FERRY ...wait
	match STUDY_COM3_TURN_FERRY type ahead
	match STUDY_COM3_FERRY You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM3_PAUSE_FERRY:
pause
STUDY_COM3_FERRY:
echo
echo STUDY_COM3_FERRY:
echo
	match STUDY_COM4_TURN_FERRY Why do you need to study this chart again?
	match STUDY_COM4_TURN_FERRY sudden moment of clarity
	match STUDY_COM_STOW_FERRY difficult time
	match STUDY_COM_STOW_FERRY impossible
	match STUDY_COM4_PAUSE_FERRY gradually absorbing
	match STUDY_COM3_PAUSE_FERRY ...wait
	match STUDY_COM3_PAUSE_FERRY type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM4_TURN_FERRY:
pause
	match STUDY_COM4_TURN_FERRY ...wait
	match STUDY_COM4_TURN_FERRY type ahead
	match STUDY_COM4_FERRY You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM4_PAUSE_FERRY:
pause
STUDY_COM4_FERRY:
echo
echo STUDY_COM4_FERRY:
echo
	match STUDY_COM5_TURN_FERRY Why do you need to study this chart again?
	match STUDY_COM5_TURN_FERRY sudden moment of clarity
	match STUDY_COM_STOW_FERRY difficult time
	match STUDY_COM_STOW_FERRY impossible
	match STUDY_COM5_PAUSE_FERRY gradually absorbing
	match STUDY_COM4_PAUSE_FERRY ...wait
	match STUDY_COM4_PAUSE_FERRY type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM5_TURN_FERRY:
pause
	match STUDY_COM5_TURN_FERRY ...wait
	match STUDY_COM5_TURN_FERRY type ahead
	match STUDY_COM5_FERRY You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM5_PAUSE_FERRY:
pause
STUDY_COM5_FERRY:
echo
echo STUDY_COM5_FERRY:
echo
	match STUDY_COM_STOW_FERRY Why do you need to study this chart again?
	match STUDY_COM_STOW_FERRY sudden moment of clarity
	match STUDY_COM_STOW_FERRY difficult time
	match STUDY_COM_STOW_FERRY impossible
	match STUDY_COM_STOW2_FERRY gradually absorbing
	match STUDY_COM5_PAUSE_FERRY ...wait
	match STUDY_COM5_PAUSE_FERRY type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM_STOW_PAUSE_FERRY:
pause
STUDY_COM_STOW_FERRY:
	match STUDY_COM_STOW2_FERRY You turn to the section containing
	match STUDY_COM_STOW_PAUSE_FERRY ...wait
	match STUDY_COM_STOW_PAUSE_FERRY type ahead
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM_STOW2_PAUSE_FERRY:
pause
STUDY_COM_STOW2_FERRY:
	match FERRY_2 you put
	match STUDY_COM_STOW_PAUSE_FERRY ...wait
	match STUDY_COM_STOW_PAUSE_FERRY type ahead
	match QUIT [You're
put close my compendium
put stow my compendium
	matchwait

PATTERN_FERRY:
pause
	match FERRY_2 referring
	match STUDY1_FERRY you get
	match QUIT [You're
put get my pattern
	matchwait

STUDY1_PAUSE_FERRY:
pause
STUDY1_FERRY:
	match STUDY_STOW_FERRY You believe that you understand
	match STUDY2_FERRY roundtime
	match STUDY_STOW_FERRY You already know enough
	match STUDY_STOW_FERRY You don't have the proper training for that.
	match STUDY1_PAUSE_FERRY ...wait
	match STUDY1_PAUSE_FERRY type ahead
	match QUIT [You're
	match STUDY2_PAUSE_FERRY Encumbrance:
	match STUDY_DROP_FERRY so much that you can't make out any
put study my pattern
put encum
	matchwait

STUDY2_PAUSE_FERRY:
pause
STUDY2_FERRY:
	match STUDY_STOW_FERRY You believe that you understand
	match STUDY3_FERRY roundtime
	match STUDY_STOW_FERRY You already know enough
	match STUDY2_PAUSE_FERRY ...wait
	match STUDY2_PAUSE_FERRY type ahead
	match QUIT [You're
	match STUDY3_PAUSE_FERRY Encumbrance:
	match STUDY_DROP_FERRY so much that you can't make out any
put study my pattern
put encum
	matchwait

STUDY3_PAUSE_FERRY:
pause
STUDY3_FERRY:
	match STUDY_STOW_FERRY You believe that you understand
	match STUDY4_FERRY roundtime
	match STUDY_STOW_FERRY You already know enough
	match STUDY3_PAUSE_FERRY ...wait
	match STUDY3_PAUSE_FERRY type ahead
	match QUIT [You're
	match STUDY4_PAUSE_FERRY Encumbrance:
	match STUDY_DROP_FERRY so much that you can't make out any
put study my pattern
put encum
	matchwait

STUDY4_PAUSE_FERRY:
pause
STUDY4_FERRY:
	match STUDY_STOW_FERRY You believe that you understand
	match STUDY5_FERRY roundtime
	match STUDY_STOW_FERRY You already know enough
	match STUDY4_PAUSE_FERRY ...wait
	match STUDY4_PAUSE_FERRY type ahead
	match QUIT [You're
	match STUDY5_PAUSE_FERRY Encumbrance:
	match STUDY_DROP_FERRY so much that you can't make out any
put study my pattern
put encum
	matchwait

STUDY5_PAUSE_FERRY:
pause
STUDY5_FERRY:
	match STUDY_STOW_FERRY You believe that you understand
	match STUDY_STOW_FERRY roundtime
	match STUDY_STOW_FERRY You already know enough
	match STUDY5_PAUSE_FERRY ...wait
	match STUDY5_PAUSE_FERRY type ahead
	match QUIT [You're
	match STUDY_STOW_PAUSE_FERRY Encumbrance:
	match STUDY_DROP_FERRY so much that you can't make out any
put study my pattern
put encum
	matchwait

STUDY_DROP_PAUSE_FERRY:
pause
STUDY_DROP_FERRY:
	match FERRY_2 you drop
	match STUDY_STOW_PAUSE_FERRY ...wait
	match STUDY_STOW_PAUSE_FERRY type ahead
	match QUIT [You're
put drop my pattern
	matchwait

STUDY_STOW_PAUSE_FERRY:
pause
STUDY_STOW_FERRY:
	match FERRY_2 you put
	match STUDY_STOW_PAUSE_FERRY ...wait
	match STUDY_STOW_PAUSE_FERRY type ahead
	match QUIT [You're
put stow my pattern
	matchwait

FERRY_2_PAUSE:
pause
FERRY_2:
	echo
	echo FERRY_2:
	echo
put rem feedbag
wait
put give cara
wait
put wear feedbag
wait
IF_2 goto WAIT_FERRYFERRY
IF_1 goto WAIT_FERRY1
WAIT_FERRYFERRY_PAUSE:
pause
WAIT_FERRYFERRY:
	match WAIT_FERRY1 Eh?
	match WAIT_FERRY1 You blend
	match WAIT_FERRY1 You melt into the background
	match WAIT_FERRY1 glance at you as you hide.
	match WAIT_FERRY1 ruining your hiding place!
	match WAIT_FERRY1 reveals you
	match WAIT_FERRYFERRY_PAUSE roundtime
	match WAIT_FERRYFERRY_PAUSE ...wait
	match WAIT_FERRYFERRY_PAUSE type ahead
	match OFF_FERRY its crew ties the ferry off.
put hide
	match QUIT [You're
	matchwait

WAIT_FERRY1_PAUSE:
pause
WAIT_FERRY1:
	echo
	echo WAIT_FERRY1:
	echo
	match OFF_FERRY its crew ties the ferry off.
	match OFF_FERRY pulls up to the dock
	match OFF_FERRY You hear a bell ring out
	match OFF_FERRY A great clanging bell
	match WAIT_FERRYFERRY You hear a shrill whistle
	match QUIT [You're
	matchwait


OFF_FERRY:
	echo
	echo OFF_FERRY:
	echo
	match %s Lemicus Square
	match %s Alfren's Tollbridge
	match %s North Road, Ferry
	match %s a ramp
	match HIDE_FERRY have to wait
	match HIDE_FERRY What docks?
	match HIDE_FERRY referring
	match HIDE_FERRY stuck here
put go dock
	matchwait

L_FERRY:
save CROSS_TIGER_CHECK
	match OFF_CROSS_FERRY Lemicus Square
	match OFF_LETH_FERRY Alfren's Tollbridge
	match OFF_DIRGE_FERRY North Road, Ferry
	match OFF_RIVER_FERRY a ramp
	match WAIT_FERRYFERRY have to wait
	match WAIT_FERRYFERRY What docks?
	match WAIT_FERRYFERRY referring
	match WAIT_FERRYFERRY stuck here
waitfor following you
put look
	matchwait

I_FERRY:
	match I_OFF_CROSS_FERRY Lemicus Square
	match I_OFF_LETH_FERRY Alfren's Tollbridge
	match I_OFF_DIRGE_FERRY North Road, Ferry
	match I_OFF_RIVER_FERRY a ramp
	match WAIT_FERRYFERRY have to wait
	match WAIT_FERRYFERRY What docks?
	match WAIT_FERRYFERRY referring
	match WAIT_FERRYFERRY stuck here
waitfor following you
put look
	matchwait


OFF_LETH_FERRY:
put tell caravan lead to leth deriel
goto LETH_ORIGAMI

LETH_ORIGAMI:
	echo
	echo LETH_ORIGAMI:
	echo
IF_1 put belch
IF_1 wait
IF_1 put nod
IF_1 pause 2
IF_1 put whisper group origami
LETH_PAPER_CHECK:
	match LETH_ENVELOPE referring
	match LETH_FOLD1 You are already holding that
	match LETH_FOLD1 you get a piece
put get my paper
	matchwait

LETH_WEAR_ENV:
put wear my env
wait
LETH_ENVELOPE:
	match LETH_INSTRU you get a
	match LETH_REM_ENV The envelope is empty.
	match LETH_GET_ENV You must be either wearing
	match LETH_STONES I'm afraid that you can't pull that.
put pull my origami-paper envelope
	matchwait

LETH_REM_ENV:
put rem env
put drop env
waitfor you drop
LETH_GET_ENV_WEAR:
	match LETH_WEAR_ENV you get
	match LETH_STONES referring
put get my origami-paper envelope
	matchwait

LETH_DROP_ENV:
put drop my or env
wait
LETH_GET_ENV:
	match LETH_PULL_ENV you get
	match LETH_STONES referring
put get my origami-paper envelope
	matchwait

LETH_PULL_ENV:
	match LETH_STOW_ENV you get a
	match LETH_DROP_ENV The envelope is empty.
	match LETH_STONES I'm afraid that you can't pull that.
put pull my origami-paper envelope
	matchwait

LETH_STOW_ENV:
put stow my ori env
waitfor you
LETH_INSTRU:
counter set 1
goto LETH_ORI_STUDY1

LETH_ORI_STUDY2:
LETH_ORI_STUDY3:
LETH_ORI_STUDY4:
LETH_ORI_STUDY5:
LETH_ORI_STUDY6:
LETH_ORI_STUDY7:
LETH_ORI_STUDY8:
LETH_ORI_STUDY9:
goto LETH_ORI_STUDY1
LETH_ORI_STUDY_PAUSE:
pause
LETH_ORI_STUDY1:
counter add 1
	match LETH_ORI_STUDY%c You turn the instructions this way and that
	match LETH_GET_PRIMER You take on a studious look.
	match LETH_GET_PRIMER You study the sky
	match LETH_FOLD1 and begin to fold
	match LETH_ORI_STUDY_PAUSE ...wait
	match LETH_ORI_STUDY_PAUSE type ahead
put study my %zTorigami instruction
	matchwait

LETH_GET_PRIMER:
	match LETH_STOW_PAPER1 referring
	match LETH_OPEN_PRIMER you get
put get my ori primer
	matchwait

LETH_OPEN_PRIMER:
put open my primer
wait
goto LETH_PRI_STUDY1


LETH_PRI_STUDY2:
LETH_PRI_STUDY3:
LETH_PRI_STUDY4:
LETH_PRI_STUDY5:
LETH_PRI_STUDY6:
LETH_PRI_STUDY7:
LETH_PRI_STUDY8:
LETH_PRI_STUDY9:
LETH_PRI_STUDY_PAUSE:
pause
LETH_PRI_STUDY1:
counter add 1
	match LETH_PRI_STUDY%c You turn the instructions this way and that
	match LETH_NO_PRIMER You take on a studious look.
	match LETH_NO_PRIMER  You study the sky
	match LETH_PRI_FOLD and begin to fold
	match LETH_PRI_STUDY_PAUSE ...wait
	match LETH_PRI_STUDY_PAUSE type ahead
put study my %zTorigami instruction
	matchwait

LETH_PRI_FOLD_PAUSE:
pause
LETH_PRI_FOLD:
	match LETH_PRI_FOLD_PAUSE ...wait
	match LETH_PRI_FOLD_PAUSE type ahead
	match LETH_PRI_FOLD2 you close
put close primer
	matchwait

LETH_PRI_FOLD2:
put stow primer
wait
LETH_FOLD1:
counter set 1

LETH_FOLD2:
LETH_FOLD3:
LETH_FOLD4:
LETH_FOLD5:
LETH_FOLD6:
LETH_FOLD7:
LETH_FOLD8:
LETH_FOLD9:
counter add 1
goto LETH_FOLD

LETH_FOLD_PAUSE:
pause
LETH_FOLD:
	match LETH_FOLD%c roundtime
	match LETH_INSTRU You need to study your instructions
	match LETH_PAPER_DROP project is ruined.
	match LETH_BLOW You make the final fold
	match LETH_BLOW referring
	match LETH_FOLD_PAUSE ...wait
	match LETH_FOLD_PAUSE type ahead
put fold my paper
	matchwait
LETH_FOLD10_PAUSE:
pause
LETH_FOLD10:
	match LETH_HIDE you put
	match LETH_FOLD10_PAUSE ...wait
	match LETH_FOLD10_PAUSE type ahead
put stow my paper
	matchwait


LETH_PAPER_DROP_PAUSE:
pause
LETH_PAPER_DROP:
	match LETH_HIDE you drop
	match PAPER_DROP_PAUSE ...wait
	match PAPER_DROP_PAUSE type ahead
put drop my paper
	matchwait

LETH_BLOW_PAUSE:
pause
LETH_BLOW:
	match LETH_HIDE You exhale into your
	match LETH_HIDE blow into it
	match LETH_HIDE referring
	match LETH_BLOW_PAUSE ...wait
	match LETH_BLOW_PAUSE type ahead
	match LETH_TRASH Smoking commands
	match LETH_TRASH you blow gently
put exhale my %zTorigami
	matchwait

LETH_TRASH:
put drop my %zTorigami
goto LETH_HIDE

LETH_NO_PRIMER:
put stow paper
wait
LETH_PRI_STUDY10_PAUSE:
pause
LETH_PRI_STUDY10:
	match LETH_PRI_STUDY11 you put
	match LETH_PRI_STUDY10_PAUSE ...wait
	match LETH_PRI_STUDY10_PAUSE type ahead
put stow primer
	matchwait

LETH_PRI_STUDY11:
goto LETH_STOW_PAPER

LETH_ORI_STUDY10_PAUSE:
pause
LETH_ORI_STUDY10:
	match LETH_HIDE you put
	match LETH_ORI_STUDY10_PAUSE ...wait
	match LETH_ORI_STUDY10_PAUSE type ahead
put stow my paper
	matchwait

LETH_STOW_PAPER_PAUSE:
pause
LETH_STOW_PAPER:
	match LETH_HIDE you put
	match LETH_STOW_PAPER_PAUSE ...wait
	match LETH_STOW_PAPER_PAUSE type ahead
put stow my paper
	matchwait

LETH_STOW_PAPER1_PAUSE:
pause
LETH_STOW_PAPER1:
	match LETH_STONES you put
	match LETH_STOW_PAPER1_PAUSE ...wait
	match LETH_STOW_PAPER1_PAUSE type ahead
put stow my paper
	matchwait

LETH_HIDE_PAUSE:
pause
goto LETH_HIDE_HIDE

LETH_HIDE_VINE:
put drop vine
pause

LETH_HIDE:
IF_1 put whisper group hide
IF_2 pause 2
IF_2 put listen to %2
IF_2 wait
IF_2 goto LETH_HIDE_HIDE
IF_1 goto LETH_LOOK
LETH_HIDE_HIDE:
	echo
	echo LETH_HIDE:
	echo
	match LETH_LOOK Eh?
	match LETH_LOOK You blend
	match LETH_LOOK You melt into the background
	match LETH_LOOK glance at you as you hide.
	match LETH_LOOK ruining your hiding place!
	match LETH_HIDE_PAUSE roundtime
	match LETH_HIDE_PAUSE ...wait
	match LETH_HIDE_PAUSE type ahead
	match LETH_LOOK having arrived at its destination.
put hide
	match QUIT [You're
	matchwait


LETH_DES_WAIT:
	echo
	echo LETH_DES_WAIT:
	echo
	match LETH_THIEF Oddly, your pouch seems suddenly heavier for a moment.
	match LETH_LOOK having arrived at its destination.
	match LETH_LOOK YOU HAVE BEEN IDLE
	match LETH_LISTEN you must LISTEN
	match QUIT [You're
	matchwait

LETH_THIEF:
put chuckle
put 'Thanks for the perception.
goto LETH_DES_WAIT2

LETH_DES_WAIT2:
IF_1 put whis group hide
	echo
	echo LETH_DES_WAIT2:
	echo
	match LETH_LOOK having arrived at its destination.
	match LETH_LOOK YOU HAVE BEEN IDLE
	match LETH_LISTEN you must LISTEN
	match QUIT [You're
	matchwait

LETH_LISTEN:
put listen to %2
put listen to %1
goto LETH_DES_WAIT
	matchwait

LETH_LOOK:
IF_1 pause 2
	echo
	echo LETH_LOOK:
	echo
	match TO_CROSS_FERRY1 Southern Trade Route, Segoltha Plain
	match TO_CROSS_FERRY Southern Trade Route, Segoltha South Bank
	match AT_LETH Southern Trade Route, Outside Leth Deriel
	match LETH_DES_WAIT obvious
put look
	match QUIT [You're
	matchwait

TO_CROSS_FERRY1_PAUSE:
waitfor following you
TO_CROSS_FERRY1:
put tell caravan follow
waitfor you
	match QUIT [You're
	match TO_CROSS_FERRY1_PAUSE Southern Trade Route, Segoltha Plain
	match TO_CROSS_FERRY_PAUSE Southern Trade Route, Segoltha South Bank
	match TO_CROSS_FERRY You can't go there.
put n
	matchwait

TO_CROSS_FERRY_PAUSE:
waitfor following you
TO_CROSS_FERRY:
put tell caravan follow
waitfor you
save L_FERRY
goto FERRY

AT_LETH_CARA:
save CROSS_TIGER_CHECK
AT_LETH:
	echo
	echo AT_LETH:
	echo
put tell caravan follow
waitfor you
move go gate
waitfor following you
IF_1 put belch
IF_1 wait
IF_1 put nod
IF_1 pause 2
IF_1 put whisper group feed
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
	IF_1 match AT_LETH_F group, "ready
	IF_1 match AT_LETH_F_SHIFT YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	IF_1 match QUIT [You're
IF_1 put whisper group done
	IF_1 matchwait

goto AT_LETH_F

AT_LETH_F_SHIFT:
shift
shift
AT_LETH_F:
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move go shanty
goto LETH


LETH_GATE:
	echo
	echo LETH_GATE:
	echo
move go gate
put se
move se
put se
move se
put se
move se
put se
move se
LETH_OUT:
move go shanty
LETH_IN:
save CROSS_TIGER_CHECK
goto LETH_CARA

LETH_BANK_IN2:
move down
LETH_BANK_IN1:
move down
LETH_BANK_IN:
move out
LETH_BANK_OUT:
move w
put s
move go shanty
save CROSS_TIGER_CHECK
goto LETH_CARA

LETH:
	echo
	echo LETH:
	echo
IF_1 match LETH1 nods to you
IF_1 match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
IF_1 matchwait
LETH1:
	match LETH_GIVE_CON you get
	match LETH_GET_CON1 referring
put get my leth contract
	match QUIT [You're
	matchwait

LETH_GIVE_CON:
	echo
	echo LETH_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto LETH1

LETH_GET_CON1:
put pay clerk gold
wait
LETH_GET_CON:
	echo
	echo LETH_GET_CON:
	echo
put speculate finesse
wait
	match LETH_GOT_CON minister says.
	match LETH_GOT_CON The minister reminds you
	match LETH_GOT_CON The minister plucks a contract
put ask minister for contract
	match QUIT [You're
	matchwait

LETH_GOT_CON:
	echo
	echo LETH_GOT_CON:
	echo
put speculate finesse stop
wait
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
CON_CHECK_LETH:
IF_1 put nod
IF_1 waitfor you nod
put read my contract
wait
goto CON_STOW_LETH1

CON_STOW_LETH1_PAUSE:
pause
CON_STOW_LETH1:
	match CON_STOW_LETH stow what?
	match CON_STOW_LETH you put
	match CON_STOW_LETH1_PAUSE ...wait
	match CON_STOW_LETH1_PAUSE type ahead
put stow my contract
	match QUIT [You're
	matchwait

CON_STOW_PAUSE_LETH:
pause
CON_STOW_LETH:
IF_1 pause 5
put rem my %zTapp1
wait
put get my %zTapp1
wait
put open my %zTapp1
wait
	match APP1_DONE_LETH Appraise what?
	matchre APP1_DONE_LETH /roundtime|inside something|can't appraise/i
	match CON_STOW_PAUSE_LETH ...wait
	match CON_STOW_PAUSE_LETH type ahead
put app my %zTapp1 careful
	match QUIT [You're
	matchwait

APP1_DONE_LETH:
pause
put close my %zTapp1
wait
put wear my %zTapp1
wait
put stow my %zTapp1
wait
put rem my %zTapp2
wait
put get my %zTapp2
wait
put open my %zTapp2
wait


APP2_PAUSE_LETH:
pause
APP2_LETH:
	match APP2_DONE_LETH Appraise what?
	matchre APP2_DONE_LETH /roundtime|inside something|can't appraise/i
	match APP2_PAUSE_LETH ...wait
	match APP2_PAUSE_LETH type ahead
put app my %zTapp2 careful
	match QUIT [You're
	matchwait

APP2_DONE_LETH:
pause
put close my %zTapp2
wait
put wear my %zTapp2
wait
put stow my %zTapp2
wait
goto APP_DONE_LETH

APP_DONE_PAUSE_LETH:
pause
APP_DONE_LETH:
IF_1 put avoid join
IF_1 waitfor you
	match APP_DONE2_LETH You hum
	match APP_DONE_PAUSE_LETH ...wait
	match APP_DONE_PAUSE_LETH type ahead
put hum
	match QUIT [You're
	matchwait
APP_DONE2_PAUSE_LETH:
pause
APP_DONE2_LETH:
IF_1 waitfor group, "ready
IF_1 put avoid !join
IF_1 waitfor You're now
	match OUT_LETH stow what?
	match OUT_LETH you put
	match APP_DONE2_PAUSE_LETH ...wait
	match APP_DONE2_PAUSE_LETH type ahead
put stow my contract
	match QUIT [You're
	matchwait

OUT_LETH:
	echo
	echo OUT_LETH:
	echo
move out
IF_1 pause
put tell caravan follow
wait
put tell caravan go fast
wait
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move go gate
waitfor following you
put tell caravan lead to crossing
waitfor you
put tell caravan go fast
waitfor you
goto LETH_ORIGAMI


LETH_STONES:
	match LETH_BRAID_FOR referring
	match LETH_STONE1A you get
put get my stones
	matchwait


LETH_STONE1_PAUSE:
pause
LETH_STONE1A:
counter set 1
	match LETH_BRAID_FOR Remove what?
	match LETH_STONE2_C roundtime
	match LETH_STONE_STOW exactly
	match LETH_STONE1_PAUSE ...wait
	match LETH_STONE1_PAUSE type ahead
put remove %c stones
	matchwait


LETH_STONE2_C:
counter add 1
goto LETH_STONE2_COMB

LETH_STONE2_COMB_PAUSE:
pause
LETH_STONE2_COMB:
	match LETH_STONE2 You combine
	match LETH_STONE3_COMB roundtime
	match LETH_STONE2_COMB_PAUSE ...wait
	match LETH_STONE2_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

LETH_STONE2_RC:
counter set 1
goto LETH_STONE2

LETH_STONE2_PAUSE:
pause
LETH_STONE2:
	match LETH_STONE3_C roundtime
	match LETH_STONE2_RC exactly
	match LETH_STONE2_PAUSE ...wait
	match LETH_STONE2_PAUSE type ahead
put remove %c stones
	matchwait

LETH_STONE3_RC:
counter set 1
goto LETH_STONE3
LETH_STONE3_C:
counter add 1
goto LETH_STONE3_COMB

LETH_STONE3_COMB_PAUSE:
pause
LETH_STONE3_COMB:
	match LETH_STONE3 You combine
	match LETH_STONE4_COMB roundtime
	match LETH_STONE3_COMB_PAUSE ...wait
	match LETH_STONE3_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

LETH_STONE3_PAUSE:
pause
LETH_STONE3:
	match LETH_STONE4_C roundtime
	match LETH_STONE3_RC exactly
	match LETH_STONE3_PAUSE ...wait
	match LETH_STONE3_PAUSE type ahead
put remove %c stones
	matchwait

LETH_STONE4_RC:
counter set 1
goto LETH_STONE4
LETH_STONE4_C:
counter add 1
goto LETH_STONE4_COMB

LETH_STONE4_COMB_PAUSE:
pause
LETH_STONE4_COMB:
	match LETH_STONE4 You combine
	match LETH_STONE5_COMB roundtime
	match LETH_STONE4_COMB_PAUSE ...wait
	match LETH_STONE4_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

LETH_STONE4_PAUSE:
pause
LETH_STONE4:
	match LETH_STONE5_C roundtime
	match LETH_STONE4_RC exactly
	match LETH_STONE4_PAUSE ...wait
	match LETH_STONE4_PAUSE type ahead
put remove %c stones
	matchwait

LETH_STONE5_RC:
counter set 1
goto LETH_STONE5
LETH_STONE5_C:
counter add 1
goto LETH_STONE5_COMB

LETH_STONE5_COMB_PAUSE:
pause
LETH_STONE5_COMB:
	match LETH_STONE5 You combine
	match LETH_STONE6 roundtime
	match LETH_STONE5_COMB_PAUSE ...wait
	match LETH_STONE5_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

LETH_STONE5_PAUSE:
pause
LETH_STONE5:
	match LETH_STONE6_COMB roundtime
	match LETH_STONE5_RC exactly
	match LETH_STONE5_PAUSE ...wait
	match LETH_STONE5_PAUSE type ahead
put remove %c stones
	matchwait

LETH_STONE6_COMB_PAUSE:
pause
LETH_STONE6_COMB:
	match LETH_STONE6 You combine
	match LETH_STONE6_COMB roundtime
	match LETH_STONE6_COMB_PAUSE ...wait
	match LETH_STONE6_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

LETH_STONE6_PAUSE:
pause
LETH_STONE6:
	match LETH_HIDE you put
	match LETH_STONE6_PAUSE type ahead
	match LETH_STONE6_PAUSE ...wait
put stow my stones
	matchwait

LETH_BRAID_FOR:
IF_1 put whisper group braid
	match LETH_BRAID_FORA referring
	match LETH_BRAID you get
put get my vines
	matchwait

LETH_BRAID_FORA_PAUSE:
pause
LETH_BRAID_FORA:
	match LETH_BRAID You manage to find a vine.
	match LETH_BRAID_FOR1 roundtime
	match LETH_BRAID_FORA_PAUSE ...wait
	match LETH_BRAID_FORA_PAUSE type ahead
	match QUIT [You're
put forage vine
	matchwait


LETH_BRAID_FOR1:
counter set 1
LETH_BRAID_FOR2:
LETH_BRAID_FOR3:
LETH_BRAID_FOR4:
LETH_BRAID_FOR5:
LETH_BRAID_FOR6:
LETH_BRAID_FOR7:
LETH_BRAID_FOR8:
LETH_BRAID_FOR9:
counter add 1
goto LETH_BRAIDING_FOR

LETH_BRAIDING_FOR_PAUSE:
pause
LETH_BRAIDING_FOR:
	match LETH_BRAID You manage to find a vine.
	match LETH_BRAID_FOR%c roundtime
	match LETH_BRAIDING_FOR_PAUSE ...wait
	match LETH_BRAIDING_FOR_PAUSE type ahead
	match QUIT [You're
put forage vine
	matchwait

LETH_BRAID_FOR10_PAUSE:
pause
LETH_BRAID_FOR10:
	match LETH_HIDE you put
	match LETH_HIDE stow what?
	match LETH_HIDE_VINE after stuffing it
	match LETH_BRAID_FOR10_PAUSE ...wait
put stow my vine
	matchwait

LETH_BRAID_PAUSE:
pause
LETH_BRAID:
	match LETH_BRAID1 roundtime
	match LETH_BRAID_FORA You need to have
	match LETH_BRAID_PULL The braided vines is already
	match LETH_BRAID_PULL Better just PULL
	match LETH_BRAID_PAUSE type ahead
	match LETH_BRAID_PAUSE ...wait
put braid my vine
	matchwait

LETH_BRAID1:
counter set 1
LETH_BRAID2:
LETH_BRAID3:
LETH_BRAID4:
LETH_BRAID5:
counter add 1
goto L_B
LETH_BRAID2_PAUSE:
pause
L_B:
	match LETH_BRAID%c roundtime
	match LETH_BRAID6 You need to have
	match LETH_BRAID_PULL The braided vines is already
	match LETH_BRAID_PULL Better just PULL
	match LETH_BRAID2_PAUSE type ahead
	match LETH_BRAID2_PAUSE ...wait
put braid my vine
	matchwait
LETH_BRAID_PULL_PAUSE:
pause
LETH_BRAID_PULL:
	match LETH_BRAID_DROP roundtime
	match LETH_JUGGLE With a muttered curse you throw away the ruined pieces.
	match LETH_BRAID_PULL_PAUSE ...wait
	match LETH_BRAID_PULL_PAUSE type ahead
put pull my vine
	matchwait

LETH_BRAID_DROP_PAUSE:
pause
LETH_BRAID_DROP:
	match LETH_BRAID_DROPB you drop
	match LETH_BRAID_DROPB referring
	match LETH_BRAID_DROP_PAUSE ...wait
	match LETH_BRAID_DROP_PAUSE type ahead
put drop rope
	matchwait

LETH_BRAID_DROPB:
put drop my vine
wait
goto LETH_JUGGLE

LETH_BRAID6_PAUSE:
pause
LETH_BRAID6:
	match LETH_BRAID6_PAUSE ...wait
	match LETH_BRAID6_PAUSE type ahead
	match LETH_JUGGLE you put
	match LETH_JUGGLE_VINE after stuffing it
	match LETH_JUGGLE stow what?
put stow my vines
	matchwait

LETH_JUGGLE_VINE:
put drop vine
pause

LETH_JUGGLE:
IF_1 pause 5
IF_1 put whis group juggle
IF_1 waitfor you
pause 2
put get my %zTjugglies
waitfor you
counter set 1
goto LETH_JUGGLE%c
LETH_JUGGLE_PAUSE:
pause
goto LETH_JUGGLE_PAUSE1
LETH_JUGGLE1:
LETH_JUGGLE2:
LETH_JUGGLE3:
LETH_JUGGLE4:
LETH_JUGGLE5:
counter add 1
LETH_JUGGLE_PAUSE1:
	match LETH_JUGGLE_PAUSE type ahead
	match LETH_JUGGLE_PAUSE ...wait
	match LETH_JUGGLE%c roundtime
	match LETH_JUGGLE6 heal
	match LETH_HIDE referring
	match LETH_HIDE Please rephrase that command
put Juggle my %zTjugglies
	matchwait


LETH_JUGGLE6:
pause
	match LETH_JUGGLE6 type ahead
	match LETH_JUGGLE6 ...wait
	match LETH_HIDE you put
	match LETH_HIDE referring
	match LETH_HIDE Stow what?
put stow my %zTjugglies
	match QUIT [You're
	matchwait



OFF_CROSS_FERRY:
	echo
	echo OFF_CROSS_FERRY:
	echo
move go squ
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move go door
goto CROSS


NOT_ARTHE1:
put tell caravan lead to arthe dale
wait
goto HIDE

AT_ARTHE_STONE:
	match NOT_ARTHE1 obvious
	match AT_ARTHE_STONE2 Valley, Village Gate
put look
	match QUIT [You're
	matchwait

AT_ARTHE_STONE2:
save ARTHE_TO_CROSSA
goto 2FORAGE

AT_ARTHE_CROSS:
	match NOT_ARTHE1 obvious
	match AT_ARTHE_CROSS2 Valley, Village Gate
put look
	match QUIT [You're
	matchwait

AT_ARTHE_CROSS2:
save ARTHE_STONE_CHECKA
goto 2FORAGE


ARTHE_TO_CROSSA:
save ARTHE_TO_CROSS_LEDGER
goto AT_ARTHE

ARTHE_STONE_CHECKA:
save ARTHE_STONE_CHECK
goto AT_ARTHE

AT_ARTHE:
	echo
	echo AT_ARTHE:
	echo
put tell caravan follow
waitfor you
move go gate
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move w
waitfor following you
put knock sign
waitfor you knock
move go door

AT_ARTHE_DOOR:
	match ARTHE shipment clerk
	match OPEN_ARTHE_DOOR smash your nose
put go door
	matchwait

OPEN_ARTHE_DOOR:
put open door
goto AT_ARTHE_DOOR

ARTHE_GATE:
	echo
	echo ARTHE_GATE:
	echo
move go gate
put n
move n
put n
move n
move w
ARTHE_OUT:
put knock sign
waitfor you knock
move go door
ARTHE_IN2:
	match ARTHE_IN shipment clerk
	match OPEN_ARTHE_IN2_DOOR smash you nose
put go door
	matchwait

OPEN_ARTHE_IN2_DOOR:
put open door
goto ARTHE_IN2

ARTHE_IN:
save ARTHE_CROSS
goto RENT_CARAVAN


ARTHE_CROSS:
save ARTHE_STONE_CHECK

ARTHE:
	echo
	echo ARTHE:
	echo
IF_1 match ARTHE1 nods to you
IF_1 match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
IF_1 matchwait
ARTHE1:
	match ARTHE_GIVE_CON you get
	match ARTHE_GET_CON1 referring
put get my arthe contract
	match QUIT [You're
	matchwait

ARTHE_GIVE_CON:
	echo
	echo ARTHE_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto ARTHE1

ARTHE_GET_CON1:
put pay clerk gold
wait
ARTHE_GET_CON:
	echo
	echo ARTHE_GET_CON:
	echo
put speculate finesse
wait
	match ARTHE_GOT_CON minister says.
	match ARTHE_GOT_CON The minister reminds you
	match ARTHE_GOT_CON The minister plucks a contract
put ask minister for contract
	match QUIT [You're
	matchwait

ARTHE_GOT_CON:
	echo
	echo ARTHE_GOT_CON:
	echo
put speculate finesse stop
wait
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto CON_CHECK


ARTHE_STONE_CHECK:
	echo
	echo ARTHE_STONE_CHECK:
	echo
Put get my ledger
waitfor you
put open my ledger
waitfor open
put turn my ledger to chapter 1
waitfor "Zoluren Outposts"
put turn my ledger to page 7
waitfor entitled
	match ARTHE_CON_STONE Have a contracted trade
	match ARTHE_TO_STONE Have no contracts
	match ARTHE_TO_STONE Have a delinquent
put read ledge
	match QUIT [You're
	matchwait

ARTHE_CON_STONE:
	echo
	echo ARTHE_CON_STONE:
	echo
	match ARTHE_DIRGE_CHECK referring
	match ARTHE_TO_STONE The contract is printed
put look my stone contract
	match QUIT [You're
	matchwait

ARTHE_DIRGE_CHECK:
	echo
	echo ARTHE_DIRGE_CHECK:
	echo
put turn my ledger to page 2
waitfor entitled
	match ARTHE_CON_DIRGE Have a contracted trade
	match ARTHE_TO_DIRGE Have no contracts
	match ARTHE_TO_DIRGE Have a delinquent
put read ledge
	match QUIT [You're
	matchwait

ARTHE_CON_DIRGE:
	echo
	echo ARTHE_CON_DIRGE:
	echo
	match ARTHE_TO_CROSS referring
	match ARTHE_TO_STONE The contract is printed
put look my second dirge contract
	match QUIT [You're
	matchwait


ARTHE_TO_DIRGE:
	echo
	echo ARTHE_TO_DIRGE:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
save AT_DIRGE
goto ARTHE_TO_DIRGE_OUT


ARTHE_TO_DIRGE_DOOR:
put open door
ARTHE_TO_DIRGE_OUT_PAUSE:
pause
ARTHE_TO_DIRGE_OUT:
	match ARTHE_TO_DIRGE_STAND can't do that
	match ARTHE_TO_DIRGE_OUT2 obvious
	match ARTHE_TO_DIRGE_DOOR smash your nose
	match ARTHE_TO_DIRGE_OUT_PAUSE ...wait
	match ARTHE_TO_DIRGE_OUT_PAUSE type ahead
put go door
	match QUIT [You're
	matchwait
ARTHE_TO_DIRGE_PAUSE:
pause
ARTHE_TO_DIRGE_STAND:
	match ARTHE_TO_DIRGE_PAUSE roundtime
	match ARTHE_TO_DIRGE_OUT You stand back up.
	match ARTHE_TO_DIRGE_PAUSE ...wait
	match ARTHE_TO_DIRGE_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

ARTHE_TO_DIRGE_OUT2:
move out
IF_1 pause
put tell caravan lead to dirge
wait
put tell caravan go fast
wait
goto ORIGAMI

ARTHE_TO_STONE:
	echo
	echo ARTHE_TO_STONE:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
save AT_STONE_ARTHE
goto ARTHE_TO_STONE_OUT

ARTHE_TO_STONE_DOOR:
put open door
ARTHE_TO_STONE_OUT_PAUSE:
pause
ARTHE_TO_STONE_OUT:
	match ARTHE_TO_STONE_STAND can't do that
	match ARTHE_TO_STONE_DOOR smash your nose
	match ARTHE_TO_STONE_OUT2 obvious
	match ARTHE_TO_STONE_OUT_PAUSE ...wait
	match ARTHE_TO_STONE_OUT_PAUSE type ahead
put go door
	match QUIT [You're
	matchwait
ARTHE_TO_STONE_PAUSE:
pause
ARTHE_TO_STONE_STAND:
	match ARTHE_TO_STONE_PAUSE roundtime
	match ARTHE_TO_STONE_OUT You stand back up.
	match ARTHE_TO_STONE_PAUSE ...wait
	match ARTHE_TO_STONE_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

ARTHE_TO_STONE_OUT2:
move out
IF_1 pause
put tell caravan lead to stone clan
wait
put tell caravan go fast
wait
goto ORIGAMI


ARTHE_TO_CROSS_LEDGER:
put get my ledger
wait
put open my ledger
wait
ARTHE_TO_CROSS:
	echo
	echo ARTHE_TO_CROSS:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
save AT_CROSS
goto ARTHE_TO_CROSS_OUT

ARTHE_TO_CROSS_DOOR:
put open door
ARTHE_TO_CROSS_OUT_PAUSE:
pause
ARTHE_TO_CROSS_OUT:
	match ARTHE_TO_CROSS_STAND can't do that
	match ARTHE_TO_CROSS_DOOR smash your nose
	match ARTHE_TO_CROSS_OUT2 obvious
	match ARTHE_TO_CROSS_OUT_PAUSE ...wait
	match ARTHE_TO_CROSS_OUT_PAUSE type ahead
put go door
	match QUIT [You're
	matchwait
ARTHE_TO_CROSS_PAUSE:
pause
ARTHE_TO_CROSS_STAND:
	match ARTHE_TO_CROSS_PAUSE roundtime
	match ARTHE_TO_CROSS_OUT You stand back up.
	match ARTHE_TO_CROSS_PAUSE ...wait
	match ARTHE_TO_CROSS_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

ARTHE_TO_CROSS_OUT2:
move out
put tell caravan lead to crossing
wait
put tell caravan go fast
wait
goto ARTHE_STUDY

ARTHE_STUDY:
IF_1 put whis group study
IF_1 pause 5
	match ARTHE_PATTERN referring
	match STUDY_COM1_ARTHE you get
	match STUDY_COM1_ARTHE you open
	match QUIT [You're
put get my compendium
put open my compendium
	matchwait

STUDY_COM1_TURN_ARTHE:
pause
	match STUDY_COM1_TURN_ARTHE ...wait
	match STUDY_COM1_TURN_ARTHE type ahead
	match STUDY_COM1_ARTHE You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM1_PAUSE_ARTHE:
pause
STUDY_COM1_ARTHE:
echo
echo STUDY_COM1_ARTHE:
echo
	match STUDY_COM2_TURN_ARTHE Why do you need to study this chart again?
	match STUDY_COM2_TURN_ARTHE sudden moment of clarity
	match STUDY_COM5_TURN_ARTHE difficult time
	match STUDY_COM5_TURN_ARTHE impossible
	match STUDY_COM2_PAUSE_ARTHE gradually absorbing
	match STUDY_COM1_PAUSE_ARTHE ...wait
	match STUDY_COM1_PAUSE_ARTHE type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM2_TURN_ARTHE:
pause
	match STUDY_COM2_TURN_ARTHE ...wait
	match STUDY_COM2_TURN_ARTHE type ahead
	match STUDY_COM2_ARTHE You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM2_PAUSE_ARTHE:
pause
STUDY_COM2_ARTHE:
echo
echo STUDY_COM2_ARTHE:
echo
	match STUDY_COM3_TURN_ARTHE Why do you need to study this chart again?
	match STUDY_COM3_TURN_ARTHE sudden moment of clarity
	match STUDY_COM_STOW_ARTHE difficult time
	match STUDY_COM_STOW_ARTHE impossible
	match STUDY_COM3_PAUSE_ARTHE gradually absorbing
	match STUDY_COM2_PAUSE_ARTHE ...wait
	match STUDY_COM2_PAUSE_ARTHE type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM3_TURN_ARTHE:
pause
	match STUDY_COM3_TURN_ARTHE ...wait
	match STUDY_COM3_TURN_ARTHE type ahead
	match STUDY_COM3_ARTHE You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM3_PAUSE_ARTHE:
pause
STUDY_COM3_ARTHE:
echo
echo STUDY_COM3_ARTHE:
echo
	match STUDY_COM4_TURN_ARTHE Why do you need to study this chart again?
	match STUDY_COM4_TURN_ARTHE sudden moment of clarity
	match STUDY_COM_STOW_ARTHE difficult time
	match STUDY_COM_STOW_ARTHE impossible
	match STUDY_COM4_PAUSE_ARTHE gradually absorbing
	match STUDY_COM3_PAUSE_ARTHE ...wait
	match STUDY_COM3_PAUSE_ARTHE type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM4_TURN_ARTHE:
pause
	match STUDY_COM4_TURN_ARTHE ...wait
	match STUDY_COM4_TURN_ARTHE type ahead
	match STUDY_COM4_ARTHE You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM4_PAUSE_ARTHE:
pause
STUDY_COM4_ARTHE:
echo
echo STUDY_COM4_ARTHE:
echo
	match STUDY_COM5_TURN_ARTHE Why do you need to study this chart again?
	match STUDY_COM5_TURN_ARTHE sudden moment of clarity
	match STUDY_COM_STOW_ARTHE difficult time
	match STUDY_COM_STOW_ARTHE impossible
	match STUDY_COM5_PAUSE_ARTHE gradually absorbing
	match STUDY_COM4_PAUSE_ARTHE ...wait
	match STUDY_COM4_PAUSE_ARTHE type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM5_TURN_ARTHE:
pause
	match STUDY_COM5_TURN_ARTHE ...wait
	match STUDY_COM5_TURN_ARTHE type ahead
	match STUDY_COM5_ARTHE You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM5_PAUSE_ARTHE:
pause
STUDY_COM5_ARTHE:
echo
echo STUDY_COM5_ARTHE:
echo
	match STUDY_COM_STOW_ARTHE Why do you need to study this chart again?
	match STUDY_COM_STOW_ARTHE sudden moment of clarity
	match STUDY_COM_STOW_ARTHE difficult time
	match STUDY_COM_STOW_ARTHE impossible
	match STUDY_COM_STOW2_ARTHE gradually absorbing
	match STUDY_COM5_PAUSE_ARTHE ...wait
	match STUDY_COM5_PAUSE_ARTHE type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM_STOW_PAUSE_ARTHE:
pause
STUDY_COM_STOW_ARTHE:
	match STUDY_COM_STOW2_ARTHE You turn to the section containing
	match STUDY_COM_STOW_PAUSE_ARTHE ...wait
	match STUDY_COM_STOW_PAUSE_ARTHE type ahead
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM_STOW2_PAUSE_ARTHE:
pause
STUDY_COM_STOW2_ARTHE:
	match HIDE you put
	match STUDY_COM_STOW_PAUSE_ARTHE ...wait
	match STUDY_COM_STOW_PAUSE_ARTHE type ahead
	match QUIT [You're
put close my compendium
put stow my compendium
	matchwait

ARTHE_PATTERN:
pause
	match HIDE referring
	match ARTHE_STUDY1 you get
	match QUIT [You're
put get my pattern
	matchwait

ARTHE_STUDY1_PAUSE:
pause
ARTHE_STUDY1:
	match A_STUDY_STOW You believe that you understand
	match ARTHE_STUDY2 roundtime
	match A_STUDY_STOW You already know enough
	match A_STUDY_STOW You don't have the proper training for that.
	match ARTHE_STUDY1_PAUSE ...wait
	match ARTHE_STUDY1_PAUSE type ahead
	match QUIT [You're
	match ARTHE_STUDY1_PAUSE Encumbrance:
	match A_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

ARTHE_STUDY2_PAUSE:
pause
ARTHE_STUDY2:
	match A_STUDY_STOW You believe that you understand
	match ARTHE_STUDY3 roundtime
	match A_STUDY_STOW You already know enough
	match ARTHE_STUDY2_PAUSE ...wait
	match ARTHE_STUDY2_PAUSE type ahead
	match QUIT [You're
	match ARTHE_STUDY2_PAUSE Encumbrance:
	match A_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

ARTHE_STUDY3_PAUSE:
pause
ARTHE_STUDY3:
	match A_STUDY_STOW You believe that you understand
	match ARTHE_STUDY4 roundtime
	match A_STUDY_STOW You already know enough
	match ARTHE_STUDY3_PAUSE ...wait
	match ARTHE_STUDY3_PAUSE type ahead
	match QUIT [You're
	match ARTHE_STUDY3_PAUSE Encumbrance:
	match A_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

ARTHE_STUDY4_PAUSE:
pause
ARTHE_STUDY4:
	match A_STUDY_STOW You believe that you understand
	match ARTHE_STUDY5 roundtime
	match A_STUDY_STOW You already know enough
	match ARTHE_STUDY4_PAUSE ...wait
	match ARTHE_STUDY4_PAUSE type ahead
	match QUIT [You're
	match ARTHE_STUDY4_PAUSE Encumbrance:
	match A_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

ARTHE_STUDY5_PAUSE:
pause
ARTHE_STUDY5:
	match A_STUDY_STOW You believe that you understand
	match A_STUDY_STOW roundtime
	match A_STUDY_STOW You already know enough
	match ARTHE_STUDY5_PAUSE ...wait
	match ARTHE_STUDY5_PAUSE type ahead
	match QUIT [You're
	match ARTHE_STUDY5_PAUSE Encumbrance:
	match A_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

A_STUDY_DROP_PAUSE:
pause
A_STUDY_DROP:
	match HIDE you drop
	match A_STUDY_DROP_PAUSE ...wait
	match A_STUDY_DROP_PAUSE type ahead
	match QUIT [You're
put drop my pattern
	matchwait

A_STUDY_STOW_PAUSE:
pause
A_STUDY_STOW:
	match HIDE you put
	match A_STUDY_STOW_PAUSE ...wait
	match A_STUDY_STOW_PAUSE type ahead
	match QUIT [You're
put stow my pattern
	matchwait


AT_STONE_DIRGE:
save STONE_DIRGE
goto AT_STONE


AT_STONE_ARTHE:
save STONE_ARTHE
goto AT_STONE

AT_STONE_PAUSE:
pause
AT_STONE:
	echo
	echo AT_STONE:
	echo
	match AT_STONE_PAUSE ...wait
	match AT_STONE_PAUSE type ahead
	match AT_STONE2 You pass on the order
put tell caravan follow
	match QUIT [You're
	matchwait

AT_STONE2:
IF_1 pause 2
	match NOT_STONE obvious
	match NOT_STONE1 can't go there
	match NOT_STONE1 referring
	match CLIMB_TRAIL Foothills, Stony Incline
put down
	match QUIT [You're
	matchwait

NOT_STONE:
waitfor following you
put up
waitfor following you
NOT_STONE1:
save AT_STONE_ARTHE
put tell caravan lead to stone clan
wait
goto HIDE


TRAIL_STOW:
put stow left
wait
put stow right
wait
goto CLIMB_TRAIL_PAUSE
CLIMB_TRAIL:
	echo
	echo CLIMB_TRAIL:
	echo
waitfor following you

goto CLIMB_TRAIL_PAUSE

CLIMB_TRAIL_RETREAT1_PAUSE:
pause
CLIMB_TRAIL_RETREAT1:
	match CLIMB_TRAIL_PAUSE You retreat from combat.
	match CLIMB_TRAIL_PAUSE already as far
	match CLIMB_TRAIL_RETREAT2_PAUSE roundtime
	match CLIMB_TRAIL_RETREAT1_PAUSE ...wait
	match CLIMB_TRAIL_RETREAT1_PAUSE type ahead
	match CLIMB_TRAIL_RETREAT1_PAUSE You stop advancing
	match QUIT You are still stunned
put retreat
put reateat
	matchwait

CLIMB_TRAIL_RETREAT2_PAUSE:
pause
CLIMB_TRAIL_RETREAT2:
	match CLIMB_TRAIL_PAUSE You retreat from combat.
	match CLIMB_TRAIL_PAUSE already as far
	match CLIMB_TRAIL_RETREAT3_PAUSE roundtime
	match CLIMB_TRAIL_RETREAT2_PAUSE ...wait
	match CLIMB_TRAIL_RETREAT2_PAUSE type ahead
	match CLIMB_TRAIL_RETREAT2_PAUSE You stop advancing
	match QUIT You are still stunned
put retreat
put reateat
	matchwait

CLIMB_TRAIL_RETREAT3_PAUSE:
pause
CLIMB_TRAIL_RETREAT3:
	match CLIMB_TRAIL_PAUSE You retreat from combat.
	match CLIMB_TRAIL_PAUSE already as far
	match QUIT roundtime
	match CLIMB_TRAIL_RETREAT3_PAUSE ...wait
	match CLIMB_TRAIL_RETREAT3_PAUSE type ahead
	match CLIMB_TRAIL_RETREAT3_PAUSE You stop advancing
	match QUIT You are still stunned
put retreat
put reateat
	matchwait

CLIMB_TRAIL_PAUSE_SHIFT:
shift
shift
CLIMB_TRAIL_PAUSE:
IF_1 put nod
IF_1 waitfor you
IF_1 put whisper group trail
IF_1 waitfor you whisper
	match TRAIL_STAND stand
	match AT_STONE21 Northern Trade Road, Foothills
	match TRAIL_STOW free
	match CLIMB_TRAIL_CHECK .
put climb trail
	match CLIMB_TRAIL_RETREAT1 [You're
	matchwait
TRAIL_STAND_PAUSE:
pause
TRAIL_STAND:
	match TRAIL_STAND_PAUSE ...wait
	match TRAIL_STAND_PAUSE type ahead
	match TRAIL_STAND_PAUSE roundtime
	match CLIMB_TRAIL_PAUSE you stand
put stand
	match QUIT [You're
	matchwait

CLIMB_TRAIL_CHECK:
	match AT_STONE21 Northern Trade Road, Foothills
	match CLIMB_TRAIL_PAUSE Foothills, Stony Incline
	match AT_STONE22 following you
put look
	match QUIT [You're
	matchwait

AT_STONE21:
waitfor following you
IF_1 pause 2
IF_1 put belch
IF_1 wait
IF_1 put nod
IF_1 pause 2
IF_1 put whisper group feed
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
	IF_1 match AT_STONE22 group, "ready
	IF_1 match AT_STONE_SHIFT YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	IF_1 match QUIT [You're
IF_1 put whisper group done
	IF_1 matchwait
goto AT_STONE22
AT_STONE_SHIFT:
shift
shift
AT_STONE22:
pause 2
move go outpost
goto STONE

STONE_TRAIL:
move down
put climb trail
STONE_OUT:
move go outpost
STONE_IN:
save STONE_RENT
goto RENT_CARAVAN

STONE_RENT:
save STONE_ARTHE

STONE:
	echo
	echo STONE:
	echo
IF_1 match STONE1 nods to you
IF_1 match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
IF_1 matchwait
STONE1:
	match STONE_GIVE_CON you get
	match STONE_GET_CON1 referring
put get my stone contract
	match QUIT [You're
	matchwait

STONE_GIVE_CON:
	echo
	echo STONE_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto STONE1

STONE_GET_CON1:
put pay clerk gold
wait
STONE_GET_CON:
	echo
	echo STONE_GET_CON:
	echo
	match STONE_GOT_CON minister says.
	match STONE_GOT_CON The minister reminds you
	match STONE_GOT_CON The minister plucks a contract
put ask minister for contract
	match QUIT [You're
	matchwait

STONE_GOT_CON:
	echo
	echo STONE_GOT_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you

goto CON_CHECK




STONE_ARTHE:

STONE_DIRGE_CHECK:
	echo
	echo STONE_DIRGE_CHECK:
	echo
Put get my ledger
waitfor you
put open my ledger
waitfor open
put turn my ledger to chapter 1
waitfor "Zoluren Outposts"
put turn my ledger to page 2
waitfor entitled
	match STONE_CON_DIRGE Have a contracted trade
	match STONE_TO_DIRGE Have no contracts
	match STONE_TO_DIRGE Have a delinquent
put read ledge
	match QUIT [You're
	matchwait

STONE_CON_DIRGE:
	echo
	echo STONE_CON_DIRGE:
	echo
	match STONE_ARTHE_CHECK referring
	match STONE_TO_DIRGE The contract is printed
put look my second dirge contract
	match QUIT [You're
	matchwait


STONE_DIRGE:

STONE_ARTHE_CHECK:
	echo
	echo STONE_ARTHE_CHECK:
	echo
Put get my ledger
waitfor you
put open my ledger
waitfor open
put turn my ledger to chapter 1
wait
put turn my ledger to page 5
waitfor entitled
	match STONE_CON_ARTHE Have a contracted trade
	match STONE_TO_ARTHE Have no contracts
	match STONE_TO_ARTHE Have a delinquent
put read ledge
	match QUIT [You're
	matchwait

STONE_CON_ARTHE:
	echo
	echo STONE_CON_ARTHE:
	echo
	match STONE_TO_CROSS referring
	match STONE_TO_ARTHE The contract is printed
put look my arthe contract
	match QUIT [You're
	matchwait


STONE_TO_DIRGE:
	echo
	echo STONE_TO_DIRGE:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
save AT_DIRGE
goto STONE_TO_DIRGE_OUT

STONE_TO_DIRGE_OUT_PAUSE:
pause
STONE_TO_DIRGE_OUT:
	match STONE_TO_DIRGE_STAND can't do that
	match STONE_TO_DIRGE_OUT2 obvious
	match STONE_TO_DIRGE_OUT_PAUSE ...wait
	match STONE_TO_DIRGE_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
STONE_TO_DIRGE_PAUSE:
pause
STONE_TO_DIRGE_STAND:
	match STONE_TO_DIRGE_PAUSE roundtime
	match STONE_TO_DIRGE_OUT You stand back up.
	match STONE_TO_DIRGE_PAUSE ...wait
	match STONE_TO_DIRGE_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

STONE_TO_DIRGE_OUT2:
IF_1 pause
put tell caravan lead to dirge
wait
put tell caravan go fast
wait
goto ORIGAMI

STONE_TO_CROSS:
	echo
	echo STONE_TO_CROSS:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
save AT_CROSS
goto STONE_TO_CROSS_OUT
STONE_TO_CROSS_OUT_PAUSE:
pause
STONE_TO_CROSS_OUT:
	match STONE_TO_CROSS_STAND can't do that
	match STONE_TO_CROSS_OUT2 obvious
	match STONE_TO_CROSS_OUT_PAUSE ...wait
	match STONE_TO_CROSS_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
STONE_TO_CROSS_PAUSE:
pause
STONE_TO_CROSS_STAND:
	match STONE_TO_CROSS_PAUSE roundtime
	match STONE_TO_CROSS_OUT You stand back up.
	match STONE_TO_CROSS_PAUSE ...wait
	match STONE_TO_CROSS_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

STONE_TO_CROSS_OUT2:
IF_1 pause
put tell caravan lead to crossing
wait
put tell caravan go fast
wait
goto ORIGAMI



STONE_TO_ARTHE:
	echo
	echo STONE_TO_ARTHE:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
save AT_ARTHE_STONE
goto STONE_TO_ARTHE_OUT
STONE_TO_ARTHE_OUT_PAUSE:
pause
STONE_TO_ARTHE_OUT:
	match STONE_TO_ARTHE_STAND can't do that
	match STONE_TO_ARTHE_OUT2 obvious
	match STONE_TO_ARTHE_OUT_PAUSE ...wait
	match STONE_TO_ARTHE_OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
STONE_TO_ARTHE_PAUSE:
pause
STONE_TO_ARTHE_STAND:
	match STONE_TO_ARTHE_PAUSE roundtime
	match STONE_TO_ARTHE_OUT You stand back up.
	match STONE_TO_ARTHE_PAUSE ...wait
	match STONE_TO_ARTHE_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

STONE_TO_ARTHE_OUT2:
IF_1 pause
put tell caravan lead to arthe dale
wait
put tell caravan go fast
wait
goto ORIGAMI

AT_DIRGE:
	echo
	echo AT_DIRGE:
	echo
put tell caravan follow
waitfor you
IF_1 put belch
IF_1 wait
IF_1 put nod
IF_1 pause 2
IF_1 put whisper group feed
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
	IF_1 match AT_DIRGE2B group, "ready
	IF_1 match AT_DIRGE2B_SHIFT YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	IF_1 match QUIT [You're
IF_1 put whisper group done
	IF_1 matchwait

goto AT_DIRGE2B

AT_DIRGE2B_SHIFT:
shift
shift
AT_DIRGE2B:
	match NOT_DIRGE obvious
	match NOT_DIRGE1 can't
	match NOT_DIRGE1 referring
	match AT_DIRGE2 Lava Fields, Narrow Trace
put go path
	match QUIT [You're
	matchwait

NOT_DIRGE:
waitfor following you
put go path
waitfor following you
NOT_DIRGE1:
put tell caravan lead to dirge
wait
goto HIDE


AT_DIRGE2:
waitfor following you
move e
waitfor following you
move ne
waitfor following you
move e
waitfor following you
move ne
waitfor following you
move w
waitfor following you
move nw
waitfor following you
move sw
waitfor following you
move w
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move go gate
waitfor following you
move go stable
goto DIRGE

DIRGE_BANK_IN:
move out
DIRGE_BANK_OUT:
move s
goto DIRGE_OUT

DIRGE_BANK_OUT_CARA:
move s
waitfor following you
goto DIRGE_OUT

DIRGE_ROAD:
	echo
	echo DIRGE_ROAD:
	echo
move go path
put e
move ne
put e
move ne
put w
move nw
put sw
move w
put n
move n
put n
DIRGE_OUT:
move go stable
DIRGE_IN:
save DIRGE
goto RENT_CARAVAN

DIRGE:
save DIRGE_STONE_CHECK
	echo
	echo DIRGE:
	echo
IF_1 match DIRGE1 nods to you
IF_1 match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
IF_1 matchwait
DIRGE1:
	match DIRGE_GIVE_CON you get
	match DIRGE_GET_CON1 referring
put get my dirge contract
	match QUIT [You're
	matchwait

DIRGE_GIVE_CON:
	echo
	echo DIRGE_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto DIRGE1
DIRGE_GET_CON1:
put pay clerk gold
wait
DIRGE_STAIR:
	match DIRGE_STAND can't do that
	match DIRGE_STAIR1 obvious
put climb stair
	matchwait
DIRGE_STAIR1:
pause
put speculate finesse
wait
DIRGE_GET_CON:
	echo
	echo DIRGE_GET_CON:
	echo
	match DIRGE_GOT_CON minister says.
	match DIRGE_GOT_CON The minister reminds you
	match DIRGE_GOT_CON The minister plucks a contract
	match DIRGE_STAIR referring
	match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
put ask minister for contract
	match QUIT [You're
	matchwait

DIRGE_STAND_PAUSE:
pause
DIRGE_STAND:
	match DIRGE_STAND_PAUSE roundtime
	match DIRGE_STAIR You stand back up.
	match DIRGE_STAND_PAUSE ...wait
	match DIRGE_STAND_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

DIRGE_GOT_CON:
	echo
	echo DIRGE_GOT_CON:
	echo
put speculate finesse stop
wait
move climb stair
pause
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you

goto CON_CHECK




DIRGE_STONE_CHECK:
	echo
	echo DIRGE_STONE_CHECK:
	echo
Put get my ledger
waitfor you
put open my ledger
waitfor open
put turn my ledger to chapter 1
waitfor "Zoluren Outposts"
put turn my ledger to page 7
waitfor entitled
	match DIRGE_CON_STONE Have a contracted trade
	match DIRGE_TO_STONE1 Have no contracts
	match DIRGE_TO_STONE1 Have a delinquent
put read ledge
	match QUIT [You're
	matchwait

DIRGE_CON_STONE:
	echo
	echo DIRGE_CON_STONE:
	echo
	match DIRGE_ARTHE_CHECK referring
	match DIRGE_TO_STONE1 The contract is printed
put look my stone contract
	match QUIT [You're
	matchwait

DIRGE_ARTHE_CHECK:
	echo
	echo DIRGE_ARTHE_CHECK:
	echo
put turn my ledger to page 5
waitfor entitled
	match DIRGE_CON_ARTHE Have a contracted trade
	match DIRGE_TO_ARTHE1 Have no contracts
	match DIRGE_TO_ARTHE1 Have a delinquent
put read ledge
	match QUIT [You're
	matchwait

DIRGE_CON_ARTHE:
	echo
	echo DIRGE_CON_ARTHE:
	echo
	match DIRGE_TO_CROSS1 referring
	match DIRGE_TO_ARTHE1 The contract is printed
put look my arthe contract
	match QUIT [You're
	matchwait

DIRGE_TO_STONE1:
save DIRGE_TO_STONE
goto DIRGE_DONE

DIRGE_TO_ARTHE1:
save DIRGE_TO_ARTHE
goto DIRGE_DONE

DIRGE_TO_CROSS1:
save DIRGE_TO_CROSS
goto DIRGE_DONE


DIRGE_DONE:
	echo
	echo DIRGE_DONE:
	echo
put turn ledger to chapter 5
wait
put turn ledger to page 1
wait
put study ledger
waitfor roundtime
pause
put close my ledger
waitfor you
put stow my ledger
wait
goto DIRGE_TO__OUT
DIRGE_TO__OUT_PAUSE:
pause
DIRGE_TO__OUT:
	match DIRGE_TO__STAND can't do that
	match DIRGE_TO__OUT2 obvious
	match DIRGE_TO__OUT_PAUSE ...wait
	match DIRGE_TO__OUT_PAUSE type ahead
put out
	match QUIT [You're
	matchwait
DIRGE_TO__PAUSE:
pause
DIRGE_TO__STAND:
	match DIRGE_TO__PAUSE roundtime
	match DIRGE_TO__OUT You stand back up.
	match DIRGE_TO__PAUSE ...wait
	match DIRGE_TO__PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

DIRGE_TO__OUT2:
IF_1 pause
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
move go gate
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move e
waitfor following you
move ne
waitfor following you
move se
waitfor following you
move e
waitfor following you
move sw
waitfor following you
move w
waitfor following you
move sw
waitfor following you
move w
waitfor following you
move go road
waitfor following you
goto %s


DIRGE_TO_ARTHE:
put tell caravan lead to arthe dale
save J_AT_ARTHE_STONE
waitfor you
put tell caravan go fast
waitfor you
goto PATTERN

J_AT_ARTHE_STONE:
save AT_ARTHE_STONE
goto ORIGAMI

DIRGE_TO_STONE:
save AT_STONE_DIRGE
put tell caravan lead to stone clan
waitfor you
put tell caravan go fast
waitfor you
goto PATTERN


DIRGE_TO_CROSS:
put tell caravan lead to crossing
save J_AT_CROSS
waitfor you
put tell caravan go fast
waitfor you
goto PATTERN

J_AT_CROSS:
save AT_CROSS

goto ORIGAMI


I_CARA_CHECK:
	echo
	echo I_CARA_CHECK:
	echo
	match I_HAVE_CARA inventory report
	match I_BEGIN referring
	match I_OTHER_CHECK belonging to
put look caravan
	match I_QUIT [You're
	matchwait

I_OTHER_CHECK:
pause
	match I_HAVE_CARA inventory report
	match I_BEGIN referring
	match I_OTHER_CHECK1 belonging to
put look other caravan
	match I_QUIT [You're
	matchwait

I_OTHER_CHECK1:
pause
	match I_HAVE_CARA inventory report
	match I_BEGIN referring
	match I_OTHER_CHECK2 belonging to
put look third caravan
	match I_QUIT [You're
	matchwait

I_OTHER_CHECK2:
pause
	match I_HAVE_CARA inventory report
	match I_BEGIN referring
	match I_OTHER_CHECK3 belonging to
put look fourth caravan
	match I_QUIT [You're
	matchwait

I_OTHER_CHECK3:
pause
	match I_HAVE_CARA inventory report
	match I_BEGIN referring
	match I_OTHER_CHECK4 belonging to
put look fifth caravan
	match I_QUIT [You're
	matchwait

I_OTHER_CHECK4:
pause
	match I_HAVE_CARA inventory report
	match I_BEGIN referring
	match I_OTHER_CHECK5 belonging to
put look sixth caravan
	match I_QUIT [You're
	matchwait

I_OTHER_CHECK5:
pause
	match I_HAVE_CARA inventory report
	match I_BEGIN referring
	match I_OTHER_CHECK6 belonging to
put look seventh caravan
	match I_QUIT [You're
	matchwait

I_OTHER_CHECK6:
pause
	match I_HAVE_CARA inventory report
	match I_BEGIN referring
	match I_OTHER_CHECK7 belonging to
put look eighth caravan
	match I_QUIT [You're
	matchwait

I_OTHER_CHECK7:
pause
	match I_HAVE_CARA inventory report
	match I_BEGIN referring
	match I_BEGIN belonging to
put look ninth caravan
	match I_QUIT [You're
	matchwait

I_UNKNOWN_CARA:
save I_HAVE_CARA
	match I_UNKNOWN_CARA1 but the driver turns back
	match HIDE does your bidding.
put tell caravan lead to crossing
	matchwait

I_UNKNOWN_CARA1:
	match I_UNKNOWN_CARA2 but the driver turns back
	match HIDE does your bidding.
put tell caravan lead to Riverhaven
	matchwait

I_UNKNOWN_CARA2:
	match I_UNKNOWN_CARA3 but the driver turns back
	match HIDE does your bidding.
put tell caravan lead to leth
	matchwait

I_UNKNOWN_CARA3:
	match NO_GO but the driver turns back
	match HIDE does your bidding.
put tell caravan lead to gondola
	matchwait

I_HAVE_CARA:
	echo
	echo I_HAVE_CARA:
	echo
put tell caravan to follow
waitfor you
	match I_AT_DIRGE North Roads Caravansary
	match I_AT_CROSS Northeast Wilds, Outside Northeast Gate
	match I_CROSS_OUT_CARA The Crossing, Commerce Avenue
	match I_GO_FERRY_CARA The Crossing, Alfren's Ferry
	match I_GO_FERRY_CARA1 Sparse grass, weeds and a few hardy shrubs
	match I_GO_FERRY_CARA Southern Trade Route, Segoltha South Bank
	match I_OFF_RIVER_FERRY Riverhaven, Ferry Dock
	match I_AT_RIVER the Trader's Guild as it passes through
	match I_AT_LETH_CARA Southern Trade Route, Outside Leth Deriel
	match I_AT_LETH_CARA2 Deobar Bower Gate, Esouvar Deriel
	match I_AT_RIVER and the Trader's Guild as it passes
	match I_GO_FERRY_CARA ferry
	match I_LETH_GON stable as a faenrae reaver on samatak
	match I_GO_FERRY_CARA Long, wide, and low
	match I_GO_FERRY_CARA low riding barge
	match I_SHA_GON_CARA Two massive granite pillars offer
	match I_GON_SHA_CARA Two side-by-side granite beams rise up
	match I_GON_NF Gondola, Cab North
	match I_GON_SF Gondola, Cab South
	match I_SHARD_OUT2_CARA The courtyard of Brickwell Tower stretches beyond the keep's curved archway
	match I_SHARD_OUT_CARA Brickwell Tower, Courtyard
	match I_UNKNOWN_CARA obvious
put look
	match QUIT [You're
	matchwait

I_LETH_GON:
move climb platform
waitfor following you
I_GON_SHA_CARA:
	echo
	echo I_GON_SHA_CARA:
	echo
	match I_GON_SHA The Contract
	match I_SHA_GON_OFF1 referring
put look my shard con
	matchwait

I_SHA_GON_CARA:
	echo
	echo I_SHA_GON_CARA:
	echo
	match I_SHA_GOND_2 The Contract
	match I_SHA_GON referring
put look my shard con
	matchwait

I_GON_NF:
put rem feed
wait
put give cara
wait
put wear feed

I_GON_N_CHECK:
	echo
	echo I_GON_N_CHECK:
	echo
	match I_GON_CAB_N referring
	match I_GON_NS The Contract
put look my shard con
	matchwait

I_GON_SF:
put rem feed
wait
put give cara
wait
put wear feed

I_GON_S_CHECK:
	echo
	echo I_GON_S_CHECK:
	echo
	match I_GON_SN referring
	match I_GON_CAB_S The contract
put look my shard con
	matchwait

I_GON_SN:
put tell caravan follow
move n
goto I_GON_CAB_N

I_GON_NS:
put tell caravan follow
move s
goto I_GON_CAB_S


I_GON_CAB_N_PAUSE:
pause
I_GON_CAB_N:
	match I_GON_CAB_N_WAIT Eh?
	match I_GON_CAB_N_WAIT You blend
	match I_GON_CAB_N_WAIT You melt into the background
	match I_GON_CAB_N_WAIT glance at you as you hide.
	match I_GON_CAB_N_WAIT ruining your hiding place!
	match I_GON_CAB_N_PAUSE roundtime
	match I_GON_CAB_N_PAUSE ...wait
	match I_GON_CAB_N_PAUSE type ahead
put hide
	match I_QUIT [You're
	matchwait

I_GON_CAB_N_WAIT:
	match I_GON_CAB_N_OFF With a soft bump, the gondola
	match I_GON_CAB_N_OFF_EXP YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	match I_QUIT [You're
	matchwait


I_GON_CAB_N_OFF:
	match I_SHA_TO_LETH_GON_SKILL you can't
	match I_GOND_SHA obvious
put out
	matchwait

I_GON_CAB_N_OFF_EXP:
put skill
goto I_GON_CAB_N_WAIT

I_GON_CAB_S_PAUSE:
pause
I_GON_CAB_S:
	match I_GON_CAB_S_WAIT Eh?
	match I_GON_CAB_S_WAIT You blend
	match I_GON_CAB_S_WAIT You melt into the background
	match I_GON_CAB_S_WAIT glance at you as you hide.
	match I_GON_CAB_S_WAIT ruining your hiding place!
	match I_GON_CAB_S_PAUSE roundtime
	match I_GON_CAB_S_PAUSE ...wait
	match I_GON_CAB_S_PAUSE type ahead
put hide
	match I_QUIT [You're
	matchwait

I_GON_CAB_S_WAIT:
	match I_GON_CAB_S_OFF With a soft bump, the gondola
	match I_GON_CAB_S_OFF_EXP YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	match I_QUIT [You're
	matchwait

I_GON_CAB_S_OFF_EXP:
put skill
goto I_GON_CAB_S_WAIT

I_GON_CAB_S_OFF:
	match I_LETH_TO_SHA_GON_SKILL you can't
	match I_SHA_GOND obvious
put out
	matchwait



I_BEGIN:
	echo
	echo I_BEGIN:
	echo
	match I_HOME_IN Malific's Home
	match I_HOME_OUT Willow Walk, Garden Path
	match I_CROSS_GATE Northeast Wilds, Outside Northeast Gate
	match I_CROSS_BANK_OUT The Crossing, Hodierna Way
	match I_CROSS_BANK_IN First Provincial Bank
	match I_CROSS_BANK_IN2 Provincial Bank, Teller
	match I_CROSS_OUT The Crossing, Commerce Avenue
	match I_CROS_CARA Traders' Guild, Shipment Center
	match I_RIVER_CARA Traders' Guild, Shipping Dock
	match I_RIV_OUT the Trader's Guild as it passes through
	match I_RIV_IN Riverhaven, Traders' Guild Lobby
	match I_RIV_IN1 Traders' Guild, Foreign Trade Office
	match I_RIV_BANK_OUT patrons passing through its wide portals
	match I_RIV_BANK_IN1 Bank of Riverhaven, Main Lobby
	match I_RIV_BANK_IN Bank of Riverhaven, Teller
	match I_RIV_FERRY Riverhaven, Ferry Dock
	match I_SHARD_OUT2 The courtyard of Brickwell Tower stretches beyond the keep's curved archway
	match I_SHARD_OUT The gleaming white stone walls that surround Brickwell Tower
	match I_SHARD_IN The grand entrance hall of the Trader's Guild is tastefully decorated
	match I_SHARD_IN2 A no-nonsense businesswoman, the Provincial Broker's office
	match I_SHARD_CARA The vast dispatch chamber is filled with frantic activity as caravan after caravan
	match I_SHARD_BANK_OUT mountains, the domed building is Elothean in design and
	match I_SHARD_BANK_IN Shard, First Bank of Ilithi
	match I_SHARD_BANK_IN2 First Bank of Ilithi, Teller's Windows
	match I_SHARD_BANK_INB First Bank of Ilithi, Coin Exchange
put look
	matchwait


I_SHARD_IN3:
move out
goto I_SHARD_IN

I_SHARD_OUT2:
put go tower
I_SHARD_OUT:
move go arch
I_SHARD_IN:
move w
I_SHARD_IN2:
I_SHARD_CARA:
	echo
	echo I_SHARD_CARA:
	echo
	match I_NEED_MONEYS don't have enough money
	match I_SHARD_BANK pay the clerk
	match I_SHARD_BANK the clerk says.
put rent caravan
	match QUIT [You're
	matchwait

I_SHARD_BANK_INB:
put w
goto I_SHARD_BANK_IN

I_NEED_MONEYS:
	echo
	echo I_NEED_MONEYS:
	echo
put east
move out
put out
move nw
put w
move w
put w
move w
put sw
move sw
put sw
move s
put e
move e
put e
move e
I_SHARD_BANK_OUT:
put go bank
I_SHARD_BANK_IN:
move n
I_SHARD_BANK_IN2:
put with 400 cop
move s
move out
put w
move w
put w
move w
put n
move ne
put ne
move ne
put e
move e
put e
move e
put se
goto I_SHARD_OUT2


I_RIV_FERRY:
move go ramp
put go arch
move nw
goto I_RIV_OUT

I_RIV_IN1:
move w
I_RIV_IN:
move out
goto I_RIV_OUT


I_NEED_MONEYR:
move out
put ne
move n
put n
I_RIV_BANK_OUT:
move go bank
I_RIV_BANK_IN1:
put go arch
I_RIV_BANK_IN:
put with 400 cop
move go arch
put out
move s
put s
move sw
I_RIV_OUT:
move go alley
I_RIVER_CARA:
	echo
	echo I_RIVER_CARA:
	echo
	match I_NEED_MONEYR don't have enough money
	match I_RIV_TO_BANK pay the clerk
	match I_RIV_TO_BANK the clerk says.
put rent caravan
	match QUIT [You're
	matchwait

I_RIV_TO_BANK:
move out
goto I_AT_RIVER

I_CROSS_GATE:
	echo
	echo CROSS_GATE:
	echo
move go gate
put w
move w
put w
move s
put s
move w
put s
move w
put w
move w
put w
move w
put w
move go bri
put s
move se
put sw
move s
put s
move s
put w
I_CROSS_OUT:
move go door
I_CROS_CARA:
	echo
	echo I_CROS_CARA:
	echo
	match I_NEED_MONEYC don't have enough money
	match I_CROSS_TO_BANK pay the clerk
	match I_CROSS_TO_BANK the clerk says.
put rent caravan
	match QUIT [You're
	matchwait

I_HOME_IN:
put stand
wait
put unlock door
wait
put open door
wait
move go door
put close red cot
wait
put lock red cot
wait
I_HOME_OUT:
move w
put w
move w
put w
move go gate
put s
move e
put s
move w
put w
move s
put s
move s
put s
move s
put s
move se
put go bank
move go wind
goto I_CROSS_BANK_IN2

I_NEED_MONEYC:
move e
put e
move go side door
put go foyer
move out
put out
move e
put e
move e
put se
move e
put s
move s
put go bridge
move ne
I_CROSS_BANK_OUT:
move go bank
I_CROSS_BANK_IN:
move go wind
I_CROSS_BANK_IN2:
put with 400 cop
move out
put out
move sw
put go bri
move sw
put w
move w
put w
move w
put nw
move n
put n
move n
move go door
save I_DEST_CHECK
goto I_CROS_CARA

I_BANK_DIRGE:
save I_DEST_CHECK
goto I_CROSS_TO_BANK

I_BANK_LETH:
save I_DEST_CHECK
goto I_CROSS_TO_BANK

I_CROSS_OUT_CARA:
move go door

I_CROSS_TO_BANK:
save I_DEST_CHECK
move e
put e
move go side door
put go foyer
move out
put out
move e
put e
move e
put se
move e
put s
move s
put go bridge
move ne
put go bank
move go wind
put dep all
waitfor you
put bala
waitfor you
counter set %zTcoin
goto I_WITHDRAW

I_WITHDRAW_PAUSE:
counter subtract 25
pause
I_WITHDRAW:
	match I_BANK_DONE and hands them over
	match I_BANK_DONE The clerk asks
	match I_BANK_DONE The clerk exclaims
	match I_WITHDRAW_PAUSE The clerk tells you,
put withdraw %c %zTcurrency
	match QUIT [You're
	matchwait

I_BANK_DONE:
move out
put out
move sw
put go bri
move n
put n
move w
put nw
move w
put w
move w
put go guild
move go auction foyer
put go hall
move go side door
put w
move w
goto I_CROSS


I_CROSS:
	echo
	echo I_CROSS:
	echo
I_CROSS1:
pause
	match I_CROSS_GIVE_CON you get
	match I_CROSS_GET_CON1 referring
put get my cross contract
	match I_QUIT [You're
	matchwait

I_CROSS_GIVE_CON:
	echo
	echo I_CROSS_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto I_CROSS1

I_CROSS_GET_CON1:
pause
put pay clerk gold
wait
I_CROSS_E:
	match I_CROSS_STAND can't do that
	match I_CROSS_GET_CON obvious
put n
	matchwait

I_CROSS_GET_CON:
	echo
	echo I_CROSS_GET_CON:
	echo
put speculate finesse
wait
	match I_CROSS_GOT_CON broker says.
	match I_CROSS_GOT_CON The broker reminds you
	match I_CROSS_GOT_CON The broker plucks a contract
	match I_CROSS_E referring
put ask broker for contract
	match I_QUIT [You're
	matchwait

I_CROSS_STAND_PAUSE:
pause
I_CROSS_STAND:
	match I_CROSS_STAND_PAUSE roundtime
	match I_CROSS_E You stand back up.
	match I_CROSS_STAND_PAUSE ...wait
	match I_CROSS_STAND_PAUSE type ahead
put stand
	match I_QUIT [You're
	matchwait

I_CROSS_GOT_CON:
	echo
	echo I_CROSS_GOT_CON:
	echo
put speculate finesse stop
wait
put read con
move s
pause
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you

I2_CROSS_TO_BANK:
move e
put e
move go side door
put go foyer
move out
put out
move e
put e
move e
put se
move e
put s
move s
put go bridge
move ne
put go bank
move go wind
put dep all
waitfor you
put bala
waitfor you
goto I2_WITHDRAW

I2_WITHDRAW_PAUSE:
counter subtract 25
pause
I2_WITHDRAW:
	match I2_BANK_X and hands them over
	match I2_BANK_X The clerk asks
	match I2_BANK_X The clerk exclaims
	match I2_WITHDRAW_PAUSE The clerk tells you,
put withdraw 1000 copper
	match QUIT [You're
	matchwait

I2_BANK_X:
move out
move go booth
put exchange 500 cop kro for lir
waitfor you

I2_BANK_DONE:
move out
put out
move sw
put go bri
move n
put n
move w
put nw
move w
put w
move w
put go guild
move go auction foyer
put go hall
move go side door
move w
move w
goto CON_CHECK


I_DEST_CHECK:
	match I_CROSS_TO_READ referring
	match I_CROSS_TO_LETH The contract is printed
put look my second shard contract
	match I_QUIT [You're
	matchwait

I_CROSS_TO_READ:
	match I_CROSS_TO_DROP expired
	match I_CROSS_TO_DIRGE referring
	match I_CROSS_TO_DIRGE andaen
	match I_CROSS_TO_DIRGE andu
	match I_CROSS_TO_DIRGE 11 anlaen
	match I_CROSS_TO_DIRGE 10 anlaen
	match I_CROSS_TO_DIRGE 9 anlaen
	match I_CROSS_TO_DIRGE 8 anlaen
	match I_CROSS_TO_DIRGE 7 anlaen
	match I_CROSS_TO_DIRGE 6 anlaen
	match I_CROSS_TO_DIRGE 5 anlaen
	match I_CROSS_TO_LETH 4 anlaen
	match I_CROSS_TO_LETH 3 anlaen
	match I_CROSS_TO_LETH 2 anlaen
	match I_CROSS_TO_LETH anlas
put read my shard con
	matchwait

I_CROSS_TO_DROP:
put get my shard con
wait
put drop my shard con
wait
goto I_CROSS_TO_READ


I_CROSS_TO_DIRGE:
	echo
	echo I_CROSS_TO_DIRGE:
	echo
goto I_CROSS_TO_DIRGE_OUT

I_CROSS_TO_DIRGE_OUT_PAUSE:
pause
I_CROSS_TO_DIRGE_OUT:
	match I_CROSS_TO_DIRGE_STAND can't do that
	match I_CROSS_TO_DIRGE_OUT2 obvious
	match I_CROSS_TO_DIRGE_OUT_PAUSE ...wait
	match I_CROSS_TO_DIRGE_OUT_PAUSE type ahead
put out
	match I_QUIT [You're
	matchwait
I_CROSS_TO_DIRGE_PAUSE:
pause
I_CROSS_TO_DIRGE_STAND:
	match I_CROSS_TO_DIRGE_PAUSE roundtime
	match I_CROSS_TO_DIRGE_OUT You stand back up.
	match I_CROSS_TO_DIRGE_PAUSE ...wait
	match I_CROSS_TO_DIRGE_PAUSE type ahead
put stand
	match I_QUIT [You're
	matchwait

I_CROSS_TO_DIRGE_OUT2:
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
put tell caravan lead to dirge
waitfor you
save I_CROSS_TO_DIRGE_SKILL1
goto PATTERN

I_CROSS_TO_DIRGE_SKILL1:
SAVE I_CROSS_TO_DIRGE_SKILL2
goto APPRAISE

I_CROSS_TO_DIRGE_SKILL2:
save I_AT_DIRGE2
goto ORIGAMI


I_AT_DIRGE:
	echo **
	echo ** I_AT_DIRGE
	echo **
	match I_AT_DIRGE1_RIV referring
	match I_AT_DIRGE2 The contract
put look my river contract
	matchwait

I_AT_DIRGE1_RIV:
put get my ledger
waitfor you
put open my ledger
waitfor you
put turn my ledger to chap 2
waitfor entitled
put turn my ledger to page 1
waitfor which is
	match I_AT_DIRGE1 Have a contracted trade out with this guild.
	match I_AT_DIRGE2_RIV Have no contracts pending with this guild.
put read my ledge
	matchwait

I_AT_DIRGE2_RIV:
put close my ledger
waitfor you
put stow my ledger
waitfor you
goto I_AT_DIRGE2

I_AT_DIRGE1:
save I_DIRGE_TO_CROSS
goto 2FORAGE

I_AT_DIRGE2:
save I_TO_RIVER
goto 2FORAGE

I_TO_RIVER:
put tell caravan lead to Riverhaven
save I_DIRGE_TO_RIVER_SKILL1
goto JUGGLE

I_DIRGE_TO_RIVER_SKILL1:
save I_DIRGE_TO_RIVER_SKILL2
goto APPRAISE

I_DIRGE_TO_RIVER_SKILL2:
save I_TO_RIVER_FERRY
goto HIDE

I_TO_RIVER_FERRY:
put tell caravan follow
wait
save I_FERRY
goto FERRY



I_OFF_RIVER_FERRY:
	echo
	echo I_OFF_RIVER_FERRY:
	echo
move go ramp
waitfor following you
move go arch
waitfor following you
move nw
waitfor following you



I_AT_RIVER:
	echo
	echo I_AT_RIVER:
	echo
put tell caravan wait
wait
move ne
put n
move n
put go bank
move go arch
put dep all
waitfor you
put bala
waitfor you
counter set %zTcoin
goto I_RIVER_WITHDRAW

I_RIVER_WITHDRAW_PAUSE:
counter subtract 25
pause
I_RIVER_WITHDRAW:
	match I_RIVER_BANK_DONE and hands them over
	match I_RIVER_BANK_DONE The clerk asks
	match I_RIVER_BANK_DONE The clerk exclaims
	match I_RIVER_WITHDRAW_PAUSE The clerk tells you,
put withdraw %c %zTcurrency
	match QUIT [You're
	matchwait

I_RIVER_BANK_DONE:
move go arch
move out
move s
put s
move sw
move go alley


I_RIVER:
save I_RIV_BANK
	echo
	echo I_RIVER:
	echo
I_RIVER1:
	match I_RIVER_GIVE_CON you get
	match I_RIVER_GET_CON1 referring
put get my river contract
	match I_QUIT [You're
	matchwait

I_RIVER_GIVE_CON:
	echo
	echo I_RIVER_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto I_RIVER1

I_RIVER_GET_CON1:
put pay clerk gold
wait
I_RIVER_GUILD:
move out
put go guild
move e
pause
put speculate finesse
wait
I_RIVER_GET_CON:
	echo
	echo I_RIVER_GET_CON:
	echo
	match I_RIVER_GOT_CON broker says.
	match I_RIVER_GOT_CON The broker reminds you
	match I_RIVER_GOT_CON The broker plucks a contract
put ask broker for contract
	match I_QUIT [You're
	matchwait

I_RIVER_GOT_CON:
	echo
	echo I_RIVER_GOT_CON:
	echo
put speculate finesse stop
wait
put read con
wait
move w
put out
move go alley
pause
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
save I_RIV_BANK
goto CON_CHECK

I_RIV_BANK:
move out
put ne
move n
put n
move go bank
move go arch
put dep all
waitfor you
put balance
waitfor you
put with 400 cop
wait
move go arch
move out
move s
put s
move sw
put tell caravan to follow
waitfor you
put tell caravan go fast
waitfor you
move go pier
waitfor following you
move go arch
waitfor following you
move go ramp
waitfor following you
save I_FERRY
goto FERRY

I_OFF_DIRGE_FERRY:
	echo
	echo I_OFF_DIRGE_FERRY:
	echo
move s
waitfor following you
put tell caravan lead to dirge
waitfor you
save I_RIVER_TO_DIRGE
goto JUGGLE

I_RIVER_TO_DIRGE:
	echo
	echo I_RIVER_TO_DIRGE:
	echo
save I_RIVER_TO_DIRGE_SKILL
goto ORIGAMI

I_RIVER_TO_DIRGE_SKILL:
	echo
	echo I_RIVER_TO_DIRGE_SKILL:
	echo
save I_AT_RIVER_DIRGE
goto HIDE

I_AT_RIVER_DIRGE:
	echo
	echo I_ATT_RIVER_DIRGE:
	echo
save I_DIRGE_TO_CROSS
goto 2FORAGE

I_DIRGE_TO_CROSS:
	echo
	echo I_DIRGE_TO_CROSS:
	echo
put tell caravan lead to crossing
save I_DIRGE_TO_CROSS_SKILL1
goto PATTERN

I_DIRGE_TO_CROSS_SKILL1:
SAVE I_DIRGE_TO_CROSS_SKILL2
goto APPRAISE

I_DIRGE_TO_CROSS_SKILL2:
save I_AT_CROSS
goto ORIGAMI


I_AT_CROSS:
	echo
	echo I_AT_CROSS:
	echo
put tell caravan follow
waitfor you
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait

goto I_AT_CROSS_F
I_AT_CROSS_F_SHIFT:

I_AT_CROSS_F:
	match I_NOT_CROSS obvious
	match I_NOT_CROSS1 can't
	match I_NOT_CROSS1 referring
	match I_AT_CROSS2 The Crossing, Northeast Customs
put go gate
	match I_QUIT [You're
	matchwait

I_NOT_CROSS:
waitfor following you
put go gate
waitfor following you
I_NOT_CROSS1:
put tell caravan lead to crossing
waitfor you
goto HIDE


I_AT_CROSS2:
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move s
waitfor following you
move s
waitfor following you
move w
waitfor following you
move s
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move go bri
waitfor following you
move s
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move w
waitfor following you
move go door
goto I_BANK_LETH


I_CROSS_TO_LETH:
	echo
	echo I_CROSS_TO_LETH:
	echo
goto I_CROSS_TO_LETH_OUT
I_CROSS_TO_LETH_OUT_PAUSE:
pause
I_CROSS_TO_LETH_OUT:
	match I_CROSS_TO_LETH_STAND can't do that
	match I_CROSS_TO_LETH_OUT2 obvious
	match I_CROSS_TO_LETH_OUT_PAUSE ...wait
	match I_CROSS_TO_LETH_OUT_PAUSE type ahead
put out
	match I_QUIT [You're
	matchwait
I_CROSS_TO_LETH_PAUSE:
pause
I_CROSS_TO_LETH_STAND:
	match I_CROSS_TO_LETH_PAUSE roundtime
	match I_CROSS_TO_LETH_OUT You stand back up.
	match I_CROSS_TO_LETH_PAUSE ...wait
	match I_CROSS_TO_LETH_PAUSE type ahead
put stand
	match I_QUIT [You're
	matchwait

I_CROSS_TO_LETH_OUT2:
put tell caravan to follow
waitfor you
put tell caravan go fast
waitfor you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move go pier
waitfor following you
save I_FERRY
goto FERRY


I_OFF_LETH_FERRY:
	echo
	echo I_OFF_LETH_FERRY:
	echo
I_OFF_LETH_FERRY1:
I_OFF_LETH_FERRY11:
put tell caravan lead to leth deriel
save I_LETH_ORIGAMI
goto JUGGLE

I_LETH_ORIGAMI:
save I_AT_LETH
goto ORIGAMI


I_AT_LETH_CARA2:
	echo **
	echo ** I_AT_LETH_CARA2:
	echo **
	match I_AT_LETH2 The Contract
	match I_SHARD_AT_LETH referring
put look my shard contract
	matchwait


I_AT_LETH_CARA:
	echo **
	echo ** I_AT_LETH_CARA:
	echo **
	match I_AT_LETH The contract
	match I_AT_SHA_LETH referring
put look my shard contract
	matchwait

I_AT_LETH:
	echo
	echo I_AT_LETH:
	echo
put tell caravan follow
waitfor you
I_AT_LETH_GATE:
move go gate
waitfor following you
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait

goto I_LETH_TO_GOND

I_LETH_TO_GOND_SHIFT:
shift
shift
I_LETH_TO_GOND:
move se
waitfor following you
move sw
waitfor following you
move sw
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move s
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move go gate
waitfor following you
I_AT_LETH2:
put tell caravan lead to gondola

I_LETH_TO_SHA_SKILL1:
save I_LETH_TO_SHA_SKILL2
goto APPRAISE

I_LETH_TO_SHA_SKILL2:
save I_GON_SHA2
goto ORIGAMI

I_GON_SHA2:
save I_GON_SHA1
goto HIDE

I_GON_SHA1:
move climb platform
waitfor following you
goto I_GON_SHA

I_GON_SHA_PAUSE:
pause 10
I_GON_SHA:
	echo
	echo I_GON_SHA:
	echo
match I_GON_SHA_ON [Gondola
match I_GON_SHA_HIDE There is no
match I_GON_SHA_PAUSE There are already too many caravans on the wooden gondola
put go gondola
matchwait

I_GON_SHA_HIDE_PAUSE:
pause
I_GON_SHA_HIDE:
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
	match I_GON_SHA_WAIT1 Eh?
	match I_GON_SHA_WAIT1 You blend
	match I_GON_SHA_WAIT1 You melt into the background
	match I_GON_SHA_WAIT1 glance at you as you hide.
	match I_GON_SHA_WAIT1 ruining your hiding place!
	match I_GON_SHA_HIDE_PAUSE roundtime
	match I_GON_SHA_HIDE_PAUSE ...wait
	match I_GON_SHA_HIDE_PAUSE type ahead
	match I_GON_SHA pulls into the dock
put hide
	match I_QUIT [You're
	matchwait

I_GON_SHA_WAIT1:
waitfor The gondola stops on the platform
goto I_GON_SHA

I_GON_SHA_ON:
waitfor following you
put south
waitfor following you
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
I_LETH_TO_SHA_GON_SKILL:
save I_LETH_TO_SHA_GON_SKILL1
goto GON_ORIGAMI

I_LETH_TO_SHA_GON_SKILL1:
save I_LETH_TO_SHA_GON_SKILL2
goto GON_ORIGAMI

I_LETH_TO_SHA_GON_SKILL2:
save I_LETH_TO_SHA_GON_SKILL3
goto I_PATTERN

I_LETH_TO_SHA_GON_SKILL3:
save I_LETH_TO_SHA_GON_SKILL4
goto PLAY

I_LETH_TO_SHA_GON_SKILL4:
save I_GON_SHA_WAIT_HIDE
goto APPRAISE


I_GON_SHA_WAIT_HIDE_PAUSE:
pause
I_GON_SHA_WAIT_HIDE:
	match I_GON_SHA_WAIT Eh?
	match I_GON_SHA_WAIT You blend
	match I_GON_SHA_WAIT You melt into the background
	match I_GON_SHA_WAIT glance at you as you hide.
	match I_GON_SHA_WAIT ruining your hiding place!
	match I_GON_SHA_WAIT_HIDE_PAUSE roundtime
	match I_GON_SHA_WAIT_HIDE_PAUSE ...wait
	match I_GON_SHA_WAIT_HIDE_PAUSE type ahead
	match I_GON_SHA_OFF With a soft bump, the gondola
put hide
	match I_QUIT [You're
	matchwait

I_GON_SHA_WAIT_SHIFT:
shift
shift
I_GON_SHA_OFF_EXP:
put skill
I_GON_SHA_WAIT_PAUSE:
pause
I_GON_SHA_WAIT:
	match I_GON_SHA_OFF With a soft bump, the gondola
	match I_GON_SHA_OFF_EXP YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	match I_QUIT [You're
	matchwait

I_GON_SHA_OFF:
move out
I_SHA_GOND:
waitfor following you
goto I_SHA_GOND_2
I_SHA_GOND_2A:
put tell caravan follow
wait
I_SHA_GOND_2:
	match I_SHA_GON_OFF1 What were you referring to?
	match I_SHA_GOND_3 following you
put go frame
	matchwait
I_SHA_GOND_3:
move go door
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move se
waitfor following you
move go path
waitfor following you
move sw
waitfor following you
move w
waitfor following you
move w
waitfor following you
move sw
waitfor following you
move w
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move sw
waitfor following you
move s
waitfor following you
save I_SHA_FOR
goto 2FORAGE

I_SHA_FOR:
	echo
	echo I_SHA_FOR:
	echo
move sw
waitfor following you
move sw
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move w
waitfor following you
move w
waitfor following you
move sw
waitfor following you
move w
waitfor following you
move w
waitfor following you
move s
waitfor following you
move s
waitfor following you
move se
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
put open gate
move go gate
waitfor following you
move e
waitfor following you
move e
waitfor following you
move se
waitfor following you
I_SHARD_OUT2_CARA:
move go tower
waitfor following you
I_SHARD_OUT_CARA:
move go arch
move w

I_SHARD:
	echo
	echo I_SHARD:
	echo
I_SHARD1:
pause
	match I_SHARD_GIVE_CON you get
	match I_SHARD_BANK referring
put get my shard contract
	match I_QUIT [You're
	matchwait

I_SHARD_GIVE_CON:
	echo
	echo I_SHARD_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto I_SHARD1

I_SHARD_BANK:
pause
put pay clerk gold
wait
I_SHARD_E:
	match I_SHARD_STAND can't do that
	match I_SHARD_W can't go there
	match I_SHARD_BANK2 obvious
put e
	matchwait

I_SHARD_W:
	match I_SHARD_STAND can't do that
	match I_SHARD_GET_CON obvious
put w
	matchwait

I_SHARD_BANK2:
move out
put tell caravan wait
wait
move out
put nw
move w
put w
move w
put w
move sw
put sw
move sw
put s
move e
put e
move e
put e
move go bank
put n
put dep all
waitfor you
put bala
waitfor you
counter set %zTcoin
goto I_SHARD_WITHDRAW

I_SHARD_WITHDRAW_PAUSE:
counter subtract 25
pause
I_SHARD_WITHDRAW:
	match I_SHARD_BANK_DONE and hands them over
	match I_SHARD_BANK_DONE The clerk asks
	match I_SHARD_BANK_DONE The clerk exclaims
	match I_SHARD_WITHDRAW_PAUSE The clerk tells you,
put withdraw %c %zTcurrency
	match QUIT [You're
	matchwait

I_SHARD_BANK_DONE:
move s
put out
move w
put w
move w
put w
move n
put ne
move ne
put ne
move e
put e
move e
put e
move se
put go tower
move go arch

I_SHARD_GET_CON:
	echo
	echo I_SHARD_GET_CON:
	echo
move go ivory door
put speculate finesse
wait
	match I_SHARD_GOT_CON broker says.
	match I_SHARD_GOT_CON The broker reminds you
	match I_SHARD_GOT_CON The broker plucks a contract
	match I_SHARD_E referring
put ask broker for contract
	match I_QUIT [You're
	matchwait

I_SHARD_STAND_PAUSE:
pause
I_SHARD_STAND:
	match I_SHARD_STAND_PAUSE roundtime
	match I_SHARD_E You stand back up.
	match I_SHARD_STAND_PAUSE ...wait
	match I_SHARD_STAND_PAUSE type ahead
put stand
	match I_QUIT [You're
	matchwait

I_SHARD_GOT_CON:
	echo
	echo I_SHARD_GOT_CON:
	echo
put speculate finesse stop
wait
put read con
move out
move w
pause
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
save I_SHA_BANK
goto CON_CHECK



I_SHA_BANK:
move e
put out
move out
put nw
move w
put w
move w
put w
move sw
put sw
move sw
put s
move e
put e
move e
put e
move go bank
move n
put dep all
waitfor you
put bala
waitfor you
put with 500 cop
move s
move e
put exchange all dok for kro
move w
put out
move w
put w
move w
put w
move n
put ne
move ne
put ne
move e
put e
move e
put e
move se
move go tower
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
move out
waitfor following you
move nw
waitfor following you
move w
waitfor following you
move w
waitfor following you
put open gate
move go gate
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move n
waitfor following you
move e
waitfor following you
move e
waitfor following you
move ne
waitfor following you
move e
waitfor following you
move e
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move e
waitfor following you
move ne
waitfor following you
move e
waitfor following you
move e
waitfor following you
move ne
waitfor following you
move go path
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move go door
waitfor following you
move go frame
waitfor following you
goto I_SHA_GON

I_SHA_GON_PAUSE:
pause 10
I_SHA_GON:
	echo
	echo I_SHA_GON:
	echo
match I_SHA_GON_ON [Gondola
match I_SHA_GON_HIDE There is no
match I_SHA_GON_PAUSE There are already too many caravans on the wooden gondola
put go gondola
matchwait

I_SHA_GON_HIDE_PAUSE:
pause
I_SHA_GON_HIDE:
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
	match I_SHA_GON_WAIT1 Eh?
	match I_SHA_GON_WAIT1 You blend
	match I_SHA_GON_WAIT1 You melt into the background
	match I_SHA_GON_WAIT1 glance at you as you hide.
	match I_SHA_GON_WAIT1 ruining your hiding place!
	match I_SHA_GON_HIDE_PAUSE roundtime
	match I_SHA_GON_HIDE_PAUSE ...wait
	match I_SHA_GON_HIDE_PAUSE type ahead
	match I_SHA_GON pulls into the dock
put hide
	match I_QUIT [You're
	matchwait

I_SHA_GON_WAIT1:
waitfor The gondola stops on the platform
goto I_SHA_GON

I_SHA_GON_ON:
waitfor following you
move north
waitfor following you
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
I_SHA_TO_LETH_GON_SKILL:
save I_SHA_TO_LETH_GON_SKILL1
goto GON_ORIGAMI

I_SHA_TO_LETH_GON_SKILL1:
save I_SHA_TO_LETH_GON_SKILL2
goto GON_ORIGAMI

I_SHA_TO_LETH_GON_SKILL2:
save I_SHA_TO_LETH_GON_SKILL3
goto I_PATTERN

I_SHA_TO_LETH_GON_SKILL3:
save I_SHA_TO_LETH_GON_SKILL4
goto PLAY

I_SHA_TO_LETH_GON_SKILL4:
save I_SHA_GON_WAIT_HIDE
goto APPRAISE


I_SHA_GON_WAIT_HIDE_PAUSE:
pause
I_SHA_GON_WAIT_HIDE:
	match I_SHA_GON_WAIT Eh?
	match I_SHA_GON_WAIT You blend
	match I_SHA_GON_WAIT You melt into the background
	match I_SHA_GON_WAIT glance at you as you hide.
	match I_SHA_GON_WAIT ruining your hiding place!
	match I_SHA_GON_WAIT_HIDE_PAUSE roundtime
	match I_SHA_GON_WAIT_HIDE_PAUSE ...wait
	match I_SHA_GON_WAIT_HIDE_PAUSE type ahead
	match I_SHA_GON_OFF With a soft bump, the gondola
put hide
	match I_QUIT [You're
	matchwait


I_SHA_GON_WAIT_SHIFT:
shift
shift
I_SHA_GON_OFF_EXP:
put skill
I_SHA_GON_WAIT_PAUSE:
pause
I_SHA_GON_WAIT:
	match I_SHA_GON_OFF With a soft bump, the gondola
	match I_SHA_GON_OFF_EXP YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	match I_QUIT [You're
	matchwait

I_SHA_GON_OFF:
move out
I_GOND_SHA:
waitfor following you
I_SHA_GON_OFF1:
	match I_SHA_GOND_2A go next and it stops.
	match I_SHA_GOND_2A but the driver turns back
	match I_SHA_GON_OFF2 acknowledges the order.
put tell caravan lead to Leth deriel
	matchwait

I_SHA_GON_OFF2:
save I_SHA_TO_LETH_SKILL1
goto PATTERN

I_SHA_TO_LETH_SKILL1:
save I_SHARD_AT_LETH1
goto APPRAISE

I_SHARD_AT_LETH1:
save I_SHARD_AT_LETH
goto HIDE

I_SHARD_AT_LETH:
move go gate
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
move go gate
waitfor following you
goto I_AT_SHA_LETH

I_AT_SHE_LETH_CARA:
put tell caravan follow
wait

I_AT_SHA_LETH:
	echo
	echo I_AT_SHA_LETH:
	echo
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
put tell caravan lead to crossing
waitfor you
put tell caravan go fast
waitfor you
save I_ORI_SHA_LETH
goto JUGGLE

I_ORI_SHA_LETH:
save I_TO_CROSS_FERRY1
goto ORIGAMI


I_TO_CROSS_FERRY_CARA:
goto I_TO_CROSS_FERRY

I_TO_CROSS_FERRY1_CARA:
goto I_TO_CROSS_FERRY1

I_TO_CROSS_FERRY1_PAUSE:
waitfor following you
I_TO_CROSS_FERRY1:
put tell caravan follow
waitfor you
	match I_QUIT [You're
	match I_TO_CROSS_FERRY1_PAUSE Southern Trade Route, Segoltha Plain
	match I_TO_CROSS_FERRY_PAUSE Southern Trade Route, Segoltha South Bank
	match FERRY You can't go there.
put n
	matchwait

I_TO_CROSS_FERRY_PAUSE:
waitfor following you
I_TO_CROSS_FERRY:
put tell caravan follow
waitfor you
save I_FERRY
goto FERRY


I_OFF_CROSS_FERRY:
	echo
	echo I_OFF_CROSS_FERRY:
	echo
I_OFF_CROSS_FERRY1:
move go squ
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move go door
save I_CROSS_TO_DIRGE
goto I_CROSS_TO_BANK

I_QUIT:
	echo
	echo I_QUIT:
	echo
exit




F_I_UNKNOWN_CARA:
save F_I_HAVE_CARA
F_I_UNKNOWN_CARA1:
	match F_I_UNKNOWN_CARA2 go next and it stops.
	match F_I_UNKNOWN_CARA2 but the driver turns back
	match HIDE does your bidding.
put tell caravan lead to Riverhaven
	matchwait

F_I_UNKNOWN_CARA2:
	match F_I_UNKNOWN_CARA3 go next and it stops.
	match F_I_UNKNOWN_CARA3 but the driver turns back
	match HIDE does your bidding.
put tell caravan lead to leth
	matchwait

F_I_UNKNOWN_CARA3:
	match NO_GO go next and it stops.
	match NO_GO but the driver turns back
	match HIDE does your bidding.
put tell caravan lead to gondola
	matchwait

F_I_HAVE_CARA:
	echo
	echo F_I_HAVE_CARA:
	echo
put tell caravan to follow
waitfor you
	match F_I_AT_DIRGE North Roads Caravansary
	match F_I_AT_CROSS Northeast Wilds, Outside Northeast Gate
	match F_I_CROSS_OUT The Crossing, Commerce Avenue
	match F_I_GO_FERRY_CARA The Crossing, Alfren's Ferry
	match F_I_GO_FERRY_CARA1 Sparse grass, weeds and a few hardy shrubs
	match F_I_GO_FERRY_CARA Southern Trade Route, Segoltha South Bank
	match F_I_OFF_RIVER_FERRY Riverhaven, Ferry Dock
	match F_I_AT_RIVER the Trader's Guild as it passes through
	match F_I_AT_LETH_CARA Southern Trade Route, Outside Leth Deriel
	match F_I_AT_LETH_CARA2 Deobar Bower Gate, Esouvar Deriel
	match F_I_AT_RIVER and the Trader's Guild as it passes
	match F_I_GO_FERRY_CARA Long, wide, and low
	match F_I_GO_FERRY_CARA ferry
	match F_I_LETH_GON stable as a faenrae reaver on samatak
	match F_I_GO_FERRY_CARA low riding barge
	match F_I_SHA_GON_CARA Two massive granite pillars offer
	match F_I_GON_SHA_CARA Two side-by-side granite beams rise up
	match F_I_GON_NF Gondola, Cab North
	match F_I_GON_SF Gondola, Cab South
	match F_I_SHARD_OUT2_CARA The courtyard of Brickwell Tower stretches beyond the keep's curved archway
	match F_I_SHARD_OUT Brickwell Tower, Courtyard
	match F_UNKNOWN_CARA obvious
put look
	match QUIT [You're
	matchwait

F_I_LETH_GON:
move climb platform
waitfor following you
F_I_GON_SHA_CARA:
	echo
	echo F_I_GON_SHA_CARA:
	echo
	match F_I_GON_SHA The Contract
	match F_I_SHA_GON_OFF1 referring
put look my shard contract
	matchwait

F_I_SHA_GON_CARA:
	echo
	echo F_I_SHA_GON_CARA:
	echo
	match F_I_SHA_GOND_2 The Contract
	match F_I_SHA_GON referring
put look my shard contract
	matchwait

F_I_GON_NF:
put rem feed
wait
put give cara
wait
put wear feed

F_I_GON_N_CHECK:
	echo
	echo F_I_GON_N_CHECK:
	echo
	match F_I_GON_CAB_N referring
	match F_I_GON_NS The contract
put look my shard contract
	matchwait

F_I_GON_SF:
put rem feed
wait
put give cara
wait
put wear feed

F_I_GON_S_CHECK:
	echo
	echo F_I_GON_S_CHECK:
	echo
	match F_I_GON_SN referring
	match F_I_GON_CAB_S The contract
put look my shard contract
	matchwait

F_I_GON_SN:
put tell caravan follow
move n
goto F_I_GON_CAB_N

F_I_GON_NS:
put tell caravan follow
move s
goto F_I_GON_CAB_S




F_I_GON_CAB_N_PAUSE:
pause
F_I_GON_CAB_N:
	match F_I_GON_CAB_N_WAIT Eh?
	match F_I_GON_CAB_N_WAIT You blend
	match F_I_GON_CAB_N_WAIT You melt into the background
	match F_I_GON_CAB_N_WAIT glance at you as you hide.
	match F_I_GON_CAB_N_WAIT ruining your hiding place!
	match F_I_GON_CAB_N_PAUSE roundtime
	match F_I_GON_CAB_N_PAUSE ...wait
	match F_I_GON_CAB_N_PAUSE type ahead
put hide
	match F_I_QUIT [You're
	matchwait

F_I_GON_CAB_N_WAIT:
	match F_I_GON_CAB_N_OFF With a soft bump, the gondola
	match F_I_GON_CAB_N_OFF_EXP YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	match F_I_QUIT [You're
	matchwait


F_I_GON_CAB_N_OFF:
	match F_I_SHA_TO_LETH_GON_SKILL you can't
	match F_I_GOND_SHA obvious
put out
	matchwait

F_I_GON_CAB_N_OFF_EXP:
put skill
goto F_I_GON_CAB_N_WAIT

F_I_GON_CAB_S_PAUSE:
pause
F_I_GON_CAB_S:
	match F_I_GON_CAB_S_WAIT Eh?
	match F_I_GON_CAB_S_WAIT You blend
	match F_I_GON_CAB_S_WAIT You melt into the background
	match F_I_GON_CAB_S_WAIT glance at you as you hide.
	match F_I_GON_CAB_S_WAIT ruining your hiding place!
	match F_I_GON_CAB_S_PAUSE roundtime
	match F_I_GON_CAB_S_PAUSE ...wait
	match F_I_GON_CAB_S_PAUSE type ahead
put hide
	match F_I_QUIT [You're
	matchwait

F_I_GON_CAB_S_WAIT:
	match F_I_GON_CAB_S_OFF With a soft bump, the gondola
	match F_I_GON_CAB_S_OFF_EXP YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	match F_I_QUIT [You're
	matchwait

F_I_GON_CAB_S_OFF_EXP:
put skill
goto F_I_GON_CAB_S_WAIT

F_I_GON_CAB_S_OFF:
	match F_I_LETH_TO_SHA_GON_SKILL you can't
	match F_I_SHA_GOND obvious
put out
	matchwait



F_I_BEGIN:
	echo
	echo F_I_BEGIN:
	echo
	match F_I_CROSS_BANK_OUT The Crossing, Hodierna Way
	match F_I_CROSS_BANK_IN First Provincial Bank
	match F_I_CROSS_BANK_IN2 Provincial Bank, Teller
	match F_I_CROSS_OUT The Crossing, Commerce Avenue
	match F_I_CROSS Traders' Guild, Shipment Center
	match F_I_RIVER Traders' Guild, Shipping Dock
	match F_I_RIV_OUT the Trader's Guild as it passes through
	match F_I_RIV_IN Riverhaven, Traders' Guild Lobby
	match F_I_RIV_IN1 Traders' Guild, Foreign Trade Office
	match F_I_RIV_BANK_OUT patrons passing through its wide portals
	match F_I_RIV_BANK_IN1 Bank of Riverhaven, Main Lobby
	match F_I_RIV_BANK_IN Bank of Riverhaven, Teller
	match F_I_RIV_FERRY Riverhaven, Ferry Dock
	match F_I_SHARD_OUT2 The courtyard of Brickwell Tower stretches beyond the keep's curved archway
	match F_I_SHARD_OUT The gleaming white stone walls that surround Brickwell Tower
	match F_I_SHARD_IN The grand entrance hall of the Trader's Guild is tastefully decorated
	match F_I_SHARD_IN2 A no-nonsense businesswoman, the Provincial Broker's office
	match F_I_SHARD The vast dispatch chamber is filled with frantic activity as caravan after caravan
	match F_I_SHARD_BANK_OUT mountains, the domed building is Elothean in design and
	match F_I_SHARD_BANK_IN Shard, First Bank of Ilithi
	match F_I_SHARD_BANK_IN2 First Bank of Ilithi, Teller's Windows
	match F_I_SHARD_BANK_INB First Bank of Ilithi, Coin Exchange
put look
	matchwait


F_I_SHARD_IN2:
move out
goto F_I_SHARD_IN



F_I_SHARD_BANK_INB:
put w
goto F_I_SHARD_BANK_IN

F_I_SHARD_BANK_IN2:
move s
F_I_SHARD_BANK_IN:
move out
F_I_SHARD_BANK_OUT:
put w
move w
put w
move w
put n
move ne
put ne
move ne
put e
move e
put e
move e
put se
F_I_SHARD_OUT2:
put go tower
F_I_SHARD_OUT:
move go arch
F_I_SHARD_IN:
move w
goto F_I_SHARD


F_I_RIV_FERRY:
move go ramp
put go arch
move nw
goto F_I_RIV_OUT

F_I_RIV_IN1:
move w
F_I_RIV_IN:
move out
goto F_I_RIV_OUT


F_I_RIV_BANK_IN:
move go arch
F_I_RIV_BANK_IN1:
put out
F_I_RIV_BANK_OUT:
move s
put s
move sw
F_I_RIV_OUT:
move go alley
goto F_I_RIVER


F_I_CROSS_BANK_IN2:
move out
F_I_CROSS_BANK_IN:
put out
F_I_CROSS_BANK_OUT:
move sw
put go bri
move sw
put w
move w
put w
move w
put nw
move n
put n
move n
F_I_CROSS_OUT:
move go door
FI_CROSS:
F_I_CROSS:
	echo
	echo F_I_CROSS:
	echo
F_I_CROSS1:
pause
	match F_I_CROSS_GIVE_CON you get
	match F_I_CROSS_GET_CON1 referring
put get my cross contract
	match F_I_QUIT [You're
	matchwait

F_I_CROSS_GIVE_CON:
	echo
	echo F_I_CROSS_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto F_I_CROSS1

F_I_CROSS_GET_CON1:
save F_I_CROSS_TO_DIRGE
	match F_I_DEST_CHECK referring
	match F_I2_CROSS_TO_BANK The contract is printed
put look my river contract
	match F_I_QUIT [You're
	matchwait

F_I_DEST_CHECK:
save F_I_CROSS_TO_LETH
	match F_I_CROSS_RETURN referring
	match F_I2_CROSS_TO_BANK The contract is printed
put look my shard contract
	match F_I_QUIT [You're
	matchwait

F_I_CROSS_RETURN:
put return cara
move e
put e
move go side door
put go foyer
move out
put out
move e
put e
move e
put se
move e
put s
move s
put go bridge
move ne
put go bank
move go wind
put dep all
waitfor you
put bala
waitfor you
goto F_F_F_F


F_I2_CROSS_TO_BANK:
move e
put e
move go side door
put go foyer
move out
put out
move e
put e
move e
put se
move e
put s
move s
put go bridge
move ne
put go bank
move go wind
put dep all
waitfor you
put bala
waitfor you
goto I2_WITHDRAW

F_I2_WITHDRAW_PAUSE:
counter subtract 25
pause
F_I2_WITHDRAW:
	match I2_BANK_X and hands them over
	match I2_BANK_X The clerk asks
	match I2_BANK_X The clerk exclaims
	match I2_WITHDRAW_PAUSE The clerk tells you,
put withdraw 1000 copper
	match QUIT [You're
	matchwait

F_I2_BANK_X:
move out
move go booth
put exchange 500 cop kro for lir
waitfor you

F_I2_BANK_DONE:
move out
put out
move sw
put go bri
move n
put n
move w
put nw
move w
put w
move w
put go guild
move go auction foyer
put go hall
move go side door
move w
move w
goto %s

F_I_CROSS_TO_DIRGE:
	echo
	echo F_I_CROSS_TO_DIRGE:
	echo
goto F_I_CROSS_TO_DIRGE_OUT

F_I_CROSS_TO_DIRGE_OUT_PAUSE:
pause
F_I_CROSS_TO_DIRGE_OUT:
	match F_I_CROSS_TO_DIRGE_STAND can't do that
	match F_I_CROSS_TO_DIRGE_OUT2 obvious
	match F_I_CROSS_TO_DIRGE_OUT_PAUSE ...wait
	match F_I_CROSS_TO_DIRGE_OUT_PAUSE type ahead
put out
	match F_I_QUIT [You're
	matchwait
F_I_CROSS_TO_DIRGE_PAUSE:
pause
F_I_CROSS_TO_DIRGE_STAND:
	match F_I_CROSS_TO_DIRGE_PAUSE roundtime
	match F_I_CROSS_TO_DIRGE_OUT You stand back up.
	match F_I_CROSS_TO_DIRGE_PAUSE ...wait
	match F_I_CROSS_TO_DIRGE_PAUSE type ahead
put stand
	match F_I_QUIT [You're
	matchwait

F_I_CROSS_TO_DIRGE_OUT2:
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
put tell caravan lead to dirge
waitfor you
save F_I_CROSS_TO_DIRGE_SKILL1
goto PATTERN

F_I_CROSS_TO_DIRGE_SKILL1:
save F_I_CROSS_TO_DIRGE_SKILL2
goto APPRAISE

F_I_CROSS_TO_DIRGE_SKILL2:
save F_I_AT_DIRGE2
goto ORIGAMI


F_I_AT_DIRGE:
	echo
	echo F_I_AT_DIRGE:
	echo
	match F_I_AT_DIRGE1 referring
	match F_I_AT_DIRGE2 The contract
put look my River contract
	matchwait


F_I_AT_DIRGE1:
save F_I_DIRGE_TO_CROSS
goto 2FORAGE

F_I_AT_DIRGE2:
save F_I_TO_RIVER
goto 2FORAGE

F_I_TO_RIVER:
put tell caravan lead to Riverhaven
save F_I_DIRGE_TO_RIVER_SKILL1
goto JUGGLE

F_I_DIRGE_TO_RIVER_SKILL1:
save F_I_DIRGE_TO_RIVER_SKILL2
goto APPRAISE

F_I_DIRGE_TO_RIVER_SKILL2:
save F_I_TO_RIVER_FERRY
goto HIDE

F_I_TO_RIVER_FERRY:
put tell caravan follow
wait
save F_I_FERRY
goto FERRY



F_I_OFF_RIVER_FERRY:
	echo
	echo F_I_OFF_RIVER_FERRY:
	echo
move go ramp
waitfor following you
move go arch
waitfor following you
move nw
waitfor following you



F_I_AT_RIVER:
	echo
	echo F_I_AT_RIVER:
	echo
put tell caravan wait
move go alley


F_I_RIVER:
save F_I_RIV_BANK
	echo
	echo F_I_RIVER:
	echo
F_I_RIVER1:
	match F_I_RIVER_GIVE_CON you get
	match F_I_RIVER_GET_CON1 referring
put get my river contract
	match F_I_QUIT [You're
	matchwait

F_I_RIVER_GIVE_CON:
	echo
	echo F_I_RIVER_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto F_I_RIVER1

F_I_RIVER_GET_CON1:
	match F_I_RIV_CHECK referring
	match F_I_RIV_BANK The contract is printed
put look my cross contract
	match F_I_QUIT [You're
	matchwait

F_I_RIV_CHECK:
	match F_I_RIV_RETURN referring
	match F_I_RIV_BANK The contract is printed
put look my shard contract
	match F_I_QUIT [You're
	matchwait

F_I_RIV_RETURN:
put return cara
move out
put ne
move n
put n
move go bank
move go arch
put dep all
waitfor you
put balance
waitfor you
goto F_F_F_F

F_I_RIV_BANK:
move out
put ne
move n
put n
move go bank
move go arch
put dep all
waitfor you
put balance
waitfor you
put with 400 cop
wait
move go arch
move out
move s
put s
move sw
put tell caravan to follow
waitfor you
put tell caravan go fast
waitfor you
move go pier
waitfor following you
move go arch
waitfor following you
move go ramp
waitfor following you
save F_I_FERRY
goto FERRY

F_I_OFF_DIRGE_FERRY:
	echo
	echo F_I_OFF_DIRGE_FERRY:
	echo
move s
waitfor following you
put tell caravan lead to dirge
waitfor you
save F_I_RIVER_TO_DIRGE
goto PATTERN

F_I_RIVER_TO_DIRGE:
	echo
	echo F_I_RIVER_TO_DIRGE:
	echo
save F_I_AT_RIVER_DIRGE
goto HIDE

F_I_AT_RIVER_DIRGE:
	echo
	echo F_I_ATT_RIVER_DIRGE:
	echo
save F_I_DIRGE_TO_CROSS
goto 2FORAGE

F_I_DIRGE_TO_CROSS:
	echo
	echo F_I_DIRGE_TO_CROSS:
	echo
put tell caravan lead to crossing
save F_I_DIRGE_TO_CROSS_SKILL1
goto PATTERN

F_I_DIRGE_TO_CROSS_SKILL1:
save F_I_DIRGE_TO_CROSS_SKILL2
goto APPRAISE

F_I_DIRGE_TO_CROSS_SKILL2:
save F_I_AT_CROSS
goto ORIGAMI


F_I_AT_CROSS:
	echo
	echo F_I_AT_CROSS:
	echo
put tell caravan follow
waitfor you
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait

goto F_I_AT_CROSS_F
F_I_AT_CROSS_F_SHIFT:

F_I_AT_CROSS_F:
	match F_I_NOT_CROSS obvious
	match F_I_NOT_CROSS1 can't
	match F_I_NOT_CROSS1 referring
	match F_I_AT_CROSS2 The Crossing, Northeast Customs
put go gate
	match F_I_QUIT [You're
	matchwait

F_I_NOT_CROSS:
waitfor following you
put go gate
waitfor following you
F_I_NOT_CROSS1:
put tell caravan lead to crossing
waitfor you
goto HIDE


F_I_AT_CROSS2:
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move s
waitfor following you
move s
waitfor following you
move w
waitfor following you
move s
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move go bri
waitfor following you
move s
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move w
waitfor following you
move go door
goto F_I_CROSS


F_I_CROSS_TO_LETH:
	echo
	echo F_I_CROSS_TO_LETH:
	echo
goto F_I_CROSS_TO_LETH_OUT
F_I_CROSS_TO_LETH_OUT_PAUSE:
pause
F_I_CROSS_TO_LETH_OUT:
	match F_I_CROSS_TO_LETH_STAND can't do that
	match F_I_CROSS_TO_LETH_OUT2 obvious
	match F_I_CROSS_TO_LETH_OUT_PAUSE ...wait
	match F_I_CROSS_TO_LETH_OUT_PAUSE type ahead
put out
	match F_I_QUIT [You're
	matchwait
F_I_CROSS_TO_LETH_PAUSE:
pause
F_I_CROSS_TO_LETH_STAND:
	match F_I_CROSS_TO_LETH_PAUSE roundtime
	match F_I_CROSS_TO_LETH_OUT You stand back up.
	match F_I_CROSS_TO_LETH_PAUSE ...wait
	match F_I_CROSS_TO_LETH_PAUSE type ahead
put stand
	match F_I_QUIT [You're
	matchwait

F_I_CROSS_TO_LETH_OUT2:
put tell caravan to follow
waitfor you
put tell caravan go fast
waitfor you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move go pier
waitfor following you
save F_I_FERRY
goto FERRY


F_I_OFF_LETH_FERRY:
	echo
	echo F_I_OFF_LETH_FERRY:
	echo
F_I_OFF_LETH_FERRY1:
F_I_OFF_LETH_FERRY11:
put tell caravan lead to leth deriel
save F_I_LETH_ORIGAMI
goto JUGGLE

F_I_LETH_ORIGAMI:
save F_I_AT_LETH
goto ORIGAMI


F_I_AT_LETH_CARA2:
	echo **
	echo ** F_I_AT_LETH_CARA2:
	echo **
	match F_I_AT_LETH2 The contract
	match F_I_SHARD_AT_LETH referring
put look my shard contract
	matchwait


F_I_AT_LETH_CARA:
	echo **
	echo ** F_I_AT_LETH_CARA:
	echo **
	match F_I_AT_LETH The contract
	match F_I_AT_SHA_LETH referring
put look my shard contract
	matchwait

F_I_AT_LETH:
	echo
	echo F_I_AT_LETH:
	echo
put tell caravan follow
waitfor you
F_I_AT_LETH_GATE:
move go gate
waitfor following you
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait

goto F_I_LETH_TO_GOND

F_I_LETH_TO_GOND_SHIFT:
shift
shift
F_I_LETH_TO_GOND:
move se
waitfor following you
move sw
waitfor following you
move sw
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move s
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move go gate
waitfor following you
F_I_AT_LETH2:
put tell caravan lead to gondola

F_I_LETH_TO_SHA_SKILL1:
save F_I_LETH_TO_SHA_SKILL2
goto APPRAISE

F_I_LETH_TO_SHA_SKILL2:
save F_I_GON_SHA2
goto ORIGAMI

F_I_GON_SHA2:
save F_I_GON_SHA1
goto DES_CHECK

F_I_GON_SHA1:
move climb platform
waitfor following you
goto F_I_GON_SHA

F_I_GON_SHA_PAUSE:
pause 10
F_I_GON_SHA:
	echo
	echo F_I_GON_SHA:
	echo
match F_I_GON_SHA_ON [Gondola
match F_I_GON_SHA_HIDE There is no
match F_I_GON_SHA_PAUSE There are already too many caravans on the wooden gondola
put go gondola
matchwait

F_I_GON_SHA_HIDE_PAUSE:
pause
F_I_GON_SHA_HIDE:
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
	match F_I_GON_SHA_WAIT1 Eh?
	match F_I_GON_SHA_WAIT1 You blend
	match F_I_GON_SHA_WAIT1 You melt into the background
	match F_I_GON_SHA_WAIT1 glance at you as you hide.
	match F_I_GON_SHA_WAIT1 ruining your hiding place!
	match F_I_GON_SHA_HIDE_PAUSE roundtime
	match F_I_GON_SHA_HIDE_PAUSE ...wait
	match F_I_GON_SHA_HIDE_PAUSE type ahead
	match F_I_GON_SHA pulls into the dock
put hide
	match F_I_QUIT [You're
	matchwait

F_I_GON_SHA_WAIT1:
waitfor The gondola stops on the platform
goto F_I_GON_SHA

F_I_GON_SHA_ON:
waitfor following you
put south
waitfor following you
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
F_I_LETH_TO_SHA_GON_SKILL:
save F_I_LETH_TO_SHA_GON_SKILL1
goto GON_ORIGAMI

F_I_LETH_TO_SHA_GON_SKILL1:
save F_I_LETH_TO_SHA_GON_SKILL2
goto GON_ORIGAMI

F_I_LETH_TO_SHA_GON_SKILL2:
save F_I_LETH_TO_SHA_GON_SKILL3
goto I_PATTERN

F_I_LETH_TO_SHA_GON_SKILL3:
save F_I_LETH_TO_SHA_GON_SKILL4
goto PLAY

F_I_LETH_TO_SHA_GON_SKILL4:
save F_I_GON_SHA_WAIT_HIDE
goto APPRAISE

F_I_GON_SHA_WAIT_HIDE_PAUSE:
pause
F_I_GON_SHA_WAIT_HIDE:
	match F_I_GON_SHA_WAIT Eh?
	match F_I_GON_SHA_WAIT You blend
	match F_I_GON_SHA_WAIT You melt into the background
	match F_I_GON_SHA_WAIT glance at you as you hide.
	match F_I_GON_SHA_WAIT ruining your hiding place!
	match F_I_GON_SHA_WAIT_HIDE_PAUSE roundtime
	match F_I_GON_SHA_WAIT_HIDE_PAUSE ...wait
	match F_I_GON_SHA_WAIT_HIDE_PAUSE type ahead
	match F_I_GON_SHA_OFF With a soft bump, the gondola
put hide
	match F_I_QUIT [You're
	matchwait

F_I_GON_SHA_WAIT_SHIFT:
shift
shift
F_I_GON_SHA_OFF_EXP:
put skill
F_I_GON_SHA_WAIT_PAUSE:
pause
F_I_GON_SHA_WAIT:
	match F_I_GON_SHA_OFF With a soft bump, the gondola
	match F_I_GON_SHA_OFF_EXP YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	match F_I_QUIT [You're
	matchwait

F_I_GON_SHA_OFF:
move out
F_I_SHA_GOND:
waitfor following you
goto F_I_SHA_GOND_2
F_I_SHA_GOND_2A:
put tell caravan follow
wait
F_I_SHA_GOND_2:
	match F_I_SHA_GON_OFF1 What were you referring to?
	match F_I_SHA_GOND_3 following you
put go frame
	matchwait
F_I_SHA_GOND_3:
move go door
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move se
waitfor following you
move go path
waitfor following you
move sw
waitfor following you
move w
waitfor following you
move w
waitfor following you
move sw
waitfor following you
move w
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move sw
waitfor following you
move s
waitfor following you
save F_I_SHA_FOR
goto 2FORAGE

F_I_SHA_FOR:
	echo
	echo F_I_SHA_FOR:
	echo
move sw
waitfor following you
move sw
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move w
waitfor following you
move w
waitfor following you
move sw
waitfor following you
move w
waitfor following you
move w
waitfor following you
move s
waitfor following you
move s
waitfor following you
move se
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move go gate
waitfor following you
move e
waitfor following you
move e
waitfor following you
move se
waitfor following you
F_I_SHARD_OUT2_CARA:
move go tower
waitfor following you
F_I_SHARD_OUT_CARA:
move go arch
move w

F_I_SHARD:
	echo
	echo F_I_SHARD:
	echo
F_I_SHARD1:
pause
	match F_I_SHARD_GIVE_CON you get
	match F_I_SHARD_BANK referring
put get my shard contract
	match F_I_QUIT [You're
	matchwait

F_I_SHARD_GIVE_CON:
	echo
	echo F_I_SHARD_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto F_I_SHARD1

F_I_SHARD_BANK:
	match F_I_SHA_CHECK referring
	match F_I_SHA_BANK The contract is printed
put look my cross contract
	match F_I_QUIT [You're
	matchwait

F_I_SHA_CHECK:
	match F_I_SHA_RETURN referring
	match F_I_SHA_BANK The contract is printed
put look my river contract
	match F_I_QUIT [You're
	matchwait

F_I_SHA_RETURN:
put return cara
move e
move out
move out
put nw
move w
put w
move w
put w
move sw
put sw
move sw
put s
move e
put e
move e
put e
move go bank
put n
put dep all
waitfor you
put bala
waitfor you
goto F_F_F_F

F_I_SHA_BANK:
move e
move out
put tell caravan wait
move out
put nw
move w
put w
move w
put w
move sw
put sw
move sw
put s
move e
put e
move e
put e
move go bank
move n
put dep all
waitfor you
put bala
waitfor you
put with 500 cop
move s
move e
put exchange all dok for kro
move w
put out
move w
put w
move w
put w
move n
put ne
move ne
put ne
move e
put e
move e
put e
move se
move go tower
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
move out
waitfor following you
move nw
waitfor following you
move w
waitfor following you
move w
waitfor following you
move go gate
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move n
waitfor following you
move e
waitfor following you
move e
waitfor following you
move ne
waitfor following you
move e
waitfor following you
move e
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move e
waitfor following you
move ne
waitfor following you
move e
waitfor following you
move e
waitfor following you
move ne
waitfor following you
move go path
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move go door
waitfor following you
move go frame
waitfor following you
goto F_I_SHA_GON

F_I_SHA_GON_PAUSE:
pause 10
F_I_SHA_GON:
	echo
	echo F_I_SHA_GON:
	echo
match F_I_SHA_GON_ON [Gondola
match F_I_SHA_GON_HIDE There is no
match F_I_SHA_GON_PAUSE There are already too many caravans on the wooden gondola
put go gondola
matchwait

F_I_SHA_GON_HIDE_PAUSE:
pause
F_I_SHA_GON_HIDE:
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
	match F_I_SHA_GON_WAIT1 Eh?
	match F_I_SHA_GON_WAIT1 You blend
	match F_I_SHA_GON_WAIT1 You melt into the background
	match F_I_SHA_GON_WAIT1 glance at you as you hide.
	match F_I_SHA_GON_WAIT1 ruining your hiding place!
	match F_I_SHA_GON_HIDE_PAUSE roundtime
	match F_I_SHA_GON_HIDE_PAUSE ...wait
	match F_I_SHA_GON_HIDE_PAUSE type ahead
	match F_I_SHA_GON pulls into the dock
put hide
	match F_I_QUIT [You're
	matchwait

F_I_SHA_GON_WAIT1:
waitfor The gondola stops on the platform
goto F_I_SHA_GON

F_I_SHA_GON_ON:
waitfor following you
move north
waitfor following you
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
F_I_SHA_TO_LETH_GON_SKILL:
save F_I_SHA_TO_LETH_GON_SKILL1
goto GON_ORIGAMI

F_I_SHA_TO_LETH_GON_SKILL1:
save F_I_SHA_TO_LETH_GON_SKILL2
goto GON_ORIGAMI

F_I_SHA_TO_LETH_GON_SKILL2:
save F_I_SHA_TO_LETH_GON_SKILL3
goto I_PATTERN

F_I_SHA_TO_LETH_GON_SKILL3:
save F_I_SHA_TO_LETH_GON_SKILL4
goto PLAY

F_I_SHA_TO_LETH_GON_SKILL4:
save F_I_GON_SHA_WAIT_HIDE
goto APPRAISE


F_I_SHA_GON_WAIT_HIDE_PAUSE:
pause
F_I_SHA_GON_WAIT_HIDE:
	match F_I_SHA_GON_WAIT Eh?
	match F_I_SHA_GON_WAIT You blend
	match F_I_SHA_GON_WAIT You melt into the background
	match F_I_SHA_GON_WAIT glance at you as you hide.
	match F_I_SHA_GON_WAIT ruining your hiding place!
	match F_I_SHA_GON_WAIT_HIDE_PAUSE roundtime
	match F_I_SHA_GON_WAIT_HIDE_PAUSE ...wait
	match F_I_SHA_GON_WAIT_HIDE_PAUSE type ahead
	match F_I_SHA_GON_OFF With a soft bump, the gondola
put hide
	match F_I_QUIT [You're
	matchwait


F_I_SHA_GON_WAIT_SHIFT:
shift
shift
F_I_SHA_GON_OFF_EXP:
put skill
F_I_SHA_GON_WAIT_PAUSE:
pause
F_I_SHA_GON_WAIT:
	match F_I_SHA_GON_OFF With a soft bump, the gondola
	match F_I_SHA_GON_OFF_EXP YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	match F_I_QUIT [You're
	matchwait

F_I_SHA_GON_OFF:
move out
F_I_GOND_SHA:
waitfor following you

F_I_SHA_GON_OFF1:
	match F_I_SHA_GOND_2A go next and it stops.
	match F_I_SHA_GOND_2A but the driver turns back
	match F_I_SHA_GON_OFF2 acknowledges the order.
put tell caravan lead to Leth deriel
	matchwait

F_I_SHA_GON_OFF2:
save F_I_SHA_TO_LETH_SKILL1
goto PATTERN

F_I_SHA_TO_LETH_SKILL1:
save F_I_SHARD_AT_LETH1
goto APPRAISE

F_I_SHARD_AT_LETH1:
save F_I_SHARD_AT_LETH
goto HIDE

F_I_SHARD_AT_LETH:
move go gate
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move n
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
move go gate
waitfor following you
goto F_I_AT_SHA_LETH

F_I_AT_SHE_LETH_CARA:
put tell caravan follow
wait

F_I_AT_SHA_LETH:
	echo
	echo F_I_AT_SHA_LETH:
	echo
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
put tell caravan lead to crossing
waitfor you
put tell caravan go fast
waitfor you
save F_I_ORI_SHA_LETH
goto JUGGLE

F_I_ORI_SHA_LETH:
save F_I_TO_CROSS_FERRY1
goto ORIGAMI


F_I_TO_CROSS_FERRY_CARA:
goto F_I_TO_CROSS_FERRY

F_I_TO_CROSS_FERRY1_CARA:
goto F_I_TO_CROSS_FERRY1

F_I_TO_CROSS_FERRY1_PAUSE:
waitfor following you
F_I_TO_CROSS_FERRY1:
put tell caravan follow
waitfor you
	match F_I_QUIT [You're
	match F_I_TO_CROSS_FERRY1_PAUSE Southern Trade Route, Segoltha Plain
	match F_I_TO_CROSS_FERRY_PAUSE Southern Trade Route, Segoltha South Bank
	match FERRY You can't go there.
put n
	matchwait

F_I_TO_CROSS_FERRY_PAUSE:
waitfor following you
F_I_TO_CROSS_FERRY:
put tell caravan follow
waitfor you
save F_I_FERRY
goto FERRY


F_I_OFF_CROSS_FERRY:
	echo
	echo F_I_OFF_CROSS_FERRY:
	echo
F_I_OFF_CROSS_FERRY1:
move go squ
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move go door
goto F_I_CROSS

F_I_QUIT:
	echo
	echo F_I_QUIT:
	echo
exit

I_FERRY_CARA:
put tell caravan follow
pause 2
put tell caravan follow
put tell caravan go fast
wait
save I_FERRY
goto OFF_FERRY

I_GO_FERRY_CARA1:
put tell caravan follow
pause 2
put tell caravan follow
put tell caravan go fast
wait
move n
waitfor following you
save I_FERRY
goto FERRY

I_GO_FERRY_CARA:
put tell caravan follow
pause 2
put tell caravan follow
put tell caravan go fast
wait
save I_FERRY
goto FERRY

F_I_FERRY_CARA:
put tell caravan follow
pause 2
put tell caravan follow
put tell caravan go fast
wait
save F_I_FERRY
goto OFF_FERRY

F_I_GO_FERRY_CARA1:
put tell caravan follow
pause 2
put tell caravan follow
put tell caravan go fast
wait
move n
waitfor following you
save F_I_FERRY
goto FERRY

F_I_GO_FERRY_CARA:
put tell caravan follow
pause 2
put tell caravan follow
put tell caravan go fast
wait
save F_I_FERRY
goto FERRY

F_I_FERRY:
	match F_I_OFF_CROSS_FERRY Lemicus Square
	match F_I_OFF_LETH_FERRY Alfren's Tollbridge
	match F_I_OFF_DIRGE_FERRY North Road, Ferry
	match F_I_OFF_RIVER_FERRY a ramp
	match WAIT_FERRYFERRY have to wait
	match WAIT_FERRYFERRY What docks?
	match WAIT_FERRYFERRY referring
	match WAIT_FERRYFERRY stuck here
waitfor following you
put look
	matchwait


CON_CHECK:
	echo
	echo CON_CHECK:
	echo
put read my contract
wait
goto CON_STOW1

CON_STOW1_PAUSE:
pause
CON_STOW1:
	match CON_STOW you put
	match CON_STOW stow what
	match CON_STOW1_PAUSE ...wait
	match CON_STOW1_PAUSE type ahead
put stow my contract
	match I_QUIT [You're
	matchwait


CON_STOW:
IF_1 pause 5
REM_CHECK1:
	match STOW_CHECK1 Remove what?
	match APP1_REM you remove
	match APP1_REM you slide
	match APP1_REM you sling
	match APP1_REM you work
	match APP1_REM you pull
	match APP1_REM you take
	match APP1_REM you slip
	match APP1_REM you loosen
put rem my %zTapp1
	matchwait
STOW_CHECK1_PAUSE:
pause
STOW_CHECK1:
put get my %zTapp1
wait
put open my %zTapp1
wait
	match APP1_DONE Appraise what?
	matchre APP1_DONE /roundtime|inside something|can't appraise/i
	match STOW_CHECK1_PAUSE ...wait
	match STOW_CHECK1_PAUSE type ahead
put app my %zTapp1 careful
	match I_QUIT [You're
	matchwait

APP1_REM_PAUSE:
pause
APP1_REM:
put open my %zTapp1
wait
	match WEAR_APP1 Appraise what?
	match WEAR_APP1 roundtime
	match APP1_REM_PAUSE ...wait
	match APP1_REM_PAUSE type ahead
put app my %zTapp1 careful
	match I_QUIT [You're
	matchwait


APP1_DONE:
pause
put close my %zTapp1
wait
put stow my %zTapp1
wait
goto REM_CHECK2

WEAR_APP1_PAUSE:
pause
WEAR_APP1:
	match WEAR_APP1_PAUSE ...wait
	match REM2_CHECK2 you
put close my %zTapp1
put wear my %zTapp1
	matchwait


REM2_CHECK2:
REM_CHECK2:
	match STOW_CHECK2 Remove what?
	match APP2_REM you remove
	match APP2_REM you slide
	match APP2_REM you sling
	match APP2_REM you slip
	match APP2_REM you work
	match APP2_REM you pull
	match APP2_REM you take
	match APP2_REM you loosen
put rem my %zTapp2
	matchwait

STOW_CHECK2_PAUSE:
pause
STOW_CHECK2:
put get my %zTapp2
wait
put open my %zTapp2
wait
	match APP2_DONE1 Appraise what?
	matchre APP2_DONE1 /roundtime|inside something|can't appraise/i
	match STOW_CHECK2_PAUSE ...wait
	match STOW_CHECK2_PAUSE type ahead
put app my %zTapp2 careful
	match I_QUIT [You're
	matchwait

APP2_REM_PAUSE:
pause
APP2_REM:
put open my %zTapp2
wait
	match WEAR_APP2 Appraise what?
	match WEAR_APP2 roundtime
	match APP2_REM_PAUSE ...wait
	match APP2_REM_PAUSE type ahead
put app my %zTapp2 careful
	match I_QUIT [You're
	matchwait


APP2_DONE1:
pause
put close my %zTapp2
wait
put stow my %zTapp2
wait
goto APP2_DONE

WEAR_APP2_PAUSE:
pause
WEAR_APP2:
	match WEAR_APP2_PAUSE ...wait
	match APP2_DONE you
put close my %zTapp2
put wear my %zTapp2
	matchwait

APP2_DONE_PAUSE:
pause
APP2_DONE:
put DISBAND GROUP BAN EXCEPT %0
IF_1 put avoid join
IF_1 waitfor you
IF_1	match APP_DONE2 You hum
IF_1	match APP2_DONE_PAUSE ...wait
IF_1	match APP2_DONE_PAUSE type ahead
IF_1 put hum
IF_1 	match I_QUIT [You're
IF_1	matchwait
APP_DONE2_PAUSE:
pause
APP_DONE2:
IF_1 waitfor group, "ready
IF_1 pause
IF_1 put avoid !join
IF_1 waitfor You're now
goto %s

HIDE_VINE:
put drop vine

HIDE_PAUSE:
pause
HIDE:
IF_1 put whisper group hide
IF_2 goto HIDE_TEACH
goto HIDE_TEACH1:
HIDE_TEACH:
IF_2 pause 2
IF_2 put listen to %2
IF_2 wait
IF_2 goto HIDEHIDE
HIDE_TEACH1:
put teach %zTteach to %1
IF_1 goto DES_CHECK
HIDEHIDE:
	echo
	echo HIDE:
	echo
	match DES_CHECK Eh?
	match DES_CHECK You blend
	match DES_CHECK You melt into the background
	match DES_CHECK glance at you as you hide.
	match DES_CHECK ruining your hiding place!
	match HIDE_PAUSE You look around, but can't see any place to hide yourself.
	match HIDE_PAUSE roundtime
	match HIDE_PAUSE ...wait
	match HIDE_PAUSE type ahead
	match %s having arrived at its destination.
put hide
	match QUIT [You're
	matchwait

DES_CHECK:
	match %s stable as a faenrae reaver on samatak
	match %s North Road, Ferry
	match %s North Roads Caravansary
	match %s Southern Trade Route, Outside Leth Deriel
	match %s Lairocott Brach, Entrance
	match %s Valley, Village Gate
	match %s Northeast Wilds, Outside Northeast Gate
	match %s Deobar Bower Gate, Esouvar Deriel
	match %s Southern Trade Route, Segoltha Plain
	match DES_WAIT obvious
put look
	match QUIT [You're
	matchwait

DES_WAIT:
	echo
	echo DES_WAIT:
	echo
	match THIEF Oddly, your pouch seems suddenly heavier for a moment.
	match ACCEPT Enter ACCEPT to accept the offer or DECLINE to decline it.
	match DES_STAND You lose your footing
	match DES_STAND coughing spasm wracks your body
	match DES_STAND P>
	match DES_STAND PH>
	match TIP accept tip
	match DES_CHECK YOU HAVE BEEN IDLE
	match LISTEN you must LISTEN
	match %s having arrived at its destination.
	match QUIT [You're
	matchwait

DES_STAND_PAUSE:
pause
DES_STAND:
	match DES_STAND_PAUSE roundtime
	match HIDE You stand back up.
	match HIDE are already
	match DES_STAND_PAUSE ...wait
	match DES_STAND_PAUSE type ahead
put stand
	match I_QUIT [You're
	matchwait

THIEF:
put chuckle
put 'Thanks for the perception.
goto DES_WAIT2

DES_WAIT2:
IF_1 put whisper group hide
IF_1 waitfor you
	echo
	echo DES_WAIT2:
	echo
	match ACCEPT Enter ACCEPT to accept the offer or DECLINE to decline it.
	match DES_STAND You lose your footing
	match DES_STAND coughing spasm wracks your body
	match DES_STAND P>
	match DES_STAND PH>
	match TIP accept tip
	match DES_CHECK YOU HAVE BEEN IDLE
	match LISTEN you must LISTEN
	match %s having arrived at its destination.
	match QUIT [You're
	matchwait

LISTEN:
put listen to %1
put listen to %2
wait
put hide
goto DES_CHECK



PLAY:
	match %s referring
	match PLAY_CLEAN you get
put get my %zTplay
	matchwait

PLAY_CLEAN_PAUSE:
pause
PLAY_CLEAN:
	match PLAY_CLEAN_PAUSE roundtime
	match PLAY_CLEAN_PAUSE ...wait
	match PLAY_CLEAN_PAUSE type ahead
	match PLAY1 Encumbrance
put clean my %zTplay
put enc
	matchwait

PLAY1_PAUSE:
pause
PLAY1:
	match PLAY2 You finish
	match PLAY_STOW You can't play
	match PLAY1_PAUSE ..wait
	match PLAY1_PAUSE type ahead
	match QUIT [You're
put play %zTsong %zTmood on %zTplay
	matchwait

PLAY2_PAUSE:
pause
PLAY2:
	match PLAY_STOW You finish
	match PLAY_STOW You can't play
	match PLAY2_PAUSE ..wait
	match PLAY2_PAUSE type ahead
	match QUIT [You're
put play %zTsong %zTmood on %zTplay
	matchwait


PLAY_STOW_PAUSE:
pause
PLAY_STOW:
	match %s you put
	match PLAY_STOW_PAUSE ...wait
	match PLAY_STOW_PAUSE type ahead
put stow my %zTplay
	matchwait



STONES:
	match BRAID_FOR referring
	match STONE1A you get
put get my stones
	matchwait


STONE1_PAUSE:
pause
STONE1A:
counter set 1
	match BRAID_FOR Remove what?
	match STONE2_C roundtime
	match STONE_STOW exactly
	match STONE1_PAUSE ...wait
	match STONE1_PAUSE type ahead
put remove %c stones
	matchwait

STONE2_RC:
counter set 1
goto STONE2
STONE2_C:
counter add 1
goto STONE2_COMB

STONE2_COMB_PAUSE:
pause
STONE2_COMB:
	match STONE2 You combine
	match STONE3_COMB roundtime
	match STONE2_COMB_PAUSE ...wait
	match STONE2_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

STONE2_PAUSE:
pause
STONE2:
	match STONE3_C roundtime
	match STONE2_RC exactly
	match STONE2_PAUSE ...wait
	match STONE2_PAUSE type ahead
put remove %c stones
	matchwait

STONE3_RC:
counter set 1
goto STONE3
STONE3_C:
counter add 1
goto STONE3_COMB

STONE3_COMB_PAUSE:
pause
STONE3_COMB:
	match STONE3 You combine
	match STONE4_COMB roundtime
	match STONE3_COMB_PAUSE ...wait
	match STONE3_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

STONE3_PAUSE:
pause
STONE3:
	match STONE4_C roundtime
	match STONE3_RC exactly
	match STONE3_PAUSE ...wait
	match STONE3_PAUSE type ahead
put remove %c stones
	matchwait

STONE4_RC:
counter set 1
goto STONE4
STONE4_C:
counter add 1
goto STONE4_COMB

STONE4_COMB_PAUSE:
pause
STONE4_COMB:
	match STONE4 You combine
	match STONE5_COMB roundtime
	match STONE4_COMB_PAUSE ...wait
	match STONE4_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

STONE4_PAUSE:
pause
STONE4:
	match STONE5_C roundtime
	match STONE4_RC exactly
	match STONE4_PAUSE ...wait
	match STONE4_PAUSE type ahead
put remove %c stones
	matchwait

STONE5_RC:
counter set 1
goto STONE5
STONE5_C:
counter add 1
goto STONE5_COMB

STONE5_COMB_PAUSE:
pause
STONE5_COMB:
	match STONE5 You combine
	match STONE6 roundtime
	match STONE5_COMB_PAUSE ...wait
	match STONE5_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

STONE5_PAUSE:
pause
STONE5:
	match STONE6_COMB roundtime
	match STONE5_RC exactly
	match STONE5_PAUSE ...wait
	match STONE5_PAUSE type ahead
put remove %c stones
	matchwait

STONE6_COMB_PAUSE:
pause
STONE6_COMB:
	match STONE6 You combine
	match STONE6_COMB roundtime
	match STONE6_COMB_PAUSE ...wait
	match STONE6_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

STONE6_PAUSE:
pause
STONE6:
	match HIDE you put
	match STONE6_PAUSE type ahead
	match STONE6_PAUSE ...wait
put stow my stones
	matchwait

ORIGAMI:
	echo
	echo ORIGAMI:
	echo
IF_1 put belch
IF_1 wait
IF_1 put nod
IF_1 pause 2
IF_1 put whisper group origami
PAPER_CHECK:
	match ENVELOPE referring
	match FOLD1 You are already holding that
	match FOLD1 you get a piece
put get my paper
	matchwait

WEAR_ENV:
put wear my env
wait
ENVELOPE:
	match INSTRU you get a
	match REM_ENV The envelope is empty.
	match GET_ENV You must be either wearing
	match STONES I'm afraid that you can't pull that.
put pull my origami-paper envelope
	matchwait

REM_ENV:
put rem env
put drop env
waitfor you drop
GET_ENV_WEAR:
	match WEAR_ENV you get
	match STONES referring
put get my origami-paper envelope
	matchwait

DROP_ENV:
put drop my or env
wait
GET_ENV:
	match PULL_ENV you get
	match STONES referring
put get my origami-paper envelope
	matchwait

PULL_ENV:
	match STOW_ENV you get a
	match DROP_ENV The envelope is empty.
	match STONES I'm afraid that you can't pull that.
put pull my origami-paper envelope
	matchwait

STOW_ENV:
put stow my ori env
waitfor you
INSTRU:
counter set 1
goto ORI_STUDY1

ORI_STUDY2:
ORI_STUDY3:
ORI_STUDY4:
ORI_STUDY5:
goto ORI_STUDY1
ORI_STUDY_PAUSE:
pause
ORI_STUDY1:
counter add 1
	match ORI_STUDY%c You turn the instructions this way and that
	match GET_PRIMER You take on a studious look.
	match GET_PRIMER You study the sky
	match FOLD1 and begin to fold
	match ORI_STUDY_PAUSE ...wait
	match ORI_STUDY_PAUSE type ahead
put study my %zTorigami instruction
	matchwait

GET_PRIMER:
	match STOW_PAPER referring
	match OPEN_PRIMER you get
put get my ori primer
	matchwait

OPEN_PRIMER:
put open my primer
wait
goto PRI_STUDY1


PRI_STUDY2:
PRI_STUDY3:
PRI_STUDY4:
PRI_STUDY5:
PRI_STUDY_PAUSE:
pause
PRI_STUDY1:
counter add 1
	match PRI_STUDY%c You turn the instructions this way and that
	match NO_PRIMER You take on a studious look.
	match NO_PRIMER You study the sky
	match PRI_FOLD and begin to fold
	match PRI_STUDY_PAUSE ...wait
	match PRI_STUDY_PAUSE type ahead
put study my %zTorigami instruction
	matchwait

PRI_FOLD_PAUSE:
pause
PRI_FOLD:
	match PRI_FOLD_PAUSE ...wait
	match PRI_FOLD_PAUSE type ahead
	match PRI_FOLD2 you close
put close primer
	matchwait

PRI_FOLD2:
put stow primer
wait
FOLD1:
counter set 1

FOLD2:
FOLD3:
FOLD4:
FOLD5:
counter add 1
goto FOLD

FOLD_PAUSE:
pause
FOLD:
	match FOLD%c roundtime
	match PAPER_DROP project is ruined.
	match INSTRU You need to study your instructions
	match BLOW You make the final fold
	match BLOW referring
	match FOLD_PAUSE ...wait
	match FOLD_PAUSE type ahead
put fold my paper
	matchwait
FOLD6_PAUSE:
pause
FOLD6:
	match HIDE you put
	match FOLD6_PAUSE ...wait
	match FOLD6_PAUSE type ahead
put stow my paper
	matchwait

PAPER_DROP_PAUSE:
pause
PAPER_DROP:
	match HIDE you drop
	match PAPER_DROP_PAUSE ...wait
	match PAPER_DROP_PAUSE type ahead
put drop my paper
	matchwait
BLOW_PAUSE:
pause
BLOW:
	match HIDE You exhale into your
	match HIDE blow into it
	match BLOW_PAUSE ...wait
	match BLOW_PAUSE type ahead
	match HIDE referring
	match BLOW_TRASH Smoking commands
	match BLOW_TRASH you blow gently
put exhale my %zTorigami
	matchwait

BLOW_TRASH:
put drop my %zTorigami
goto HIDE

NO_PRIMER:
put stow paper
wait
PRI_STUDY6_PAUSE:
pause
PRI_STUDY6:
	match PRI_STUDY7 you put
	match PRI_STUDY6_PAUSE ...wait
	match PRI_STUDY6_PAUSE type ahead
put stow primer
	matchwait

PRI_STUDY7:
goto STOW_PAPER

ORI_STUDY6_PAUSE:
pause
ORI_STUDY6:
	match HIDE you put
	match ORI_STUDY6_PAUSE ...wait
	match ORI_STUDY6_PAUSE type ahead
put stow my paper
	matchwait

STOW_PAPER_PAUSE:
pause
STOW_PAPER:
	match STONES you put
	match STOW_PAPER_PAUSE ...wait
	match STOW_PAPER_PAUSE type ahead
put stow my paper
	matchwait


PATTERN:
IF_1 put whis group study
IF_1 pause 5
	match PATTERN1 referring
	match STUDY_COM1_DIRGE you get
	match STUDY_COM1_DIRGE you open
	match QUIT [You're
put get my compendium
put open my compendium
	matchwait

STUDY_COM1_TURN_DIRGE:
pause
	match STUDY_COM1_TURN_DIRGE ...wait
	match STUDY_COM1_TURN_DIRGE type ahead
	match STUDY_COM1_DIRGE You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM1_PAUSE_DIRGE:
pause
STUDY_COM1_DIRGE:
echo
echo STUDY_COM1_DIRGE:
echo
	match STUDY_COM2_TURN_DIRGE Why do you need to study this chart again?
	match STUDY_COM2_TURN_DIRGE sudden moment of clarity
	match STUDY_COM5_TURN_DIRGE difficult time
	match STUDY_COM5_TURN_DIRGE impossible
	match STUDY_COM2_PAUSE_DIRGE gradually absorbing
	match STUDY_COM1_PAUSE_DIRGE ...wait
	match STUDY_COM1_PAUSE_DIRGE type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM2_TURN_DIRGE:
pause
	match STUDY_COM2_TURN_DIRGE ...wait
	match STUDY_COM2_TURN_DIRGE type ahead
	match STUDY_COM2_DIRGE You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM2_PAUSE_DIRGE:
pause
STUDY_COM2_DIRGE:
echo
echo STUDY_COM2_DIRGE:
echo
	match STUDY_COM3_TURN_DIRGE Why do you need to study this chart again?
	match STUDY_COM3_TURN_DIRGE sudden moment of clarity
	match STUDY_COM_STOW_DIRGE difficult time
	match STUDY_COM_STOW_DIRGE impossible
	match STUDY_COM3_PAUSE_DIRGE gradually absorbing
	match STUDY_COM2_PAUSE_DIRGE ...wait
	match STUDY_COM2_PAUSE_DIRGE type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM3_TURN_DIRGE:
pause
	match STUDY_COM3_TURN_DIRGE ...wait
	match STUDY_COM3_TURN_DIRGE type ahead
	match STUDY_COM3_DIRGE You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM3_PAUSE_DIRGE:
pause
STUDY_COM3_DIRGE:
echo
echo STUDY_COM3_DIRGE:
echo
	match STUDY_COM4_TURN_DIRGE Why do you need to study this chart again?
	match STUDY_COM4_TURN_DIRGE sudden moment of clarity
	match STUDY_COM_STOW_DIRGE difficult time
	match STUDY_COM_STOW_DIRGE impossible
	match STUDY_COM4_PAUSE_DIRGE gradually absorbing
	match STUDY_COM3_PAUSE_DIRGE ...wait
	match STUDY_COM3_PAUSE_DIRGE type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM4_TURN_DIRGE:
pause
	match STUDY_COM4_TURN_DIRGE ...wait
	match STUDY_COM4_TURN_DIRGE type ahead
	match STUDY_COM4_DIRGE You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM4_PAUSE_DIRGE:
pause
STUDY_COM4_DIRGE:
echo
echo STUDY_COM4_DIRGE:
echo
	match STUDY_COM5_TURN_DIRGE Why do you need to study this chart again?
	match STUDY_COM5_TURN_DIRGE sudden moment of clarity
	match STUDY_COM_STOW_DIRGE difficult time
	match STUDY_COM_STOW_DIRGE impossible
	match STUDY_COM5_PAUSE_DIRGE gradually absorbing
	match STUDY_COM4_PAUSE_DIRGE ...wait
	match STUDY_COM4_PAUSE_DIRGE type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM5_TURN_DIRGE:
pause
	match STUDY_COM5_TURN_DIRGE ...wait
	match STUDY_COM5_TURN_DIRGE type ahead
	match STUDY_COM5_DIRGE You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM5_PAUSE_DIRGE:
pause
STUDY_COM5_DIRGE:
echo
echo STUDY_COM5_DIRGE:
echo
	match STUDY_COM_STOW_DIRGE Why do you need to study this chart again?
	match STUDY_COM_STOW_DIRGE sudden moment of clarity
	match STUDY_COM_STOW_DIRGE difficult time
	match STUDY_COM_STOW_DIRGE impossible
	match STUDY_COM_STOW2_DIRGE gradually absorbing
	match STUDY_COM5_PAUSE_DIRGE ...wait
	match STUDY_COM5_PAUSE_DIRGE type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM_STOW_PAUSE_DIRGE:
pause
STUDY_COM_STOW_DIRGE:
	match STUDY_COM_STOW2_DIRGE You turn to the section containing
	match STUDY_COM_STOW_PAUSE_DIRGE ...wait
	match STUDY_COM_STOW_PAUSE_DIRGE type ahead
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM_STOW2_PAUSE_DIRGE:
pause
STUDY_COM_STOW2_DIRGE:
	match JUGGLE you put
	match STUDY_COM_STOW_PAUSE_DIRGE ...wait
	match STUDY_COM_STOW_PAUSE_DIRGE type ahead
	match QUIT [You're
put close my compendium
put stow my compendium
	matchwait

PATTERN1:
pause
	match JUGGLE referring
	match DIRGE_STUDY1 you get
	match QUIT [You're
put get my pattern
	matchwait

DIRGE_STUDY1_PAUSE:
pause
DIRGE_STUDY1:
	match D_STUDY_STOW You believe that you understand
	match DIRGE_STUDY2 roundtime
	match D_STUDY_STOW You already know enough
	match D_STUDY_STOW You don't have the proper training for that.
	match DIRGE_STUDY1_PAUSE ...wait
	match DIRGE_STUDY1_PAUSE type ahead
	match QUIT [You're
	match DIRGE_STUDY1_PAUSE Encumbrance:
	match D_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

DIRGE_STUDY2_PAUSE:
pause
DIRGE_STUDY2:
	match D_STUDY_STOW You believe that you understand
	match DIRGE_STUDY3 roundtime
	match D_STUDY_STOW You already know enough
	match DIRGE_STUDY2_PAUSE ...wait
	match DIRGE_STUDY2_PAUSE type ahead
	match QUIT [You're
	match DIRGE_STUDY2_PAUSE Encumbrance:
	match D_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

DIRGE_STUDY3_PAUSE:
pause
DIRGE_STUDY3:
	match D_STUDY_STOW You believe that you understand
	match DIRGE_STUDY4 roundtime
	match D_STUDY_STOW You already know enough
	match DIRGE_STUDY3_PAUSE ...wait
	match DIRGE_STUDY3_PAUSE type ahead
	match QUIT [You're
	match DIRGE_STUDY3_PAUSE Encumbrance:
	match D_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

DIRGE_STUDY4_PAUSE:
pause
DIRGE_STUDY4:
	match D_STUDY_STOW You believe that you understand
	match DIRGE_STUDY5 roundtime
	match D_STUDY_STOW You already know enough
	match DIRGE_STUDY4_PAUSE ...wait
	match DIRGE_STUDY4_PAUSE type ahead
	match QUIT [You're
	match DIRGE_STUDY4_PAUSE Encumbrance:
	match D_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

DIRGE_STUDY5_PAUSE:
pause
DIRGE_STUDY5:
	match D_STUDY_STOW You believe that you understand
	match D_STUDY_STOW roundtime
	match D_STUDY_STOW You already know enough
	match DIRGE_STUDY5_PAUSE ...wait
	match DIRGE_STUDY5_PAUSE type ahead
	match QUIT [You're
	match DIRGE_STUDY5_PAUSE Encumbrance:
	match D_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

D_STUDY_DROP_PAUSE:
pause
D_STUDY_DROP:
	match JUGGLE you drop
	match D_STUDY_DROP_PAUSE ...wait
	match D_STUDY_DROP_PAUSE type ahead
	match QUIT [You're
put drop my pattern
	matchwait

D_STUDY_STOW_PAUSE:
pause
D_STUDY_STOW:
	match JUGGLE you put
	match D_STUDY_STOW_PAUSE ...wait
	match D_STUDY_STOW_PAUSE type ahead
	match QUIT [You're
put stow my pattern
	matchwait

JUGGLE:
IF_1 put whis group juggle
IF_1 waitfor you
pause 2
put get my %zTjugglies
waitfor you
counter set 1
goto JUGGLE%c
JUGGLE_PAUSE:
pause
goto JUGGLE_PAUSE1
JUGGLE1:
JUGGLE2:
JUGGLE3:
JUGGLE4:
JUGGLE5:
JUGGLE6:
JUGGLE7:
JUGGLE8:
counter add 1
JUGGLE_PAUSE1:
	match JUGGLE_PAUSE type ahead
	match JUGGLE_PAUSE ...wait
	match JUGGLE%c roundtime
	match JUGGLE9 heal
	match JUGGLE_STAND You'd have better luck standing up.
	match %s referring
	match %s Please rephrase that command
put Juggle my %zTjugglies
	matchwait

JUGGLE_STAND_PAUSE:
pause
JUGGLE_STAND:
	match JUGGLE_PAUSE1 you stand back up
	match JUGGLE_STAND_PAUSE roundtime
put stand
	matchwait

JUGGLE9:
pause
	match JUGGLE9 type ahead
	match JUGGLE9 ...wait
	match %s you put
	match %s referring
	match %s Stow what?
put stow my %zTjugglies
	match QUIT [You're
	matchwait

APPRAISE:
	echo
	echo APPRAISE:
	echo
APP_REM_CHECK1:
	match APP_STOW_CHECK1 Remove what?
	match APP_APP1_REM you remove
	match APP_APP1_REM you slide
	match APP_APP1_REM you sling
	match APP_APP1_REM you slip
	match APP_APP1_REM you work
	match APP_APP1_REM you pull
	match APP_APP1_REM you take
put rem my %zTapp1
	matchwait
APP_STOW_CHECK1_PAUSE:
pause
APP_STOW_CHECK1:
put get my %zTapp1
wait
put open my %zTapp1
wait
	match APP_APP1_DONE Appraise what?
	matchre APP_APP1_DONE /roundtime|inside something|can't appraise/i
	match APP_STOW_CHECK1_PAUSE ...wait
	match APP_STOW_CHECK1_PAUSE type ahead
put app my %zTapp1 careful
	match I_QUIT [You're
	matchwait

APP_APP1_REM_PAUSE:
pause
APP_APP1_REM:
put open my %zTapp1
wait
	match APP_WEAR_APP1 Appraise what?
	match APP_WEAR_APP1 roundtime
	match APP_APP1_REM_PAUSE ...wait
	match APP_APP1_REM_PAUSE type ahead
put app my %zTapp1 careful
	match I_QUIT [You're
	matchwait


APP_APP1_DONE:
pause
put close my %zTapp1
wait
put stow my %zTapp1
wait
goto APP_REM_CHECK2

APP_WEAR_APP1_PAUSE:
pause
APP_WEAR_APP1:
	match APP_WEAR_APP1_PAUSE ...wait
	match APP_REM2_CHECK2 you
put wear my %zTapp1
	matchwait


APP_REM2_CHECK2:
APP_REM_CHECK2:
	match APP_STOW_CHECK2 Remove what?
	match APP_APP2_REM you remove
	match APP_APP2_REM you sli
	match APP_APP2_REM you sling
	match APP_APP2_REM you work
	match APP_APP2_REM you pull
	match APP_APP2_REM you take
put rem my %zTapp2
	matchwait

APP_STOW_CHECK2_PAUSE:
pause
APP_STOW_CHECK2:
put get my %zTapp2
wait
put open my %zTapp2
wait
	match APP_APP2_DONE1 Appraise what?
	matchre APP_APP2_DONE1 /roundtime|inside something|can't appraise/i
	match APP_STOW_CHECK2_PAUSE ...wait
	match APP_STOW_CHECK2_PAUSE type ahead
put app my %zTapp2 careful
	match I_QUIT [You're
	matchwait

APP_APP2_REM_PAUSE:
pause
APP_APP2_REM:
put open my %zTapp2
wait
	match APP_WEAR_APP2 Appraise what?
	match APP_WEAR_APP2 roundtime
	match APP_APP2_REM_PAUSE ...wait
	match APP_APP2_REM_PAUSE type ahead
put app my %zTapp2 careful
	match I_QUIT [You're
	matchwait


APP_APP2_DONE1:
pause
put close my %zTapp2
wait
put stow my %zTapp2
wait
goto APP_REM_CHECK3

APP_WEAR_APP2_PAUSE:
pause
APP_WEAR_APP2:
	match APP_WEAR_APP2_PAUSE ...wait
	match APP_REM_CHECK3 you
put wear my %zTapp2
	matchwait


APP_REM_CHECK3:
	match APP_STOW_CHECK3 Remove what?
	match APP_APP3_REM you remove
	match APP_APP3_REM you sli
	match APP_APP3_REM you sling
	match APP_APP3_REM you work
	match APP_APP3_REM you pull
	match APP_APP3_REM you take
put rem my %zTapp1
	matchwait
APP_STOW_CHECK3_PAUSE:
pause
APP_STOW_CHECK3:
put get my %zTapp1
wait
put open my %zTapp1
wait
	match APP_APP3_DONE Appraise what?
	matchre APP_APP3_DONE /roundtime|inside something|can't appraise/i
	match APP_STOW_CHECK3_PAUSE ...wait
	match APP_STOW_CHECK3_PAUSE type ahead
put app my %zTapp1 careful
	match I_QUIT [You're
	matchwait

APP_APP3_REM_PAUSE:
pause
APP_APP3_REM:
put open my %zTapp1
wait
	match APP_WEAR_APP3 Appraise what?
	match APP_WEAR_APP3 roundtime
	match APP_APP3_REM_PAUSE ...wait
	match APP_APP3_REM_PAUSE type ahead
put app my %zTapp1 careful
	match I_QUIT [You're
	matchwait


APP_APP3_DONE:
pause
put close my %zTapp1
wait
put stow my %zTapp1
wait
goto APP_REM_CHECK4

APP_WEAR_APP3_PAUSE:
pause
APP_WEAR_APP3:
	match APP_WEAR_APP3_PAUSE ...wait
	match APP_REM4_CHECK4 you
put wear my %zTapp1
	matchwait


APP_REM4_CHECK4:
APP_REM_CHECK4:
	match APP_STOW_CHECK4 Remove what?
	match APP_APP4_REM you remove
	match APP_APP4_REM you sli
	match APP_APP4_REM you sling
	match APP_APP4_REM you work
	match APP_APP4_REM you pull
	match APP_APP4_REM you take
put rem my %zTapp2
	matchwait

APP_STOW_CHECK4_PAUSE:
pause
APP_STOW_CHECK4:
put get my %zTapp2
wait
put open my %zTapp2
wait
	match APP_APP4_DONE3 Appraise what?
	matchre APP_APP4_DONE3 /roundtime|inside something|can't appraise/i
	match APP_STOW_CHECK4_PAUSE ...wait
	match APP_STOW_CHECK4_PAUSE type ahead
put app my %zTapp2 careful
	match I_QUIT [You're
	matchwait

APP_APP4_REM_PAUSE:
pause
APP_APP4_REM:
put open my %zTapp2
wait
	match APP_WEAR_APP4 Appraise what?
	match APP_WEAR_APP4 roundtime
	match APP_APP4_REM_PAUSE ...wait
	match APP_APP4_REM_PAUSE type ahead
put app my %zTapp2 careful
	match I_QUIT [You're
	matchwait


APP_APP4_DONE3:
pause
put close my %zTapp2
wait
put stow my %zTapp2
wait
goto APP_APP4_DONE

APP_WEAR_APP4_PAUSE:
pause
APP_WEAR_APP4:
	match APP_WEAR_APP4_PAUSE ...wait
	match APP_APP4_DONE you
put wear my %zTapp2
	matchwait

APP_APP4_DONE:
goto %s

2FORAGE_PAUSE:
pause
goto 2FOR

2FORAGE:
IF_2 put belch
IF_1 put nod
IF_1 pause 2
IF_1 put whisper group forage
IF_1 pause 4
2FOR:
	match 2FORA feel the need
	match FEED_DONE some grass, some grass, some grass, some grass, some grass, some grass, some grass, some grass, some grass, some grass, some grass and some grass.
put look in feedbag
put belch
	matchwait

2FORA:
	echo
	echo 2FORAGE:
	echo
	match 2FEED You manage to find some grass.
	match 2FORAGE_PAUSE clutter
	match 2FORAGE_PAUSE roundtime
	match 2FORAGE_PAUSE ...wait
	match 2FORAGE_PAUSE type ahead
put forage grass
	match QUIT [You're
	matchwait

2FEED_PAUSE:
pause
2FEED:
	match 2FORAGE1 you put
	match 2FEED_PAUSE ...wait
	match 2FEED_PAUSE type ahead
	match FEED_DONE1 heavy
put put grass in my feedbag
	match QUIT [You're
	matchwait

2FORAGE1_PAUSE:
pause
2FORAGE1:
	echo
	echo 2FORAGE1:
	echo
	match 2FEED1 You manage to find some grass.
	match 2FORAGE1_PAUSE clutter
	match 2FORAGE1_PAUSE roundtime
	match 2FORAGE1_PAUSE ...wait
	match 2FORAGE1_PAUSE type ahead
put forage grass
	match QUIT [You're
	matchwait


2FEED1_PAUSE:
pause
2FEED1:
	match 2FORAGE2 you put
	match 2FEED1_PAUSE ...wait
	match 2FEED1_PAUSE type ahead
	match FEED_DONE2 heavy
put put grass in my feedbag
	match QUIT [You're
	matchwait

2FORAGE2_PAUSE:
pause
2FORAGE2:
	echo
	echo 2FORAGE2:
	echo
	match 2FEED2 You manage to find some grass.
	match 2FORAGE2_PAUSE clutter
	match 2FORAGE2_PAUSE roundtime
	match 2FORAGE2_PAUSE ...wait
	match 2FORAGE2_PAUSE type ahead
put forage grass
	match QUIT [You're
	matchwait


2FEED2_PAUSE:
pause
2FEED2:
	match 2FORAGE3 you put
	match 2FEED2_PAUSE ...wait
	match 2FEED2_PAUSE type ahead
	match FEED_DONE3 heavy
put put grass in my feedbag
	match QUIT [You're
	matchwait

2FORAGE3_PAUSE:
pause
2FORAGE3:
	echo
	echo 2FORAGE3:
	echo
	match 2FEED3 You manage to find some grass.
	match 2FORAGE3_PAUSE clutter
	match 2FORAGE3_PAUSE roundtime
	match 2FORAGE3_PAUSE ...wait
	match 2FORAGE3_PAUSE type ahead
put forage grass
	match QUIT [You're
	matchwait

2FEED3_PAUSE:
pause
2FEED3:
	match FEED_DONE you put
	match 2FEED3_PAUSE ...wait
	match 2FEED3_PAUSE type ahead
	match FEED_DONE heavy
put put grass in my feedbag
	match QUIT [You're
	matchwait

FEED_DONE1:
IF_1 put give cara
IF_1 wait
IF_1 goto 2FORAGE1
goto FEED_DONE

FEED_DONE2:
IF_1 put give cara
IF_1 wait
IF_1 goto 2FORAGE2
goto FEED_DONE

FEED_DONE3:
IF_1 put give cara
IF_1 wait
IF_1 goto 2FORAGE3
goto FEED_DONE



FEED_DONE:
IF_1 put whisper group feed
put give cara
wait
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
goto FEED_NOD


FEED_NOD_PAUSE:
pause
FEED_NOD:
	IF_1 match %s group, "ready
	IF_1 match FEED_NOD_SHIFT YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	IF_1 match QUIt [You're
IF_1 put whisper group done
	IF_1 matchwait
goto %s
FEED_NOD_SHIFT:
shift
shift
goto %s


BRAID_FOR_PAUSE:
pause
FORAGE:
3FORAGE:
BRAID_FOR:
IF_1 put nod
IF_1 pause 2
IF_1 put whisper group braid
	match BRAID_FORA referring
	match BRAID you get
put get my vines
	matchwait

BRAID_FORA_PAUSE:
pause
BRAID_FORA:
	match BRAID You manage to find a vine.
	match BRAID_FORA_PAUSE clutter
	match BRAID_FOR1 roundtime
	match BRAID_FORA_PAUSE ...wait
	match BRAID_FORA_PAUSE type ahead
	match QUIT [You're
put forage vine
	matchwait


BRAID_FOR1:
counter set 1
BRAID_FOR2:
BRAID_FOR3:
BRAID_FOR4:
counter add 1
goto BRAIDING_FOR

BRAIDING_FOR_PAUSE:
pause
BRAIDING_FOR:
	match BRAID You manage to find a vine.
	match BRAIDING_FOR_PAUSE clutter
	match BRAID_FOR%c roundtime
	match BRAIDING_FOR_PAUSE ...wait
	match BRAIDING_FOR_PAUSE type ahead
	match QUIT [You're
put forage vine
	matchwait


BRAID_FOR5_PAUSE:
pause
BRAID_FOR5:
	match HIDE you put
	match HIDE Stow what?
	match HIDE_VINE after stuffing it
	match BRAID_FOR5_PAUSE ...wait
put stow my vine
	matchwait

BRAID_PAUSE:
pause
BRAID:
	match BRAID1 roundtime
	match BRAID_FORA You need to have
	match BRAID_PULL The braided vines is already
	match BRAID_PULL Better just PULL
	match BRAID_PAUSE type ahead
	match BRAID_PAUSE ...wait
put braid my vine
	matchwait

BRAID1:
counter set 1
BRAID2:
BRAID3:
BRAID4:
counter add 1
goto F_B
BRAID2_PAUSE:
pause
F_B:
	match BRAID%c roundtime
	match BRAID5 You need to have
	match BRAID_PULL The braided vines is already
	match BRAID_PULL Better just PULL
	match BRAID2_PAUSE type ahead
	match BRAID2_PAUSE ...wait
put braid my vine
	matchwait
BRAID_PULL_PAUSE:
pause
BRAID_PULL:
	match BRAID_DROP roundtime
	match HIDE With a muttered curse you throw away the ruined pieces.
	match BRAID_PULL_PAUSE ...wait
	match BRAID_PULL_PAUSE type ahead
put pull my vine
	matchwait

BRAID_DROP_PAUSE:
pause
BRAID_DROP:
	match BRAID_DROPB you drop
	match BRAID_DROPB referring
	match BRAID_DROP_PAUSE ...wait
	match BRAID_DROP_PAUSE type ahead
put drop rope
	matchwait

BRAID_DROPB:
put drop my vine
wait
goto HIDE

BRAID5_PAUSE:
pause
BRAID5:
	match BRAID5_PAUSE ...wait
	match BRAID5_PAUSE type ahead
	match HIDE you put
	match HIDE_VINE after stuffing it
	match HIDE stow what?
put stow my vines
	matchwait



GON_STONES:
	match %s referring
	match GON_STONE1 you get
put get my stones
	matchwait


GON_STONE1_PAUSE:
pause
GON_STONE1:
counter set 1
	match %s Remove what?
	match GON_STONE2_C roundtime
	match GON_STONE_STOW exactly
	match GON_STONE1_PAUSE ...wait
	match GON_STONE1_PAUSE type ahead
put remove %c stones
	matchwait

GON_STONE2_RC:
counter set 1
goto GON_STONE2
GON_STONE2_C:
counter add 1
goto GON_STONE2_COMB

GON_STONE2_COMB_PAUSE:
pause
GON_STONE2_COMB:
	match GON_STONE2 You combine
	match GON_STONE3_COMB roundtime
	match GON_STONE2_COMB_PAUSE ...wait
	match GON_STONE2_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

GON_STONE2_PAUSE:
pause
GON_STONE2:
	match GON_STONE3_C roundtime
	match GON_STONE2_RC exactly
	match GON_STONE2_PAUSE ...wait
	match GON_STONE2_PAUSE type ahead
put remove %c stones
	matchwait

GON_STONE3_RC:
counter set 1
goto GON_STONE3
GON_STONE3_C:
counter add 1
goto GON_STONE3_COMB

GON_STONE3_COMB_PAUSE:
pause
GON_STONE3_COMB:
	match GON_STONE3 You combine
	match GON_STONE4_COMB roundtime
	match GON_STONE3_COMB_PAUSE ...wait
	match GON_STONE3_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

GON_STONE3_PAUSE:
pause
GON_STONE3:
	match GON_STONE4_C roundtime
	match GON_STONE3_RC exactly
	match GON_STONE3_PAUSE ...wait
	match GON_STONE3_PAUSE type ahead
put remove %c stones
	matchwait

GON_STONE4_RC:
counter set 1
goto GON_STONE4
GON_STONE4_C:
counter add 1
goto GON_STONE4_COMB

GON_STONE4_COMB_PAUSE:
pause
GON_STONE4_COMB:
	match GON_STONE4 You combine
	match GON_STONE5_COMB roundtime
	match GON_STONE4_COMB_PAUSE ...wait
	match GON_STONE4_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

GON_STONE4_PAUSE:
pause
GON_STONE4:
	match GON_STONE5_C roundtime
	match GON_STONE4_RC exactly
	match GON_STONE4_PAUSE ...wait
	match GON_STONE4_PAUSE type ahead
put remove %c stones
	matchwait

GON_STONE5_RC:
counter set 1
goto GON_STONE5
GON_STONE5_C:
counter add 1
goto GON_STONE5_COMB

GON_STONE5_COMB_PAUSE:
pause
GON_STONE5_COMB:
	match GON_STONE5 You combine
	match GON_STONE6 roundtime
	match GON_STONE5_COMB_PAUSE ...wait
	match GON_STONE5_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

GON_STONE5_PAUSE:
pause
GON_STONE5:
	match GON_STONE6_COMB roundtime
	match GON_STONE5_RC exactly
	match GON_STONE5_PAUSE ...wait
	match GON_STONE5_PAUSE type ahead
put remove %c stones
	matchwait

GON_STONE6_RC:
counter set 1
goto GON_STONE6
GON_STONE6_C:
counter add 1
goto GON_STONE6_COMB

GON_STONE6_COMB_PAUSE:
pause
GON_STONE6_COMB:
	match GON_STONE6 You combine
	match GON_STONE7_COMB roundtime
	match GON_STONE6_COMB_PAUSE ...wait
	match GON_STONE6_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

GON_STONE6_PAUSE:
pause
GON_STONE6:
	match GON_STONE7_COMB roundtime
	match GON_STONE6_RC exactly
	match GON_STONE6_PAUSE ...wait
	match GON_STONE6_PAUSE type ahead
put remove %c stones
	matchwait

GON_STONE7_RC:
counter set 1
goto GON_STONE7
GON_STONE7_C:
counter add 1
goto GON_STONE7_COMB

GON_STONE7_COMB_PAUSE:
pause
GON_STONE7_COMB:
	match GON_STONE7 You combine
	match GON_STONE8_COMB roundtime
	match GON_STONE7_COMB_PAUSE ...wait
	match GON_STONE7_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

GON_STONE7_PAUSE:
pause
GON_STONE7:
	match GON_STONE8_COMB roundtime
	match GON_STONE7_RC exactly
	match GON_STONE7_PAUSE ...wait
	match GON_STONE7_PAUSE type ahead
put remove %c stones
	matchwait

GON_STONE8_RC:
counter set 1
goto GON_STONE8
GON_STONE8_C:
counter add 1
goto GON_STONE8_COMB

GON_STONE8_COMB_PAUSE:
pause
GON_STONE8_COMB:
	match GON_STONE8 You combine
	match GON_STONE9_COMB roundtime
	match GON_STONE8_COMB_PAUSE ...wait
	match GON_STONE8_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

GON_STONE8_PAUSE:
pause
GON_STONE8:
	match GON_STONE9_COMB roundtime
	match GON_STONE8_RC exactly
	match GON_STONE8_PAUSE ...wait
	match GON_STONE8_PAUSE type ahead
put remove %c stones
	matchwait

GON_STONE9_RC:
counter set 1
goto GON_STONE9
GON_STONE9_C:
counter add 1
goto GON_STONE9_COMB

GON_STONE9_COMB_PAUSE:
pause
GON_STONE9_COMB:
	match GON_STONE9 You combine
	match GON_STONE10_COMB roundtime
	match GON_STONE9_COMB_PAUSE ...wait
	match GON_STONE9_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

GON_STONE9_PAUSE:
pause
GON_STONE9:
	match GON_STONE10_COMB roundtime
	match GON_STONE9_RC exactly
	match GON_STONE9_PAUSE ...wait
	match GON_STONE9_PAUSE type ahead
put remove %c stones
	matchwait

GON_STONE10_RC:
counter set 1
goto GON_STONE10
GON_STONE10_C:
counter add 1
goto GON_STONE10_COMB

GON_STONE10_COMB_PAUSE:
pause
GON_STONE10_COMB:
	match GON_STONE10 You combine
	match GON_STONE11_COMB roundtime
	match GON_STONE10_COMB_PAUSE ...wait
	match GON_STONE10_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

GON_STONE10_PAUSE:
pause
GON_STONE10:
	match GON_STONE11_COMB roundtime
	match GON_STONE10_RC exactly
	match GON_STONE10_PAUSE ...wait
	match GON_STONE10_PAUSE type ahead
put remove %c stones
	matchwait

GON_STONE11_COMB_PAUSE:
pause
GON_STONE11_COMB:
	match GON_STONE11 You combine
	match GON_STONE11_COMB roundtime
	match GON_STONE11_COMB_PAUSE ...wait
	match GON_STONE11_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

GON_STONE11_PAUSE:
pause
GON_STONE11:
	match %s you put
	match GON_STONE6_PAUSE type ahead
	match GON_STONE6_PAUSE ...wait
put stow my stones
	matchwait

GON_ORIGAMI:
	echo
	echo GON_ORIGAMI:
	echo
IF_1 put belch
IF_1 wait
IF_1 put nod
IF_1 pause 2
IF_1 put whisper group origami
GON_PAPER_CHECK:
	match GON_ENVELOPE referring
	match GON_FOLD1 You are already holding that
	match GON_FOLD1 you get a piece
put get my paper
	matchwait

GON_WEAR_ENV:
put wear my env
wait
GON_ENVELOPE:
	match GON_INSTRU you get a
	match GON_REM_ENV The envelope is empty.
	match GON_GET_ENV You must be either wearing
	match GON_STONES I'm afraid that you can't pull that.
put pull my origami-paper envelope
	matchwait

GON_REM_ENV:
put rem env
put drop env
waitfor you drop
GON_GET_ENV_WEAR:
	match GON_WEAR_ENV you get
	match GON_STONES referring
put get my origami-paper envelope
	matchwait

GON_DROP_ENV:
put drop my or env
wait
GON_GET_ENV:
	match GON_PULL_ENV you get
	match GON_STONES referring
put get my origami-paper envelope
	matchwait

GON_PULL_ENV:
	match GON_STOW_ENV you get a
	match GON_DROP_ENV The envelope is empty.
	match GON_STONES I'm afraid that you can't pull that.
put pull my origami-paper envelope
	matchwait

GON_STOW_ENV:
put stow my ori env
waitfor you
GON_INSTRU:
counter set 1
goto GON_ORI_STUDY1

GON_ORI_STUDY2:
GON_ORI_STUDY3:
GON_ORI_STUDY4:
GON_ORI_STUDY5:
GON_ORI_STUDY6:
GON_ORI_STUDY7:
GON_ORI_STUDY8:
GON_ORI_STUDY9:
goto GON_ORI_STUDY1
GON_ORI_STUDY_PAUSE:
pause
GON_ORI_STUDY1:
counter add 1
	match GON_ORI_STUDY%c You turn the instructions this way and that
	match GON_GET_PRIMER You take on a studious look.
	match GON_GET_PRIMER You study the sky
	match GON_FOLD1 and begin to fold
	match GON_ORI_STUDY_PAUSE ...wait
	match GON_ORI_STUDY_PAUSE type ahead
put study my %zTorigami instruction
	matchwait

GON_GET_PRIMER:
	match GON_STOW_PAPER referring
	match GON_OPEN_PRIMER you get
put get my ori primer
	matchwait

GON_OPEN_PRIMER:
put open my primer
wait
goto GON_PRI_STUDY1


GON_PRI_STUDY2:
GON_PRI_STUDY3:
GON_PRI_STUDY4:
GON_PRI_STUDY5:
GON_PRI_STUDY6:
GON_PRI_STUDY7:
GON_PRI_STUDY8:
GON_PRI_STUDY9:
GON_PRI_STUDY_PAUSE:
pause
GON_PRI_STUDY1:
counter add 1
	match GON_PRI_STUDY%c You turn the instructions this way and that
	match GON_NO_PRIMER You take on a studious look.
	match GON_NO_PRIMER You study the sky
	match GON_PRI_FOLD and begin to fold
	match GON_PRI_STUDY_PAUSE ...wait
	match GON_PRI_STUDY_PAUSE type ahead
put study my %zTorigami instruction
	matchwait

GON_PRI_FOLD_PAUSE:
pause
GON_PRI_FOLD:
	match GON_PRI_FOLD_PAUSE ...wait
	match GON_PRI_FOLD_PAUSE type ahead
	match GON_PRI_FOLD2 you close
put close primer
	matchwait

GON_PRI_FOLD2:
put stow primer
wait
GON_FOLD1:
counter set 1

GON_FOLD2:
GON_FOLD3:
GON_FOLD4:
GON_FOLD5:
GON_FOLD6:
GON_FOLD7:
GON_FOLD8:
GON_FOLD9:
counter add 1
goto GON_FOLD

GON_FOLD_PAUSE:
pause
GON_FOLD:
	match GON_FOLD%c roundtime
	match GON_INSTRU You need to study your instructions
	match GON_PAPER_DROP project is ruined.
	match GON_BLOW You make the final fold
	match GON_BLOW referring
	match GON_FOLD_PAUSE ...wait
	match GON_FOLD_PAUSE type ahead
put fold my paper
	matchwait
GON_FOLD10_PAUSE:
pause
GON_FOLD10:
	match %s you put
	match GON_FOLD10_PAUSE ...wait
	match GON_FOLD10_PAUSE type ahead
put stow my paper
	matchwait


GON_PAPER_DROP_PAUSE:
pause
GON_PAPER_DROP:
	match %s you drop
	match PAPER_DROP_PAUSE ...wait
	match PAPER_DROP_PAUSE type ahead
put drop my paper
	matchwait

GON_BLOW_PAUSE:
pause
GON_BLOW:
	match %s You exhale into your
	match %s blow into it
	match %s referring
	match GON_BLOW_PAUSE ...wait
	match GON_BLOW_PAUSE type ahead
	match GON_TRASH Smoking commands
	match GON_TRASH you blow gently
put exhale my %zTorigami
	matchwait

GON_TRASH:
put drop my %zTorigami
goto %s

GON_NO_PRIMER:
put stow paper
wait
GON_PRI_STUDY10_PAUSE:
pause
GON_PRI_STUDY10:
	match GON_PRI_STUDY11 you put
	match GON_PRI_STUDY10_PAUSE ...wait
	match GON_PRI_STUDY10_PAUSE type ahead
put stow primer
	matchwait

GON_PRI_STUDY11:
goto GON_STOW_PAPER

GON_ORI_STUDY10_PAUSE:
pause
GON_ORI_STUDY10:
	match %s you put
	match GON_ORI_STUDY10_PAUSE ...wait
	match GON_ORI_STUDY10_PAUSE type ahead
put stow my paper
	matchwait

GON_STOW_PAPER_PAUSE:
pause
GON_STOW_PAPER:
	match %s you put
	match GON_STOW_PAPER_PAUSE ...wait
	match GON_STOW_PAPER_PAUSE type ahead
put stow my paper
	matchwait

I_PATTERN:
IF_1 put whis group study
IF_1 pause 5
	match I_PATTERN1 referring
	match STUDY_COM1_INTER you get
	match STUDY_COM1_INTER you open
	match QUIT [You're
put get my compendium
put open my compendium
	matchwait

STUDY_COM1_TURN_INTER:
pause
	match STUDY_COM1_TURN_INTER ...wait
	match STUDY_COM1_TURN_INTER type ahead
	match STUDY_COM1_INTER You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM1_PAUSE_INTER:
pause
STUDY_COM1_INTER:
echo
echo STUDY_COM1_INTER:
echo
	match STUDY_COM2_TURN_INTER Why do you need to study this chart again?
	match STUDY_COM2_TURN_INTER sudden moment of clarity
	match STUDY_COM5_TURN_INTER difficult time
	match STUDY_COM5_TURN_INTER impossible
	match STUDY_COM2_PAUSE_INTER gradually absorbing
	match STUDY_COM1_PAUSE_INTER ...wait
	match STUDY_COM1_PAUSE_INTER type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM2_TURN_INTER:
pause
	match STUDY_COM2_TURN_INTER ...wait
	match STUDY_COM2_TURN_INTER type ahead
	match STUDY_COM2_INTER You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM2_PAUSE_INTER:
pause
STUDY_COM2_INTER:
echo
echo STUDY_COM2_INTER:
echo
	match STUDY_COM3_TURN_INTER Why do you need to study this chart again?
	match STUDY_COM3_TURN_INTER sudden moment of clarity
	match STUDY_COM_STOW_INTER difficult time
	match STUDY_COM_STOW_INTER impossible
	match STUDY_COM3_PAUSE_INTER gradually absorbing
	match STUDY_COM2_PAUSE_INTER ...wait
	match STUDY_COM2_PAUSE_INTER type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM3_TURN_INTER:
pause
	match STUDY_COM3_TURN_INTER ...wait
	match STUDY_COM3_TURN_INTER type ahead
	match STUDY_COM3_INTER You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM3_PAUSE_INTER:
pause
STUDY_COM3_INTER:
echo
echo STUDY_COM3_INTER:
echo
	match STUDY_COM4_TURN_INTER Why do you need to study this chart again?
	match STUDY_COM4_TURN_INTER sudden moment of clarity
	match STUDY_COM_STOW_INTER difficult time
	match STUDY_COM_STOW_INTER impossible
	match STUDY_COM4_PAUSE_INTER gradually absorbing
	match STUDY_COM3_PAUSE_INTER ...wait
	match STUDY_COM3_PAUSE_INTER type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM4_TURN_INTER:
pause
	match STUDY_COM4_TURN_INTER ...wait
	match STUDY_COM4_TURN_INTER type ahead
	match STUDY_COM4_INTER You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM4_PAUSE_INTER:
pause
STUDY_COM4_INTER:
echo
echo STUDY_COM4_INTER:
echo
	match STUDY_COM5_TURN_INTER Why do you need to study this chart again?
	match STUDY_COM5_TURN_INTER sudden moment of clarity
	match STUDY_COM_STOW_INTER difficult time
	match STUDY_COM_STOW_INTER impossible
	match STUDY_COM5_PAUSE_INTER gradually absorbing
	match STUDY_COM4_PAUSE_INTER ...wait
	match STUDY_COM4_PAUSE_INTER type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM5_TURN_INTER:
pause
	match STUDY_COM5_TURN_INTER ...wait
	match STUDY_COM5_TURN_INTER type ahead
	match STUDY_COM5_INTER You turn to the section containing
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM5_PAUSE_INTER:
pause
STUDY_COM5_INTER:
echo
echo STUDY_COM5_INTER:
echo
	match STUDY_COM_STOW_INTER Why do you need to study this chart again?
	match STUDY_COM_STOW_INTER sudden moment of clarity
	match STUDY_COM_STOW_INTER difficult time
	match STUDY_COM_STOW_INTER impossible
	match STUDY_COM_STOW2_INTER gradually absorbing
	match STUDY_COM5_PAUSE_INTER ...wait
	match STUDY_COM5_PAUSE_INTER type ahead
	match QUIT [You're
put study my compendium
	matchwait

STUDY_COM_STOW_PAUSE_INTER:
pause
STUDY_COM_STOW_INTER:
	match STUDY_COM_STOW2_INTER You turn to the section containing
	match STUDY_COM_STOW_PAUSE_INTER ...wait
	match STUDY_COM_STOW_PAUSE_INTER type ahead
	match QUIT [You're
put turn my compendium
	matchwait

STUDY_COM_STOW2_PAUSE_INTER:
pause
STUDY_COM_STOW2_INTER:
	match %s you put
	match STUDY_COM_STOW_PAUSE_INTER ...wait
	match STUDY_COM_STOW_PAUSE_INTER type ahead
	match QUIT [You're
put close my compendium
put stow my compendium
	matchwait

I_PATTERN1:
pause
	match %s referring
	match I_STUDY1 you get
	match QUIT [You're
put get my pattern
	matchwait

I_STUDY1_PAUSE:
pause
I_STUDY1:
	match I_STUDY_STOW You believe that you understand
	match I_STUDY2 roundtime
	match I_STUDY_STOW You already know enough
	match I_STUDY_STOW You don't have the proper training for that.
	match I_STUDY1_PAUSE ...wait
	match I_STUDY1_PAUSE type ahead
	match QUIT [You're
	match I_STUDY1_PAUSE Encumbrance:
	match I_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

I_STUDY2_PAUSE:
pause
I_STUDY2:
	match I_STUDY_STOW You believe that you understand
	match I_STUDY3 roundtime
	match I_STUDY_STOW You already know enough
	match I_STUDY2_PAUSE ...wait
	match I_STUDY2_PAUSE type ahead
	match QUIT [You're
	match I_STUDY2_PAUSE Encumbrance:
	match I_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

I_STUDY3_PAUSE:
pause
I_STUDY3:
	match I_STUDY_STOW You believe that you understand
	match I_STUDY4 roundtime
	match I_STUDY_STOW You already know enough
	match I_STUDY3_PAUSE ...wait
	match I_STUDY3_PAUSE type ahead
	match QUIT [You're
	match I_STUDY3_PAUSE Encumbrance:
	match I_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

I_STUDY4_PAUSE:
pause
I_STUDY4:
	match I_STUDY_STOW You believe that you understand
	match I_STUDY5 roundtime
	match I_STUDY_STOW You already know enough
	match I_STUDY4_PAUSE ...wait
	match I_STUDY4_PAUSE type ahead
	match QUIT [You're
	match I_STUDY4_PAUSE Encumbrance:
	match I_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

I_STUDY5_PAUSE:
pause
I_STUDY5:
	match I_STUDY_STOW You believe that you understand
	match I_STUDY_STOW roundtime
	match I_STUDY_STOW You already know enough
	match I_STUDY5_PAUSE ...wait
	match I_STUDY5_PAUSE type ahead
	match QUIT [You're
	match I_STUDY5_PAUSE Encumbrance:
	match I_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

I_STUDY_DROP_PAUSE:
pause
I_STUDY_DROP:
	match %s you drop
	match I_STUDY_DROP_PAUSE ...wait
	match I_STUDY_DROP_PAUSE type ahead
	match QUIT [You're
put drop my pattern
	matchwait

I_STUDY_STOW_PAUSE:
pause
I_STUDY_STOW:
	match %s you put
	match I_STUDY_STOW_PAUSE ...wait
	match I_STUDY_STOW_PAUSE type ahead
	match QUIT [You're
put stow my pattern
	matchwait

NO_GO:
	echo
	echo *******************************
	echo ** Don't know where you are! **
	echo *******************************
	echo
exit

QUIT:
put quit
exit


T:
TE:
TEA:
TEAC:
TEACH:
TEACHE:
TEACHER:
goto TEACHER%zTSET
1T:
1TE:
1TEA:
1TEAC:
1TEACH:
1TEACHE:
1TEACHER:
TEACHER1:
shift
save T_TEACH1
echo
echo ************************************************************
echo ** This script is designed for sending a teacher with your trading group.
echo **
echo ** Please do a replace for the following text strings.
echo ** Replace them with values you prefer.
echo **
echo **
echo ** Script will teach after every bank trip. Defaults to teaching Evasion.
echo **
echo ** To manually teach a skill have the main trader say "stop teaching" while
echo ** the group is moving and no one is training. Then say "teach <skill>" to
echo ** begin teaching the new skill and have everyone listen automatically.
echo **
echo ** Supported skills are:
echo ** teach evasion
echo ** teach armor
echo ** teach teaching
echo ** teach hiding
echo ** teach stalking
echo ** teach weapon
echo ** teach mechanical
echo ** teach climbing
echo ** teach swimming
echo ** teach escaping
echo ** teach foraging
echo ** teach first aid
echo ** teach devices
echo ** teach parry
echo ** teach shields
echo ** teach skinning
echo ** teach animal lore
echo ** teach brawling
echo ** teach lockpicking
echo ** teach disarming
echo *************************************************************
echo
IF_1 goto T_START
echo
echo ************************************************************
echo ** Script must be started .SFtrader TEACHER <jugglies> <master> (name) (name)
echo ** <>=required  ()=optional
echo ** <jugglies> are your jugglies
echo ** <master> is the full first name of the main trader
echo ** (name) is the full first name of any additional students
echo ************************************************************
echo
exit



T_START:
echo
echo **************************
echo ** Beginning as Teacher **
echo **************************
echo
put set inac
waitfor Ok.
put avoid all
wait
put avoid !join
waitfor you're now
T_JOIN:
	match T_LOOK obvious
	match T_IDLE IDLE
	match T_BEGIN %1%'s group
	match T_BEGIN %1 just arrived
	match T_BEGIN are already following
	match T_BEGIN %1 glances at you
put join %1
	match T_QUIT [You're
	matchwait
T_IDLE:
put skill
goto T_JOIN


T_BEGIN:
	echo
	echo BEGIN:
	echo
	match T_DONE Darkstone Inn, Stables
	match T_DONE Stone Clan, Trader's Guild Outpost
	match T_DONE Swotting Hall, Trader's Center
	match T_DONE Traders' Guild, Shipment Center
	match T_DONE Wolf Clan Trader Outpost
	match T_DONE Tiger Clan, Trader's Guild Outpost
	match T_DONE Eshar's Trading Post, Main Room
	match T_WAIT obvious
put look
	match T_QUIT [You're
	matchwait
T_DONE:
	echo
	echo DONE:
	echo
put leave
pause 8
goto T_CON_STOW
T_CON_STOW_PAUSE:
pause
T_CON_STOW:
put nod %1
waitfor you nod
put rem my %zTapp1
wait
put get my %zTapp1
wait
put open my %zTapp1
wait
	match T_APP1_DONE Appraise what?
	match T_APP1_DONE roundtime
	match T_CON_STOW_PAUSE ...wait
	match T_CON_STOW_PAUSE type ahead
put app my %zTapp1 Quick
	match QUIT [You're
	matchwait

T_APP1_DONE:
pause
put close my %zTapp1
wait
put wear my %zTapp1
wait
put stow my %zTapp1
wait
put rem my %zTapp2
wait
put get my %zTapp2
wait
put open my %zTapp2
wait

T_APP2_PAUSE:
pause
T_APP2:
	match T_APP_DONE Appraise what?
	match T_APP_DONE roundtime
	match T_APP2_PAUSE ...wait
	match T_APP2_PAUSE type ahead
put app my %zTapp2 quick
	match QUIT [You're
	matchwait

T_APP_DONE:
pause
put close my %zTapp2
wait
put wear my %zTapp2
wait
put stow my %zTapp2
wait

T_NOD:
waitfor %1 hums
put join %1
put whisper group ready
waitfor whisper
T_NOD2:
	echo
	echo T_NOD2:
	echo
	match T_CON_DONE %1's group just
	match T_CON_DONE %1%'s group just
	match T_CON_DONE You follow %1
	match T_BANK_WAIT group, "Anyone for Leth?"
	match T_BANK_WAIT2 group, "bank run
	match T_QUIT [You're
	matchwait

T_CON_DONE:
	echo
	echo CON_DONE:
	echo
goto T_WAIT


T_BANK_WAIT:
pause 3
put shake head %1
T_BANK_WAIT2:
	echo
	echo BANK_WAIT:
	echo
	match T_BANK Provincial Bank, Teller
	match T_QUIT [You're
	matchwait
T_BANK:
put dep all
waitfor you
put bala
waitfor you
counter set %zTcoin
goto T_WITHDRAW

T_WITHDRAW_PAUSE:
counter subtract 25
T_WITHDRAW:
	match T_BANK_DONE and hands them over
	match T_BANK_DONE The clerk asks
	match T_BANK_DONE The clerk exclaims
	match T_BANK_DONE must be at a bank teller
	match T_WITHDRAW_PAUSE The clerk tells you,
put withdraw %c %zTcurrency
	match T_QUIT [You're
	matchwait

T_BANK_DONE:
put whisper group done
waitfor You notice a thick, steel door just peeking
goto T_B_TEACH

T_BANK_DONE1:
pause 2
put nod %1
nextroom
nextroom
nextroom

T_WAIT:
	echo
	echo T_WAIT:
	echo
	match T_PATTERN group, "study
	match T_FEED_DONE group, "feed
	match T_FEED_DONE group, "done
	match T_APP_HIDE group, "app hide
	match T_ACCEPT Enter ACCEPT to accept the offer or DECLINE to decline it.
	match T_STOP_TEACH "stop teach
	match T_TEACH1 "teach eva
	match T_TEACH2 "teach arm
	match T_TEACH3 "teach tea
	match T_TEACH4 "teach hid
	match T_TEACH5 "teach sta
	match T_TEACH6 "teach wea
	match T_TEACH7 "teach mec
	match T_TEACH8 "teach cli
	match T_TEACH9 "teach swi
	match T_TEACH10 "teach esc
	match T_TEACH11 "teach for
	match T_TEACH12 "teach fir
	match T_TEACH13 "teach dev
	match T_TEACH14 "teach par
	match T_TEACH15 "teach shi
	match T_TEACH16 "teach ski
	match T_TEACH17 "teach ani
	match T_TEACH18 "teach bra
	match T_TEACH19 "teach loc
	match T_TEACH20 "teach dis
	match T_TEACH21 "teach app
	match T_TEACH22 "teach sch
	match T_DONE shipment clerk
	match T_DONE shipping clerk
	match T_B_TEACH group, "hide
	match T_BROOK group, "brook
	match T_TRAIL group, "trail
	match T_JUGGLE group, "juggle
	match T_ORIGAMI group, "origami
	match T_QUIT [You're
	matchwait

T_WAIT_VINE:
put drop vine
pause
goto T_WAIT

T_ORIGAMI:
	echo
	echo T_ORIGAMI:
	echo
T_PAPER_CHECK:
	match T_ENVELOPE referring
	match T_FOLD1 You are already holding that
	match T_FOLD1 you get a piece
put get my paper
	matchwait

T_WEAR_ENV:
put wear my env
wait
T_ENVELOPE:
	match T_INSTRU you get a
	match T_REM_ENV The envelope is empty.
	match T_GET_ENV You must be either wearing
	match T_STONES I'm afraid that you can't pull that.
put pull my origami-paper envelope
	matchwait

T_REM_ENV:
put rem env
put drop env
waitfor you drop
T_GET_ENV_WEAR:
	match T_WEAR_ENV you get
	match T_STONES referring
put get my origami-paper envelope
	matchwait

T_DROP_ENV:
put drop my or env
wait
T_GET_ENV:
	match T_PULL_ENV you get
	match T_STONES referring
put get my origami-paper envelope
	matchwait

T_PULL_ENV:
	match T_STOW_ENV you get a
	match T_DROP_ENV The envelope is empty.
	match T_STONES I'm afraid that you can't pull that.
put pull my origami-paper envelope
	matchwait

T_STOW_ENV:
put stow my ori env
waitfor you
T_INSTRU:
counter set 1
goto T_ORI_STUDY1

T_ORI_STUDY2:
T_ORI_STUDY3:
T_ORI_STUDY4:
T_ORI_STUDY5:
goto T_ORI_STUDY1
T_ORI_STUDY_PAUSE:
pause
T_ORI_STUDY1:
counter add 1
	match T_ORI_STUDY%c You turn the instructions this way and that
	match T_GET_PRIMER You take on a studious look.
	match T_GET_PRIMER You study the sky
	match T_FOLD1 and begin to fold
	match T_ORI_STUDY_PAUSE ...wait
	match T_ORI_STUDY_PAUSE type ahead
put study my %zTorigami instruction
	matchwait

T_GET_PRIMER:
	match T_STOW_PAPER referring
	match T_OPEN_PRIMER you get
put get my ori primer
	matchwait

T_OPEN_PRIMER:
put open my primer
wait
goto T_PRI_STUDY1


T_PRI_STUDY2:
T_PRI_STUDY3:
T_PRI_STUDY4:
T_PRI_STUDY5:
T_PRI_STUDY_PAUSE:
pause
T_PRI_STUDY1:
counter add 1
	match T_PRI_STUDY%c You turn the instructions this way and that
	match T_NO_PRIMER You take on a studious look.
	match T_NO_PRIMER You study the sky
	match T_PRI_FOLD and begin to fold
	match T_PRI_STUDY_PAUSE ...wait
	match T_PRI_STUDY_PAUSE type ahead
put study my %zTorigami instruction
	matchwait

T_PRI_FOLD_PAUSE:
pause
T_PRI_FOLD:
	match T_PRI_FOLD_PAUSE ...wait
	match T_PRI_FOLD_PAUSE type ahead
	match T_PRI_FOLD2 you close
put close primer
	matchwait

T_PRI_FOLD2:
put stow primer
wait
T_FOLD1:
counter set 1

T_FOLD2:
T_FOLD3:
T_FOLD4:
T_FOLD5:
counter add 1
goto T_FOLD

T_FOLD_PAUSE:
pause
T_FOLD:
	match T_FOLD%c roundtime
	match T_INSTRU You need to study your instructions
	match T_BLOW You make the final fold
	match T_BLOW referring
	match T_FOLD_PAUSE ...wait
	match T_FOLD_PAUSE type ahead
put fold my paper
	matchwait
T_FOLD6_PAUSE:
pause
T_FOLD6:
	match T_WAIT you put
	match T_FOLD6_PAUSE ...wait
	match T_FOLD6_PAUSE type ahead
put stow my paper
	matchwait

T_BLOW_PAUSE:
pause
T_BLOW:
	match T_WAIT You exhale into your
	match T_WAIT blow into it
	match T_WAIT referring
	match T_BLOW_PAUSE ...wait
	match T_BLOW_PAUSE type ahead
	match T_TRASH Smoking commands
	match T_TRASH you blow gently
put exhale my %zTorigami
	matchwait

T_TRASH:
put drop my %zTorigami
goto T_WAIT


T_NO_PRIMER:
put stow paper
wait
T_PRI_STUDY6_PAUSE:
pause
T_PRI_STUDY6:
	match T_PRI_STUDY7 you put
	match T_PRI_STUDY6_PAUSE ...wait
	match T_PRI_STUDY6_PAUSE type ahead
put stow primer
	matchwait

T_PRI_STUDY7:
goto T_STOW_PAPER

T_ORI_STUDY6_PAUSE:
pause
T_ORI_STUDY6:
	match T_WAIT you put
	match T_ORI_STUDY6_PAUSE ...wait
	match T_ORI_STUDY6_PAUSE type ahead
put stow my paper
	matchwait

T_STOW_PAPER_PAUSE:
pause
T_STOW_PAPER:
	match T_STONES you put
	match T_STOW_PAPER_PAUSE ...wait
	match T_STOW_PAPER_PAUSE type ahead
put stow my paper
	matchwait

T_FEED_DONE:
IF_2 goto T_WAIT
	match T_FEED_DONE group, "done
	match T_WAIT you whisper
	match T_QUIT [You're
put whisper group ready
	matchwait

T_TRAIL_STOW:
put stow left
put stow right
T_TRAIL:
	match T_WAIT Northern Trade Road, Foothills
	match T_TRAIL1 but you find it hard going
	match T_TRAIL1 A wave of dizziness hits you
	match T_TRAIL1 but you can't seem to find purchase
	match T_TRAIL1 Struck by vertigo
	match T_TRAIL1 your footing is questionable
	match T_TRAIL_STAND few feet and fall to the ground
	match T_TRAIL_STOW1 free
	match T_TRAIL_STAND stand
	match T_QUIT [You're
	match T_TRAIL_STOW hands
	matchwait

T_TRAIL_STAND_PAUSE:
pause
T_TRAIL_STAND:
	match T_TRAIL1_PAUSE You stand back up
	match T_TRAIL_STAND_PAUSE roundtime
put stand
	match T_QUIT [You're
	matchwait

T_TRAIL_STOW1:
put stow left
wait
put stow right
wait
T_TRAIL1_PAUSE:
pause
T_TRAIL1:
	match T_TRAIL2 Northern Trade Road, Foothill
	match T_TRAIL1_PAUSE Foothills, Stony Incline
	match T_TRAIL1_PAUSE but you find it hard going
	match T_TRAIL1_PAUSE A wave of dizziness hits you
	match T_TRAIL1_PAUSE but you can't seem to find purchase
	match T_TRAIL1_PAUSE Struck by vertigo
	match T_TRAIL1_PAUSE your footing is questionable
	match T_TRAIL_STAND few feet and fall to the ground
	match T_TRAIL_STOW free
	match T_TRAIL_STAND stand
put climb trail
	match T_QUIT [You're
	matchwait

T_TRAIL2:
move go outpost
goto T_DONE

T_STOP_TEACH:
put stop teach
goto T_WAIT


T_TEACH:
put stop teach
waitfor you
T_B_TEACH:
put wield my %zTweapteach
put rem my %zTweapteach
wait
put teach %zTteach to %1
IF_2 waitfor you
IF_2 put teach %zTteach to %2
IF_3 waitfor you
IF_3 put teach %zTteach to %3
IF_4 waitfor you
IF_4 put teach %zTteach to %4
IF_5 waitfor you
IF_5 put teach %zTteach to %5
IF_6 waitfor you
IF_6 put teach %zTteach to %6
IF_7 waitfor you
IF_7 put teach %zTteach to %7
IF_8 waitfor you
IF_8 put teach %zTteach to %8
IF_9 waitfor you
IF_9 put teach %zTteach to %9
waitfor you
put sheath
put wear my %zTweapteach
goto T_TEACH_LOOK

T_TEACH1:
setvariable zTteach evasion
goto T_TEACH

T_TEACH2:
setvariable zTteach armor
goto T_TEACH

T_TEACH3:
setvariable zTteach teaching
goto T_TEACH

T_TEACH4:
setvariable zTteach hiding
goto T_TEACH

T_TEACH5:
setvariable zTteach stalking
goto T_TEACH

T_TEACH6:
setvariable zTteach weapon
goto T_TEACH

T_TEACH7:
setvariable zTteach mechanical
goto T_TEACH

T_TEACH8:
setvariable zTteach climbing
goto T_TEACH

T_TEACH9:
setvariable zTteach swimming
goto T_TEACH

T_TEACH10:
setvariable zTteach escaping
goto T_TEACH

T_TEACH11:
setvariable zTteach foraging
goto T_TEACH

T_TEACH12:
setvariable zTteach firstaid
goto T_TEACH

T_TEACH13:
setvariable zTteach devices
goto T_TEACH

T_TEACH14:
setvariable zTteach parry
goto T_TEACH

T_TEACH15:
setvariable zTteach shields
goto T_TEACH

T_TEACH16:
setvariable zTteach skinning
goto T_TEACH

T_TEACH17:
setvariable zTteach animallore
goto T_TEACH

T_TEACH18:
setvariable zTteach brawling
goto T_TEACH

T_TEACH19:
setvariable zTteach lockpicking
goto T_TEACH

T_TEACH20:
setvariable zTteach disarming
goto T_TEACH

T_TEACH21:
setvariable zTteach appraisal
goto T_TEACH

T_TEACH22:
setvariable zTteach scholarship
goto T_TEACH

T_TEACH_LOOK:
	match T_BANK_DONE1 Traders' Guild, Narrow Corridor
	match T_WAIT obvious
put look
	matchwait


T_STONES:
	match T_BRAID_FOR referring
	match T_STONE1A you get
put get my stones
	matchwait


T_STONE1_PAUSE:
pause
T_STONE1A:
counter set 1
	match T_BRAID_FOR Remove what?
	match T_STONE2_C roundtime
	match T_STONE_STOW exactly
	match T_STONE1_PAUSE ...wait
	match T_STONE1_PAUSE type ahead
put remove %c stones
	matchwait

T_STONE2_RC:
counter set 1
goto T_STONE2
T_STONE2_C:
counter add 1
goto T_STONE2_COMB

T_STONE2_COMB_PAUSE:
pause
T_STONE2_COMB:
	match T_STONE2 You combine
	match T_STONE2_COMB roundtime
	match T_STONE2_COMB_PAUSE ...wait
	match T_STONE2_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

T_STONE2_PAUSE:
pause
T_STONE2:
	match T_STONE3_C roundtime
	match T_STONE3_RC exactly
	match T_STONE2_PAUSE ...wait
	match T_STONE2_PAUSE type ahead
put remove %c stones
	matchwait

T_STONE3_RC:
counter set 1
goto T_STONE3
T_STONE3_C:
counter add 1
goto T_STONE3_COMB

T_STONE3_COMB_PAUSE:
pause
T_STONE3_COMB:
	match T_STONE3 You combine
	match T_STONE4_COMB roundtime
	match T_STONE3_COMB_PAUSE ...wait
	match T_STONE3_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

T_STONE3_PAUSE:
pause
T_STONE3:
	match T_STONE4_C roundtime
	match T_STONE3_RC exactly
	match T_STONE3_PAUSE ...wait
	match T_STONE3_PAUSE type ahead
put remove %c stones
	matchwait

T_STONE4_RC:
counter set 1
goto T_STONE4
T_STONE4_C:
counter add 1
goto T_STONE4_COMB

T_STONE4_COMB_PAUSE:
pause
T_STONE4_COMB:
	match T_STONE4 You combine
	match T_STONE5_COMB roundtime
	match T_STONE4_COMB_PAUSE ...wait
	match T_STONE4_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

T_STONE4_PAUSE:
pause
T_STONE4:
	match T_STONE5_C roundtime
	match T_STONE4_RC exactly
	match T_STONE4_PAUSE ...wait
	match T_STONE4_PAUSE type ahead
put remove %c stones
	matchwait

T_STONE5_RC:
counter set 1
goto T_STONE5
T_STONE5_C:
counter add 1
goto T_STONE5_COMB

T_STONE5_COMB_PAUSE:
pause
T_STONE5_COMB:
	match T_STONE5 You combine
	match T_STONE6 roundtime
	match T_STONE5_COMB_PAUSE ...wait
	match T_STONE5_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

T_STONE5_PAUSE:
pause
T_STONE5:
	match T_STONE6_COMB roundtime
	match T_STONE5_RC exactly
	match T_STONE5_PAUSE ...wait
	match T_STONE5_PAUSE type ahead
put remove %c stones
	matchwait

T_STONE6_COMB_PAUSE:
pause
T_STONE6_COMB:
	match T_STONE6 You combine
	match T_STONE6_COMB roundtime
	match T_STONE6_COMB_PAUSE ...wait
	match T_STONE6_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

T_STONE6_PAUSE:
pause
T_STONE6:
	match T_WAIT you put
	match T_STONE6_PAUSE type ahead
	match T_STONE6_PAUSE ...wait
put stow my stones
	matchwait

T_BRAID_FOR_PAUSE:
pause
T_FORAGE:
T_3FORAGE:
T_BRAID_FOR:
	match T_BRAID_FORA referring
	match T_BRAID you get
put get my vines
	matchwait

T_BRAID_FORA_PAUSE:
pause
T_BRAID_FORA:
	match T_BRAID You manage to find a vine.
	match T_BRAID_FOR1 roundtime
	match T_BRAID_FORA_PAUSE ...wait
	match T_BRAID_FORA_PAUSE type ahead
	match T_QUIT [You're
put forage vine
	matchwait


T_BRAID_FOR1:
counter set 1
T_BRAID_FOR2:
T_BRAID_FOR3:
T_BRAID_FOR4:
T_BRAID_FOR5:
T_BRAID_FOR6:
T_BRAID_FOR7:
T_BRAID_FOR8:
T_BRAID_FOR9:
counter add 1
goto T_BRAIDING_FOR

T_BRAIDING_FOR_PAUSE:
pause
T_BRAIDING_FOR:
	match T_BRAID You manage to find a vine.
	match T_BRAID_FOR%c roundtime
	match T_BRAIDING_FOR_PAUSE ...wait
	match T_BRAIDING_FOR_PAUSE type ahead
	match T_QUIT [You're
put forage vine
	matchwait

T_BRAID_FOR10_PAUSE:
pause
T_BRAID_FOR10:
	match T_BRAID10_PAUSE ...wait
	match T_BRAID10_PAUSE type ahead
	match T_WAIT you put
	match T_WAIT_VINE after stuffing it
	match T_WAIT stow what?
put stow my vine
	matchwait

T_BRAID_PAUSE:
pause
T_BRAID:
	match T_BRAID1 roundtime
	match T_BRAID_FORA You need to have
	match T_BRAID_PULL The braided vines is already
	match T_BRAID_PULL Better just PULL
	match T_BRAID_PAUSE type ahead
	match T_BRAID_PAUSE ...wait
put braid my vine
	matchwait

T_BRAID1:
counter set 1
T_BRAID2:
T_BRAID3:
T_BRAID4:
T_BRAID5:
counter add 1
goto T_L_B
T_BRAID2_PAUSE:
pause
T_L_B:
	match T_BRAID%c roundtime
	match T_BRAID6 You need to have
	match T_BRAID_PULL The braided vines is already
	match T_BRAID_PULL Better just PULL
	match T_BRAID2_PAUSE type ahead
	match T_BRAID2_PAUSE ...wait
put braid my vine
	matchwait
T_BRAID_PULL_PAUSE:
pause
T_BRAID_PULL:
	match T_BRAID_DROP roundtime
	match T_BRAID_PULL_PAUSE ...wait
	match T_BRAID_PULL_PAUSE type ahead
	match T_WAIT With a muttered curse you throw away the ruined pieces.
put pull my vine
	matchwait

T_BRAID_DROP_PAUSE:
pause
T_BRAID_DROP:
	match T_BRAID_DROPB you drop
	match T_BRAID_DROPB referring
	match T_BRAID_DROP_PAUSE ...wait
	match T_BRAID_DROP_PAUSE type ahead
put drop rope
	matchwait

T_BRAID_DROPB:
put drop my vine
wait
goto T_WAIT

T_BRAID6_PAUSE:
pause
T_BRAID6:
	match T_BRAID6_PAUSE ...wait
	match T_BRAID6_PAUSE type ahead
	match T_WAIT you put
	match T_WAIT stow what?
	match T_WAIT_VINE after stuffing it
put stow my vines
	matchwait


T_PATTERN:
	match T_PATTERN1 referring
	match T_STUDY_COM1 you get
	match T_STUDY_COM1 you open
	match T_QUIT [You're
put get my compendium
put open my compendium
	matchwait

T_STUDY_COM1_TURN:
pause
	match T_STUDY_COM1_TURN ...wait
	match T_STUDY_COM1_TURN type ahead
	match T_STUDY_COM1 You turn to the section containing
	match T_QUIT [You're
put turn my compendium
	matchwait

T_STUDY_COM1_PAUSE:
pause
T_STUDY_COM1:
	echo
	echo STUDY_COM1:
	echo
	match T_STUDY_COM2_TURN Why do you need to study this chart again?
	match T_STUDY_COM2_TURN sudden moment of clarity
	match T_STUDY_COM3_TURN difficult time
	match T_STUDY_COM3_TURN impossible
	match T_STUDY_COM2_PAUSE gradually absorbing
	match T_STUDY_COM1_PAUSE ...wait
	match T_STUDY_COM1_PAUSE type ahead
	match T_QUIT [You're
put study my compendium
	matchwait

T_STUDY_COM2_TURN:
pause
	match T_STUDY_COM2_TURN ...wait
	match T_STUDY_COM2_TURN type ahead
	match T_STUDY_COM2 You turn to the section containing
	match T_QUIT [You're
put turn my compendium
	matchwait

T_STUDY_COM2_PAUSE:
pause
T_STUDY_COM2:
	echo
	echo STUDY_COM2:
	echo
	match T_STUDY_COM3_TURN Why do you need to study this chart again?
	match T_STUDY_COM3_TURN sudden moment of clarity
	match T_STUDY_COM4_TURN difficult time
	match T_STUDY_COM4_TURN impossible
	match T_STUDY_COM3_PAUSE gradually absorbing
	match T_STUDY_COM2_PAUSE ...wait
	match T_STUDY_COM2_PAUSE type ahead
	match T_QUIT [You're
put study my compendium
	matchwait

T_STUDY_COM3_TURN:
pause
	match T_STUDY_COM3_TURN ...wait
	match T_STUDY_COM3_TURN type ahead
	match T_STUDY_COM3 You turn to the section containing
	match T_QUIT [You're
put turn my compendium
	matchwait

T_STUDY_COM3_PAUSE:
pause
T_STUDY_COM3:
	echo
	echo STUDY_COM3:
	echo
	match T_STUDY_COM4_TURN Why do you need to study this chart again?
	match T_STUDY_COM4_TURN sudden moment of clarity
	match T_STUDY_COM5_TURN difficult time
	match T_STUDY_COM5_TURN impossible
	match T_STUDY_COM4_PAUSE gradually absorbing
	match T_STUDY_COM3_PAUSE ...wait
	match T_STUDY_COM3_PAUSE type ahead
	match T_QUIT [You're
put study my compendium
	matchwait

T_STUDY_COM4_TURN:
pause
	match T_STUDY_COM4_TURN ...wait
	match T_STUDY_COM4_TURN type ahead
	match T_STUDY_COM4 You turn to the section containing
	match T_QUIT [You're
put turn my compendium
	matchwait

T_STUDY_COM4_PAUSE:
pause
T_STUDY_COM4:
	echo
	echo STUDY_COM4:
	echo
	match T_STUDY_COM5_TURN Why do you need to study this chart again?
	match T_STUDY_COM5_TURN sudden moment of clarity
	match T_STUDY_COM_STOW difficult time
	match T_STUDY_COM_STOW impossible
	match T_STUDY_COM5_PAUSE gradually absorbing
	match T_STUDY_COM4_PAUSE ...wait
	match T_STUDY_COM4_PAUSE type ahead
	match T_QUIT [You're
put study my compendium
	matchwait

T_STUDY_COM5_TURN:
pause
	match T_STUDY_COM5_TURN ...wait
	match T_STUDY_COM5_TURN type ahead
	match T_STUDY_COM5 You turn to the section containing
	match T_QUIT [You're
put turn my compendium
	matchwait

T_STUDY_COM5_PAUSE:
pause
T_STUDY_COM5:
	echo
	echo STUDY_COM5:
	echo
	match T_STUDY_COM_STOW Why do you need to study this chart again?
	match T_STUDY_COM_STOW sudden moment of clarity
	match T_STUDY_COM_STOW difficult time
	match T_STUDY_COM_STOW impossible
	match T_STUDY_COM_STOW2 gradually absorbing
	match T_STUDY_COM5_PAUSE ...wait
	match T_STUDY_COM5_PAUSE type ahead
	match T_QUIT [You're
put study my compendium
	matchwait

T_STUDY_COM_STOW_PAUSE:
pause
T_STUDY_COM_STOW:
	match T_STUDY_COM_STOW2 You turn to the section containing
	match T_STUDY_COM_STOW_PAUSE ...wait
	match T_STUDY_COM_STOW_PAUSE type ahead
	match T_QUIT [You're
put turn my compendium
	matchwait

T_STUDY_COM_STOW2_PAUSE:
pause
T_STUDY_COM_STOW2:
	match T_WAIT you put
	match T_STUDY_COM_STOW_PAUSE ...wait
	match T_STUDY_COM_STOW_PAUSE type ahead
	match T_QUIT [You're
put close my compendium
put stow my compendium
	matchwait


T_PATTERN1:
pause
	match T_WAIT referring
	match T_STUDY1 you get
	match T_QUIT [You're
put get my pattern
	matchwait

T_STUDY1_PAUSE:
pause
T_STUDY1:
	match T_STUDY_STOW You believe that you understand
	match T_STUDY2 roundtime
	match T_STUDY_STOW You already know enough
	match T_STUDY_STOW You don't have the proper training for that.
	match T_STUDY1_PAUSE ...wait
	match T_STUDY1_PAUSE type ahead
	match T_QUIT [You're
	match T_STUDY1_PAUSE Encumbrance:
	match T_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

T_STUDY2_PAUSE:
pause
T_STUDY2:
	match T_STUDY_STOW You believe that you understand
	match T_STUDY3 roundtime
	match T_STUDY_STOW You already know enough
	match T_STUDY2_PAUSE ...wait
	match T_STUDY2_PAUSE type ahead
	match T_QUIT [You're
	match T_STUDY2_PAUSE Encumbrance:
	match T_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

T_STUDY3_PAUSE:
pause
T_STUDY3:
	match T_STUDY_STOW You believe that you understand
	match T_STUDY4 roundtime
	match T_STUDY_STOW You already know enough
	match T_STUDY3_PAUSE ...wait
	match T_STUDY3_PAUSE type ahead
	match T_QUIT [You're
	match T_STUDY3_PAUSE Encumbrance:
	match T_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

T_STUDY4_PAUSE:
pause
T_STUDY4:
	match T_STUDY_STOW You believe that you understand
	match T_STUDY5 roundtime
	match T_STUDY_STOW You already know enough
	match T_STUDY4_PAUSE ...wait
	match T_STUDY4_PAUSE type ahead
	match T_QUIT [You're
	match T_STUDY4_PAUSE Encumbrance:
	match T_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

T_STUDY5_PAUSE:
pause
T_STUDY5:
	match T_STUDY_STOW You believe that you understand
	match T_STUDY_STOW roundtime
	match T_STUDY_STOW You already know enough
	match T_STUDY5_PAUSE ...wait
	match T_STUDY5_PAUSE type ahead
	match T_QUIT [You're
	match T_STUDY5_PAUSE Encumbrance:
	match T_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

T_STUDY_DROP_PAUSE:
pause
T_STUDY_DROP:
	match T_WAIT you drop
	match T_STUDY_DROP_PAUSE ...wait
	match T_STUDY_DROP_PAUSE type ahead
	match T_QUIT [You're
put drop my pattern
	matchwait

T_STUDY_STOW_PAUSE:
pause
T_STUDY_STOW:
	match T_WAIT you put
	match T_STUDY_STOW_PAUSE ...wait
	match T_STUDY_STOW_PAUSE type ahead
	match T_QUIT [You're
put stow my pattern
	matchwait

T_JUGGLE:
put get my %zTjugglies
waitfor you
counter set 1
goto T_JUGGLE%c
T_JUGGLE_PAUSE:
pause
goto T_JUGGLE_PAUSE1
T_JUGGLE1:
T_JUGGLE2:
T_JUGGLE3:
T_JUGGLE4:
#T_JUGGLE5:
counter add 1
T_JUGGLE_PAUSE1:
	match T_JUGGLE_PAUSE type ahead
	match T_JUGGLE_PAUSE ...wait
	match T_JUGGLE%c roundtime
	match T_JUGGLE6 heal
	match T_WAIT referring
	match T_WAIT Please rephrase that command
put Juggle my %zTjugglies
	matchwait

T_JUGGLE6_PAUSE:
pause
T_JUGGLE5:
pause
	match T_JUGGLE6_PAUSE type ahead
	match T_JUGGLE6_PAUSE ...wait
	match T_WAIT you put
	match T_WAIT referring
	match T_WAIT Stow what?
put stow my %zTjugglies
	match T_QUIT [You're
	matchwait


T_PRAISE:
put praise %1
pause 2
put 'We love you great %1 You are the most magnificent being on earth!
pause 2
put grovel %1
pause 2
put 'We subject ourselves to your godly wisdom, please be just and kind to us!
pause 2
put dance grace
pause 2
put 'We celebrate our divine love for you, %1 May we forever bask in your glorious light!
pause 2
put whisper %1 Is that what you wanted? Did we impress all the lesser mortals for you?
waitfor whisper
put smile at %1 lovingly.
goto T_WAIT

T_UNHIDE:
put belch
wait
goto T_WAIT

T_SHARE:
put share all kro
wait
goto T_WAIT


T_BROOK:
waitfor roundtime
pause
pause 2
put whisper group ready
waitfor roundtime
pause
pause 2
put whisper group ready
goto T_WAIT


T_LOOK:
	echo
	echo LOOK:
	echo
	match T_DONE shipping clerk
	match T_DONE shipment clerk
	match T_WAIT obvious
put look
	match T_QUIT [You're
	matchwait

T_ACCEPT:
put accept
wait
put stow right
wait


T_TIP:
put accept tip
wait
goto T_WAIT


T_APP_HIDE_PAUSE:
pause
T_APP_HIDE:
put open my gem pouch
wait

T_APP_CROSS_FERRY_PAUSE:
pause
T_APP_CROSS_FERRY:
	match T_APP_POUCH_C_F Appraise what?
	matchre T_APP_POUCH_C_F /roundtime|inside something|can't appraise/i
	match T_APP_CROSS_FERRY_PAUSE ...wait
	match T_APP_CROSS_FERRY_PAUSE type ahead
put app my %zTapp1 quick
	match T_QUIT [You're
	matchwait

T_APP_POUCH_C_F_PAUSE:
pause
T_APP_POUCH_C_F:
	match T_APP_BUN_C_F Appraise what?
	matchre T_APP_BUN_C_F /roundtime|inside something|can't appraise/i
	match T_APP_POUCH_C_F_PAUSE ...wait
	match T_APP_POUCH_C_F_PAUSE type ahead
put app my %zTapp2 quick
	match T_QUIT [You're
	matchwait

T_APP_BUN_C_F_PAUSE:
pause
T_APP_BUN_C_F:
	match T_APP_POUCH1_C_F Appraise what?
	matchre T_APP_POUCH1_C_F /roundtime|inside something|can't appraise/i
	match T_APP_BUN_C_F_PAUSE ...wait
	match T_APP_BUN_C_F_PAUSE type ahead
put app my %zTapp1 quick
	match T_QUIT [You're
	matchwait


T_APP_POUCH1_C_F_PAUSE:
pause
T_APP_POUCH1_C_F:
	match T_APP_BUN1_C_F Appraise what?
	matchre T_APP_BUN1_C_F /roundtime|inside something|can't appraise/i
	match T_APP_POUCH1_C_F_PAUSE ...wait
	match T_APP_POUCH1_C_F_PAUSE type ahead
put app my %zTapp2 quick
	match T_QUIT [You're
	matchwait

T_APP_BUN1_C_F_PAUSE:
pause
T_APP_BUN1_C_F:
	match T_APP_POUCH2_C_F Appraise what?
	matchre T_APP_POUCH2_C_F /roundtime|inside something|can't appraise/i
	match T_APP_BUN1_C_F_PAUSE ...wait
	match T_APP_BUN1_C_F_PAUSE type ahead
put app my %zTapp1 quick
	match T_QUIT [You're
	matchwait


T_APP_POUCH2_C_F_PAUSE:
pause
T_APP_POUCH2_C_F:
	match T_APP_BUN2_C_F Appraise what?
	matchre T_APP_BUN2_C_F /roundtime|inside something|can't appraise/i
	match T_APP_POUCH2_C_F_PAUSE ...wait
	match T_APP_POUCH2_C_F_PAUSE type ahead
put app my %zTapp2 quick
	match T_QUIT [You're
	matchwait

T_APP_BUN2_C_F_PAUSE:
pause
T_APP_BUN2_C_F:
	match T_FERRY_TO_CROSS_CLOSE Appraise what?
	matchre T_FERRY_TO_CROSS_CLOSE /roundtime|inside something|can't appraise/i
	match T_APP_BUN2_C_F_PAUSE ...wait
	match T_APP_BUN2_C_F_PAUSE type ahead
put app my %zTapp1 quick
	match T_QUIT [You're
	matchwait

T_FERRY_TO_CROSS_CLOSE_PAUSE:
pause
T_FERRY_TO_CROSS_CLOSE:
	match T_PATTERN_APP close
	match T_PATTERN_APP referring
	match T_FERRY_TO_CROSS_CLOSE_PAUSE ...wait
	match T_FERRY_TO_CROSS_CLOSE_PAUSE type ahead
put close my gem pouch
	match T_QUIT [You're
	matchwait


T_PATTERN_APP:
	match T_JUGGLE referring
	match T_STUDY1_APP you get
	match T_QUIT [You're
put get my pattern
	matchwait

T_STUDY1_PAUSE_APP:
pause
T_STUDY1_APP:
	match T_STUDY_STOW_APP You believe that you understand
	match T_STUDY2_APP roundtime
	match T_STUDY_STOW_APP You already know enough
	match T_STUDY_STOW_APP You don't have the proper training for that.
	match T_STUDY1_PAUSE_APP ...wait
	match T_STUDY1_PAUSE_APP type ahead
	match T_QUIT [You're
	match T_STUDY1_PAUSE_APP Encumbrance:
	match T_STUDY_STOW_APP so much that you can't make out any
put study my pattern
put encum
	matchwait

T_STUDY2_PAUSE_APP:
pause
T_STUDY2_APP:
	match T_STUDY_STOW_APP You believe that you understand
	match T_STUDY3_APP roundtime
	match T_STUDY_STOW_APP You already know enough
	match T_STUDY2_PAUSE_APP ...wait
	match T_STUDY2_PAUSE_APP type ahead
	match T_QUIT [You're
	match T_STUDY2_PAUSE_APP Encumbrance:
	match T_STUDY_STOW_APP so much that you can't make out any
put study my pattern
put encum
	matchwait

T_STUDY3_PAUSE_APP:
pause
T_STUDY3_APP:
	match T_STUDY_STOW_APP You believe that you understand
	match T_STUDY4_APP roundtime
	match T_STUDY_STOW_APP You already know enough
	match T_STUDY3_PAUSE_APP ...wait
	match T_STUDY3_PAUSE_APP type ahead
	match T_QUIT [You're
	match T_STUDY3_PAUSE_APP Encumbrance:
	match T_STUDY_STOW_APP so much that you can't make out any
put study my pattern
put encum
	matchwait

T_STUDY4_PAUSE_APP:
pause
T_STUDY4_APP:
	match T_STUDY_STOW_APP You believe that you understand
	match T_STUDY5_APP roundtime
	match T_STUDY_STOW_APP You already know enough
	match T_STUDY4_PAUSE_APP ...wait
	match T_STUDY4_PAUSE_APP type ahead
	match T_QUIT [You're
	match T_STUDY4_PAUSE_APP Encumbrance:
	match T_STUDY_STOW_APP so much that you can't make out any
put study my pattern
put encum
	matchwait

T_STUDY5_PAUSE_APP:
pause
T_STUDY5_APP:
	match T_STUDY_STOW_APP You believe that you understand
	match T_STUDY_STOW_APP roundtime
	match T_STUDY_STOW_APP You already know enough
	match T_STUDY5_PAUSE_APP ...wait
	match T_STUDY5_PAUSE_APP type ahead
	match T_QUIT [You're
	match T_STUDY5_PAUSE_APP Encumbrance:
	match T_STUDY_STOW_APP so much that you can't make out any
put study my pattern
put encum
	matchwait

T_STUDY_STOW_PAUSE_APP:
pause
T_STUDY_STOW_APP:
	match T_JUGGLE you put
	match T_STUDY_STOW_PAUSE_APP ...wait
	match T_STUDY_STOW_PAUSE_APP type ahead
	match T_QUIT [You're
put stow my pattern
	matchwait


T_QUIT:
put quit
exit

P:
PA:
PAR:
PART:
PARTN:
PARTNE:
PARTNER:
goto PARTNER%zTSET
1P:
1PA:
1PAR:
1PART:
1PARTN:
1PARTNE:
1PARTNER:
PARTNER1:
shift
IF_1 goto P_START
echo
echo ************************************************************
echo ** Script must be started .SFtrader PARTNER <name> (caravan) (teacher)
echo ** <> = required  ()=optional
echo ** <name> is the name of the master using SFtrader.
echo ** (caravan) is what caravan to feed. Second, Third, fourth...
echo ** (teacher) is the name of the non trader teacher using SFtrader TEACHER
echo ************************************************************
echo
exit



P_START:
echo
echo **************************
echo ** Beginning as Partner **
echo **************************
echo
put set inac
waitfor Ok.
put avoid all
wait
put avoid !join
waitfor you're now
put rent cara
wait
P_JOIN:
	match P_BEGIN %1 glances at you
	match P_LOOK obvious
	match P_IDLE IDLE
	match P_BEGIN %1%'s group
	match P_BEGIN %1 just arrived
	match P_BEGIN are already following
put join %1
	match P_QUIT [You're
	matchwait
P_IDLE:
put skill
goto P_JOIN


P_BEGIN:
	echo
	echo BEGIN:
	echo
	match P_DIRGE Darkstone Inn, Stables
	match P_STONE Stone Clan, Trader's Guild Outpost
	match P_ARTHE Swotting Hall, Trader's Center
	match P_CROSS Traders' Guild, Shipment Center
	match P_WOLF Wolf Clan Trader Outpost
	match P_TIGER Tiger Clan, Trader's Guild Outpost
	match P_LETH Eshar's Trading Post, Main Room
	match P_WAIT obvious
put look
	match P_QUIT [You're
	matchwait
P_DONE:
	echo
	echo DONE:
	echo
put rent caravan
wait
put read my contract
wait
put stow my contract
wait
goto P_CON_STOW
P_CON_STOW_PAUSE:
pause
P_CON_STOW:
put nod %1
waitfor you nod
put rem my %zTapp1
wait
put get my %zTapp1
wait
put open my %zTapp1
wait
	match P_APP1_DONE Appraise what?
	match P_APP1_DONE roundtime
	match P_CON_STOW_PAUSE ...wait
	match P_CON_STOW_PAUSE type ahead
put app my %zTapp1 careful
	match QUIT [You're
	matchwait

P_APP1_DONE:
pause
put close my %zTapp1
wait
put wear my %zTapp1
wait
put stow my %zTapp1
wait
put rem my %zTapp2
wait
put get my %zTapp2
wait
put open my %zTapp2
wait

P_APP2_PAUSE:
pause
P_APP2:
	match P_APP_DONE Appraise what?
	match P_APP_DONE roundtime
	match P_APP2_PAUSE ...wait
	match P_APP2_PAUSE type ahead
put app my %zTapp2 careful
	match QUIT [You're
	matchwait

P_APP_DONE:
pause
put close my %zTapp2
wait
put wear my %zTapp2
wait
put stow my %zTapp2
wait

P_NOD:
	match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	match P_NOD3 %1 hums
	match P_QUIT [You're
	matchwait

P_NOD3:
put join %1
wait
put whisper group ready
waitfor whisper
P_NOD2:
	echo
	echo P_NOD2:
	echo
	match P_CON_DONE %1's group just
	match P_CON_DONE %1%'s group just
	match P_CON_DONE You follow %1
	match P_NEED_LETH group, "Anyone for Leth?"
	match P_BANK_WAIT group, "bank run
	match P_QUIT [You're
	match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	matchwait

P_CON_DONE:
	echo
	echo CON_DONE:
	echo
put tell caravan follow
put tell caravan join
waitfor you
put tell caravan go fast
goto P_WAIT

P_NEED_LETH:
	echo
	echo P_NEED_LETH:
	echo
	match P_NO_NEED_LETH referring
	match P_NO_NEED_LETH_DROP expired
	match P_NEED_LETH1 andaen
	match P_NEED_LETH1 andu
	match P_NEED_LETH1 11 anlaen
	match P_NEED_LETH1 10 anlaen
	match P_NEED_LETH1 9 anlaen
	match P_NEED_LETH1 8 anlaen
	match P_NEED_LETH1 7 anlaen
	match P_NEED_LETH1 6 anlaen
	match P_NEED_LETH1 5 anlaen
	match P_NEED_LETH1 4 anlaen
	match P_NEED_LETH1 3 anlaen
	match P_YES_NEED_LETH1 2 anlaen
	match P_YES_NEED_LETH1 anlas
put read my first leth contract
	match P_QUIT [You're
	matchwait

P_NEED_LETH1:
	echo
	echo P_NEED_LETH1:
	echo
	match P_NO_NEED_LETH referring
	match P_NEED_LETH2 andaen
	match P_NEED_LETH2 andu
	match P_NEED_LETH2 11 anlaen
	match P_NEED_LETH2 10 anlaen
	match P_NEED_LETH2 9 anlaen
	match P_NEED_LETH2 8 anlaen
	match P_NEED_LETH2 7 anlaen
	match P_NEED_LETH2 6 anlaen
	match P_NEED_LETH2 5 anlaen
	match P_NEED_LETH2 4 anlaen
	match P_NEED_LETH2 3 anlaen
	match P_YES_NEED_LETH1 2 anlaen
	match P_YES_NEED_LETH1 anlas
put read my second leth contract
	match P_QUIT [You're
	matchwait

P_NEED_LETH2:
	echo
	echo P_NEED_LETH2:
	echo
	match P_YES_NEED_LETH referring
	match P_YES_NEED_LETH1 andaen
	match P_YES_NEED_LETH1 andu
	match P_YES_NEED_LETH1 11 anlaen
	match P_YES_NEED_LETH1 10 anlaen
	match P_YES_NEED_LETH1 9 anlaen
	match P_YES_NEED_LETH1 8 anlaen
	match P_YES_NEED_LETH1 7 anlaen
	match P_YES_NEED_LETH1 6 anlaen
	match P_YES_NEED_LETH1 5 anlaen
	match P_YES_NEED_LETH1 4 anlaen
	match P_YES_NEED_LETH1 3 anlaen
	match P_YES_NEED_LETH1 2 anlaen
	match P_YES_NEED_LETH1 anlas
put read my third leth contract
	match P_QUIT [You're
	matchwait


P_YES_NEED_LETH1:
put whisper group I have three for Leth.
goto P_BANK_WAIT

P_YES_NEED_LETH:
pause
put nod %1
goto P_BANK_WAIT

P_NO_NEED_LETH:
pause
put shake head %1
goto P_BANK_WAIT


P_BANK_WAIT:
	echo
	echo BANK_WAIT:
	echo
	match P_BANK Provincial Bank, Teller
	match P_QUIT [You're
	matchwait
P_BANK:
put dep all
waitfor you
put bala
waitfor you
counter set %zTcoin
goto P_WITHDRAW

P_WITHDRAW_PAUSE:
counter subtract 25
pause
P_WITHDRAW:
	match P_BANK_DONE and hands them over
	match P_BANK_DONE The clerk asks
	match P_BANK_DONE The clerk exclaims
	match P_BANK_DONE must be at a bank teller
	match P_WITHDRAW_PAUSE The clerk tells you,
put withdraw %c %zTcurrency
	match P_QUIT [You're
	matchwait

P_BANK_DONE:
put whisper group done
	IF_3 match P_BANK_LISTEN you must LISTEN
	IF_3 match P_BANK_DONE1 %3 nods to %1
	IF_3 match P_BANK_DONE1 Traders' Guild, Hall of Records
	IF_3 match P_IDLE2 YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	IF_3 matchwait
P_BANK_LISTEN:
IF_3 put listen to %3
goto P_BANK_DONE1

P_IDLE2:
put whisper group YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.

P_BANK_DONE1:
waitfor Traders' Guild, Shipment Center
nextroom
put tell caravan follow
put tell caravan join
waitfor you
put tell caravan go fast
goto P_WAIT

P_SHARE:
put share all kro
wait
put share all dok
wait
put share all lir
wait
goto P_WAIT

P_WAIT:
	echo
	echo P_WAIT:
	echo
	match P_PATTERN group, "study
	match P_ORIGAMI group, "origami
	match P_APP_HIDE group, "app hide
	match P_UNHIDE %1 nods
	match P_JOIN group, "join
	match P_ACCEPT Enter ACCEPT to accept the offer or DECLINE to decline it.
	match P_TIP accept tip
	match P_SHARE group, "share
	match P_LOOK shipment clerk
	match P_LOOK shipping clerk
	match P_LISTEN "teach
	match P_LISTEN1 LISTEN TO
	match P_HIDE group, "hide
	match P_PRAISE %1 exclaims, "Love me!
	match P_FEED_NOD group, "done
	match P_FEED_DONE group, "feed
	match P_2FORAGE group, "forage
	match P_BROOK group, "brook
	match P_LOOK group, "look
	match P_TRAIL group, "trail
	match P_JUGGLE group, "juggle
	match P_QUIT [You're
	match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	matchwait

P_ORIGAMI:
	echo
	echo P_ORIGAMI:
	echo
P_PAPER_CHECK:
	match P_ENVELOPE referring
	match P_FOLD1 You are already holding that
	match P_FOLD1 you get a piece
put get my paper
	matchwait

P_WEAR_ENV:
put wear my env
wait
P_ENVELOPE:
	match P_INSTRU you get a
	match P_REM_ENV The envelope is empty.
	match P_GET_ENV You must be either wearing
	match P_STONES I'm afraid that you can't pull that.
put pull my origami-paper envelope
	matchwait

P_REM_ENV:
put rem env
put drop env
waitfor you drop
P_GET_ENV_WEAR:
	match P_WEAR_ENV you get
	match P_STONES referring
put get my origami-paper envelope
	matchwait

P_DROP_ENV:
put drop my or env
wait
P_GET_ENV:
	match P_PULL_ENV you get
	match P_STONES referring
put get my origami-paper envelope
	matchwait

P_PULL_ENV:
	match P_STOW_ENV you get a
	match P_DROP_ENV The envelope is empty.
	match P_STONES I'm afraid that you can't pull that.
put pull my origami-paper envelope
	matchwait

P_STOW_ENV:
put stow my ori env
waitfor you
P_INSTRU:
counter set 1
goto P_ORI_STUDY1

P_ORI_STUDY2:
P_ORI_STUDY3:
P_ORI_STUDY4:
P_ORI_STUDY5:
goto P_ORI_STUDY1
P_ORI_STUDY_PAUSE:
pause
P_ORI_STUDY1:
counter add 1
	match P_ORI_STUDY%c You turn the instructions this way and that
	match P_GET_PRIMER You take on a studious look.
	match P_GET_PRIMER You study the sky
	match P_FOLD1 and begin to fold
	match P_ORI_STUDY_PAUSE ...wait
	match P_ORI_STUDY_PAUSE type ahead
put study my %zTorigami instruction
	matchwait

P_GET_PRIMER:
	match P_STOW_PAPER referring
	match P_OPEN_PRIMER you get
put get my ori primer
	matchwait

P_OPEN_PRIMER:
put open my primer
wait
goto P_PRI_STUDY1


P_PRI_STUDY2:
P_PRI_STUDY3:
P_PRI_STUDY4:
P_PRI_STUDY5:
P_PRI_STUDY_PAUSE:
pause
P_PRI_STUDY1:
counter add 1
	match P_PRI_STUDY%c You turn the instructions this way and that
	match P_NO_PRIMER You take on a studious look.
	match P_NO_PRIMER You study the sky
	match P_PRI_FOLD and begin to fold
	match P_PRI_STUDY_PAUSE ...wait
	match P_PRI_STUDY_PAUSE type ahead
put study my %zTorigami instruction
	matchwait

P_PRI_FOLD_PAUSE:
pause
P_PRI_FOLD:
	match P_PRI_FOLD_PAUSE ...wait
	match P_PRI_FOLD_PAUSE type ahead
	match P_PRI_FOLD2 you close
put close primer
	matchwait

P_PRI_FOLD2:
put stow primer
wait
P_FOLD1:
counter set 1

P_FOLD2:
P_FOLD3:
P_FOLD4:
P_FOLD5:
counter add 1
goto P_FOLD

P_FOLD_PAUSE:
pause
P_FOLD:
	match P_FOLD%c roundtime
	match P_INSTRU You need to study your instructions
	match P_BLOW You make the final fold
	match P_BLOW referring
	match P_FOLD_PAUSE ...wait
	match P_FOLD_PAUSE type ahead
put fold my paper
	matchwait
P_FOLD6_PAUSE:
pause
P_FOLD6:
	match P_HIDE you put
	match P_FOLD6_PAUSE ...wait
	match P_FOLD6_PAUSE type ahead
put stow my paper
	matchwait

P_BLOW_PAUSE:
pause
P_BLOW:
	match P_HIDE You exhale into your
	match P_HIDE blow into it
	match P_HIDE referring
	match P_BLOW_PAUSE ...wait
	match P_BLOW_PAUSE type ahead
	match P_TRASH Smoking commands
	match P_TRASH you blow gently
put exhale my %zTorigami
	matchwait

P_TRASH:
put drop my %zTorigami
goto P_HIDE

P_NO_PRIMER:
put stow paper
wait
P_PRI_STUDY6_PAUSE:
pause
P_PRI_STUDY6:
	match P_PRI_STUDY7 you put
	match P_PRI_STUDY6_PAUSE ...wait
	match P_PRI_STUDY6_PAUSE type ahead
put stow primer
	matchwait

P_PRI_STUDY7:
goto P_STOW_PAPER

P_ORI_STUDY6_PAUSE:
pause
P_ORI_STUDY6:
	match P_HIDE you put
	match P_ORI_STUDY6_PAUSE ...wait
	match P_ORI_STUDY6_PAUSE type ahead
put stow my paper
	matchwait

P_STOW_PAPER_PAUSE:
pause
P_STOW_PAPER:
	match P_STONES you put
	match P_STOW_PAPER_PAUSE ...wait
	match P_STOW_PAPER_PAUSE type ahead
put stow my paper
	matchwait

P_TRAIL_STOW:
put stow left
put stow right
P_TRAIL:
	match P_WAIT Northern Trade Road, Foothills
	match P_TRAIL1 but you find it hard going
	match P_TRAIL1 A wave of dizziness hits you
	match P_TRAIL1 but you can't seem to find purchase
	match P_TRAIL1 Struck by vertigo
	match P_TRAIL1 your footing is questionable
	match P_TRAIL_STAND few feet and fall to the ground
	match P_TRAIL_STOW1 free
	match P_TRAIL_STAND stand
	match P_QUIT [You're
	match P_TRAIL_STOW hands
	matchwait

P_TRAIL_STAND_PAUSE:
pause
P_TRAIL_STAND:
	match P_TRAIL1_PAUSE You stand back up
	match P_TRAIL_STAND_PAUSE roundtime
put stand
	match P_QUIT [You're
	matchwait

P_TRAIL_STOW1:
put stow left
wait
put stow right
wait
P_TRAIL1_PAUSE:
pause
P_TRAIL1:
	match P_TRAIL2 Northern Trade Road, Foothills
	match P_TRAIL1_PAUSE Foothills, Stony Incline
	match P_TRAIL1_PAUSE but you find it hard going
	match P_TRAIL1_PAUSE A wave of dizziness hits you
	match P_TRAIL1_PAUSE but you can't seem to find purchase
	match P_TRAIL1_PAUSE Struck by vertigo
	match P_TRAIL1_PAUSE your footing is questionable
	match P_TRAIL_STAND few feet and fall to the ground
	match P_TRAIL_STOW free
	match P_TRAIL_STAND stand
put climb trail
	match P_QUIT [You're
	matchwait

P_TRAIL2:
waitfor following you
move go outpost
goto P_STONE


P_STONES:
	match P_BRAID_FOR referring
	match P_STONE1A you get
put get my stones
	matchwait


P_STONE1_PAUSE:
pause
P_STONE1A:
counter set 1
	match P_BRAID_FOR Remove what?
	match P_STONE2_C roundtime
	match P_STONE_STOW exactly
	match P_STONE1_PAUSE ...wait
	match P_STONE1_PAUSE type ahead
put remove %c stones
	matchwait

P_STONE2_RC:
counter set 1
goto P_STONE2
P_STONE2_C:
counter add 1
goto P_STONE2_COMB

P_STONE2_COMB_PAUSE:
pause
P_STONE2_COMB:
	match P_STONE2 You combine
	match P_STONE3_COMB roundtime
	match P_STONE2_COMB_PAUSE ...wait
	match P_STONE2_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

P_STONE2_PAUSE:
pause
P_STONE2:
	match P_STONE3_C roundtime
	match P_STONE3_RC exactly
	match P_STONE2_PAUSE ...wait
	match P_STONE2_PAUSE type ahead
put remove %c stones
	matchwait

P_STONE3_RC:
counter set 1
goto P_STONE3
P_STONE3_C:
counter add 1
goto P_STONE3_COMB

P_STONE3_COMB_PAUSE:
pause
P_STONE3_COMB:
	match P_STONE3 You combine
	match P_STONE4_COMB roundtime
	match P_STONE3_COMB_PAUSE ...wait
	match P_STONE3_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

P_STONE3_PAUSE:
pause
P_STONE3:
	match P_STONE4_C roundtime
	match P_STONE3_RC exactly
	match P_STONE3_PAUSE ...wait
	match P_STONE3_PAUSE type ahead
put remove %c stones
	matchwait

P_STONE4_RC:
counter set 1
goto P_STONE4
P_STONE4_C:
counter add 1
goto P_STONE4_COMB

P_STONE4_COMB_PAUSE:
pause
P_STONE4_COMB:
	match P_STONE4 You combine
	match P_STONE5_COMB roundtime
	match P_STONE4_COMB_PAUSE ...wait
	match P_STONE4_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

P_STONE4_PAUSE:
pause
P_STONE4:
	match P_STONE5_C roundtime
	match P_STONE4_RC exactly
	match P_STONE4_PAUSE ...wait
	match P_STONE4_PAUSE type ahead
put remove %c stones
	matchwait

P_STONE5_RC:
counter set 1
goto P_STONE5
P_STONE5_C:
counter add 1
goto P_STONE5_COMB

P_STONE5_COMB_PAUSE:
pause
P_STONE5_COMB:
	match P_STONE5 You combine
	match P_STONE6 roundtime
	match P_STONE5_COMB_PAUSE ...wait
	match P_STONE5_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

P_STONE5_PAUSE:
pause
P_STONE5:
	match P_STONE6_COMB roundtime
	match P_STONE5_RC exactly
	match P_STONE5_PAUSE ...wait
	match P_STONE5_PAUSE type ahead
put remove %c stones
	matchwait

P_STONE6_COMB_PAUSE:
pause
P_STONE6_COMB:
	match P_STONE6 You combine
	match P_STONE6_COMB roundtime
	match P_STONE6_COMB_PAUSE ...wait
	match P_STONE6_COMB_PAUSE type ahead
put combine my stone with my other stone
	matchwait

P_STONE6_PAUSE:
pause
P_STONE6:
	match P_HIDE you put
	match P_STONE6_PAUSE type ahead
	match P_STONE6_PAUSE ...wait
put stow my stones
	matchwait

P_BRAID_FOR_PAUSE:
pause
P_FORAGE:
P_3FORAGE:
P_BRAID_FOR:
	match P_BRAID_FORA referring
	match P_BRAID you get
put get my vines
	matchwait

P_BRAID_FORA_PAUSE:
pause
P_BRAID_FORA:
	match P_BRAID You manage to find a vine.
	match P_BRAID_FOR1 roundtime
	match P_BRAID_FORA_PAUSE ...wait
	match P_BRAID_FORA_PAUSE type ahead
	match P_QUIT [You're
put forage vine
	matchwait


P_BRAID_FOR1:
counter set 1
P_BRAID_FOR2:
P_BRAID_FOR3:
P_BRAID_FOR4:
P_BRAID_FOR5:
P_BRAID_FOR6:
P_BRAID_FOR7:
P_BRAID_FOR8:
P_BRAID_FOR9:
counter add 1
goto P_BRAIDING_FOR

P_BRAIDING_FOR_PAUSE:
pause
P_BRAIDING_FOR:
	match P_BRAID You manage to find a vine.
	match P_BRAID_FOR%c roundtime
	match P_BRAIDING_FOR_PAUSE ...wait
	match P_BRAIDING_FOR_PAUSE type ahead
	match P_QUIT [You're
put forage vine
	matchwait


P_BRAID_FOR10_PAUSE:
pause
P_BRAID_FOR10:
	match P_HIDE you put
	match P_HIDE stow what?
	match P_BRAID_FOR10_PAUSE ...wait
	match P_HIDE_VINE after stuffing it
put stow my vine
	matchwait

P_BRAID_PAUSE:
pause
P_BRAID:
	match P_BRAID1 roundtime
	match P_BRAID_FORA You need to have
	match P_BRAID_PULL The braided vines is already
	match P_BRAID_PULL Better just PULL
	match P_BRAID_PAUSE type ahead
	match P_BRAID_PAUSE ...wait
put braid my vine
	matchwait

P_BRAID1:
counter set 1
P_BRAID2:
P_BRAID3:
P_BRAID4:
P_BRAID5:
counter add 1
goto P_L_B
P_BRAID2_PAUSE:
pause
P_L_B:
	match P_BRAID%c roundtime
	match P_BRAID6 You need to have
	match P_BRAID_PULL The braided vines is already
	match P_BRAID_PULL Better just PULL
	match P_BRAID2_PAUSE type ahead
	match P_BRAID2_PAUSE ...wait
put braid my vine
	matchwait
P_BRAID_PULL_PAUSE:
pause
P_BRAID_PULL:
	match P_BRAID_DROP roundtime
	match P_BRAID_PULL_PAUSE ...wait
	match P_BRAID_PULL_PAUSE type ahead
	match P_HIDE With a muttered curse you throw away the ruined pieces.
put pull my vine
	matchwait

P_BRAID_DROP_PAUSE:
pause
P_BRAID_DROP:
	match P_BRAID_DROPB you drop
	match P_BRAID_DROPB referring
	match P_BRAID_DROP_PAUSE ...wait
	match P_BRAID_DROP_PAUSE type ahead
put drop rope
	matchwait

P_BRAID_DROPB:
put drop my vine
wait
goto P_HIDE

P_BRAID6_PAUSE:
pause
P_BRAID6:
	match P_BRAID6_PAUSE ...wait
	match P_BRAID6_PAUSE type ahead
	match P_HIDE you put
	match P_HIDE stow what?
	match P_HIDE_VINE after stuffing it
put stow my vines
	matchwait

P_PATTERN:
	match P_PATTERN1 referring
	match P_STUDY_COM1 you get
	match P_STUDY_COM1 you open
	match P_QUIT [You're
put get my compendium
put open my compendium
	matchwait

P_STUDY_COM1_TURN:
pause
	match P_STUDY_COM1_TURN ...wait
	match P_STUDY_COM1_TURN type ahead
	match P_STUDY_COM1 You turn to the section containing
	match P_QUIT [You're
put turn my compendium
	matchwait

P_STUDY_COM1_PAUSE:
pause
P_STUDY_COM1:
	echo
	echo STUDY_COM1:
	echo
	match P_STUDY_COM2_TURN Why do you need to study this chart again?
	match P_STUDY_COM2_TURN sudden moment of clarity
	match P_STUDY_COM3_TURN difficult time
	match P_STUDY_COM3_TURN impossible
	match P_STUDY_COM2_PAUSE gradually absorbing
	match P_STUDY_COM1_PAUSE ...wait
	match P_STUDY_COM1_PAUSE type ahead
	match P_QUIT [You're
put study my compendium
	matchwait

P_STUDY_COM2_TURN:
pause
	match P_STUDY_COM2_TURN ...wait
	match P_STUDY_COM2_TURN type ahead
	match P_STUDY_COM2 You turn to the section containing
	match P_QUIT [You're
put turn my compendium
	matchwait

P_STUDY_COM2_PAUSE:
pause
P_STUDY_COM2:
	echo
	echo STUDY_COM2:
	echo
	match P_STUDY_COM3_TURN Why do you need to study this chart again?
	match P_STUDY_COM3_TURN sudden moment of clarity
	match P_STUDY_COM4_TURN difficult time
	match P_STUDY_COM4_TURN impossible
	match P_STUDY_COM3_PAUSE gradually absorbing
	match P_STUDY_COM2_PAUSE ...wait
	match P_STUDY_COM2_PAUSE type ahead
	match P_QUIT [You're
put study my compendium
	matchwait

P_STUDY_COM3_TURN:
pause
	match P_STUDY_COM3_TURN ...wait
	match P_STUDY_COM3_TURN type ahead
	match P_STUDY_COM3 You turn to the section containing
	match P_QUIT [You're
put turn my compendium
	matchwait

P_STUDY_COM3_PAUSE:
pause
P_STUDY_COM3:
	echo
	echo STUDY_COM3:
	echo
	match P_STUDY_COM4_TURN Why do you need to study this chart again?
	match P_STUDY_COM4_TURN sudden moment of clarity
	match P_STUDY_COM5_TURN difficult time
	match P_STUDY_COM5_TURN impossible
	match P_STUDY_COM4_PAUSE gradually absorbing
	match P_STUDY_COM3_PAUSE ...wait
	match P_STUDY_COM3_PAUSE type ahead
	match P_QUIT [You're
put study my compendium
	matchwait

P_STUDY_COM4_TURN:
pause
	match P_STUDY_COM4_TURN ...wait
	match P_STUDY_COM4_TURN type ahead
	match P_STUDY_COM4 You turn to the section containing
	match P_QUIT [You're
put turn my compendium
	matchwait

P_STUDY_COM4_PAUSE:
pause
P_STUDY_COM4:
	echo
	echo STUDY_COM4:
	echo
	match P_STUDY_COM5_TURN Why do you need to study this chart again?
	match P_STUDY_COM5_TURN sudden moment of clarity
	match P_STUDY_COM_STOW difficult time
	match P_STUDY_COM_STOW impossible
	match P_STUDY_COM5_PAUSE gradually absorbing
	match P_STUDY_COM4_PAUSE ...wait
	match P_STUDY_COM4_PAUSE type ahead
	match P_QUIT [You're
put study my compendium
	matchwait

P_STUDY_COM5_TURN:
pause
	match P_STUDY_COM5_TURN ...wait
	match P_STUDY_COM5_TURN type ahead
	match P_STUDY_COM5 You turn to the section containing
	match P_QUIT [You're
put turn my compendium
	matchwait

P_STUDY_COM5_PAUSE:
pause
P_STUDY_COM5:
	echo
	echo STUDY_COM5:
	echo
	match P_STUDY_COM_STOW Why do you need to study this chart again?
	match P_STUDY_COM_STOW sudden moment of clarity
	match P_STUDY_COM_STOW difficult time
	match P_STUDY_COM_STOW impossible
	match P_STUDY_COM_STOW2 gradually absorbing
	match P_STUDY_COM5_PAUSE ...wait
	match P_STUDY_COM5_PAUSE type ahead
	match P_QUIT [You're
put study my compendium
	matchwait

P_STUDY_COM_STOW_PAUSE:
pause
P_STUDY_COM_STOW:
	match P_STUDY_COM_STOW2 You turn to the section containing
	match P_STUDY_COM_STOW_PAUSE ...wait
	match P_STUDY_COM_STOW_PAUSE type ahead
	match P_QUIT [You're
put turn my compendium
	matchwait

P_STUDY_COM_STOW2_PAUSE:
pause
P_STUDY_COM_STOW2:
	match P_WAIT you put
	match P_STUDY_COM_STOW_PAUSE ...wait
	match P_STUDY_COM_STOW_PAUSE type ahead
	match P_QUIT [You're
put close my compendium
put stow my compendium
	matchwait

P_PATTERN1:
pause
	match P_WAIT referring
	match P_STUDY1 you get
	match P_QUIT [You're
put get my pattern
	matchwait

P_STUDY1_PAUSE:
pause
P_STUDY1:
	match P_STUDY_STOW You believe that you understand
	match P_STUDY2 roundtime
	match P_STUDY_STOW You already know enough
	match P_STUDY_STOW You don't have the proper training for that.
	match P_STUDY1_PAUSE ...wait
	match P_STUDY1_PAUSE type ahead
	match P_QUIT [You're
	match P_STUDY1_PAUSE Encumbrance:
	match P_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

P_STUDY2_PAUSE:
pause
P_STUDY2:
	match P_STUDY_STOW You believe that you understand
	match P_STUDY3 roundtime
	match P_STUDY_STOW You already know enough
	match P_STUDY2_PAUSE ...wait
	match P_STUDY2_PAUSE type ahead
	match P_QUIT [You're
	match P_STUDY2_PAUSE Encumbrance:
	match P_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

P_STUDY3_PAUSE:
pause
P_STUDY3:
	match P_STUDY_STOW You believe that you understand
	match P_STUDY4 roundtime
	match P_STUDY_STOW You already know enough
	match P_STUDY3_PAUSE ...wait
	match P_STUDY3_PAUSE type ahead
	match P_QUIT [You're
	match P_STUDY3_PAUSE Encumbrance:
	match P_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

P_STUDY4_PAUSE:
pause
P_STUDY4:
	match P_STUDY_STOW You believe that you understand
	match P_STUDY5 roundtime
	match P_STUDY_STOW You already know enough
	match P_STUDY4_PAUSE ...wait
	match P_STUDY4_PAUSE type ahead
	match P_QUIT [You're
	match P_STUDY4_PAUSE Encumbrance:
	match P_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

P_STUDY5_PAUSE:
pause
P_STUDY5:
	match P_STUDY_STOW You believe that you understand
	match P_STUDY_STOW roundtime
	match P_STUDY_STOW You already know enough
	match P_STUDY5_PAUSE ...wait
	match P_STUDY5_PAUSE type ahead
	match P_QUIT [You're
	match P_STUDY5_PAUSE Encumbrance:
	match P_STUDY_DROP so much that you can't make out any
put study my pattern
put encum
	matchwait

P_STUDY_drop_PAUSE:
pause
P_STUDY_drop:
	match P_WAIT you drop
	match P_STUDY_drop_PAUSE ...wait
	match P_STUDY_drop_PAUSE type ahead
	match P_QUIT [You're
put drop my pattern
	matchwait

P_STUDY_STOW_PAUSE:
pause
P_STUDY_STOW:
	match P_WAIT you put
	match P_STUDY_STOW_PAUSE ...wait
	match P_STUDY_STOW_PAUSE type ahead
	match P_QUIT [You're
put stow my pattern
	matchwait


P_JUGGLE:
put get my %zTjugglies
waitfor you
counter set 1
goto P_JUGGLE%c
P_JUGGLE_PAUSE:
pause
goto P_JUGGLE_PAUSE1
P_JUGGLE1:
P_JUGGLE2:
P_JUGGLE3:
P_JUGGLE4:
P_JUGGLE5:
counter add 1
P_JUGGLE_PAUSE1:
	match P_JUGGLE_PAUSE type ahead
	match P_JUGGLE_PAUSE ...wait
	match P_JUGGLE%c roundtime
	match P_JUGGLE6 heal
	match P_HIDE referring
	match P_HIDE Please rephrase that command
put Juggle my %zTjugglies
	matchwait


P_JUGGLE6:
pause
	match P_JUGGLE6 type ahead
	match P_JUGGLE6 ...wait
	match P_HIDE you put
	match P_HIDE referring
	match P_HIDE Stow what?
put stow my %zTjugglies
	match P_QUIT [You're
	matchwait


P_PRAISE:
put praise %1
pause 2
put 'We love you great %1 You are the most magnificent being on earth!
pause 2
put grovel %1
pause 2
put 'We subject ourselves to your godly wisdom, please be just and kind to us!
pause 2
put dance grace
pause 2
put 'We celebrate our divine love for you, %1 May we forever bask in your glorious light!
pause 2
put whisper %1 Is that what you wanted? Did we impress all the lesser mortals for you?
waitfor whisper
put smile at %1 lovingly.
goto P_WAIT

P_UNHIDE:
put belch
wait
goto P_WAIT



P_BROOK:
waitfor roundtime
pause
pause
put whisper group ready
waitfor roundtime
pause
pause
put whisper group ready
goto P_WAIT


P_LOOK:
	echo
	echo LOOK:
	echo
	match P_DIRGE Darkstone Inn, Stables
	match P_STONE Stone Clan, Trader's Guild Outpost
	match P_ARTHE Swotting Hall, Trader's Center
	match P_CROSS Traders' Guild, Shipment Center
	match P_WOLF Wolf Clan Trader Outpost
	match P_TIGER Tiger Clan, Trader's Guild Outpost
	match P_LETH Eshar's Trading Post, Main Room
	match P_WAIT obvious
put look
	match P_QUIT [You're
	matchwait

P_ACCEPT:
put accept
wait
put stow right
goto P_WAIT


P_TIP:
put accept tip
wait
goto P_WAIT

P_LISTEN:
	echo
	echo LISTEN:
	echo
put belch
waitfor you must LISTEN
P_LISTEN1:
put listen to %3
put listen to %1
goto P_WAIT

P_APP_HIDE_PAUSE:
pause
P_APP_HIDE:
put open my gem pouch
wait
	echo
	echo APP_HIDE:
	echo
	match P_APP_CROSS_FERRY Eh?
	match P_APP_CROSS_FERRY You blend
	match P_APP_CROSS_FERRY You melt into the background
	match P_APP_CROSS_FERRY glance at you as you hide.
	match P_APP_CROSS_FERRY ruining your hiding place!
	match P_APP_HIDE_PAUSE roundtime
	match P_APP_HIDE_PAUSE ...wait
	match P_APP_HIDE_PAUSE type ahead
put hide
	match P_QUIT [You're
	matchwait

P_APP_CROSS_FERRY_PAUSE:
pause
P_APP_CROSS_FERRY:
	match P_APP_POUCH_C_F Appraise what?
	matchre P_APP_POUCH_C_F /roundtime|inside something|can't appraise/i
	match P_APP_CROSS_FERRY_PAUSE ...wait
	match P_APP_CROSS_FERRY_PAUSE type ahead
put app my %zTapp1 careful
	match P_QUIT [You're
	matchwait

P_APP_POUCH_C_F_PAUSE:
pause
P_APP_POUCH_C_F:
	match P_APP_BUN_C_F Appraise what?
	matchre P_APP_BUN_C_F /roundtime|inside something|can't appraise/i
	match P_APP_POUCH_C_F_PAUSE ...wait
	match P_APP_POUCH_C_F_PAUSE type ahead
put app my %zTapp2 careful
	match P_QUIT [You're
	matchwait

P_APP_BUN_C_F_PAUSE:
pause
P_APP_BUN_C_F:
	match P_APP_POUCH1_C_F Appraise what?
	matchre P_APP_POUCH1_C_F /roundtime|inside something|can't appraise/i
	match P_APP_BUN_C_F_PAUSE ...wait
	match P_APP_BUN_C_F_PAUSE type ahead
put app my %zTapp1 careful
	match P_QUIT [You're
	matchwait


P_APP_POUCH1_C_F_PAUSE:
pause
P_APP_POUCH1_C_F:
	match P_APP_BUN1_C_F Appraise what?
	matchre P_APP_BUN1_C_F /roundtime|inside something|can't appraise/i
	match P_APP_POUCH1_C_F_PAUSE ...wait
	match P_APP_POUCH1_C_F_PAUSE type ahead
put app my %zTapp2 careful
	match P_QUIT [You're
	matchwait

P_APP_BUN1_C_F_PAUSE:
pause
P_APP_BUN1_C_F:
	match P_APP_POUCH2_C_F Appraise what?
	matchre P_APP_POUCH2_C_F /roundtime|inside something|can't appraise/i
	match P_APP_BUN1_C_F_PAUSE ...wait
	match P_APP_BUN1_C_F_PAUSE type ahead
put app my %zTapp1 careful
	match P_QUIT [You're
	matchwait


P_APP_POUCH2_C_F_PAUSE:
pause
P_APP_POUCH2_C_F:
	match P_APP_BUN2_C_F Appraise what?
	matchre P_APP_BUN2_C_F /roundtime|inside something|can't appraise/i
	match P_APP_POUCH2_C_F_PAUSE ...wait
	match P_APP_POUCH2_C_F_PAUSE type ahead
put app my %zTapp2 careful
	match P_QUIT [You're
	matchwait

P_APP_BUN2_C_F_PAUSE:
pause
P_APP_BUN2_C_F:
	match P_FERRY_TO_CROSS_CLOSE Appraise what?
	matchre P_FERRY_TO_CROSS_CLOSE /roundtime|inside something|can't appraise/i
	match P_APP_BUN2_C_F_PAUSE ...wait
	match P_APP_BUN2_C_F_PAUSE type ahead
put app my %zTapp1 careful
	match P_QUIT [You're
	matchwait

P_FERRY_TO_CROSS_CLOSE_PAUSE:
pause
P_FERRY_TO_CROSS_CLOSE:
	match P_APP_FEED close
	match P_APP_FEED referring
	match P_FERRY_TO_CROSS_CLOSE_PAUSE ...wait
	match P_FERRY_TO_CROSS_CLOSE_PAUSE type ahead
put close my gem pouch
	match P_QUIT [You're
	matchwait


P_APP_FEED:
IF_2 goto P_APP_FEED2
put rem my feedbag
wait
put give second cara
wait
put wear my feedbag
wait
goto P_PATTERN_APP

P_APP_FEED2:
put rem my feedbag
wait
put give %2 cara
wait
put wear my feedbag
wait
goto P_PATTERN_APP

P_PATTERN_APP:
	match P_JUGGLE referring
	match P_STUDY1_APP you get
	match P_QUIT [You're
put get my pattern
	matchwait

P_STUDY1_PAUSE_APP:
pause
P_STUDY1_APP:
	match P_STUDY_STOW_APP You believe that you understand
	match P_STUDY2_APP roundtime
	match P_STUDY_STOW_APP You already know enough
	match P_STUDY_STOW_APP You don't have the proper training for that.
	match P_STUDY1_PAUSE_APP ...wait
	match P_STUDY1_PAUSE_APP type ahead
	match P_QUIT [You're
	match P_STUDY1_PAUSE_APP Encumbrance:
	match P_STUDY_STOW_APP so much that you can't make out any
put study my pattern
put encum
	matchwait

P_STUDY2_PAUSE_APP:
pause
P_STUDY2_APP:
	match P_STUDY_STOW_APP You believe that you understand
	match P_STUDY3_APP roundtime
	match P_STUDY_STOW_APP You already know enough
	match P_STUDY2_PAUSE_APP ...wait
	match P_STUDY2_PAUSE_APP type ahead
	match P_QUIT [You're
	match P_STUDY2_PAUSE_APP Encumbrance:
	match P_STUDY_STOW_APP so much that you can't make out any
put study my pattern
put encum
	matchwait

P_STUDY3_PAUSE_APP:
pause
P_STUDY3_APP:
	match P_STUDY_STOW_APP You believe that you understand
	match P_STUDY4_APP roundtime
	match P_STUDY_STOW_APP You already know enough
	match P_STUDY3_PAUSE_APP ...wait
	match P_STUDY3_PAUSE_APP type ahead
	match P_QUIT [You're
	match P_STUDY3_PAUSE_APP Encumbrance:
	match P_STUDY_STOW_APP so much that you can't make out any
put study my pattern
put encum
	matchwait

P_STUDY4_PAUSE_APP:
pause
P_STUDY4_APP:
	match P_STUDY_STOW_APP You believe that you understand
	match P_STUDY5_APP roundtime
	match P_STUDY_STOW_APP You already know enough
	match P_STUDY4_PAUSE_APP ...wait
	match P_STUDY4_PAUSE_APP type ahead
	match P_QUIT [You're
	match P_STUDY4_PAUSE_APP Encumbrance:
	match P_STUDY_STOW_APP so much that you can't make out any
put study my pattern
put encum
	matchwait

P_STUDY5_PAUSE_APP:
pause
P_STUDY5_APP:
	match P_STUDY_STOW_APP You believe that you understand
	match P_STUDY_STOW_APP roundtime
	match P_STUDY_STOW_APP You already know enough
	match P_STUDY5_PAUSE_APP ...wait
	match P_STUDY5_PAUSE_APP type ahead
	match P_QUIT [You're
	match P_STUDY5_PAUSE_APP Encumbrance:
	match P_STUDY_STOW_APP so much that you can't make out any
put study my pattern
put encum
	matchwait

P_STUDY_STOW_PAUSE_APP:
pause
P_STUDY_STOW_APP:
	match P_JUGGLE you put
	match P_STUDY_STOW_PAUSE_APP ...wait
	match P_STUDY_STOW_PAUSE_APP type ahead
	match P_QUIT [You're
put stow my pattern
	matchwait


P_HIDE_VINE:
put drop vine

P_HIDE_PAUSE:
pause
P_HIDE:
put belch
pause 2
put listen to %3
put listen to %1
wait
	echo
	echo P_HIDE:
	echo
	match P_WAIT Eh?
	match P_WAIT You blend
	match P_WAIT You melt into the background
	match P_WAIT glance at you as you hide.
	match P_WAIT ruining your hiding place!
	match P_HIDE_PAUSE You look around, but can't see any place to hide yourself.
	match P_HIDE_PAUSE roundtime
	match P_HIDE_PAUSE ...wait
	match P_HIDE_PAUSE type ahead
put hide
	match P_QUIT [You're
	matchwait

P_2FORAGE_PAUSE:
pause
P_2FORAGE:
	match P_2FORA I could not
	match P_FEED_DONE You see nothing unusual.
put look grass in feedbag
	matchwait

P_2FORA:
	echo
	echo P_2FORAGE:
	echo
	match P_2FEED You manage to find some grass.
	match P_2FORAGE_PAUSE clutter
	match P_2FORAGE_PAUSE roundtime
	match P_2FORAGE_PAUSE ...wait
	match P_2FORAGE_PAUSE type ahead
put forage grass
	match P_QUIT [You're
	matchwait

P_2FEED_PAUSE:
pause
P_2FEED:
	match P_2FORAGE1 you put
	match P_2FEED_PAUSE ...wait
	match P_2FEED_PAUSE type ahead
	match P_FEED_DONE heavy
put put grass in my feedbag
	match P_QUIT [You're
	matchwait

P_2FORAGE1_PAUSE:
pause
P_2FORAGE1:
	echo
	echo 2FORAGE1:
	echo
	match P_2FEED1 You manage to find some grass.
	match P_2FORAGE1_PAUSE clutter
	match P_2FORAGE1_PAUSE roundtime
	match P_2FORAGE1_PAUSE ...wait
	match P_2FORAGE1_PAUSE type ahead
put forage grass
	match P_QUIT [You're
	matchwait


P_2FEED1_PAUSE:
pause
P_2FEED1:
	match P_2FORAGE2 you put
	match P_2FEED1_PAUSE ...wait
	match P_2FEED1_PAUSE type ahead
	match P_FEED_DONE heavy
put put grass in my feedbag
	match P_QUIT [You're
	matchwait

P_2FORAGE2_PAUSE:
pause
P_2FORAGE2:
	echo
	echo 2FORAGE2:
	echo
	match P_2FEED2 You manage to find some grass.
	match P_2FORAGE2_PAUSE clutter
	match P_2FORAGE2_PAUSE roundtime
	match P_2FORAGE2_PAUSE ...wait
	match P_2FORAGE2_PAUSE type ahead
put forage grass
	match P_QUIT [You're
	matchwait


P_2FEED2_PAUSE:
pause
P_2FEED2:
	match P_2FORAGE3 you put
	match P_2FEED2_PAUSE ...wait
	match P_2FEED2_PAUSE type ahead
	match P_FEED_DONE heavy
put put grass in my feedbag
	match P_QUIT [You're
	matchwait

P_2FORAGE3_PAUSE:
pause
P_2FORAGE3:
	echo
	echo 2FORAGE3:
	echo
	match P_2FEED3 You manage to find some grass.
	match P_2FORAGE2_PAUSE clutter
	match P_2FORAGE3_PAUSE roundtime
	match P_2FORAGE3_PAUSE ...wait
	match P_2FORAGE3_PAUSE type ahead
put forage grass
	match P_QUIT [You're
	matchwait

P_2FEED3_PAUSE:
pause
P_2FEED3:
	match P_FEED_DONE you put
	match P_2FEED3_PAUSE ...wait
	match P_2FEED3_PAUSE type ahead
	match P_FEED_DONE heavy
put put grass in my feedbag
	match P_QUIT [You're
	matchwait

P_FEED_DONE:
IF_2 goto P_FEED_DONE1
put give cara
wait
put rem my feedbag
wait
put give second cara
wait
put wear my feedbag
wait
goto P_FEED_NOD


P_FEED_DONE1:
put give cara
wait
put rem my feedbag
wait
put give %2 cara
wait
put wear my feedbag
wait
goto P_FEED_NOD


P_FEED_NOD_PAUSE:
pause
P_FEED_NOD:
	match P_FEED_NOD_PAUSE group, "done
	match P_WAIT you whisper
	match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
	match P_QUIT [You're
put whisper group ready
	matchwait

P_DIRGE:
	echo
	echo DIRGE:
	echo
	match P_DIRGE_GIVE_CON you get
	match P_DIRGE_GET_CON1 referring
put get my dirge contract
	match P_QUIT [You're
	matchwait

P_DIRGE_GIVE_CON:
	echo
	echo DIRGE_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto P_DIRGE

P_DIRGE_GET_CON1:
put pay clerk gold
wait
P_DIRGE_STAIR:
	match P_DIRGE_STAND can't do that
	match P_DIRGE_STAIR1 obvious
put climb stair
	matchwait
P_DIRGE_STAIR1:
pause
put speculate finesse
wait
P_DIRGE_GET_CON:
	echo
	echo DIRGE_GET_CON:
	echo
	match P_DIRGE_GOT_CON minister says.
	match P_DIRGE_GOT_CON The minister reminds you
	match P_DIRGE_GOT_CON The minister plucks a contract
	match P_DIRGE_STAIR referring
	match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
put ask minister for contract
	match P_QUIT [You're
	matchwait

P_DIRGE_STAND_PAUSE:
pause
P_DIRGE_STAND:
	match P_DIRGE_STAND_PAUSE roundtime
	match P_DIRGE_STAIR You stand back up.
	match P_DIRGE_STAND_PAUSE ...wait
	match P_DIRGE_STAND_PAUSE type ahead
put stand
	match P_QUIT [You're
	matchwait

P_DIRGE_GOT_CON:
	echo
	echo DIRGE_GET_CON:
	echo
put speculate finesse stop
wait
move climb stair
pause
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto P_DONE


P_ARTHE_SIGN:
put knock sign
waitfor Swotting Hall, Trader's Center
P_ARTHE:
	echo
	echo ARTHE:
	echo
	match P_ARTHE_GIVE_CON you get
	match P_ARTHE_GET_CON1 referring
put get my arthe contract
	match P_QUIT [You're
	matchwait

P_ARTHE_GIVE_CON:
	echo
	echo ARTHE_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto P_ARTHE

P_ARTHE_GET_CON1:
put pay clerk gold
wait
P_ARTHE_GET_CON:
	echo
	echo ARTHE_GET_CON:
	echo
put speculate finesse
wait
	match P_ARTHE_GOT_CON minister says.
	match P_ARTHE_GOT_CON The minister reminds you
	match P_ARTHE_GOT_CON The minister plucks a contract
put ask minister for contract
	match P_QUIT [You're
	matchwait

P_ARTHE_GOT_CON:
	echo
	echo ARTHE_GOT_CON:
	echo
put speculate finesse stop
wait
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto P_DONE


P_STONE:
	echo
	echo STONE:
	echo
	match P_STONE_GIVE_CON you get
	match P_STONE_GET_CON1 referring
put get my stone contract
	match P_QUIT [You're
	matchwait

P_STONE_GIVE_CON:
	echo
	echo STONE_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto P_STONE
P_STONE_GET_CON1:
put pay clerk gold
wait
P_STONE_GET_CON:
	echo
	echo STONE_GET_CON:
	echo
	match P_STONE_GOT_CON minister says.
	match P_STONE_GOT_CON The minister reminds you
	match P_STONE_GOT_CON The minister plucks a contract
put ask minister for contract
	match P_QUIT [You're
	matchwait

P_STONE_GOT_CON:
	echo
	echo STONE_GOT_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto P_DONE



P_CROSS:
	echo
	echo P_CROSS:
	echo
	match P_CROSS_GIVE_CON you get
	match P_CROSS_GET_CON1 referring
put get my cross contract
	match P_QUIT [You're
	matchwait

P_CROSS_GIVE_CON:
	echo
	echo CROSS_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto P_CROSS

P_CROSS_GET_CON1:
pause
put pay clerk gold
wait
P_CROSS_E:
	match P_CROSS_STAND can't do that
	match P_CROSS_GET_CON obvious
put e
	matchwait

P_CROSS_GET_CON:
	echo
	echo CROSS_GET_CON:
	echo
	match P_CROSS_GOT_CON minister says.
	match P_CROSS_GOT_CON The minister reminds you
	match P_CROSS_GOT_CON The minister plucks a contract
	match P_CROSS_GET_CON referring
	match IDLE YOU HAVE BEEN IDLE TOO LONG. PLEASE RESPOND.
put ask minister for contract
	match P_QUIT [You're
	matchwait

P_CROSS_STAND_PAUSE:
pause
P_CROSS_STAND:
	match P_CROSS_STAND_PAUSE roundtime
	match P_CROSS_E You stand back up.
	match P_CROSS_STAND_PAUSE ...wait
	match P_CROSS_STAND_PAUSE type ahead
put stand
	match P_QUIT [You're

P_CROSS_GOT_CON:
	echo
	echo CROSS_GOT_CON:
	echo
move w
pause
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto P_DONE


P_LETH:
	echo
	echo P_LETH:
	echo
	match P_LETH_GIVE_CON you get
	match P_LETH_GET_CON1 referring
put get my leth contract
	match P_QUIT [You're
	matchwait

P_LETH_GIVE_CON:
	echo
	echo LETH_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto P_LETH

P_LETH_GET_CON1:
put pay clerk gold
wait
P_LETH_GET_CON:
	echo
	echo LETH_GET_CON:
	echo
put speculate finesse
wait
	match P_LETH_GOT_CON minister says.
	match P_LETH_GOT_CON The minister reminds you
	match P_LETH_GOT_CON The minister plucks a contract
put ask minister for contract
	match P_QUIT [You're
	matchwait

P_LETH_GOT_CON:
	echo
	echo LETH_GOT_CON:
	echo
put speculate finesse stop
wait
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
put stow my contract

goto P_DONE

P_TIGER:
	echo
	echo TIGER:
	echo
	match P_TIGER_GIVE_CON you get
	match P_TIGER_GET_CON1 referring
put get my tiger contract
	match P_QUIT [You're
	matchwait

P_TIGER_GIVE_CON:
	echo
	echo TIGER_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto P_TIGER

P_TIGER_GET_CON1:
put pay clerk gold
wait
P_TIGER_GET_CON:
	echo
	echo TIGER_GET_CON:
	echo
	match P_TIGER_GOT_CON minister says.
	match P_TIGER_GOT_CON The minister reminds you
	match P_TIGER_GOT_CON The minister plucks a contract
put ask minister for contract
	match P_QUIT [You're
	matchwait

P_TIGER_GOT_CON:
	echo
	echo TIGER_GOT_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you

goto P_DONE

P_WOLF:
	echo
	echo WOLF:
	echo
	match P_WOLF_GIVE_CON you get
	match P_WOLF_GET_CON1 referring
put get my wolf contract
	match P_QUIT [You're
	matchwait

P_WOLF_GIVE_CON:
	echo
	echo WOLF_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto P_WOLF

P_WOLF_GET_CON1:
put pay clerk gold
wait
P_WOLF_GET_CON:
	echo
	echo WOLF_GET_CON:
	echo
put speculate finesse
wait
	match P_WOLF_GOT_CON minister says.
	match P_WOLF_GOT_CON The minister reminds you
	match P_WOLF_GOT_CON The minister plucks a contract
put ask minister for contract
	match P_QUIT [You're
	matchwait

P_WOLF_GOT_CON:
	echo
	echo WOLF_GOT_CON:
	echo
put speculate finesse stop
wait
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto P_DONE

P_QUIT:
put quit
exit

F:
FI:
FIN:
FINI:
FINIS:
FINISH:
save FINISH
echo
echo *********************
echo ** FINISHING ROUTE **
echo *********************
echo
shift

F_START:
put set Inac
waitfor Ok.
goto F_CARA_CHECK

F_IDLE:
F_CARA_CHECK:
	echo
	echo F_CARA_CHECK:
	echo
	match F_HAVE_CARA inventory report
	match F_BEGIN referring
	match F_OTHER_CHECK belonging to
put look caravan
	match F_QUIT [You're
	matchwait

F_OTHER_CHECK:
pause
	match F_HAVE_CARA inventory report
	match F_BEGIN referring
	match F_OTHER_CHECK1 belonging to
put look other caravan
	match F_QUIT [You're
	matchwait

F_OTHER_CHECK1:
pause
	match F_HAVE_CARA inventory report
	match F_BEGIN referring
	match F_OTHER_CHECK2 belonging to
put look third caravan
	match F_QUIT [You're
	matchwait

F_OTHER_CHECK2:
pause
	match F_HAVE_CARA inventory report
	match F_BEGIN referring
	match F_OTHER_CHECK3 belonging to
put look fourth caravan
	match F_QUIT [You're
	matchwait

F_OTHER_CHECK3:
pause
	match F_HAVE_CARA inventory report
	match F_BEGIN referring
	match F_OTHER_CHECK4 belonging to
put look fifth caravan
	match F_QUIT [You're
	matchwait

F_OTHER_CHECK4:
pause
	match F_HAVE_CARA inventory report
	match F_BEGIN referring
	match F_OTHER_CHECK5 belonging to
put look sixth caravan
	match F_QUIT [You're
	matchwait

F_OTHER_CHECK5:
pause
	match F_HAVE_CARA inventory report
	match F_BEGIN referring
	match F_OTHER_CHECK6 belonging to
put look seventh caravan
	match F_QUIT [You're
	matchwait

F_OTHER_CHECK6:
pause
	match F_HAVE_CARA inventory report
	match F_BEGIN referring
	match F_OTHER_CHECK7 belonging to
put look eighth caravan
	match F_QUIT [You're
	matchwait

F_OTHER_CHECK7:
pause
	match F_HAVE_CARA inventory report
	match F_BEGIN referring
	match F_BEGIN belonging to
put look ninth caravan
	match F_QUIT [You're
	matchwait

F_HAVE_CARA:
	echo
	echo F_HAVE_CARA:
	echo
put tell caravan to follow
waitfor you
	match F_AT_DIRGE North Roads Caravansary
	match F_DIRGE_BANK_OUT_CARA Dirge, Crossroads
	match F_DIRGE_OUT Dirge, Gateway Road
	match F_AT_STONE Lairocott Brach, Entrance
	match F_STONE_OUT Guild outpost sits alongside
	match F_CLIMB_TRAIL_PAUSE Foothills, Stony Incline
	match F_AT_ARTHE Valley, Village Gate
	match F_ARTHE_OUT Arthe Dale, Cul-de-sac
	match F_AT_CROSS Northeast Wilds, Outside Northeast Gate
	match F_CROSS_OUT The Crossing, Commerce Avenue
	match F_WOLF_OUT Wolf Clan Home, Dirt Road
	match F_TIGER_OUT Tiger Clan Home, Dirt Pathway
	match F_TO_LETH_FERRY_CARA The Crossing, Alfren's Ferry
	match F_TO_CROSS_FERRY1_CARA Sparse grass, weeds and a few hardy shrubs
	match F_TO_CROSS_FERRY_CARA Southern Trade Route, Segoltha South Bank
	match F_AT_LETH_CARA Southern Trade Route, Outside Leth Deriel
	match F_LETH_OUT Leth Deriel, Oakenheart Circle
	match F_FERRY ferry
	match F_I_HAVE_CARA obvious
put look
	match F_QUIT [You're
	matchwait
F_ACCEPT:
put accept
waitfor you
put stow right
wait
goto F_DES_WAIT

F_TIP:
put accept tip
goto F_DES_WAIT

F_UNKNOWN_CARA:
	match F_I_UNKNOWN_CARA go next and it stops.
	match F_I_UNKNOWN_CARA driver turns back and says
	match F_HIDE acknowledges the order.
put tell caravan lead to crossing
	match F_QUIT [You're
	matchwait

F_FERRY_PAUSE:
pause
F_FERRY:
put tell caravan follow
waitfor you
pause 2
put tell caravan follow
waitfor you
	echo
	echo F_FERRY:
	echo
	match F_GO_DOCK south bank
	match F_GO_DOCK north bank
	match F_FERRY1 obvious
put look
	match F_QUIT [You're
	matchwait

F_GO_DOCK:
	echo
	echo F_GO_DOCK:
	echo
	match F_FERRY1 What docks?
	match F_FERRY1 have to wait
	match F_OFF_LETH_FERRY1 Southern Trade Route, Segoltha South Bank
	match F_OFF_CROSS_FERRY1 The Crossing, Alfren's Ferry
put go dock
	match F_QUIT [You're
	matchwait

F_FERRY1:
	echo
	echo F_FERRY1:
	echo
F_FERRY1FERRY1:
	match F_WAIT_FERRY Eh?
	match F_WAIT_FERRY You blend
	match F_WAIT_FERRY You melt into the background
	match F_WAIT_FERRY glance at you as you hide.
	match F_WAIT_FERRY ruining your hiding place!
	match F_FERRY_PAUSE roundtime
	match F_FERRY_PAUSE ...wait
	match F_FERRY_PAUSE type ahead
	match F_FERRY_CHECK You hear a bell ring out
	match F_FERRY_CHECK pulls into the dock
put hide
	match F_QUIT [You're
	matchwait


F_WAIT_FERRY:
	match F_FERRY_CHECK You hear a bell ring out
	match F_FERRY_CHECK pulls up to the dock
	match F_FERRY_CHECK pulls into the dock
	match F_QUIT [You're
	matchwait

F_FERRY_CHECK:
	match F_OFF_LETH_FERRY south bank
	match F_OFF_CROSS_FERRY north bank
put look
	match F_QUIT [You're
	matchwait

F_BEGIN:
	echo
	echo F_BEGIN:
	echo
	match F_DIRGE_ROAD North Roads Caravansary
	match F_DIRGE_BANK_OUT Dirge, Crossroads
	match F_DIRGE_BANK_IN Dirge, Traveller's Bank
	match F_DIRGE_OUT Dirge, Gateway Road
	match F_DIRGE_IN Darkstone Inn, Stables
	match F_STONE_TRAIL Lairocott Brach, Entrance
	match F_STONE_OUT Guild outpost sits alongside
	match F_STONE_IN Stone Clan, Trader's Guild Outpost
	match F_ARTHE_GATE Valley, Village Gate
	match F_ARTHE_OUT Arthe Dale, Cul-de-sac
	match F_ARTHE_IN2 Swotting Hall, Public Foyer
	match F_ARTHE_IN Swotting Hall, Trader's Center
	match F_CROSS_GATE Northeast Wilds, Outside Northeast Gate
	match F_CROSS_BANK_OUT The Crossing, Hodierna Way
	match F_CROSS_BANK_IN First Provincial Bank
	match F_CROSS_BANK_IN2 Provincial Bank,
	match F_CROSS_OUT The Crossing, Commerce Avenue
	match F_CROSS_IN Traders' Guild, Shipment Center
	match F_WOLF_OUT Wolf Clan Home, Dirt Road
	match F_WOLF_IN Wolf Clan Trader Outpost
	match F_TIGER_OUT Tiger Clan Home, Dirt Pathway
	match F_TIGER_IN Tiger Clan, Trader's Guild Outpost
	match F_LETH_GATE Leth Deriel, Alder Bower Gate
	match F_LETH_BANK_OUT Leth Deriel, Dragon Tree Road
	match F_LETH_BANK_IN Imperial Depository, Lobby
	match F_LETH_BANK_IN1 Imperial Depository, Domestic Branch
	match F_LETH_BANK_IN2 Imperial Depository, Foreign Branch
	match F_LETH_OUT Leth Deriel, Oakenheart Circle
	match F_LETH_IN Eshar's Trading Post, Main Room
	match F_I_BEGIN Obvious
Put look
	match F_QUIT [You're
	matchwait

F_CROSS_BANK_IN2:
move out
F_CROSS_BANK_IN:
move out
F_CROSS_BANK_OUT:
move sw
move go bri
move sw
move w
move w
move w
move w
move nw
move n
move n
move n
move go door
goto F_CROSS

F_AT_CROSS:
	echo
	echo F_AT_CROSS:
	echo
put tell caravan follow
waitfor you
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
goto F_AT_CROSS_F
F_AT_CROSS_F_SHIFT:

F_AT_CROSS_F:
	match F_NOT_CROSS obvious
	match F_NOT_CROSS1 can't
	match F_NOT_CROSS1 referring
	match F_AT_CROSS2 The Crossing, Northeast Customs
put go gate
	match F_QUIT [You're
	matchwait

F_NOT_CROSS:
waitfor following you
put go gate
waitfor following you
F_NOT_CROSS1:
put tell caravan lead to crossing
waitfor you
goto F_HIDE


F_AT_CROSS2:
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move s
waitfor following you
move s
waitfor following you
move w
waitfor following you
move s
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move go bri
waitfor following you
move s
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move w
waitfor following you
move go door
goto F_CROSS

F_CROSS_GATE:
	echo
	echo F_CROSS_GATE:
	echo
move go gate
move w
move w
move w
move s
move s
move w
move s
move w
move w
move w
move w
move w
move w
move go bri
move s
move se
move sw
move s
move s
move s
move w
F_CROSS_OUT:
move go door
F_CROSS_IN:
goto F_CROSS

F_CROSS:
	echo
	echo F_CROSS:
	echo
F_CROSS1:
pause
	match F_CROSS_GIVE_CON you get
	match F_CROSS_LETH_CHECK referring
put get my cross contract
	match F_QUIT [You're
	matchwait

F_CROSS_GIVE_CON:
	echo
	echo F_CROSS_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto F_CROSS1

F_CROSS_LETH_CHECK:
	echo
	echo F_CROSS_LETH_CHECK:
	echo
	match F_CROSS_TIGER_CHECK referring
	match F_CROSS_TO_LETH The contract is printed
put look my leth contract
	match F_QUIT [You're
	matchwait

F_CROSS_TIGER_CHECK:
	echo
	echo F_CROSS_TIGER_CHECK:
	echo
	match F_CROSS_WOLF_CHECK referring
	match F_CROSS_TO_TIGER1 The contract is printed
put look my tiger contract
	match F_QUIT [You're
	matchwait

F_CROSS_WOLF_CHECK:
	echo
	echo F_CROSS_WOLF_CHECK:
	echo
	match F_CROSS_ARTHE_CHECK referring
	match F_CROSS_TO_WOLF1 The contract is printed
put look my wolf contract
	match F_QUIT [You're
	matchwait

F_CROSS_ARTHE_CHECK:
	echo
	echo F_CROSS_ARTHE_CHECK:
	echo
	match F_CROSS_STONE_CHECK referring
	match F_CROSS_TO_ARTHE1 The contract is printed
put look my arthe contract
	match F_QUIT [You're
	matchwait

F_CROSS_STONE_CHECK:
	echo
	echo F_CROSS_STONE_CHECK:
	echo
	match F_CROSS_DIRGE_CHECK referring
	match F_CROSS_TO_STONE1 The contract is printed
put look my stone contract
	match F_QUIT [You're
	matchwait

F_CROSS_DIRGE_CHECK:
	echo
	echo F_CROSS_DIRGE_CHECK:
	echo
	match F_I_CROSS_GET_CON1 referring
	match F_CROSS_TO_DIRGE1 The contract is printed
put look my dirge contract
	match F_QUIT [You're
	matchwait

F_CROSS_TO_ARTHE1:
save F_CROSS_TO_ARTHE
goto F_CROSS_TO_BANK

F_CROSS_TO_DIRGE1:
save F_CROSS_TO_DIRGE
goto F_CROSS_TO_BANK

F_CROSS_TO_TIGER1:
save F_CROSS_TO_TIGER
goto F_CROSS_TO_BANK

F_CROSS_TO_STONE1:
save F_CROSS_TO_STONE
goto F_CROSS_TO_BANK

F_CROSS_TO_WOLF1:
save F_CROSS_TO_WOLF
goto F_CROSS_TO_BANK

F_CROSS_TO_BANK1:
put return caravan
wait
move e
move e
move go side door
move go foyer
move out
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
move go wind
put dep all


F_F_F_F:
match FFFFF TDPs
matchre FFFF /Calbour|Calinya/i
put info
matchwait

FFFFF:
echo
echo *********************
echo ** ROUTE COMPLETE! **
echo *********************
echo
put bala
wait
put get my bank book
wait
put read my bank book
wait
put stow my bank book
exit

FFFF:
echo
echo *********************
echo ** ROUTE COMPLETE! **
echo *********************
echo
put bala
wait
put get my bank book
wait
put read my bank book
wait
put stow my bank book
move out
move out
move nw
move n
move n
move n
move n
move n
move n
move e
move e
move n
move w
move n
move go gate
move e
move e
move e
move e
put unlock red cot
wait
put open red cot
wait
put go red cot
IF_2 waitfor %2
pause
put close door
wait
put lock door
put .wait

F_CROSS_TO_BANK:
move e
move e
move go side door
move go foyer
move out
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
move go wind
put dep all
waitfor you
put bala
waitfor you
move out
move out
move sw
move go bri
move n
move n
move w
move nw
move w
move w
move w
move go guild
move go auction foyer
move go hall
move go side door
move w
move w
goto %s


F_CROSS_TO_ARTHE:
	echo
	echo F_CROSS_TO_ARTHE:
	echo
goto F_CROSS_TO_ARTHE_OUT
F_CROSS_TO_ARTHE_OUT_PAUSE:
pause
F_CROSS_TO_ARTHE_OUT:
	match F_CROSS_TO_ARTHE_STAND can't do that
	match F_CROSS_TO_ARTHE_OUT2 obvious
	match F_CROSS_TO_ARTHE_OUT_PAUSE ...wait
	match F_CROSS_TO_ARTHE_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_CROSS_TO_ARTHE_PAUSE:
pause
F_CROSS_TO_ARTHE_STAND:
	match F_CROSS_TO_ARTHE_PAUSE roundtime
	match F_CROSS_TO_ARTHE_OUT You stand back up.
	match F_CROSS_TO_ARTHE_PAUSE ...wait
	match F_CROSS_TO_ARTHE_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_CROSS_TO_ARTHE_OUT2:
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
put tell caravan lead to arthe dale
waitfor you
goto F_HIDE


F_CROSS_TO_STONE:
	echo
	echo F_CROSS_TO_STONE:
	echo
goto F_CROSS_TO_STONE_OUT
F_CROSS_TO_STONE_OUT_PAUSE:
pause
F_CROSS_TO_STONE_OUT:
	match F_CROSS_TO_STONE_STAND can't do that
	match F_CROSS_TO_STONE_OUT2 obvious
	match F_CROSS_TO_STONE_OUT_PAUSE ...wait
	match F_CROSS_TO_STONE_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_CROSS_TO_STONE_PAUSE:
pause
F_CROSS_TO_STONE_STAND:
	match F_CROSS_TO_STONE_PAUSE roundtime
	match F_CROSS_TO_STONE_OUT You stand back up.
	match F_CROSS_TO_STONE_PAUSE ...wait
	match F_CROSS_TO_STONE_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_CROSS_TO_STONE_OUT2:
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
put tell caravan lead to stone clan
waitfor you
goto F_HIDE


F_CROSS_TO_DIRGE:
	echo
	echo F_CROSS_TO_DIRGE:
	echo
goto F_CROSS_TO_DIRGE_OUT
F_CROSS_TO_DIRGE_OUT_PAUSE:
pause
F_CROSS_TO_DIRGE_OUT:
	match F_CROSS_TO_DIRGE_STAND can't do that
	match F_CROSS_TO_DIRGE_OUT2 obvious
	match F_CROSS_TO_DIRGE_OUT_PAUSE ...wait
	match F_CROSS_TO_DIRGE_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_CROSS_TO_DIRGE_PAUSE:
pause
F_CROSS_TO_DIRGE_STAND:
	match F_CROSS_TO_DIRGE_PAUSE roundtime
	match F_CROSS_TO_DIRGE_OUT You stand back up.
	match F_CROSS_TO_DIRGE_PAUSE ...wait
	match F_CROSS_TO_DIRGE_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_CROSS_TO_DIRGE_OUT2:
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
put tell caravan lead to dirge
waitfor you
goto F_HIDE

F_CROSS_TO_TIGER:
	echo
	echo F_CROSS_TO_TIGER:
	echo
goto F_CROSS_TO_TIGER_OUT
F_CROSS_TO_TIGER_OUT_PAUSE:
pause
F_CROSS_TO_TIGER_OUT:
	match F_CROSS_TO_TIGER_STAND can't do that
	match F_CROSS_TO_TIGER_OUT2 obvious
	match F_CROSS_TO_TIGER_OUT_PAUSE ...wait
	match F_CROSS_TO_TIGER_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_CROSS_TO_TIGER_PAUSE:
pause
F_CROSS_TO_TIGER_STAND:
	match F_CROSS_TO_TIGER_PAUSE roundtime
	match F_CROSS_TO_TIGER_OUT You stand back up.
	match F_CROSS_TO_TIGER_PAUSE ...wait
	match F_CROSS_TO_TIGER_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_CROSS_TO_TIGER_OUT2:
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move go gate
waitfor following you
goto F_GOB_CROSS_TIGER1

F_GOB_CROSS_TIGER_PAUSE:
pause
F_GOB_CROSS_TIGER_SUBTRACT:
counter subtract 2
goto F_GOB_CROSS_TIGER%c


F_GOB_CROSS_TIGER_RP:
pause
F_GOB_CROSS_TIGER_RETREAT:
	match F_GOB_CROSS_TIGER%c You retreat from combat.
	match F_GOB_CROSS_TIGER%c already as far
	match F_GOB_CROSS_TIGER_P roundtime
	match F_GOB_CROSS_TIGER_RP ...wait
	match F_GOB_CROSS_TIGER_RP type ahead
	match F_GOB_CROSS_TIGER_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_CROSS_TIGER_P:
pause
	match F_GOB_CROSS_TIGER%c You retreat from combat.
	match F_GOB_CROSS_TIGER%c already as far
	match F_GOB_CROSS_TIGER_Q roundtime
	match F_GOB_CROSS_TIGER_P ...wait
	match F_GOB_CROSS_TIGER_P type ahead
	match F_GOB_CROSS_TIGER_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_CROSS_TIGER_RP1:
pause
F_GOB_CROSS_TIGER_RETREAT1:
	match F_GOB_CROSS_TIGER%c You retreat from combat.
	match F_GOB_CROSS_TIGER%c already as far
	match F_GOB_CROSS_TIGER_P1 roundtime
	match F_GOB_CROSS_TIGER_RP1 ...wait
	match F_GOB_CROSS_TIGER_RP1 type ahead
	match F_GOB_CROSS_TIGER_RP1 You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_CROSS_TIGER_P1:
pause
	match F_GOB_CROSS_TIGER%c You retreat from combat.
	match F_GOB_CROSS_TIGER%c already as far
	match F_GOB_CROSS_TIGER_Q roundtime
	match F_GOB_CROSS_TIGER_P1 ...wait
	match F_GOB_CROSS_TIGER_P1 type ahead
	match F_GOB_CROSS_TIGER_RP1 You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_CROSS_TIGER_Q:
pause
	match F_GOB_CROSS_TIGER%c You retreat from combat.
	match F_GOB_CROSS_TIGER%c already as far
	match F_QUIT roundtime
	match F_GOB_CROSS_TIGER_Q ...wait
	match F_GOB_CROSS_TIGER_Q type ahead
	match F_GOB_CROSS_TIGER_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_CROSS_TIGER1:
counter set 2
put go path
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T2:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER2:
counter set 3
put w
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T3:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER3:
counter set 4
put w
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T4:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER4:
counter set 5
put nw
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T5:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER5:
counter set 6
put w
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T6:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER6:
counter set 7
put w
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T7:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER7:
counter set 8
put nw
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T8:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER8:
counter set 9
put w
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T9:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER9:
counter set 10
put w
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T10:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER10:
counter set 11
put sw
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T11:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER11:
counter set 12
put w
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T12:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER12:
counter set 13
put w
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T13:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER13:
counter set 14
put nw
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T14:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER14:
counter set 15
put nw
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T15:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER15:
counter set 16
put w
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T16:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER16:
counter set 17
put go gate
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_T%c obvious
	matchwait

F_GOB_CROSS_T17:
	match F_GOB_CROSS_TIGER%c following you
	match F_GOB_CROSS_TIGER_RETREAT [You're
	match F_GOB_CROSS_TIGER_RETREAT1 You are engaged
	match F_GOB_CROSS_TIGER_SUBTRACT you can't
	match F_GOB_CROSS_TIGER_PAUSE type ahead
	match F_GOB_CROSS_TIGER_PAUSE ...wait
	matchwait


F_GOB_CROSS_TIGER17:
move s
waitfor following you
move se
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move go outpost
goto F_TIGER

F_CROSS_TO_WOLF:
	echo
	echo F_CROSS_TO_WOLF:
	echo
goto F_CROSS_TO_WOLF_OUT
F_CROSS_TO_WOLF_OUT_PAUSE:
pause
F_CROSS_TO_WOLF_OUT:
	match F_CROSS_TO_WOLF_STAND can't do that
	match F_CROSS_TO_WOLF_OUT2 obvious
	match F_CROSS_TO_WOLF_OUT_PAUSE ...wait
	match F_CROSS_TO_WOLF_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_CROSS_TO_WOLF_PAUSE:
pause
F_CROSS_TO_WOLF_STAND:
	match F_CROSS_TO_WOLF_PAUSE roundtime
	match F_CROSS_TO_WOLF_OUT You stand back up.
	match F_CROSS_TO_WOLF_PAUSE ...wait
	match F_CROSS_TO_WOLF_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_CROSS_TO_WOLF_OUT2:
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move w
waitfor following you
move w
waitfor following you
move w
waitfor following you
move go gate
waitfor following you
goto F_GOB_CROSS_WOLF1

F_GOB_CROSS_WOLF_PAUSE:
pause
F_GOB_CROSS_WOLF_SUBTRACT:
counter subtract 1
goto F_GOB_CROSS_WOLF%c

F_GOB_CROSS_WOLF_RP:
pause
F_GOB_CROSS_WOLF_RETREAT:
	match F_GOB_CROSS_WOLF%c You retreat from combat.
	match F_GOB_CROSS_WOLF%c already as far
	match F_GOB_CROSS_WOLF_P roundtime
	match F_GOB_CROSS_WOLF_RP ...wait
	match F_GOB_CROSS_WOLF_RP type ahead
	match F_GOB_CROSS_WOLF_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_CROSS_WOLF_P:
pause
	match F_GOB_CROSS_WOLF%c You retreat from combat.
	match F_GOB_CROSS_WOLF%c already as far
	match F_GOB_CROSS_WOLF_Q roundtime
	match F_GOB_CROSS_WOLF_P ...wait
	match F_GOB_CROSS_WOLF_P type ahead
	match F_GOB_CROSS_WOLF_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_CROSS_WOLF_RP1:
pause
F_GOB_CROSS_WOLF_RETREAT1:
	match F_GOB_CROSS_WOLF%c You retreat from combat.
	match F_GOB_CROSS_WOLF%c already as far
	match F_GOB_CROSS_WOLF_P1 roundtime
	match F_GOB_CROSS_WOLF_RP1 ...wait
	match F_GOB_CROSS_WOLF_RP1 type ahead
	match F_GOB_CROSS_WOLF_RP1 You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_CROSS_WOLF_P1:
pause
	match F_GOB_CROSS_WOLF%c You retreat from combat.
	match F_GOB_CROSS_WOLF%c already as far
	match F_GOB_CROSS_WOLF_Q roundtime
	match F_GOB_CROSS_WOLF_P1 ...wait
	match F_GOB_CROSS_WOLF_P1 type ahead
	match F_GOB_CROSS_WOLF_RP1 You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_CROSS_WOLF_Q:
pause
	match F_GOB_CROSS_WOLF%c You retreat from combat.
	match F_GOB_CROSS_WOLF%c already as far
	match F_QUIT roundtime
	match F_GOB_CROSS_WOLF_Q ...wait
	match F_GOB_CROSS_WOLF_Q type ahead
	match F_GOB_CROSS_WOLF_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_CROSS_WOLF1:
counter set 2
put go path
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W2:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF2:
counter set 3
put w
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W3:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF3:
counter set 4
put w
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W4:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF4:
counter set 5
put nw
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W5:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF5:
counter set 6
put w
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W6:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF6:
counter set 7
put w
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W7:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF7:
counter set 8
put nw
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W8:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF8:
counter set 9
put w
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W9:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF9:
counter set 10
put w
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W10:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF10:
counter set 11
put sw
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W11:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF11:
counter set 12
put w
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W12:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF12:
counter set 13
put w
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W13:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF13:
counter set 14
put nw
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W14:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF14:
counter set 15
put nw
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W15:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_GOB_CROSS_WOLF15:
counter set 16
put w
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_W%c obvious
	matchwait

F_GOB_CROSS_W16:
	match F_GOB_CROSS_WOLF%c following you
	match F_GOB_CROSS_WOLF_RETREAT [You're
	match F_GOB_CROSS_WOLF_RETREAT1 You are engaged
	match F_GOB_CROSS_WOLF_SUBTRACT you can't
	match F_GOB_CROSS_WOLF_PAUSE type ahead
	match F_GOB_CROSS_WOLF_PAUSE ...wait
	matchwait


F_TIGER_OUT:
move go outpost
F_TIGER_IN:
F_TIGER:
	echo
	echo F_TIGER:
	echo
F_TIGER1:
	match F_TIGER_GIVE_CON you get
	match F_TIGER_WOLF_CHECK referring
put get my tiger contract
	match F_QUIT [You're
	matchwait

F_TIGER_GIVE_CON:
	echo
	echo F_TIGER_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto F_TIGER1

F_TIGER_WOLF_CHECK:
pause
	echo
	echo F_TIGER_WOLF_CHECK:
	echo
	match F_TIGER_TO_CROSS referring
	match F_TIGER_TO_WOLF The contract is printed
put look my wolf contract
	match F_QUIT [You're
	matchwait

F_TIGER_TO_CROSS:
	echo
	echo F_TIGER_TO_CROSS:
	echo
goto F_TIGER_TO_CROSS_OUT
F_TIGER_TO_CROSS_OUT_PAUSE:
pause
F_TIGER_TO_CROSS_OUT:
	match F_TIGER_TO_CROSS_STAND can't do that
	match F_TIGER_TO_CROSS_OUT2 obvious
	match F_TIGER_TO_CROSS_OUT_PAUSE ...wait
	match F_TIGER_TO_CROSS_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_TIGER_TO_CROSS_PAUSE:
pause
F_TIGER_TO_CROSS_STAND:
	match F_TIGER_TO_CROSS_PAUSE roundtime
	match F_TIGER_TO_CROSS_OUT You stand back up.
	match F_TIGER_TO_CROSS_PAUSE ...wait
	match F_TIGER_TO_CROSS_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_TIGER_TO_CROSS_OUT2:
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
move se
waitfor following you
move se
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move nw
waitfor following you
move n
waitfor following you
goto F_GOB_TIGER_CROSS1

F_GOB_TIGER_CROSS_PAUSE:
pause
F_GOB_TIGER_CROSS_SUBTRACT:
counter subtract 1
goto F_GOB_TIGER_CROSS%c


F_GOB_TIGER_CROSS_RP:
pause
F_GOB_TIGER_CROSS_RETREAT:
	match F_GOB_TIGER_CROSS%c You retreat from combat.
	match F_GOB_TIGER_CROSS%c already as far
	match F_GOB_TIGER_CROSS_P roundtime
	match F_GOB_TIGER_CROSS_RP ...wait
	match F_GOB_TIGER_CROSS_RP type ahead
	match F_GOB_TIGER_CROSS_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_TIGER_CROSS_P:
pause
	match F_GOB_TIGER_CROSS%c You retreat from combat.
	match F_GOB_TIGER_CROSS%c already as far
	match F_GOB_TIGER_CROSS_Q roundtime
	match F_GOB_TIGER_CROSS_P ...wait
	match F_GOB_TIGER_CROSS_P type ahead
	match F_GOB_TIGER_CROSS_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_TIGER_CROSS_RP1:
pause
F_GOB_TIGER_CROSS_RETREAT1:
	match F_GOB_TIGER_CROSS%c You retreat from combat.
	match F_GOB_TIGER_CROSS%c already as far
	match F_GOB_TIGER_CROSS_P1 roundtime
	match F_GOB_TIGER_CROSS_RP1 ...wait
	match F_GOB_TIGER_CROSS_RP1 type ahead
	match F_GOB_TIGER_CROSS_RP1 You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_TIGER_CROSS_P1:
pause
	match F_GOB_TIGER_CROSS%c You retreat from combat.
	match F_GOB_TIGER_CROSS%c already as far
	match F_GOB_TIGER_CROSS_Q roundtime
	match F_GOB_TIGER_CROSS_P1 ...wait
	match F_GOB_TIGER_CROSS_P1 type ahead
	match F_GOB_TIGER_CROSS_RP1 You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_TIGER_CROSS_Q:
pause
	match F_GOB_TIGER_CROSS%c You retreat from combat.
	match F_GOB_TIGER_CROSS%c already as far
	match F_QUIT roundtime
	match F_GOB_TIGER_CROSS_Q ...wait
	match F_GOB_TIGER_CROSS_Q type ahead
	match F_GOB_TIGER_CROSS_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_TIGER_CROSS1:
put go gate
counter set 2
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C2:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

	
F_GOB_WOLF_CROSS15:
F_GOB_TIGER_CROSS2:
put e
counter set 3
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C3:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS3:
put se
counter set 4
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C4:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS4:
put se
counter set 5
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C5:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS5:
put e
counter set 6
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C6:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS6:
put e
counter set 7
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C7:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS7:
put ne
counter set 8
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C8:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS8:
put e
counter set 9
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C9:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS9:
put e
counter set 10
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C10:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS10:
put se
counter set 11
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C11:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS11:
put e
counter set 12
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C12:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS12:
put e
counter set 13
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C13:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS13:
put se
counter set 14
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C14:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS14:
put e
counter set 15
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C15:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS15:
put e
counter set 16
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C16:
	match F_GOB_TIGER_CROSS%c following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS16:
put go path
counter set 17
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_C%c obvious
	matchwait

F_GOB_TIGER_C17:
	match F_CROSS_WEST_GATE following you
	match F_GOB_TIGER_CROSS_RETREAT [You're
	match F_GOB_TIGER_CROSS_RETREAT1 You are engaged
	match F_GOB_TIGER_CROSS_SUBTRACT you can't
	match F_GOB_TIGER_CROSS_PAUSE type ahead
	match F_GOB_TIGER_CROSS_PAUSE ...wait
	matchwait

F_GOB_TIGER_CROSS17:
F_CROSS_WEST_GATE:
move go gate
waitfor following you
move e
waitfor following you
move e
waitfor following you
move e
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move go door
goto F_CROSS

F_TIGER_TO_WOLF:
	echo
	echo F_TIGER_TO_WOLF:
	echo
goto F_TIGER_TO_WOLF_OUT
F_TIGER_TO_WOLF_OUT_PAUSE:
pause
F_TIGER_TO_WOLF_OUT:
	match F_TIGER_TO_WOLF_STAND can't do that
	match F_TIGER_TO_WOLF_OUT2 obvious
	match F_TIGER_TO_WOLF_OUT_PAUSE ...wait
	match F_TIGER_TO_WOLF_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_TIGER_TO_WOLF_PAUSE:
pause
F_TIGER_TO_WOLF_STAND:
	match F_TIGER_TO_WOLF_PAUSE roundtime
	match F_TIGER_TO_WOLF_OUT You stand back up.
	match F_TIGER_TO_WOLF_PAUSE ...wait
	match F_TIGER_TO_WOLF_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_TIGER_TO_WOLF_OUT2:
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
move se
waitfor following you
move se
waitfor following you
move ne
waitfor following you
move n
waitfor following you
move nw
waitfor following you
move n
waitfor following you
goto F_GOB_TIGER_WOLF1

F_GOB_TIGER_WOLF_PAUSE:
pause
F_GOB_TIGER_WOLF_SUBTRACT:
counter subtract 1
goto F_GOB_TIGER_WOLF%c

F_GOB_TIGER_WOLF_SUBTRACT2:
counter subtract 2
goto F_GOB_TIGER_WOLF%c

F_GOB_TIGER_WOLF_RP:
pause
F_GOB_TIGER_WOLF_RETREAT:
	match F_GOB_TIGER_WOLF%c You retreat from combat.
	match F_GOB_TIGER_WOLF%c already as far
	match F_GOB_TIGER_WOLF_P roundtime
	match F_GOB_TIGER_WOLF_RP ...wait
	match F_GOB_TIGER_WOLF_RP type ahead
	match F_GOB_TIGER_WOLF_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_TIGER_WOLF_P:
pause
	match F_GOB_TIGER_WOLF%c You retreat from combat.
	match F_GOB_TIGER_WOLF%c already as far
	match F_GOB_TIGER_WOLF_Q roundtime
	match F_GOB_TIGER_WOLF_P ...wait
	match F_GOB_TIGER_WOLF_P type ahead
	match F_GOB_TIGER_WOLF_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_TIGER_WOLF_RP1:
pause
F_GOB_TIGER_WOLF_RETREAT1:
	match F_GOB_TIGER_WOLF%c You retreat from combat.
	match F_GOB_TIGER_WOLF%c already as far
	match F_GOB_TIGER_WOLF_P1 roundtime
	match F_GOB_TIGER_WOLF_RP1 ...wait
	match F_GOB_TIGER_WOLF_RP1 type ahead
	match F_GOB_TIGER_WOLF_RP1 You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_TIGER_WOLF_P1:
pause
	match F_GOB_TIGER_WOLF%c You retreat from combat.
	match F_GOB_TIGER_WOLF%c already as far
	match F_GOB_TIGER_WOLF_Q roundtime
	match F_GOB_TIGER_WOLF_P1 ...wait
	match F_GOB_TIGER_WOLF_P1 type ahead
	match F_GOB_TIGER_WOLF_RP1 You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_TIGER_WOLF_Q:
pause
	match F_GOB_TIGER_WOLF%c You retreat from combat.
	match F_GOB_TIGER_WOLF%c already as far
	match F_QUIT roundtime
	match F_GOB_TIGER_WOLF_Q ...wait
	match F_GOB_TIGER_WOLF_Q type ahead
	match F_GOB_TIGER_WOLF_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_TIGER_WOLF1:
counter set 2
put go gate
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W2:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait
	
F_GOB_CROSS_WOLF16:
F_GOB_TIGER_WOLF2:
F_GOB_TIGER_WOLF3:
counter set 4
put w
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W4:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT2 you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


F_GOB_TIGER_WOLF4:
counter set 5
put nw
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W5:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


F_GOB_TIGER_WOLF5:
counter set 6
put w
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W6:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


F_GOB_TIGER_WOLF6:
counter set 7
put w
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W7:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


F_GOB_TIGER_WOLF7:
counter set 8
put go brook
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W8:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


F_GOB_TIGER_WOLF8:
counter set 9
put w
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF%c obvious
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait

F_GOB_TIGER_WOLF9_PAUSE:
pause
F_GOB_TIGER_WOLF9:
counter set 10
	match F_TWW1 inventory report
	match F_GOB_TIGER_WOLF9_PAUSE referring
	match F_GOB_TIGER_WOLF9_PAUSE belonging to
	match QUIT [You're
	match F_GOB_TIGER_WOLF9_PAUSE ...wait
put look cara
	matchwait

F_TWW1_PAUSE:
pause
F_TWW1:
	echo
	echo F_TWW1:
	echo
	match F_TWW21 obvious
	match F_TWW1_PAUSE ...wait
	match F_QUIT [You're
put w
	matchwait

F_TWW21_PAUSE:
pause 2
F_TWW21:
	match F_TWW2 inventory report
	match F_TWW21_PAUSE referring
	match F_TWW21_PAUSE belonging to
	match F_QUIT [You're
put look cara
	matchwait

F_TWW2_PAUSE:
pause
F_TWW2:
	echo
	echo F_TWW2:
	echo
	match F_TWW31 obvious
	match F_TWW2_PAUSE ...wait
	match F_QUIT [You're
put w
	matchwait

F_TWW31_PAUSE:
pause 2
F_TWW31:
	match F_TWW3 inventory report
	match F_TWW31_PAUSE referring
	match F_TWW31_PAUSE belonging to
	match F_QUIT [You're
put look cara
	matchwait

F_TWW3:
F_GOB_TIGER_WOLF10:
counter set 11
	echo
	echo F_TWW3:
	echo
put sw
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W11:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


F_GOB_TIGER_WOLF11:
counter set 12
put w
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W12:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


F_GOB_TIGER_WOLF12:
counter set 13
put sw
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W13:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


F_GOB_TIGER_WOLF13:
counter set 14
put s
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W14:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


F_GOB_TIGER_WOLF14:
counter set 15
put s
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W15:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


F_GOB_TIGER_WOLF15:
counter set 16
put e
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W16:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


F_GOB_TIGER_WOLF16:
counter set 17
put go bush
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_W%c obvious
	matchwait

F_GOB_TIGER_W17:
	match F_GOB_TIGER_WOLF%c following you
	match F_GOB_TIGER_WOLF_RETREAT [You're
	match F_GOB_TIGER_WOLF_RETREAT1 You are engaged
	match F_GOB_TIGER_WOLF_SUBTRACT you can't
	match F_GOB_TIGER_WOLF_PAUSE type ahead
	match F_GOB_TIGER_WOLF_PAUSE ...wait
	matchwait


F_GOB_TIGER_WOLF17:
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
move s
waitfor following you
move sw
waitfor following you
move s
waitfor following you
move go out
goto F_WOLF

F_WOLF_OUT:
move go out
F_WOLF_IN:


F_WOLF:
	echo
	echo F_WOLF:
	echo
F_WOLF1:
	match F_WOLF_GIVE_CON you get
	match F_WOLF_TIGER_CHECK referring
put get my wolf contract
	match F_QUIT [You're
	matchwait

F_WOLF_GIVE_CON:
	echo
	echo F_WOLF_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto F_WOLF1


F_WOLF_TIGER_CHECK:
pause
	echo
	echo F_WOLF_TIGER_CHECK:
	echo
	match F_WOLF_TO_CROSS referring
	match F_WOLF_TO_TIGER The contract is printed
put look my tiger contract
	match F_QUIT [You're
	matchwait


F_WOLF_TO_CROSS:
	echo
	echo F_WOLF_TO_CROSS:
	echo
goto F_WOLF_TO_CROSS_OUT
F_WOLF_TO_CROSS_OUT_PAUSE:
pause
F_WOLF_TO_CROSS_OUT:
	match F_WOLF_TO_CROSS_STAND can't do that
	match F_WOLF_TO_CROSS_OUT2 obvious
	match F_WOLF_TO_CROSS_OUT_PAUSE ...wait
	match F_WOLF_TO_CROSS_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_WOLF_TO_CROSS_PAUSE:
pause
F_WOLF_TO_CROSS_STAND:
	match F_WOLF_TO_CROSS_PAUSE roundtime
	match F_WOLF_TO_CROSS_OUT You stand back up.
	match F_WOLF_TO_CROSS_PAUSE ...wait
	match F_WOLF_TO_CROSS_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_WOLF_TO_CROSS_OUT2:
put tell caravan to follow
waitfor you
put tell caravan go fast
waitfor you
move n
waitfor following you
move ne
waitfor following you
move n
waitfor following you
goto F_GOB_WOLF_CROSS1

F_GOB_WOLF_CROSS_PAUSE:
pause
F_GOB_WOLF_CROSS_SUBTRACT:
counter subtract 1
goto F_GOB_WOLF_CROSS%c


F_GOB_WOLF_CROSS_RP:
pause
F_GOB_WOLF_CROSS_RETREAT:
	match F_GOB_WOLF_CROSS%c You retreat from combat.
	match F_GOB_WOLF_CROSS%c already as far
	match F_GOB_WOLF_CROSS_P roundtime
	match F_GOB_WOLF_CROSS_RP ...wait
	match F_GOB_WOLF_CROSS_RP type ahead
	match F_GOB_WOLF_CROSS_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_WOLF_CROSS_P:
pause
	match F_GOB_WOLF_CROSS%c You retreat from combat.
	match F_GOB_WOLF_CROSS%c already as far
	match F_GOB_WOLF_CROSS_Q roundtime
	match F_GOB_WOLF_CROSS_P ...wait
	match F_GOB_WOLF_CROSS_P type ahead
	match F_GOB_WOLF_CROSS_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_WOLF_CROSS_RP1:
pause
F_GOB_WOLF_CROSS_RETREAT1:
	match F_GOB_WOLF_CROSS%c You retreat from combat.
	match F_GOB_WOLF_CROSS%c already as far
	match F_GOB_WOLF_CROSS_P1 roundtime
	match F_GOB_WOLF_CROSS_RP1 ...wait
	match F_GOB_WOLF_CROSS_RP1 type ahead
	match F_GOB_WOLF_CROSS_RP1 You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_WOLF_CROSS_P1:
pause
	match F_GOB_WOLF_CROSS%c You retreat from combat.
	match F_GOB_WOLF_CROSS%c already as far
	match F_GOB_WOLF_CROSS_Q roundtime
	match F_GOB_WOLF_CROSS_P1 ...wait
	match F_GOB_WOLF_CROSS_P1 type ahead
	match F_GOB_WOLF_CROSS_RP1 You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_WOLF_CROSS_Q:
pause
	match F_GOB_WOLF_CROSS%c You retreat from combat.
	match F_GOB_WOLF_CROSS%c already as far
	match F_QUIT roundtime
	match F_GOB_WOLF_CROSS_Q ...wait
	match F_GOB_WOLF_CROSS_Q type ahead
	match F_GOB_WOLF_CROSS_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait


F_GOB_WOLF_CROSS1:
counter set 2
put go bush
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_C%c obvious
	matchwait

F_GOB_WOLF_C2:
	match F_GOB_WOLF_CROSS%c following you
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
	matchwait

F_GOB_WOLF_CROSS2:
counter set 3
put w
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_C%c obvious
	matchwait

F_GOB_WOLF_C3:
	match F_GOB_WOLF_CROSS%c following you
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


F_GOB_WOLF_CROSS3:
counter set 4
put n
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_C%c obvious
	matchwait

F_GOB_WOLF_C4:
	match F_GOB_WOLF_CROSS%c following you
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


F_GOB_WOLF_CROSS4:
counter set 5
put n
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_C%c obvious
	matchwait

F_GOB_WOLF_C5:
	match F_GOB_WOLF_CROSS%c following you
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


F_GOB_WOLF_CROSS5:
counter set 6
put ne
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_C%c obvious
	matchwait

F_GOB_WOLF_C6:
	match F_GOB_WOLF_CROSS%c following you
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


F_GOB_WOLF_CROSS6:
counter set 7
put e
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_C%c obvious
	matchwait

F_GOB_WOLF_C7:
	match F_GOB_WOLF_CROSS%c following you
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


F_GOB_WOLF_CROSS7:
counter set 8
put ne
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_C%c obvious
	matchwait

F_GOB_WOLF_C8:
	match F_GOB_WOLF_CROSS%c following you
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


F_GOB_WOLF_CROSS8:
counter set 9
put e
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_C%c obvious
	matchwait

F_GOB_WOLF_C9:
	match F_GOB_WOLF_CROSS%c following you
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


F_GOB_WOLF_CROSS9:
counter set 10
put go brook
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_C%c obvious
	matchwait

F_GOB_WOLF_C10:
	match F_GOB_WOLF_CROSS%c following you
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


F_GOB_WOLF_CROSS10:
counter set 11
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS%c obvious
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
put e
	matchwait

F_GOB_WOLF_CROSS11_PAUSE:
pause
F_GOB_WOLF_CROSS11:
counter set 12
	match F_WTC1 inventory report
	match F_GOB_WOLF_CROSS11_PAUSE referring
	match F_GOB_WOLF_CROSS11_PAUSE belonging to
	match QUIT [You're
	match F_GOB_WOLF_CROSS11_PAUSE ...wait
put look cara
	matchwait

F_WTC1_PAUSE:
pause
F_WTC1:
	echo
	echo F_WTC1:
	echo
	match F_WTC21 obvious
	match F_WTC1_PAUSE ...wait
	match F_QUIT [You're
put e
	matchwait

F_WTC21_PAUSE:
pause 2
F_WTC21:
	match F_WTC2 inventory report
	match F_WTC21_PAUSE referring
	match F_WTC21_PAUSE belonging to
	match F_QUIT [You're
put look cara
	matchwait

F_WTC2_PAUSE:
pause
F_WTC2:
	echo
	echo F_WTC2:
	echo
	match F_WTC31 obvious
	match F_WTC2_PAUSE ...wait
	match F_QUIT [You're
put e
	matchwait

F_WTC31_PAUSE:
pause 2
F_WTC31:
	match F_WTC3 inventory report
	match F_WTC31_PAUSE referring
	match F_WTC31_PAUSE belonging to
	match F_QUIT [You're
put look cara
	matchwait

F_WTC3_PAUSE:
pause
F_WTC3:
F_WTC4:
F_GOB_WOLF_CROSS12:
counter set 13
put e
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_C%c obvious
	matchwait

F_GOB_WOLF_C13:
	match F_GOB_WOLF_CROSS%c following you
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


F_GOB_WOLF_CROSS13:
counter set 14
put se
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_C%c obvious
	matchwait

F_GOB_WOLF_C14:
	match F_GOB_WOLF_CROSS%c following you
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


F_GOB_WOLF_CROSS14:
counter set 15
put e
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_C%c obvious
	matchwait

F_GOB_WOLF_C15:
	match F_GOB_WOLF_CROSS%c following you
	match F_GOB_WOLF_CROSS_RETREAT [You're
	match F_GOB_WOLF_CROSS_RETREAT1 You are engaged
	match F_GOB_WOLF_CROSS_SUBTRACT you can't
	match F_GOB_WOLF_CROSS_PAUSE type ahead
	match F_GOB_WOLF_CROSS_PAUSE ...wait
	matchwait


F_WOLF_TO_TIGER:
	echo
	echo F_WOLF_TO_TIGER:
	echo
goto F_WOLF_TO_TIGER_OUT
F_WOLF_TO_TIGER_OUT_PAUSE:
pause
F_WOLF_TO_TIGER_OUT:
	match F_WOLF_TO_TIGER_STAND can't do that
	match F_WOLF_TO_TIGER_OUT2 obvious
	match F_WOLF_TO_TIGER_OUT_PAUSE ...wait
	match F_WOLF_TO_TIGER_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_WOLF_TO_TIGER_PAUSE:
pause
F_WOLF_TO_TIGER_STAND:
	match F_WOLF_TO_TIGER_PAUSE roundtime
	match F_WOLF_TO_TIGER_OUT You stand back up.
	match F_WOLF_TO_TIGER_PAUSE ...wait
	match F_WOLF_TO_TIGER_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_WOLF_TO_TIGER_OUT2:
put tell caravan to follow
waitfor you
put tell caravan go fast
waitfor you
move n
waitfor following you
move ne
waitfor following you
move n
waitfor following you
goto F_GOB_WOLF_TIGER1


F_GOB_WOLF_TIGER_PAUSE:
pause
F_GOB_WOLF_TIGER_SUBTRACT:
counter subtract 1
goto F_GOB_WOLF_TIGER%c


F_GOB_WOLF_TIGER_RP:
pause
F_GOB_WOLF_TIGER_RETREAT:
	match F_GOB_WOLF_TIGER%c You retreat from combat.
	match F_GOB_WOLF_TIGER%c already as far
	match F_GOB_WOLF_TIGER_P roundtime
	match F_GOB_WOLF_TIGER_RP ...wait
	match F_GOB_WOLF_TIGER_RP type ahead
	match F_GOB_WOLF_TIGER_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_WOLF_TIGER_P:
pause
	match F_GOB_WOLF_TIGER%c You retreat from combat.
	match F_GOB_WOLF_TIGER%c already as far
	match F_GOB_WOLF_TIGER_Q roundtime
	match F_GOB_WOLF_TIGER_P ...wait
	match F_GOB_WOLF_TIGER_P type ahead
	match F_GOB_WOLF_TIGER_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_WOLF_TIGER_RP1:
pause
F_GOB_WOLF_TIGER_RETREAT1:
	match F_GOB_WOLF_TIGER%c You retreat from combat.
	match F_GOB_WOLF_TIGER%c already as far
	match F_GOB_WOLF_TIGER_P1 roundtime
	match F_GOB_WOLF_TIGER_RP1 ...wait
	match F_GOB_WOLF_TIGER_RP1 type ahead
	match F_GOB_WOLF_TIGER_RP1 You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_WOLF_TIGER_P1:
pause
	match F_GOB_WOLF_TIGER%c You retreat from combat.
	match F_GOB_WOLF_TIGER%c already as far
	match F_GOB_WOLF_TIGER_Q roundtime
	match F_GOB_WOLF_TIGER_P1 ...wait
	match F_GOB_WOLF_TIGER_P1 type ahead
	match F_GOB_WOLF_TIGER_RP1 You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait

F_GOB_WOLF_TIGER_Q:
pause
	match F_GOB_WOLF_TIGER%c You retreat from combat.
	match F_GOB_WOLF_TIGER%c already as far
	match F_QUIT roundtime
	match F_GOB_WOLF_TIGER_Q ...wait
	match F_GOB_WOLF_TIGER_Q type ahead
	match F_GOB_WOLF_TIGER_RP You stop advancing
	match F_QUIT You are still stunned
put retreat
put retreat
	matchwait


F_GOB_WOLF_TIGER1:
counter set 2
put go bush
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T2:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait

F_GOB_WOLF_TIGER2:
counter set 3
put w
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T3:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait

F_GOB_WOLF_TIGER3:
F_GOB_WOLF_TIGER4:
counter set 5
put n
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T5:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


F_GOB_WOLF_TIGER5:
counter set 6
put n
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T6:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


F_GOB_WOLF_TIGER6:
counter set 7
put ne
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T7:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


F_GOB_WOLF_TIGER7:
counter set 8
put e
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T8:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


F_GOB_WOLF_TIGER8:
counter set 9
put ne
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T9:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


F_GOB_WOLF_TIGER9:
counter set 10
put e
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T10:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


F_GOB_WOLF_TIGER10:
counter set 11
put go brook
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T11:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


F_GOB_WOLF_TIGER11:
counter set 12
put e
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	match F_GOB_WOLF_TIGER%c obvious
	matchwait

F_GOB_WOLF_TIGER12_PAUSE:
pause
F_GOB_WOLF_TIGER12:
	match F_WTT1 inventory report
	match F_GOB_WOLF_TIGER12_PAUSE referring
	match F_GOB_WOLF_TIGER12_PAUSE belonging to
	match QUIT [You're
	match F_GOB_WOLF_TIGER12_PAUSE ...wait
put look cara
	matchwait

F_WTT1_PAUSE:
pause
F_WTT1:
	echo
	echo F_WTT1:
	echo
	match F_WTT21 obvious
	match F_WTT1_PAUSE ...wait
	match F_QUIT [You're
put e
	matchwait

F_WTT21_PAUSE:
pause 2
F_WTT21:
	match F_WTT2 inventory report
	match F_WTT21_PAUSE referring
	match F_WTT21_PAUSE belonging to
	match F_QUIT [You're
put look cara
	matchwait

F_WTT2_PAUSE:
pause
F_WTT2:
	echo
	echo F_WTT2:
	echo
	match F_WTT31 obvious
	match F_WTT2_PAUSE ...wait
	match F_QUIT [You're
put e
	matchwait

F_WTT31_PAUSE:
pause 2
F_WTT31:
	match F_WTT3 inventory report
	match F_WTT31_PAUSE referring
	match F_WTT31_PAUSE belonging to
	match F_QUIT [You're
put look cara
	matchwait

F_WTT3_PAUSE:
pause
F_WTT3:
F_WTT4:
F_GOB_WOLF_TIGER13:
counter set 14
put e
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T14:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


F_GOB_WOLF_TIGER14:
counter set 15
put se
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T15:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait


F_GOB_WOLF_TIGER15:
counter set 16
put e
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T16:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait

F_GOB_WOLF_TIGER16:
counter set 17
put go gate
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_T%c obvious
	matchwait

F_GOB_WOLF_T17:
	match F_GOB_WOLF_TIGER%c following you
	match F_GOB_WOLF_TIGER_RETREAT [You're
	match F_GOB_WOLF_TIGER_RETREAT1 You are engaged
	match F_GOB_WOLF_TIGER_SUBTRACT you can't
	match F_GOB_WOLF_TIGER_PAUSE type ahead
	match F_GOB_WOLF_TIGER_PAUSE ...wait
	matchwait

F_GOB_WOLF_TIGER17:
move s
waitfor following you
move se
waitfor following you
move s
waitfor following you
move sw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move go out
goto F_TIGER


F_CROSS_TO_LETH:
	echo
	echo F_CROSS_TO_LETH:
	echo
goto F_CROSS_TO_LETH_OUT
F_CROSS_TO_LETH_OUT_PAUSE:
pause
F_CROSS_TO_LETH_OUT:
	match F_CROSS_TO_LETH_STAND can't do that
	match F_CROSS_TO_LETH_OUT2 obvious
	match F_CROSS_TO_LETH_OUT_PAUSE ...wait
	match F_CROSS_TO_LETH_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_CROSS_TO_LETH_PAUSE:
pause
F_CROSS_TO_LETH_STAND:
	match F_CROSS_TO_LETH_PAUSE roundtime
	match F_CROSS_TO_LETH_OUT You stand back up.
	match F_CROSS_TO_LETH_PAUSE ...wait
	match F_CROSS_TO_LETH_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_CROSS_TO_LETH_OUT2:
put tell caravan to follow
waitfor you
put tell caravan go fast
waitfor you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move se
waitfor following you
move sw
waitfor following you
move go pier
waitfor following you
F_TO_LETH_FERRY:
	echo
	echo F_TO_LETH_FERRY:
	echo
	match F_FERRY_TO_LETH2 and climb aboard.
	match F_HIDE_TO_LETH You will have to wait
	match F_HIDE_TO_LETH ferry here to go aboard
	match F_FERRY_MONEY_CROSS he says,
	match F_TO_LETH_FERRY_STAND you must be standing
put go ferry
	match F_QUIT [You're
	matchwait

F_TO_LETH_FERRY_STAND_PAUSE:
pause
F_TO_LETH_FERRY_STAND:
	match F_TO_LETH_FERRY_STAND_PAUSE roundtime
	match F_TO_LETH_FERRY you stand back up
put stand
	matchwait



F_TO_LETH_FERRY_CARA:
goto F_TO_LETH_FERRY

F_FERRY_MONEY_CROSS:
	echo
	echo F_FERRY_MONEY_CROSS:
	echo
put tell caravan stop
waitfor you
move go squ
move ne
move e
move e
move e
move e
move ne
move go bridge
move ne
move go bank
move go wind
	match F_FERRY_CROSS_MONEY The clerk counts out 1000
	match F_CROSS_LESS1 The clerk tells you,
put with 1000 cop kro
	match F_QUIT [You're
	matchwait

F_FERRY_CROSS_MONEY:
	echo
	echo F_FERRY_CROSS_MONEY:
	echo
move out
move out
move sw
move go bri
move sw
move w
move w
move w
move w
move sw
move go pier
put tell caravan follow
waitfor you
goto F_TO_LETH_FERRY

F_CROSS_LESS1:
	echo
	echo F_CROSS_LESS1:
	echo
pause 2
	match F_FERRY_CROSS_MONEY The clerk counts out 500
	match F_CROSS_LESS2 The clerk tells you,
put with 500 cop kro
	match F_QUIT [You're
	matchwait

F_CROSS_LESS2:
	echo
	echo F_CROSS_LESS2:
	echo
pause 2
	match F_FERRY_CROSS_MONEY The clerk counts out 200
	match F_CROSS_LESS3 The clerk tells you,
put with 200 cop kro
	match F_QUIT [You're
	matchwait

F_CROSS_LESS3:
	echo
	echo F_CROSS_LESS3:
	echo
move out
move out
move sw
move go bri
move sw
move w
move w
move w
move w
move sw
move go pier
put tell caravan follow
waitfor you
move go squ
waitfor following you
move ne
waitfor following you
move nw
waitfor follow
move n
waitfor follow
move n
waitfor follow
move n
waitfor follow
move go door
goto F_CROSS_ARTHE_CHECK



F_HIDE_TO_LETH_PAUSE:
pause
F_HIDE_TO_LETH:
	echo
	echo F_HIDE_TO_LETH:
	echo
	match F_WAIT_LETH Eh?
	match F_WAIT_LETH You blend
	match F_WAIT_LETH You melt into the background
	match F_WAIT_LETH glance at you as you hide.
	match F_WAIT_LETH ruining your hiding place!
	match F_HIDE_TO_LETH_PAUSE roundtime
	match F_HIDE_TO_LETH_PAUSE ...wait
	match F_HIDE_TO_LETH_PAUSE type ahead
	match F_TO_LETH_FERRY pulls into the dock
put hide
	match F_QUIT [You're
	matchwait

F_WAIT_LETH:
	echo
	echo F_WAIT_LETH:
	echo
	match F_TO_LETH_FERRY pulls into the dock
	match F_TO_LETH_FERRY You hear a bell ring out
	match F_QUIT [You're
	matchwait



F_FERRY_TO_LETH2_PAUSE:
pause
F_FERRY_TO_LETH2:
	echo
	echo F_FERRY_TO_LETH2:
	echo
waitfor following you
put rem feedbag
wait
put give cara
wait
put wear feedbag
wait
	match F_WAIT_LETH_FERRY Eh?
	match F_WAIT_LETH_FERRY You blend
	match F_WAIT_LETH_FERRY You melt into the background
	match F_WAIT_LETH_FERRY glance at you as you hide.
	match F_WAIT_LETH_FERRY ruining your hiding place!
	match F_FERRY_TO_LETH2_PAUSE roundtime
	match F_FERRY_TO_LETH2_PAUSE ...wait
	match F_FERRY_TO_LETH2_PAUSE type ahead
	match F_OFF_LETH_FERRY its crew ties the ferry off.
put hide
	match F_QUIT [You're
	matchwait

F_WAIT_LETH_FERRY:
	echo
	echo F_WAIT_LETH_FERRY:
	echo
	match F_OFF_LETH_FERRY its crew ties the ferry off.
	match F_QUIT [You're
	matchwait

F_OFF_LETH_FERRY:
	echo
	echo F_OFF_LETH_FERRY:
	echo
move go dock
F_OFF_LETH_FERRY1:
waitfor following you
F_OFF_LETH_FERRY11:
put tell caravan lead to leth deriel
goto F_LETH_HIDE


F_LETH_HIDE_PAUSE:
pause
F_LETH_HIDE:
	echo
	echo F_LETH_HIDE:
	echo
	match F_LETH_DES_WAIT Eh?
	match F_LETH_DES_WAIT You blend
	match F_LETH_DES_WAIT You melt into the background
	match F_LETH_DES_WAIT glance at you as you hide.
	match F_LETH_DES_WAIT ruining your hiding place!
	match F_LETH_HIDE_PAUSE roundtime
	match F_LETH_HIDE_PAUSE ...wait
	match F_LETH_HIDE_PAUSE type ahead
	match F_LETH_LOOK having arrived at its destination.
put hide
	match F_QUIT [You're
	matchwait


F_LETH_DES_WAIT:
	echo
	echo F_LETH_DES_WAIT:
	echo
	match F_LETH_LOOK having arrived at its destination.
	match F_LETH_LOOK YOU HAVE BEEN IDLE
	match F_QUIT [You're
	matchwait


F_LETH_LOOK:
	echo
	echo F_LETH_LOOK:
	echo
	match F_TO_CROSS_FERRY1 Southern Trade Route, Segoltha Plain
	match F_TO_CROSS_FERRY Southern Trade Route, Segoltha South Bank
	match F_AT_LETH Southern Trade Route, Outside Leth Deriel
	match F_LETH_DES_WAIT obvious
put look
	match F_QUIT [You're
	matchwait

F_AT_LETH_CARA:
F_AT_LETH:
	echo
	echo F_AT_LETH:
	echo
put tell caravan follow
waitfor you
move go gate
waitfor following you
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
goto F_AT_LETH_F

F_AT_LETH_F_SHIFT:
shift
shift
F_AT_LETH_F:
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move se
waitfor following you
move go shanty
goto F_LETH


F_LETH_GATE:
	echo
	echo F_LETH_GATE:
	echo
move go gate
move se
move se
move se
move se
move se
move se
move se
move se
F_LETH_OUT:
move go shanty
F_LETH_IN:
goto F_LETH

F_LETH_BANK_IN2:
move down
F_LETH_BANK_IN1:
move down
F_LETH_BANK_IN:
move out
F_LETH_BANK_OUT:
move w
move s
move go shanty
goto F_LETH

F_LETH:
	echo
	echo F_LETH:
	echo
F_LETH1:
	match F_LETH_GIVE_CON you get
	match F_OUT_LETH referring
put get my leth contract
	match F_QUIT [You're
	matchwait

F_LETH_GIVE_CON:
	echo
	echo F_LETH_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto F_LETH1



F_OUT_LETH:
	echo
	echo F_OUT_LETH:
	echo
move out
put tell caravan follow
wait
put tell caravan go fast
wait
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move nw
waitfor following you
move go gate
waitfor following you
put tell caravan lead to crossing
waitfor you
put tell caravan go fast
waitfor you
goto F_LETH_HIDE


F_TO_CROSS_FERRY_CARA:
goto F_TO_CROSS_FERRY

F_TO_CROSS_FERRY1_CARA:
goto F_TO_CROSS_FERRY1

F_TO_CROSS_FERRY1_PAUSE:
waitfor following you
F_TO_CROSS_FERRY1:
put tell caravan follow
waitfor you
	match F_QUIT [You're
	match F_TO_CROSS_FERRY1_PAUSE Southern Trade Route, Segoltha Plain
	match F_TO_CROSS_FERRY_PAUSE Southern Trade Route, Segoltha South Bank
	match F_LETH_LOOK You can't go there.
	match F_LETH_LOOK IDLE
put n
	matchwait

F_TO_CROSS_FERRY_PAUSE:
waitfor following you
F_TO_CROSS_FERRY:
put tell caravan follow
waitfor you
	echo
	echo F_TO_CROSS_FERRY:
	echo
	match F_FERRY_TO_CROSS2 and climb aboard.
	match F_HIDE_TO_CROSS You will have to wait
	match F_HIDE_TO_CROSS ferry here to go aboard
	match F_FERRY_MONEY_LETH he says,
	match F_TO_CROSS_FERRY_STAND you must be standing
	match F_LETH_LOOK IDLE
	match F_LETH_LOOK referring
put go ferry
	match F_QUIT [You're
	matchwait

F_TO_CROSS_FERRY_STAND_PAUSE:
pause
F_TO_CROSS_FERRY_STAND:
	match F_TO_CROSS_FERRY_STAND_PAUSE roundtime
	match F_TO_CROSS_FERRY you stand back up
put stand
	matchwait



F_HIDE_TO_CROSS_PAUSE:
pause
F_HIDE_TO_CROSS:
F_HIDE_TO_CROSSCROSS:
	echo
	echo F_HIDE_TO_CROSS:
	echo
	match F_WAIT_CROSS Eh?
	match F_WAIT_CROSS You blend
	match F_WAIT_CROSS You melt into the background
	match F_WAIT_CROSS glance at you as you hide.
	match F_WAIT_CROSS ruining your hiding place!
	match F_HIDE_TO_CROSS_PAUSE roundtime
	match F_HIDE_TO_CROSS_PAUSE ...wait
	match F_HIDE_TO_CROSS_PAUSE type ahead
	match F_TO_CROSS_FERRY pulls into the dock
put hide
	match F_QUIT [You're
	matchwait

F_WAIT_CROSS:
	echo
	echo F_WAIT_CROSS:
	echo
	match F_TO_CROSS_FERRY pulls into the dock
	match F_TO_CROSS_FERRY You hear a bell ring out
	match F_QUIT [You're
	matchwait


F_FERRY_MONEY_LETH:
	echo
	echo F_FERRY_MONEY_LETH:
	echo
move s
move s
move s
move s
move sw
move sw
move sw
move sw
move s
move se
move se
move s
move s
move sw
move sw
move sw
move s
move se
move sw
move s
move sw
move s
move s
move se
move se
move sw
pause 15
move sw
move sw
move sw
move s
move sw
move se
move se
move s
move s
move se
move se
move s
move s
move se
move go gate
move se
move se
move se
move se
move se
move se
move se
move se
move n
move e
put go depo
move up
	match F_FERRY_LETH_MONEY The clerk counts out 1000
	match F_LETH_LESS1 The clerk tells you,
put with 1000 cop kro
	match F_QUIT [You're
	matchwait

F_LETH_LESS1:
	echo
	echo F_LETH_LESS1:
	echo
pause 2
	match F_FERRY_LETH_MONEY The clerk counts out 500
	match F_LETH_LESS2 The clerk tells you,
put with 500 cop kro
	match F_QUIT [You're
	matchwait

F_LETH_LESS2:
	echo
	echo F_LETH_LESS2:
	echo
pause 2
	match F_FERRY_LETH_MONEY The clerk counts out 200
	match F_LETH_LESS3 The clerk tells you,
put with 200 cop kro
	match F_QUIT [You're
	matchwait

F_LETH_LESS3:
	echo
	echo F_LETH_LESS3:
	echo
move down
move out
move w
move s
move nw
move nw
move nw
move nw
move nw
move nw
move nw
move nw
move go gate
move nw
move n
move n
move nw
move nw
move n
move n
move nw
move nw
move ne
move n
move ne
move ne
move ne
move ne
pause 15
move nw
move nw
move n
move n
move ne
move n
move ne
move nw
move n
move ne
move ne
move ne
move n
move n
move nw
move nw
move n
move ne
move ne
move ne
move ne
move n
move n
move n
move n
goto F_OFF_LETH_FERRY11

F_FERRY_LETH_MONEY:
	echo
	echo F_FERRY_LETH_MONEY:
	echo
move down
move out
move w
move s
move nw
move nw
move nw
move nw
move nw
move nw
move nw
move nw
move go gate
move nw
move n
move n
move nw
move nw
move n
move n
move nw
move nw
move ne
move n
move ne
move ne
move ne
move ne
pause 15
move nw
move nw
move n
move n
move ne
move n
move ne
move nw
move n
move ne
move ne
move ne
move n
move n
move nw
move nw
move n
move ne
move ne
move ne
move ne
move n
move n
move n
move n
put tell caravan follow
waitfor you
goto F_TO_CROSS_FERRY


F_FERRY_TO_CROSS2_PAUSE:
pause
F_FERRY_TO_CROSS2:
	echo
	echo F_FERRY_TO_CROSS2:
	echo
waitfor following you
put rem feedbag
wait
put give cara
wait
put wear feedbag
wait
	match F_WAIT_CROSS_FERRY Eh?
	match F_WAIT_CROSS_FERRY You blend
	match F_WAIT_CROSS_FERRY You melt into the background
	match F_WAIT_CROSS_FERRY glance at you as you hide.
	match F_WAIT_CROSS_FERRY ruining your hiding place!
	match F_FERRY_TO_CROSS2_PAUSE roundtime
	match F_FERRY_TO_CROSS2_PAUSE ...wait
	match F_FERRY_TO_CROSS2_PAUSE type ahead
	match F_OFF_CROSS_FERRY its crew ties the ferry off.
put hide
	match F_QUIT [You're
	matchwait

F_WAIT_CROSS_FERRY:
	echo
	echo F_WAIT_CROSS_FERRY:
	echo
	match F_OFF_CROSS_FERRY its crew ties the ferry off.
	match F_QUIT [You're
	matchwait

F_OFF_CROSS_FERRY:
	echo
	echo F_OFF_CROSS_FERRY:
	echo
move go dock
F_OFF_CROSS_FERRY1:
waitfor following you
move go squ
waitfor following you
move ne
waitfor following you
move nw
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move go door
goto F_CROSS


F_NOT_ARTHE1:
put tell caravan lead to arthe dale
wait
goto F_HIDE

F_AT_ARTHE:
	echo
	echo F_AT_ARTHE:
	echo
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
put tell caravan follow
waitfor you
move go gate
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move w
waitfor following you
put knock sign
waitfor you knock
move go door
move go door
goto F_ARTHE


F_ARTHE_GATE:
	echo
	echo F_ARTHE_GATE:
	echo
move go gate
move n
move n
move n
move n
move w
F_ARTHE_OUT:
put knock sign
waitfor you knock
move go door
F_ARTHE_IN2:
move go door
F_ARTHE_IN:
F_ARTHE:
	echo
	echo F_ARTHE:
	echo
F_ARTHE1:
	match F_ARTHE_GIVE_CON you get
	match F_ARTHE_STONE_CHECK referring
put get my arthe contract
	match F_QUIT [You're
	matchwait

F_ARTHE_GIVE_CON:
	echo
	echo F_ARTHE_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto F_ARTHE1

F_ARTHE_STONE_CHECK:
pause
	echo
	echo F_ARTHE_STONE_CHECK:
	echo
	match F_ARTHE_DIRGE_CHECK referring
	match F_ARTHE_TO_STONE The contract is printed
put look my stone contract
	match F_QUIT [You're
	matchwait

F_ARTHE_DIRGE_CHECK:
pause
	echo
	echo F_ARTHE_DIRGE_CHECK:
	echo
	match F_ARTHE_TO_CROSS referring
	match F_ARTHE_TO_DIRGE The contract is printed
put look my dirge contract
	match F_QUIT [You're
	matchwait


F_ARTHE_TO_DIRGE:
pause
	echo
	echo F_ARTHE_TO_DIRGE:
	echo
goto F_ARTHE_TO_DIRGE_OUT
F_ARTHE_TO_DIRGE_OUT_PAUSE:
pause
F_ARTHE_TO_DIRGE_OUT:
	match F_ARTHE_TO_DIRGE_STAND can't do that
	match F_ARTHE_TO_DIRGE_OUT2 obvious
	match F_ARTHE_TO_DIRGE_OUT_PAUSE ...wait
	match F_ARTHE_TO_DIRGE_OUT_PAUSE type ahead
put go door
	match F_QUIT [You're
	matchwait
F_ARTHE_TO_DIRGE_PAUSE:
pause
F_ARTHE_TO_DIRGE_STAND:
	match F_ARTHE_TO_DIRGE_PAUSE roundtime
	match F_ARTHE_TO_DIRGE_OUT You stand back up.
	match F_ARTHE_TO_DIRGE_PAUSE ...wait
	match F_ARTHE_TO_DIRGE_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_ARTHE_TO_DIRGE_OUT2:
move out
put tell caravan lead to dirge
wait
put tell caravan go fast
wait
goto F_HIDE

F_ARTHE_TO_STONE:
	echo
	echo F_ARTHE_TO_STONE:
	echo
goto F_ARTHE_TO_STONE_OUT
F_ARTHE_TO_STONE_OUT_PAUSE:
pause
F_ARTHE_TO_STONE_OUT:
	match F_ARTHE_TO_STONE_STAND can't do that
	match F_ARTHE_TO_STONE_OUT2 obvious
	match F_ARTHE_TO_STONE_OUT_PAUSE ...wait
	match F_ARTHE_TO_STONE_OUT_PAUSE type ahead
put go door
	match F_QUIT [You're
	matchwait
F_ARTHE_TO_STONE_PAUSE:
pause
F_ARTHE_TO_STONE_STAND:
	match F_ARTHE_TO_STONE_PAUSE roundtime
	match F_ARTHE_TO_STONE_OUT You stand back up.
	match F_ARTHE_TO_STONE_PAUSE ...wait
	match F_ARTHE_TO_STONE_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_ARTHE_TO_STONE_OUT2:
move out
put tell caravan lead to stone clan
wait
put tell caravan go fast
wait
goto F_HIDE


F_ARTHE_TO_CROSS:
	echo
	echo F_ARTHE_TO_CROSS:
	echo
goto F_ARTHE_TO_CROSS_OUT
F_ARTHE_TO_CROSS_OUT_PAUSE:
pause
F_ARTHE_TO_CROSS_OUT:
	match F_ARTHE_TO_CROSS_STAND can't do that
	match F_ARTHE_TO_CROSS_OUT2 obvious
	match F_ARTHE_TO_CROSS_OUT_PAUSE ...wait
	match F_ARTHE_TO_CROSS_OUT_PAUSE type ahead
put go door
	match F_QUIT [You're
	matchwait
F_ARTHE_TO_CROSS_PAUSE:
pause
F_ARTHE_TO_CROSS_STAND:
	match F_ARTHE_TO_CROSS_PAUSE roundtime
	match F_ARTHE_TO_CROSS_OUT You stand back up.
	match F_ARTHE_TO_CROSS_PAUSE ...wait
	match F_ARTHE_TO_CROSS_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_ARTHE_TO_CROSS_OUT2:
move out
put tell caravan lead to crossing
wait
put tell caravan go fast
wait
goto F_HIDE


F_AT_STONE_PAUSE:
pause
F_AT_STONE:
	echo
	echo F_AT_STONE:
	echo
	match F_AT_STONE_PAUSE ...wait
	match F_AT_STONE_PAUSE type ahead
	match F_AT_STONE2 You pass on the order
put tell caravan follow
	match F_QUIT [You're
	matchwait

F_AT_STONE2:
	match F_NOT_STONE obvious
	match F_NOT_STONE1 can't go there
	match F_NOT_STONE1 referring
	match F_CLIMB_TRAIL Foothills, Stony Incline
put down
	match F_QUIT [You're
	matchwait

F_NOT_STONE:
waitfor following you
put up
waitfor following you
F_NOT_STONE1:
put tell caravan lead to stone clan
wait
goto F_HIDE


F_TRAIL_STOW:
put stow left
wait
put stow right
wait
goto F_CLIMB_TRAIL_PAUSE
F_CLIMB_TRAIL:
	echo
	echo F_CLIMB_TRAIL:
	echo
waitfor following you
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
goto F_CLIMB_TRAIL_PAUSE

F_CLIMB_TRAIL_RETREAT1_PAUSE:
pause
F_CLIMB_TRAIL_RETREAT1:
	match F_CLIMB_TRAIL_PAUSE You retreat from combat.
	match F_CLIMB_TRAIL_PAUSE already as far
	match F_CLIMB_TRAIL_RETREAT2_PAUSE roundtime
	match F_CLIMB_TRAIL_RETREAT1_PAUSE ...wait
	match F_CLIMB_TRAIL_RETREAT1_PAUSE type ahead
	match F_CLIMB_TRAIL_RETREAT1_PAUSE You stop advancing
	match F_QUIT You are still stunned
put retreat
put reateat
	matchwait

F_CLIMB_TRAIL_RETREAT2_PAUSE:
pause
F_CLIMB_TRAIL_RETREAT2:
	match F_CLIMB_TRAIL_PAUSE You retreat from combat.
	match F_CLIMB_TRAIL_PAUSE already as far
	match F_CLIMB_TRAIL_RETREAT3_PAUSE roundtime
	match F_CLIMB_TRAIL_RETREAT2_PAUSE ...wait
	match F_CLIMB_TRAIL_RETREAT2_PAUSE type ahead
	match F_CLIMB_TRAIL_RETREAT2_PAUSE You stop advancing
	match F_QUIT You are still stunned
put retreat
put reateat
	matchwait

F_CLIMB_TRAIL_RETREAT3_PAUSE:
pause
F_CLIMB_TRAIL_RETREAT3:
	match F_CLIMB_TRAIL_PAUSE You retreat from combat.
	match F_CLIMB_TRAIL_PAUSE already as far
	match F_QUIT roundtime
	match F_CLIMB_TRAIL_RETREAT3_PAUSE ...wait
	match F_CLIMB_TRAIL_RETREAT3_PAUSE type ahead
	match F_CLIMB_TRAIL_RETREAT3_PAUSE You stop advancing
	match F_QUIT You are still stunned
put retreat
put reateat
	matchwait

F_CLIMB_TRAIL_PAUSE_SHIFT:
shift
shift
F_CLIMB_TRAIL_PAUSE:
	match F_TRAIL_STAND stand
	match F_AT_STONE21 Northern Trade Road, Foothills
	match F_TRAIL_STOW free
	match F_CLIMB_TRAIL_CHECK .
put climb trail
	match F_CLIMB_TRAIL_RETREAT1 [You're
	matchwait
F_TRAIL_STAND_PAUSE:
pause
F_TRAIL_STAND:
	match F_TRAIL_STAND_PAUSE ...wait
	match F_TRAIL_STAND_PAUSE type ahead
	match F_TRAIL_STAND_PAUSE roundtime
	match F_CLIMB_TRAIL_PAUSE you stand
put stand
	match F_QUIT [You're
	matchwait

F_CLIMB_TRAIL_CHECK:
	match F_AT_STONE21 Northern Trade Road, Foothills
	match F_CLIMB_TRAIL_PAUSE Foothills, Stony Incline
	match F_AT_STONE22 following you
put look
	match F_QUIT [You're
	matchwait

F_AT_STONE21:
waitfor following you
F_AT_STONE22:
move go outpost
goto F_STONE

F_STONE_TRAIL:
move down
move climb trail
F_STONE_OUT:
move go outpost
F_STONE_IN:
F_STONE:
	echo
	echo F_STONE:
	echo
F_STONE1:
	match F_STONE_GIVE_CON you get
	match F_STONE_DIRGE_CHECK referring
put get my stone contract
	match F_QUIT [You're
	matchwait

F_STONE_GIVE_CON:
	echo
	echo F_STONE_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto F_STONE1

F_STONE_DIRGE_CHECK:
pause
	echo
	echo F_STONE_DIRGE_CHECK:
	echo
	match F_STONE_ARTHE_CHECK referring
	match F_STONE_TO_DIRGE The contract is printed
put look my dirge contract
	match F_QUIT [You're
	matchwait

F_STONE_ARTHE_CHECK:
pause
	echo
	echo F_STONE_ARTHE_CHECK:
	echo
	match F_STONE_TO_CROSS referring
	match F_STONE_TO_ARTHE The contract is printed
put look my arthe contract
	match F_QUIT [You're
	matchwait


F_STONE_TO_DIRGE:
	echo
	echo F_STONE_TO_DIRGE:
	echo
goto F_STONE_TO_DIRGE_OUT

F_STONE_TO_DIRGE_OUT_PAUSE:
pause
F_STONE_TO_DIRGE_OUT:
	match F_STONE_TO_DIRGE_STAND can't do that
	match F_STONE_TO_DIRGE_OUT2 obvious
	match F_STONE_TO_DIRGE_OUT_PAUSE ...wait
	match F_STONE_TO_DIRGE_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_STONE_TO_DIRGE_PAUSE:
pause
F_STONE_TO_DIRGE_STAND:
	match F_STONE_TO_DIRGE_PAUSE roundtime
	match F_STONE_TO_DIRGE_OUT You stand back up.
	match F_STONE_TO_DIRGE_PAUSE ...wait
	match F_STONE_TO_DIRGE_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_STONE_TO_DIRGE_OUT2:
put tell caravan lead to dirge
wait
put tell caravan go fast
wait
goto F_HIDE

F_STONE_TO_CROSS:
	echo
	echo F_STONE_TO_CROSS:
	echo
goto F_STONE_TO_CROSS_OUT
F_STONE_TO_CROSS_OUT_PAUSE:
pause
F_STONE_TO_CROSS_OUT:
	match F_STONE_TO_CROSS_STAND can't do that
	match F_STONE_TO_CROSS_OUT2 obvious
	match F_STONE_TO_CROSS_OUT_PAUSE ...wait
	match F_STONE_TO_CROSS_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_STONE_TO_CROSS_PAUSE:
pause
F_STONE_TO_CROSS_STAND:
	match F_STONE_TO_CROSS_PAUSE roundtime
	match F_STONE_TO_CROSS_OUT You stand back up.
	match F_STONE_TO_CROSS_PAUSE ...wait
	match F_STONE_TO_CROSS_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_STONE_TO_CROSS_OUT2:
put tell caravan lead to crossing
wait
put tell caravan go fast
wait
goto F_HIDE



F_STONE_TO_ARTHE:
	echo
	echo F_STONE_TO_ARTHE:
	echo
goto F_STONE_TO_ARTHE_OUT
F_STONE_TO_ARTHE_OUT_PAUSE:
pause
F_STONE_TO_ARTHE_OUT:
	match F_STONE_TO_ARTHE_STAND can't do that
	match F_STONE_TO_ARTHE_OUT2 obvious
	match F_STONE_TO_ARTHE_OUT_PAUSE ...wait
	match F_STONE_TO_ARTHE_OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_STONE_TO_ARTHE_PAUSE:
pause
F_STONE_TO_ARTHE_STAND:
	match F_STONE_TO_ARTHE_PAUSE roundtime
	match F_STONE_TO_ARTHE_OUT You stand back up.
	match F_STONE_TO_ARTHE_PAUSE ...wait
	match F_STONE_TO_ARTHE_PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_STONE_TO_ARTHE_OUT2:
put tell caravan lead to arthe dale
wait
put tell caravan go fast
wait
goto F_HIDE

F_AT_DIRGE:
	echo
	echo F_AT_DIRGE:
	echo
put tell caravan follow
waitfor you
put rem my feedbag
wait
put give cara
wait
put wear my feedbag
wait
goto F_AT_DIRGE2B

F_AT_DIRGE2B_SHIFT:
shift
shift
F_AT_DIRGE2B:
	match F_NOT_DIRGE obvious
	match F_NOT_DIRGE1 can't
	match F_NOT_DIRGE1 referring
	match F_AT_DIRGE2 Lava Fields, Narrow Trace
put go path
	match F_QUIT [You're
	matchwait

F_NOT_DIRGE:
waitfor following you
put go path
waitfor following you
F_NOT_DIRGE1:
put tell caravan lead to dirge
wait
goto F_HIDE


F_AT_DIRGE2:
waitfor following you
move e
waitfor following you
move ne
waitfor following you
move e
waitfor following you
move ne
waitfor following you
move w
waitfor following you
move nw
waitfor following you
move sw
waitfor following you
move w
waitfor following you
move n
waitfor following you
move n
waitfor following you
move n
waitfor following you
move go gate
waitfor following you
move go stable
goto F_DIRGE

F_DIRGE_BANK_IN:
move out
F_DIRGE_BANK_OUT:
move s
goto F_DIRGE_OUT

F_DIRGE_BANK_OUT_CARA:
move s
waitfor following you
goto F_DIRGE_OUT

F_DIRGE_ROAD:
	echo
	echo F_DIRGE_ROAD:
	echo
move go path
move e
move ne
move e
move ne
move w
move nw
move sw
move w
move n
move n
move n
F_DIRGE_OUT:
move go stable
F_DIRGE_IN:

F_DIRGE:
	echo
	echo F_DIRGE:
	echo
F_DIRGE1:
	match F_DIRGE_GIVE_CON you get
	match F_DIRGE_STONE_CHECK referring
put get my dirge contract
	match F_QUIT [You're
	matchwait

F_DIRGE_GIVE_CON:
	echo
	echo F_DIRGE_GIVE_CON:
	echo
put give contract to clerk
waitfor you
put pay clerk gold
waitfor you
goto F_DIRGE1

F_DIRGE_STONE_CHECK:
pause
	echo
	echo F_DIRGE_STONE_CHECK:
	echo
	match F_DIRGE_ARTHE_CHECK referring
	match F_DIRGE_TO_STONE1 The contract is printed
put look my stone contract
	match F_QUIT [You're
	matchwait

F_DIRGE_ARTHE_CHECK:
pause
	echo
	echo F_DIRGE_ARTHE_CHECK:
	echo
	match F_DIRGE_TO_CROSS1 referring
	match F_DIRGE_TO_ARTHE1 The contract is printed
put look my arthe contract
	match F_QUIT [You're
	matchwait

F_DIRGE_TO_STONE1:
save F_DIRGE_TO_STONE
goto F_DIRGE_DONE

F_DIRGE_TO_ARTHE1:
save F_DIRGE_TO_ARTHE
goto F_DIRGE_DONE

F_DIRGE_TO_CROSS1:
save F_DIRGE_TO_CROSS
goto F_DIRGE_DONE


F_DIRGE_DONE:
	echo
	echo F_DIRGE_DONE:
	echo
goto F_DIRGE_TO__OUT
F_DIRGE_TO__OUT_PAUSE:
pause
F_DIRGE_TO__OUT:
	match F_DIRGE_TO__STAND can't do that
	match F_DIRGE_TO__OUT2 obvious
	match F_DIRGE_TO__OUT_PAUSE ...wait
	match F_DIRGE_TO__OUT_PAUSE type ahead
put out
	match F_QUIT [You're
	matchwait
F_DIRGE_TO__PAUSE:
pause
F_DIRGE_TO__STAND:
	match F_DIRGE_TO__PAUSE roundtime
	match F_DIRGE_TO__OUT You stand back up.
	match F_DIRGE_TO__PAUSE ...wait
	match F_DIRGE_TO__PAUSE type ahead
put stand
	match F_QUIT [You're
	matchwait

F_DIRGE_TO__OUT2:
put tell caravan follow
waitfor you
put tell caravan go fast
waitfor you
move go gate
waitfor following you
move s
waitfor following you
move s
waitfor following you
move s
waitfor following you
move e
waitfor following you
move ne
waitfor following you
move se
waitfor following you
move e
waitfor following you
move sw
waitfor following you
move w
waitfor following you
move sw
waitfor following you
move w
waitfor following you
move go road
waitfor following you
goto %s


F_DIRGE_TO_ARTHE:
put tell caravan lead to arthe dale
waitfor you
put tell caravan go fast
waitfor you
goto F_HIDE

F_DIRGE_TO_STONE:
put tell caravan lead to stone clan
waitfor you
put tell caravan go fast
waitfor you
goto F_HIDE


F_DIRGE_TO_CROSS:
put tell caravan lead to crossing
waitfor you
put tell caravan go fast
waitfor you
goto F_HIDE


F_HIDE_PAUSE:
pause
F_HIDE:
F_HIDEHIDE:
	echo
	echo F_HIDE:
	echo
	match F_DES_WAIT Eh?
	match F_DES_WAIT You blend
	match F_DES_WAIT You melt into the background
	match F_DES_WAIT glance at you as you hide.
	match F_DES_WAIT ruining your hiding place!
	match F_HIDE_PAUSE You look around, but can't see any place to hide yourself.
	match F_HIDE_PAUSE roundtime
	match F_HIDE_PAUSE ...wait
	match F_HIDE_PAUSE type ahead
	match F_DES_CHECK having arrived at its destination.
put hide
	match F_QUIT [You're
	matchwait

F_DES_CHECK:
	match F_AT_DIRGE North Roads Caravansary
	match F_AT_STONE Lairocott Brach, Entrance
	match F_AT_LETH Alder Bower Gate
	match F_AT_ARTHE Valley, Village Gate
	match F_AT_CROSS Northeast Wilds, Outside Northeast Gate
	match F_TO_CROSS_FERRY1_CARA Sparse grass, weeds and a few hardy shrubs
	match F_TO_CROSS_FERRY_CARA Southern Trade Route, Segoltha South Bank
	match F_DES_WAIT obvious
put look
	match F_QUIT [You're
	matchwait

F_DES_WAIT:
	echo
	echo F_DES_WAIT:
	echo
	match F_DES_STAND You lose your footing
	match F_DES_STAND coughing spasm wracks your body
	match F_DES_STAND P>
	match F_DES_STAND PH>
	match F_BEGIN YOU HAVE BEEN IDLE
	match F_DES_CHECK having arrived at its destination.
	match F_QUIT [You're
	matchwait


F_DES_STAND_PAUSE:
pause
F_DES_STAND:
	match F_DES_STAND_PAUSE roundtime
	match F_HIDE You stand back up.
	match F_DES_STAND_PAUSE ...wait
	match F_DES_STAND_PAUSE type ahead
put stand
	match QUIT [You're
	matchwait

F_NO_GO:
	echo
	echo *******************************
	echo ** Don't know where you are! **
	echo *******************************
	echo
exit
F_NEED_MONEY:
	echo
	echo ************************
	echo ** NOT ENOUGH CASH!!! **
	echo ************************
	echo
exit

F_QUIT:
put quit
exit


LABELERROR:
	echo
	echo LABELERROR:
	echo
	echo
	echo DEBUG_MODE:
	echo
	echo ** Copy/Paste DEBUG_MODE and the game window from the last oupost you left.
	echo ***********************************************************
	echo ** SFtrader: Last tweak 11/16/2010 12:26AM
	echo ** Variables:
	echo **        1 = %1
IF_2	echo **        2 = %2
IF_3	echo **        3 = %3
IF_4	echo **        4 = %4
IF_5	echo **        5 = %5
IF_6	echo **        6 = %6
IF_7	echo **        7 = %7
IF_8	echo **        8 = %8
IF_9	echo **        9 = %9
	echo **        0 = %0
	echo **     Save = %s
	echo **  Counter = %c
	echo ** Jugglies = %zTjugglies
	echo **   App #1 = %zTapp1
	echo **   App #2 = %zTapp2
	echo **  Origami = %zTorigami
	echo **   Coin # = %zTcoin
	echo **     Type = %zTcurrency
	echo **    Music = %zTplay
	echo ** Teaching = %zTteach
	echo **
	echo ** Don't forget you needed to run SFtrader SET first!
	echo **
	echo ** Copy/Paste DEBUG_MODE and teh game window from the last oupost you left.
	echo ** to DrockMali@hotmail.com for troubleshooting.
	echo ** SITE:  http://www.malific.com/ or http://www.geocities.com/malificdr/
	echo ** AIM:   Malific Drockmur
	echo ***********************************************************
	echo
	echo ********************************
	echo **       Ending Script.       **
	echo ********************************
	echo
exit
MASTER%zTSET:
PARTNER%zTSET:
TEACHER%zTSET:
%zTSET:
setvariable zTjugglies %EZjugglies
setvariable zTapp1 %EZapp1
setvariable zTapp2 %EZapp2
setvariable zTorigami %EZorigami
setvariable zTcoin %EZcoin
setvariable zTcurrency %EZcurrency
setvariable zTplay %EZplay
setvariable zTsong %EZsong
setvariable zTmood %EZmood
setvariable zTweapteach %EZweapteach
setvariable zTteach %EZteach
setvariable zTSET 1
deletevariable EZjugglies
deletevariable EZapp1
deletevariable EZapp2
deletevariable EZorigami
deletevariable EZcoin
deletevariable EZcurrency
deletevariable EZplay
deletevariable EZsong
deletevariable EZmood
deletevariable EZweapteach
deletevariable EZteach
goto 1%1