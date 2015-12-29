debug 10
#MasterCraft - by the player of Jaervin Ividen
# A crafting script suite...
#v 0.1.6
#
# Script Usage: .mastercraft								--to only do one work order
#				.mastercraft <no. of orders>				--to perform more than one
#				.mastercraft <no. of orders> <difficulty>	--to ask for a different difficulty than you have set in your character profile.
#
#   Mastercraft takes the tedium out of workorders, and works in practically every society for practically every craft. It will get and
#	turn in orders, buy extra parts, repair tools, manage materials, check item quality, and will even reduce your order difficulty if
#	you fail the item too often.
#
#	There are a few things to note in using this script, however:
#	1. You must supply your own crafting materials. Keep them deeded or undeeded in your crafting bag, material will be pulled from there alone.
#	   Remnant material will be placed in a second container to be recollected afterwards. (recollection not added yet).
#	2. You must have all required tools and books in your crafting bag for the craft you choose (repairing also requires oil and brush to be
#	   available).
#	3. Workorders can only be automated within societies. Individual scripts can be run elsewhere if you desire, but part purchasing and order
#	   turn-in will not be automatic.
#	4. Make sure your stock materials (specifically ingots) are managed in sizes your character can lift. If he can't pick up an ingot, I don't
#      know how you'll be able to cut it down to a more manageable size.
#	5. If you have less than 50 Forging skill, your analyzes may not pick up item quality or ingot size. To do orders with low forging skill,
#	   be sure to have at least one large deeded ingot in your bag in excess of the ingot you will be working with. Your character will
#	   otherwise not be able to tell if he has enough material to actually complete the order.
#	5. Last but not least, don't change the scriptfile names (ie mastercraft.cmd to mc.cmd) unless you want to parse through them yourself and edit
#	   the script calls. Each subscript is called by name here and runs as a **second, separate script.** This allows for each subscript to be
#	   used standalone. Also, some subscripts (pound, carve, knit, sew, etc.) check to see if Mastercraft.cmd is running before continuing certain
#	   tasks. Be careful when renaming scriptfiles.
# 	
#	Be sure to setup your character's crafting profile in **MC INCLUDE.CMD BEFORE USING THESE SCRIPTS.** There are some things scripting
#	cannot do for you, such as make personal decisions.
#
#	Included in this suite:
#		mastercraft.cmd
#		mc_include.cmd
#		pound.cmd
#		sew.cmd
#		knit.cmd
#		carve.cmd
#		smelt.cmd
#		grind.cmd
#		weave.cmd
#		spin.cmd
#	
#	Each script can be run completely standalone from Mastercraft if you want to create multiple items or just individual orders. Using them
#	as such will require you to be responsible for your own material management and quality control. Be sure to read the beginning section for
#	each script if you intend to use it standalone.
#
# Happy Crafting!

#debug 10

include mc_include.cmd


#TO-DO LIST
#Consider checking associated workrooms for people in forges like Haven's
#Write up leaving for repairs around Line 920
#Write up stone material management. Sift through deeds to find appropriate size and workability.
#Look at way to change thread in sew based on thickness
#Bulk Smelting/Spinning script.
#Tempering, balancing, honing, sealing, reinforcing scripts.


#Carving
#-stone (needs material/deed management, currently not supported)

#Bug Fixes v 0.1.6
#Added bone armor to carving.
#Removed oil purchasing from grind.cmd, is now handled in mastercraft.cmd.
#Smoothed out some responses in carve.cmd, including some analyzes.
#Polish ordering now gets your item back from the correct bag, and should work fine for workorders.
#Will now check your bag for oil, pins, or polish, depending on society/craft before starting.
#Smoothed out pins/thread ordering in sew.cmd.
#Added support for untieing expired items from a logbook.
#Added support for adjustable and wearable tongs in pound.cmd (to come later to smelt.cmd)
#Fixed error in pound.cmd that wouldn't always leave product in hand when finished.
#Also fixed a bellows call after analyzing in pound.cmd.




	
####################################################################################################
#### Various variables and actions needed for script functionality. Most are just initializing for later manipulation.
####################################################################################################
	
var repeat 0
if_1 var repeat %1
if_2 var work.difficulty %2
put #var MC.order.noun
put #var MC.order.quality
var full.order.noun
var coin.intake 0
var orders.completed 0
var tool.gone 0
var oil.gone 0
var brush.gone 0
var fail2 0
var tool.repair 0
var order.type 0
var diff.change 0
var ordinal zeroth|first|second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth|eleventh|twelfth|thirteenth|fourteenth|fifteenth|sixteenth|seventeenth
	 
if "%discipline" = "weapon" || "%discipline" = "blacksmith" then var work.tools hammer|tongs|shovel|bellows
if "%discipline" = "armor" then var work.tools hammer|tongs|shovel|pliers|bellows
if "%discipline" = "tailor" then
{
	if "%order.pref" = "cloth" then var work.tools needles|scissors|slickstone
	if "%order.pref" = "leather" then var work.tools needles|slickstone|awl|slickstone
	if "%order.pref" = "knitted" then var work.tools knitting needles
}
if "%discipline" = "carving" then
{
	if "%order.pref" = "stone" then var work.tools chisel|riffler|rasp
	if "%order.pref" = "bone" then var work.tools saw|riffler|rasp
}

send close my %remnant.storage
action instant var order.quantity $1 when You must bundle and deliver (\d+) more within
action instant var order.quantity $1;put #var MC.order.quality $2 when I need (\d+) (finely-crafted|of superior quality|of exceptional quality),
action instant var (analyze) item.quality $2 when (is|are|have|has) (riddled with mistakes and practically|of dismal quality|very poorly-crafted|of below-average quality|of mediocre quality|of average quality|of above-average quality|well-crafted|finely-crafted|of superior quality|of exceptional quality|of outstanding quality|masterfully-crafted)
action instant var coin.temp $1 when You can purchase.*for (\d+) (Lirums|Kronars|Dokoras)\.
action instant math coin.intake add $1 when You hand .* your logbook and bundled items, and are given (\d+)
action instant math coin.intake subtract $1 when pay the sales clerk (\d+)
action instant math coin.intake subtract %coin.temp when takes some coins from you and hands you.*\.$
action instant var tool.repair $2 when This appears to be a crafting tool and .* (is|are|have|has) (.*)\.
action instant var tool.gone 1; var oil.gone 1 when The oil is all used up, so you toss
action instant var tool.gone 1; var brush.gone 1 when The brush is all used up, so you toss
action instant var grind 1 when TURN the GRINDSTONE several times
action goto lack.coin when ^LACK COIN
action (analyze) off

#### Finding Ordering Numbers
action (order) var handle.order $1 when (\d+)\)\.\s+a leather shield handle.*(Lirums|Kronars|Dokoras)
action (order) var l.cord.order $1 when (\d+)\)\.\s+a long leather cord.*(Lirums|Kronars|Dokoras)
action (order) var l.padding.order $1 when (\d+)\)\..*some large cloth padding.*(Lirums|Kronars|Dokoras)
action (order) var s.padding.order $1 when (\d+)\)\..*some.*small.*padding.*(Lirums|Kronars|Dokoras)
action (order) var pins.order $1 when (\d+)\)\..*some straight iron pins.*(Lirums|Kronars|Dokoras)
action (order) var polish.order $1 when (\d+)\)\..*jar of surface polish.*(Lirums|Kronars|Dokoras)
action (order) var oil.order $1 when (\d+)\)\.\s+a flask of oil.*(Lirums|Kronars|Dokoras)
action (order) var brush.order $1 when (\d+)\)\.\s+an iron wire brush.*(Lirums|Kronars|Dokoras)
action (order) var burlap.order $1 when (\d+)\)\..*yards of burlap cloth.*(Lirums|Kronars|Dokoras)
action (order) var wool.order $1 when (\d+)\)\..*yards of wool cloth.*(Lirums|Kronars|Dokoras)
action (order) var silk.order $1 when (\d+)\)\..*yards of silk cloth.*(Lirums|Kronars|Dokoras)
action (order) var linen.order $1 when (\d+)\)\..*yards of linen cloth.*(Lirums|Kronars|Dokoras)
action (order) var rat-pelt.order $1 when (\d+)\)\..*yards of rat-pelt leather.*(Lirums|Kronars|Dokoras)
action (order) var cougar-pelt.order $1 when (\d+)\)\..*yards of cougar-pelt leather.*(Lirums|Kronars|Dokoras)

 
#### Identifying extra pieces from the instruction book
action (book) var assemble $2 $3; var asmCount1 $1 when .*(\d).* (long|short) wooden (pole)$
action (book) var assemble $2; var asmCount1 $1 when .*(\d).* metal shield (handle)$
action (book) var assemble $2; var asmCount1 $1 when .*(\d).* wooden (hilt|haft)$
action (book) var assemble $2 $3; var asmCount1 $1 when .*(\d).* (large) cloth (padding)$
action (book) var assemble $2 $3; var asmCount1 $1 when .*(\d).* (large) leather (backing)$
action (book) var assemble2 $2 $3; var asmCount2 $1 when .*(\d).* (small) cloth (padding)$
action (book) var assemble2 $2 $3; var asmCount2 $1 when .*(\d).* (small) leather (backing)$
action (book) var assemble2 $2 $3; var asmCount2 $1 when .*(\d).* (long|short) leather (cord)$


##############################
#
#  Obtaining an order
#
##############################

check.for.order:
	if "$righthandnoun" != "logbook" && "$lefthandnoun" != "logbook" then
	{
		if "$lefthand" != "Empty" then gosub verb put my $lefthandnoun in my %main.storage
		if "$righthand" != "Empty" then gosub verb put my $righthandnoun in my %main.storage
		pause .5
		gosub verb get my %society.type logbook from my %main.storage
	}
	pause 1
	matchre new.order is not currently tracking|has expired
	matchre turn.in This work order appears to be complete
	matchre time.order You must bundle and deliver (\d+) more within the next (\d+)
	put read my %society.type logbook
	matchwait

untie.order:
	pause 1
	send open my %remnant.storage
	wait
	send untie my %society.type logbook
	waitforre ^You untie the (\w+) from the logbook
	send put my $1 in my %remnant.storage
	wait
	send close my %remnant.storage
	wait
	goto new.order

time.order:
	evalmath avg.time floor($2/$1)
	if %avg.time < 12 then goto new.order
	goto identify.order

new.order:
	var fail 0
	var diff.change 0
	gosub find.master
	if "$righthandnoun" != "logbook" && "$lefthandnoun" != "logbook" then
	{
		gosub verb put my $righthandnoun in my %main.storage
		gosub verb put my $lefthandnoun in my %main.storage
		pause .5
		gosub verb get my %society.type logbook
	}
	matchre untie.order ^You realize you have items
	matchre new.order ^To whom are you|need to be holding a \S+ work order logbook
	matchre new.order.wait but you just received a work order
	matchre identify.order this is an order for
	send ask %master for %work.difficulty %discipline work
	matchwait

new.order.wait:
	echo Pausing 10 seconds to get another order.
	pause 11
	goto new.order
	
##############################
#
#  Setting the Crafting Item
#
##############################

identify.order:
	if %order.quantity > $MC_MAX.ORDER then goto new.order
	if "%discipline" = "weapon" then
	{	
		matchre chapter.1 This logbook is tracking a work order requiring you to craft (a metal dagger|a metal kythe|a metal carving knife|a metal oben|a metal briquet|a metal koummya|a metal stiletto|a metal rapier|a metal poignard|a metal pasabas|a metal pugio|a metal thrusting blade|a metal short sword|a metal scimitar|a metal katar|a metal sabre|a metal misericorde|a metal hanger|a metal kris|a metal parang|a metal takouba|a metal curlade|a metal jambiya|a metal adze|a metal leaf blade sword|a metal sashqa|a metal telek|a metal mambeli|a metal nehlata|a metal gladius|a metal falcata|a metal baselard|a metal throwing dagger|a light throwing axe|a metal dart|a metal hand axe|a metal foil|a metal hatchet|a metal sunblade|a metal cutlass|a metal kasai|a metal shotel|a metal dao) from any material\.
		matchre chapter.2 This logbook is tracking a work order requiring you to craft (a metal broadsword|a metal namkomba|a metal arzfilt|a metal hunting sword|a metal kudalata|a metal nimsha|a metal spatha|a metal back-sword|a metal longsword|a metal recade|a metal round axe|a metal battle axe|a metal nehdalata|a metal robe sword|a metal condottiere|a metal falchion|a metal cinquedea|a metal schiavona|a metal abassi|a metal hurling axe|a metal dagasse) from any material\.
		matchre chapter.3 This logbook is tracking a work order requiring you to craft (a metal two-handed sword|a metal kaskara|a metal warring axe|a metal shh'oi'ata|a metal marauder blade|a metal greatsword|a metal greataxe|a metal flamberge|a metal claymore|a metal periperiu sword|a metal karambit|a metal double axe|a metal twin-point axe|a metal igorat axe) from any material\.
		matchre chapter.4 This logbook is tracking a work order requiring you to craft (a metal cudgel|a metal bola|a metal prod|a metal cuska|a metal cosh|a metal bulhawf|a metal gavel|a metal komno|a metal bludgeon|a metal hhr'tami|a metal hand mallet|a spiked metal club|a metal scepter|a spiked metal hammer|a metal zubke|a spiked metal mace|a spiked metal gauntlet|a metal marlingspike|a short metal hammer|a metal mace|a metal club|a metal belaying pin|a metal hand mace|a metal war hammer|a ridged metal gauntlet|a metal boomerang|a metal garz|a metal boko|a metal war club|a flanged metal mace|a metal mallet|a metal k'trinni sha-tai|a metal throwing club) from any material\.
		matchre chapter.5 This logbook is tracking a work order requiring you to craft (a metal horseman's flail|a metal morning star|a heavy metal chain|a spiked metal hara|a metal ball and chain|a spiked ball and chain|a metal greathammer|a metal ukabi|a heavy metal mace|a metal throwing hammer|a metal imperial war hammer|a metal throwing mallet|a double-headed hammer|a hurlable war hammer|a metal hara|a metal hhr'ata|a heavy metal mallet|a metal sledgehammer) from any material\.
		matchre chapter.6 This logbook is tracking a work order requiring you to craft (a metal footman's flail|a metal two-headed hammer|a metal akabo|a metal maul|a double-sided ball and chain|a heavy sledgehammer|a metal war mattock|a metal dire mace|a metal vilks kodur|a giant metal mallet) from any material\.
		matchre chapter.7 This logbook is tracking a work order requiring you to craft (a metal javelin|a two-pronged halberd|a light metal spear|a metal khuj|a metal scythe|a metal partisan|a metal bardiche|a metal military fork|a metal lochaber axe|a metal duraka skefne|a metal guisarme|a metal pole axe|a metal halberd|a metal fauchard|a metal tzece|a metal ngalio|a metal coresca|a metal pike|a metal awgravet ava|a metal lance|a metal hunthsleg|a metal spetum|a metal allarh|a metal ranseur|a metal spear|a metal ilglaiks skefne|a metal glaive) from any material\.
		matchre chapter.8 This logbook is tracking a work order requiring you to craft (a metal cane|some metal elbow spikes|a metal nightstick|some metal knee spikes|a metal quarterstaff|some spiked metal knuckles|some metal knuckles|some metal hand claws|a metal pike staff) from any material\.
		matchre chapter.9 This logbook is tracking a work order requiring you to craft (a metal throwing spike|a metal boarding axe|a metal bastard sword|a metal half-handled riste|a metal war sword|a thin-bladed metal fan|a metal broadaxe|a metal riste|a metal bar mace|a thick-bladed metal fan|a metal splitting maul) from any material\.
		matchre new.order.wait ^This logbook has been used to complete
		put read my %society.type logbook
		matchwait
	}
	if "%discipline" = "armor" then
	{
		matchre chapter.1 This logbook is tracking a work order requiring you to craft (a metal ring mask|a metal ring vest|a metal ring aventail|a metal ring mantle|some metal ring gloves|a metal ring lorica|a metal chain mask|some metal mail vambraces|a metal ring cap|some metal chain sleeves|a metal chain aventail|a metal mail tasset|some metal chain gloves|a metal chain vest|a metal mail mask|a metal chain mantle|a metal chain cap|a metal chain lorica|a metal mail aventail|a metal ring robe|a metal ring helm|a metal ring shirt|some metal ring greaves|a mail balaclava|a metal mail cap|some metal mail sleeves|a metal chain helm|a metal mail vest|a metal ring balaclava|a metal mail mantle|some metal chain greaves|a metal mail lorica|some metal ring vambraces|a metal chain robe|a metal ring tasset|a metal chain shirt|some metal mail gloves|a metal ring hauberk|a metal mail helm|a metal mail robe|a metal chain balaclava|a metal mail shirt|some metal mail greaves|a metal chain hauberk|some metal chain vambraces|a metal mail hauberk|some metal ring sleeves|a metal chain tasset) from any material\.
		matchre chapter.2 This logbook is tracking a work order requiring you to craft (a metal scale mask|some brigandine sleeves|a metal scale aventail|a metal lamellar balaclava|some metal scale gloves|some lamellar vambraces|a metal brigandine mask|a metal lamellar tasset|a metal brigandine aventail|a metal scale vest|a metal scale cap|a metal scale lorica|some metal scale greaves|a brigandine shirt|a metal lamellar aventail|some lamellar sleeves|a metal brigandine cap|a metal brigandine vest|a metal scale helm|a metal brigandine mantle|some metal lamellar gloves|a metal brigandine lorica|some brigandine greaves|a metal scale robe|a metal lamellar cap|a metal scale shirt|a metal brigandine helm|a metal lamellar shirt|a metal scale balaclava|a brigandine hauberk|some metal scale vambraces|a metal lamellar robe|a metal scale tasset|a metal lamellar vest|some metal scale sleeves|a metal lamellar mantle|some lamellar greaves|a metal lamellar lorica|a metal lamellar helm|a metal scale hauberk|a brigandine balaclava|a lamellar hauberk|some brigandine vambraces|a metal brigandine tasset) from any material\.
		matchre chapter.3 This logbook is tracking a work order requiring you to craft (a light plate mask|a metal sallet|a light plate aventail|some light plate greaves|a plate mask|a metal great helm|a metal dome helm|some heavy plate greaves|a plate aventail|some heavy plate vambraces|some light plate gauntlets|some plate sleeves|a heavy plate mask|a metal heavy backplate|a metal morion|a heavy plate fauld|a heavy plate aventail|a metal breastplate|some plate gauntlets|a light plate cuirass|a metal bascinet|some heavy plate sleeves|a metal barbute|a heavy breastplate|heavy plate gauntlets|a plate cuirass|a metal visored helm|some light field plate|some light plate vambraces|some light half plate|a light backplate|a heavy plate cuirass|a light plate fauld|some field plate|a metal closed helm|some half plate|a metal armet|some light full plate|some plate greaves|some heavy field plate|some plate vambraces|some full plate|some light plate sleeves|ome heavy half plate|a metal backplate|some heavy full plate|a plate fauld|a light breastplate) from any material\.
		matchre chapter.4 This logbook is tracking a work order requiring you to craft (a metal shield handle|a metal ceremonial shield|a metal shield boss|a metal kite shield|a metal target shield|a metal skirmisher's shield|a metal ordinary shield|a metal jousting shield|a metal round sipar|a metal tower shield|a metal medium shield|a metal warrior's shield|a metal triangular sipar|a metal aegis|a metal targe|a metal heater shield|a metal oval shield|a metal battle shield|a metal medium buckler|a metal war shield|a metal circular buckler|a metal curved shield) from any material\.
		matchre new.order.wait ^This logbook has been used to complete
		put read my %society.type logbook
		matchwait
	}
	if "%discipline" = "blacksmith" then
	{
		matchre chapter.2 This logbook is tracking a work order requiring you to craft (a diagonal-peen hammer|some metal bolt tongs|a curved metal shovel|a slender metal pickaxe|a metal cross-peen hammer|a ball-peen hammer|some straight metal tongs|a sturdy metal shovel|a stout metal pickaxe|a flat-headed metal pickaxe|some flat-bladed tongs|some segmented tongs|some curved metal tongs|a wide metal shovel|a square metal shovel|some box-jaw tongs|a narrow metal pickaxe|a weighted metal pickaxe|a straight-peen hammer|some articulated tongs|some angular metal tongs|a tapered metal shovel) from any material\.
		matchre chapter.3 This logbook is tracking a work order requiring you to craft (some short metal chisels|a textured metal rasp|some long metal chisels|some rough metal pliers|some square metal rifflers|a metal slender bow saw|a thin metal rasp|some sharpened chisels|a metal straight bone saw|some elongated rifflers|some squat metal rifflers|a flat metal rasp|some plain metal pliers|some thick metal pliers|some sturdy metal chisels|a tapered metal rasp|a coarse metal rasp|some hooked metal pliers|some curved metal pliers|a metal tapered bone saw|a metal curved bone saw|a metal serrated bone saw|some reinforced chisels|some curved metal rifflers) from any material\.
		matchre chapter.4 This logbook is tracking a work order requiring you to craft (a metal hide scraper|some squat knitting needles|some smooth knitting needles|some knobby sewing needles|a stout metal yardstick|a rectangular yardstick|some plain sewing needles|some bent metal scissors|some straight metal scissors|a serrated hide scraper|a curved hide scraper|a compact metal awl|a pointed metal awl|some polished knitting needles|some tapered knitting needle|a slender metal awl|a flat metal yardstick|a detailed yardstick|some curved metal scissors|some serrated scissors|some ribbed sewing needles|some thin sewing needles|a narrow metal awl) from any material\.
		matchre chapter.6 This logbook is tracking a work order requiring you to craft (a shallow metal cup|a metal lockpick ring|a slender metal rod|a metal herbal case|a tall metal mug|a metal jewelry box|a short metal mug|a metal flights box|a soft metal keyblank|a metal razor|a metal horseshoe|a large metal flask|a back scratcher|a metal armband|some metal barbells|a metal instrument case|a large metal horseshoe|a metal chest|a small metal flask|a metal backtube|a metal ankle band|a metal starchart tube|a metal lockpick case|some metal clippers|a metal origami case|a metal crown|a metal bolt box|a metal torque|a metal talisman case|a metal mask|a metal flask|a metal headdress|a metal oil lantern) from any material\.
		matchre new.order.wait ^This logbook has been used to complete
		put read my %society.type logbook
		matchwait
	}
	if "%discipline" = "tailor" then
	{
		matchre chapter.1 This logbook is tracking a work order requiring you to craft (some small cloth padding|some large cloth padding) from any (material|fabric)\.
		matchre chapter.2 This logbook is tracking a work order requiring you to craft (a cloth ankleband|a floppy cloth hat|some cloth fingerless gloves|a cloth veil|a cloth armband|a cloth head scarf|some cloth ankle socks|some cloth robes|some cloth socks|a cloth tunic|a cloth belt|a baggy cloth shirt|a cloth headband|a billowing cloth shirt|some elbow-length gloves|a front-laced cloth dress|some pleated cloth gloves|a knee-length cloth dress|some cloth knee socks|a cloth dress|a cloth eyepatch|some baggy cloth pants|a cloth commoner's cloak|a cloth top hat|a cloth dress belt|a cloth dress hat|a segmented cloth belt|some hooded cloth robes|a cloth dunce hat|a cloth cape|a cloth hat|a hooded cloth cloak|some cloth field shoes|a cloth tabard|some cloth slippers|a formal cloth tunic|some elegant cloth gloves|a short-sleeved tunic|a cloth scarf|a cloth dress shirt|a cloth cloak|a cloth gown|a cloth shirt|a floor-length cloth dress|a sleeveless cloth shirt|some cloth dress pants|a cloth sash|a deeply-hooded cloak|a cloth kilt|a cloth shaman's robe|a cloth skirt|some flowing cloth robes|some cloth pants|a cloth mage's robe|a double-wrapped belt) from any (material|fabric)\.
		matchre chapter.3 This logbook is tracking a work order requiring you to craft (a cloth napkin|a cloth talisman pouch|a cloth rag|a cloth herb pouch|a cloth hip pouch|a cloth carryall|a cloth weapon strap|a cloth knapsack|a cloth gem pouch|a cloth backpack|a cloth towel|a cloth charm bag|a cloth thigh bag|a cloth bandolier|a cloth pouch|a cloth haversack|a cloth utility belt|a cloth duffel bag|a cloth sack|a small cloth rucksack|a cloth bag|a cloth rucksack|a cloth arm pouch) from any (material|fabric)\.
		matchre chapter.4 This logbook is tracking a work order requiring you to craft (a quilted cloth mask|some insulated cloth pants|a quilted cloth aventail|an insulated cloth hood|a padded cloth mask|a quilted cloth tabard|a padded cloth aventail|a padded cloth mantle|a quilted cloth cap|a padded cloth vest|some quilted cloth gloves|an insulated cloth tasset|some quilted cloth pants|some padded cloth sleeves|an insulated cloth mask|some insulated cloth vambraces|an insulated cloth aventail|a padded cloth tabard|a padded cloth cap|a quilted cloth shirt|some padded cloth gloves|a quilted cloth robe|a quilted cloth hood|an insulated cloth mantle|a quilted cloth tasset|an insulated cloth vest|some quilted cloth vambrace|some insulated cloth sleeves|some padded cloth pants|an insulated cloth tabard|an insulated cloth cap|a padded cloth shirt|some insulated cloth gloves|a quilted cloth hauberk|a padded cloth hood|a padded cloth robe|a quilted cloth mantle|an insulated cloth shirt|a quilted cloth vest|a padded cloth hauberk|a padded cloth tasset|an insulated cloth robe|some quilted cloth sleeves|an insulated cloth hauberk|some padded cloth vambraces) from any (material|fabric)\.
		matchre chapter.5 This logbook is tracking a work order requiring you to craft (a knitted napkin|a knitted skirt|a knitted armband|a knitted shirt|some knitted socks|some knitted gloves|a knitted ankleband|some knitted legwarmers|a knitted headband|a knitted towel|some knitted mittens|some knitted hose|a knitted hood|a knitted sweater|some knitted booties|a knitted cloak|a knitted hat|a knitted blanket|a knitted scarf|some knitted slippers) from any material|fabric\.
		matchre chapter.7 This logbook is tracking a work order requiring you to craft (some fingerless gloves|a leather dress belt|a leather ankleband|a segmented belt|a leather armband|a sleeveless leather shirt|a leather belt|a leather shirt|a leather headband|a double-wrapped belt|a leather eyepatch|a leather dress|some elbow-length gloves|a leather tunic|a commoner's cloak|a hooded leather cloak|a leather hat|a leather utility belt|some leather shoes|a leather cape|some leather moccasins|a deeply-hooded cloak|a leather cloak|a leather skirt) from any (cloth|material|leather)\.
		matchre chapter.8 This logbook is tracking a work order requiring you to craft (a leather weapon strap) from any (material|leather)\.
		matchre chapter.9 This logbook is tracking a work order requiring you to craft (a rugged leather mask|a thick leather tasset|a rugged leather aventail|a rugged leather jerkin|a thick leather mask|a coarse leather cowl|a thick leather aventail|some coarse greaves|a rugged leather cap|some coarse vambraces|some rugged gloves|a coarse leather tasset|a coarse leather mask|a thick leather vest|a thick leather cap|some thick leather sleeves|some thick gloves|a thick leather jerkin|a rugged leather helm|a rugged leather robe|a coarse leather aventail|a rugged leather coat|a coarse leather cap|a thick leather mantle|some coarse gloves|a coarse leather vest|a thick leather helm|some coarse leather sleeves|a rugged leather cowl|a coarse leather mantle|some rugged greaves|a coarse leather jerkin|some rugged vambraces|a thick leather coat|a rugged leather tasset|some rugged leathers|a coarse leather helm|a thick leather robe|a thick leather cowl|a coarse leather coat|some thick greaves|some thick leathers|some thick vambraces|a coarse leather robe|some rugged leather sleeves|some coarse leathers|a rugged leather vest|a rugged leather mantle) from any (material|leather)\.
		matchre chapter.10 This logbook is tracking a work order requiring you to craft (a leather shield handle|a leather oval shield|a long leather cord|a leather targe|a leather target shield|a medium leather shield|an ordinary leather shield|a leather kite shield|a leather buckler|a small leather shield) from any (material|leather)\.
		matchre new.order.wait ^This logbook has been used to complete
		put read my %society.type logbook
		matchwait
	}
	if "%discipline" = "carving" then
	{
		matchre chapter.1 This logbook is tracking a work order requiring you to craft (a small stone block|a deep stone basin|a large stone block|a small stone sphere|a thin stone slab|a flat slickstone|a short stone pole|a large stone sphere|a thick stone slab|a grooved stone stirring rod|a smooth slickstone|a polished slickstone|a stout stone stirring rod|a notched stone stirring rod|a shallow stone basin|a forked stone stirring rod|a long stone pole|a slender stone stirring rod) from any material\.
		matchre chapter.2 This logbook is tracking a work order requiring you to craft (a rough stone table|a stone buffet table|a high stone table|a stone dining table|a square stone table|a stone refectory table|a round stone table|a stone meditation table|an oval stone table|a stone parquet table|a long stone table) from any material\.
		matchre chapter.3 This logbook is tracking a work order requiring you to craft (some smooth stones|a stone bola|a stone bludgeon|a stone hand sword|a stone carving knife|a heavy stone mallet|some elongated stones|a stone javelin|a stone hand axe|a stone spear|a stone war club|a stone war mattock|some balanced stones|a stone maul|a stone war hammer|a stone flail|some stone spikes|some stone shards) from any material\.
		matchre chapter.4 This logbook is tracking a work order requiring you to craft (a stone band|a stone talisman case|a stone toe ring|a stone belt buckle|a stone nose ring|a stone armband|a stone pin|an articulated stone bracelet|a stone anklet|a stone tiara|a stone bracelet|a stone locket|a stone tailband|a stone choker|a stone hairpin|a stone diadem|a stone cloak pin|a stone circlet|a pair of stone earrings|an articulated stone necklace|a stone medallion|a stone crown|a stone amulet|an articulated stone belt|a stone pendant|a stone mask|a stone brooch|a stone earcuff) from any material\.
		matchre chapter.5 This logbook is tracking a work order requiring you to craft (a Human image|an Elothean image|a Kaldar image|a Prydaen image|an Elf image|a Rakash image|a Gor'Tog image|a S'Kra Mur image|a Halfling image|a Dwarf image|a Gnome image) from any material\.
		matchre chapter.6 This logbook is tracking a work order requiring you to craft (a long bone pole|a short bone pole) from any material\.
		matchre chapter.7 This logbook is tracking a work order requiring you to craft (a round bone table|a square bone table) from any material\.
		matchre chapter.8 This logbook is tracking a work order requiring you to craft (a bone bludgeon|a bone javelin|a bone carving knife|a light bone spear|a bone hand axe|a bone maul|a bone war club|a bone mattock|a bone shiv|a bone flail|a bone hand sword|a bone mallet) from any material\.
		matchre chapter.9 This logbook is tracking a work order requiring you to craft (a bone band|a bone brooch|a bone nose ring|a bone armband|a bone toe ring|a bone belt buckle|a bone bracelet|a bone choker|a bone anklet|a bone locket|a bone pin|a bone tiara|a bone cloak pin|an articulated bone bracelet|a bone hairpin|some bone bangles|a bone tailband|an articulated bone necklace|a shallow bone cup|a bone circlet|a bone pendant|a bone crown|a bone amulet|a bone comb|a bone medallion|a bone haircomb|a pair of bone earrings|a bone earcuff) from any material\.
		matchre chapter.10 This logbook is tracking a work order requiring you to craft (a segmented bone mask|a segmented bone mantle|a segmented bone aventail|a segmented bone tabard|a notched bone mask|a ribbed bone balaclava|a notched bone aventail|some ribbed bone greaves|a segmented bone cap|some ribbed vambraces|some segmented bone gloves|some notched bone sleeves|a ribbed bone mask|a ribbed bone tasset|a ribbed bone aventail|a notched bone vest|a notched bone cap|a notched bone mantle|some notched bone gloves|a notched bone tabard|a segmented bone helm|a segmented bone robe|a ribbed bone cap|a segmented bone coat|some ribbed bone gloves|some ribbed bone sleeves|a notched bone helm|a ribbed bone vest|a segmented bone balaclava|a ribbed bone mantle|some segmented bone greaves|a ribbed bone tabard|some segmented vambraces|a notched bone robe|a segmented bone tasset|a notched bone coat|a ribbed bone helm|a segmented bone hauberk|a notched bone balaclava|a ribbed bone robe|some notched bone greaves|a ribbed bone coat|some notched vambraces|a notched bone hauberk|some segmented bone sleeves|a ribbed bone hauberk|a notched bone tasset|a segmented bone vest) from any material\.
		matchre new.order.wait ^This logbook has been used to complete
		put read my %society.type logbook
		matchwait
	}

chapter.name:
	#if !matchre("%order.chapter","$MC_TARGET.CHAPTERS") then goto new.order
	gosub set.order.noun %full.order.noun end
	echo Item Full Name : %full.order.noun
	echo Item Base Name : $MC.order.noun
	echo Chapter Item Is In : %order.chapter
	echo Quantity Desired : %order.quantity
	goto keep.order
	 
set.order.noun:
	if "$2" = "end" then put #var MC.order.noun $1
	if "$3" = "end" then put #var MC.order.noun $2
	if "$4" = "end" then put #var MC.order.noun $3
	if "$5" = "end" then put #var MC.order.noun $4
	if "$6" = "end" then put #var MC.order.noun $5
	if "$7" = "end" then put #var MC.order.noun $6
	if "$8" = "end" then put #var MC.order.noun $7
	if "$9" = "end" then put #var MC.order.noun $8
	if matchre("%full.order.noun", ".* ball and chain") then put #var MC.order.noun ball
	return

chapter.1:
	var full.order.noun $1
	if "%discipline" = "tailor" then var order.type cloth
	if "%discipline" = "carving" then var order.type stone
	if "%full.order.noun" = "a slender stone stirring rod" then var full.order.noun a slender stone stirring rod
	var order.chapter 1
	pause .5
	goto chapter.name
	
chapter.2:
	var full.order.noun $1
	if "%discipline" = "tailor" then var order.type cloth
	if "%discipline" = "carving" then var order.type furniture
	var order.chapter 2
	pause .5
	goto chapter.name
	
chapter.3:
	var full.order.noun $1
	if "%discipline" = "tailor" then var order.type cloth
	if "%discipline" = "carving" then var order.type stone
	var order.chapter 3
	pause .5
	goto chapter.name
	
chapter.4:
	var full.order.noun $1
	if "%discipline" = "tailor" then var order.type cloth
	if "%discipline" = "carving" then var order.type stone
	var order.chapter 4
	pause .5
	goto chapter.name
	
chapter.5:
	var full.order.noun $1
	if "%discipline" = "tailor" then var order.type knitted
	if "%discipline" = "carving" then var order.type stone
	var order.chapter 5
	pause .5
	goto chapter.name
	
chapter.6:
	var full.order.noun $1
	if "%discipline" = "carving" then var order.type bone
	var order.chapter 6
	pause .5
	goto chapter.name
	
chapter.7:
	var full.order.noun $1
	if "%discipline" = "tailor" then var order.type leather
	if "%discipline" = "carving" then var order.type furniture
	var order.chapter 7
	pause .5
	goto chapter.name
	
chapter.8:
	var full.order.noun $1
	if "%discipline" = "tailor" then var order.type leather
	if "%discipline" = "carving" then var order.type bone
	var order.chapter 8
	pause .5
	goto chapter.name
	
chapter.9:
	var full.order.noun $1
	if "%discipline" = "tailor" then var order.type leather
	if "%discipline" = "carving" then var order.type bone
	var order.chapter 9
	pause .5
	goto chapter.name
	
chapter.10:
	var full.order.noun $1
	if "%discipline" = "tailor" then var order.type leather
	if "%discipline" = "carving" then var order.type bone
	var order.chapter 10
	pause .5
	goto chapter.name

keep.order:
	if "%discipline" = "tailor" && "%order.pref" != "%order.type" then goto new.order.wait
	if "%discipline" = "carving" && "%order.pref" != "%order.type" then goto new.order.wait
	if "$MC.order.quality" = "finely-crafted" then put #var MC.order.quality.fail riddled with mistakes and practically useless|of dismal quality|very poorly-crafted|of below-average quality|of mediocre quality|of average quality|of above-average quality|well-crafted
	if "$MC.order.quality" = "of superior quality" then put #var MC.order.quality.fail riddled with mistakes and practically useless|of dismal quality|very poorly-crafted|of below-average quality|of mediocre quality|of average quality|of above-average quality|well-crafted|finely-crafted
	if "$MC.order.quality" = "of exceptional quality" then put #var MC.order.quality.fail riddled with mistakes and practically useless|of dismal quality|very poorly-crafted|of below-average quality|of mediocre quality|of average quality|of above-average quality|well-crafted|finely-crafted|of superior quality
	if "$MC.order.quality" = "" then goto new.order
	goto turn.page

turn.page:
	gosub verb put my %society.type logbook in my %main.storage
	gosub verb get my %discipline book
	send turn my book to chapter %order.chapter
	send read my book
	waitforre Page (\d+): %full.order.noun
	var page $1
	send turn my book to page %page
	goto calc.material

	 
#################################
#
#  Gathering materials and parts
#
#################################

calc.material:
	var material.volume 0
	var asmCount1 0
	var asmCount2 0
	if (("%discipline" = "weapon")||("%discipline" = "armor")||("%discipline" = "blacksmith")) then
	{
		pause .1
		action (book) on
		if !matchre("book", "$righthand") then send get my %discipline book
		pause .5
		send read my book
		waitforre metal ingot .(\d+) volume
		var volume $1
		action (book) off
		pause 0.1
		var reqd.volume %volume
		math reqd.volume multiply %order.quantity
		gosub parts.inv
		if %mat.item.count > 0 then gosub count.material ingot
		if %mat.deed.count > 0 then gosub count.material deed
		pause 0.5
		echo Total Volume Req'd: %reqd.volume
		echo Volume per Item: %volume
		echo Number of Items Req'd: %order.quantity
		echo Inventory: %material.volume volumes
		if %reqd.volume > %material.volume then goto lack.material
		if %oil.count < 1 then
		{
			gosub automove %tool.room
			action (order) on
			send order
			waitfor You may purchase
			pause .5
			action (order) off
			gosub purchase order %oil.order
			send put my oil in my %main.storage
			waitforre ^You put
		}
	}
	if "%discipline" = "tailor" then
	{
		pause .1
		action (book) on	
		if !matchre("book", "$righthand") then send get my tailoring book
		pause .5
		send read my book
		waitforre .*(cloth|leather|yarn).*\((\d+) yards?\)
		var volume $2
		action (book) off
		pause 0.1
		var mass.volume %volume
		math mass.volume multiply %order.quantity
		gosub parts.inv
		if %mat.item.count > 0 then gosub count.material %order.pref
		if %mat.deed.count > 0 then gosub count.material deed
		pause 0.5
		echo Total Yards Req'd: %mass.volume
		echo Yards per Item: %volume
		echo Number of Items Req'd: %order.quantity
		echo Inventory: %material.volume yards
		if %mass.volume > %material.volume then
		{
			gosub automove %supply.room
			action (order) on
			send order
			waitfor You may purchase
			action (order) off
			gosub purchase order %%work.material.order
			send put my %order.pref in my %main.storage
			waitforre ^You put
			goto calc.material
		}
		if %pins.count < 1 then
		{
			gosub automove %tool.room
			action (order) on
			send order
			waitfor You may purchase items
			action (order) off
			gosub purchase order %pins.order
			send put my pin in my %main.storage
			waitforre ^You put
		}
	}
	if (("%discipline" = "carving") && ("%order.pref" = "bone")) then
	{
		pause .1
		action (book) on
		pause .5
		if !matchre("book", "$righthand") then send get my carving book
		send read my book
		waitforre .*bone stack.*\((\d+) (piece|pieces)\)
		var volume $1
		action (book) off
		pause 0.1
		var mass.volume %volume
		math mass.volume multiply %order.quantity
		gosub parts.inv
		if %mat.item.count > 0 then gosub count.material stack
		if %mat.deed.count > 0 then gosub count.material deed
		pause 0.5
		echo Total Pieces Req'd: %mass.volume
		echo Pieces per Item: %volume
		echo Number of Items Req'd: %order.quantity
		echo Inventory: %material.volume pieces
		if %mass.volume > %material.volume then goto lack.material	
		if %polish.count < 1 then
		{
			gosub automove %tool.room
			action (order) on
			send order
			waitfor You may purchase
			action (order) off
			gosub purchase order %polish.order
			send put my polish in my %main.storage
			waitforre ^You put
		}
	}
	goto calc.parts
	 
calc.parts:
	var temp.room 0
	math asmCount1 multiply %order.quantity
	math asmCount2 multiply %order.quantity
	gosub verb put my book in my %main.storage
	if "%assemble" = "long pole" then math asmCount1 subtract %long.pole.count
	if "%assemble" = "short pole" then math asmCount1 subtract %short.pole.count
	if "%assemble" = "handle" then math asmCount1 subtract %handle.count
	if "%assemble" = "hilt" then math asmCount1 subtract %hilt.count
	if "%assemble" = "haft" then math asmCount1 subtract %haft.count
	if "%assemble" = "large backing" then math asmCount1 subtract %large.backing.count
	if "%assemble" = "large padding" then math asmCount1 subtract %large.padding.count
	if "%assemble2" = "small backing" then math asmCount2 subtract %small.backing.count
	if "%assemble2" = "small padding" then math asmCount2 subtract %small.padding.count
	if "%assemble2" = "long cord" then math asmCount2 subtract %long.cord.count
	if "%assemble2" = "short cord" then math asmCount2 subtract %short.cord.count
	pause 2
	gosub check.location
	if ((matchre("%work.room","\b$roomid\b")) && (("$roomplayers" = "") || "$roomplayers" = "Also here: Vaiyne.")) then var temp.room $roomid
	if ((%asmCount1 > 0) || (%asmCount2 > 0)) then
	{
		if "%discipline"= "carving" then
		}
		 	gosub automove %supply.room
			action (order) on
			send order
			waitfor You may purchase
			action (order) off
		}
		if (("%discipline" = "tailor")||("%discipline" = "weapon")||("%discipline" = "armor")||("%discipline" = "blacksmith")) then
		{
			gosub automove %part.room
			action (order) on
			send order
			waitfor You may purchase
			action (order) off
		}
		if %asmCount1 > 0 then gosub purchase.assemble
		if %asmCount2 > 0 then gosub purchase.assemble2
		if (%temp.room != 0) then
		{
			gosub automove %temp.room
			unvar temp.room
		}
		unvar temp.room
	}
	if "%repair" = "on" then gosub check.tools
	if ((matchre("%work.room","\b$roomid\b")) && ("$roomplayers" = "")) then goto process.order
	pause .5
	gosub find.room %work.room
	goto process.order

parts.inv:
	var mat.item.count 0
	var mat.deed.count 0
	var long.pole.count 0
	var short.pole.count 0
	var handle.count 0
	var hilt.count 0
	var haft.count 0
	var large.backing.count 0
	var large.padding.count 0
	var small.backing.count 0
	var small.padding.count 0
	var long.cord.count 0
	var short.cord.count 0
	var pins.count 0
	var oil.count 0
	var polish.count 0


	action (partsinv) math mat.item.count add 1 when ^\s+(a|an|some) (%work.material).*(leather|cloth|yarn|ingot|stack)$
	action (partsinv) math mat.deed.count add 1 when ^\s+a deed for (a|an|some).*(%work.material).*(leather|cloth|yarn|ingot|stack)$
	action (partsinv) math long.pole.count add 1 when a long \S+ pole$
	action (partsinv) math short.pole.count add 1 when a short \S+ pole$
	action (partsinv) math handle.count add 1 when (a|an) \S+ shield handle$
	action (partsinv) math hilt.count add 1 when a \S+ \S+ hilt$
	action (partsinv) math haft.count add 1 when a \S+ \S+ haft$
	action (partsinv) math large.backing.count add 1 when a large \S+ backing$
	action (partsinv) math small.backing.count add 1 when a small \S+ backing$
	action (partsinv) math large.padding.count add 1 when (a|some) large \S+ padding$
	action (partsinv) math small.padding.count add 1 when (a|some) small \S+ padding$
	action (partsinv) math large.padding.count add 1 when (a|some) large \S+ \S+ padding$
	action (partsinv) math small.padding.count add 1 when (a|some) small \S+ \S+ padding$
	action (partsinv) math long.cord.count add 1 when a long \S+ cord$
	action (partsinv) math short.cord.count add 1 when a short \S+ cord$
	action (partsinv) math pins.count add 1 when some straight iron pins
	action (partsinv) math polish.count add 1 when a jar of surface polish
	action (partsinv) math oil.count add 1 when a flask of oil

	action (partsinv) on
	send inv %main.storage
	waitforre INVENTORY HELP
	pause 2
	action (partsinv) off
	return	

count.material:
	var count $0
	if "%count" = "knitted" then var count yarn
	action (count) math material.volume add $1 when About (\d+) volume of metal was used in this
	action (count) math material.volume add $2 when \s+(Volume|Yards|Piece|Pieces):\s+(\d+)$
	action (count) math material.volume add $1 when possess a volume of (\d+)\.$
	action (count) math material.volume add $1 when You count out (\d+) (piece|pieces|yards) of material there\.$
	action (count) var manual 1 when unable to discern hardly anything about it\.$|make a few observations\.$|learn more about its construction\.$
	var manual 0
	if "%count" = "ingot" then
	{
		var c.action analyze
		var temp %mat.item.count
	}
	if contains("(leather|cloth|yarn)","%count") then
	{
		var c.action count
		var temp %mat.item.count
		gosub combine.check $MC_OUTFITTING.STORAGE "%work.material $1"
	}
	if "%count" = "stack" then
	{
		var c.action count
		var temp %mat.item.count
		gosub combine.check $MC_ENGINEERING.STORAGE "%work.material stack"
	}
	if "%count" = "deed" then
	{
		var c.action read
		var temp %mat.deed.count
	}
count.material2:
	action (count) on
	pause 1
	send %c.action %ordinal(%temp) %work.material %count in my %main.storage
	pause 1
	if %manual =  1 then 
		{
		var bagcount %temp
		goto manual.count
		}
	math temp subtract 1
	action (count) off
	pause 1
	if %temp < 1 then
	{
		unvar temp
		unvar count
		return
	}
	gosub count.material2
	return

manual.count:
		action (count) on
		if "$righthand" != "Empty" then 
				{
				var rightsave $righthand
				put put $righthand in my %main.storage
				}

		pause 0.5
		send get %ordinal(%bagcount) %work.material %count in my %main.storage
		if !contains("$lefthand", "yardstick") then send get yard from my %main.storage
		send measure my %work.material %count with my yardstick
		math temp subtract 1
		pause 1
		send put %work.material %count in my %main.storage
		action (count) off
		pause 1
		if %temp < 1 then
		{
			unvar temp
			unvar count
			unvar bagcount
			send put yard in %main.storage
			send put get %rightsave	from my %main.storage
			unvar rightsave
			return
		}
		goto manual.count
	
purchase.assemble:
	if "%discipline" = "tailor" then
	{
		if "%assemble" = "handle" then gosub purchase order %handle.order
		if "%assemble" = "large padding" then gosub purchase order %l.padding.order
	}
	else gosub purchase buy %assemble
	
	math asmCount1 subtract 1
	pause .2
	gosub verb put my %assemble in my %main.storage
	if %asmCount1 = 0 then return
	gosub purchase.assemble
	return

purchase.assemble2:
	if "%discipline" = "tailor" then
	{
		if "%assemble2" = "small padding" then gosub purchase order %s.padding.order
		if "%assemble2" = "small backing" then gosub purchase order %s.backing.order
		if "%assemble2" = "long cord" then gosub purchase order %l.cord.order
		if "%assemble2" = "short cord" then gosub purchase order %s.cord.order
	}
	else gosub purchase buy %assemble2
	math asmCount2 subtract 1
	pause .2
	gosub verb put my %assemble2 in my %main.storage
	if %asmCount2 = 0 then return
	gosub purchase.assemble2
	return

purchase:
	var purchase $0
	goto purchase2
purchase.p:
	pause 0.5
purchase2:
	var temp.room $roomid
	var purchaselabel purchase2
	matchre purchase.p type ahead|...wait|Just order it again
	matchre lack.coin you don't have enough coins|you don't have that much
	matchre return pay the sales clerk|takes some coins from you
	put %purchase
    matchwait

#################################
#
#  Order Processing
#
#################################

process.order:
	if %diff.change = 1 then goto new.order
	if %tool.gone = 1 then gosub new.tool
	if !matchre("%work.room", "\b$roomid\b") then gosub find.room %work.room
	if (("%discipline" = "weapon")||("%discipline" = "armor")||("%discipline" = "blacksmith")) then
	{
		var manual 0
		if !matchre("%work.room", "\b$roomid\b") then gosub find.room %work.room
		if "$lefthand" != "Empty" then gosub verb put my $lefthandnoun in my %main.storage
		if "$righthand" != "Empty" then gosub verb put my $righthandnoun in my %main.storage
		pause 1
		var temp null
		action (volume) var manual 1 when unable to discern hardly anything about it\.$|make a few observations\.$|learn more about its construction\.$
		action (volume) var temp $1 when a volume of (\d+)\.$
		action (volume) var temp $1 when About (\d+) volume of metal was used in this
		gosub gather.material ingot
		send analyze my ingot
		waitforre About (\d+) volume of metal was used in this|^(Roundtime)
		if %manual = 1 then 
			{
			pause 0.5
			if !contains("$lefthand", "yardstick") then send get yard from my %main.storage
			pause 0.5
			send measure my ingot with my yardstick
			waitforre posses a volume of (\d+)\.$|^(Roundtime)
			send put yard in my %main.storage
			}
		if "%temp" != "null" then
		{
			if %volume > %temp then gosub small.mat ingot
		}
		action (volume) off
		gosub verb put my %work.material ingot on anvil
		gosub verb get my %discipline book
		send study my book
		pause .5
		if $MC_DIFFICULTY < 3 then
		{
			put get %work.material ingot on anvil
			put put ingot in $MC_FORGING.STORAGE
			goto new.order
		}
		send .pound
		waitforre ^(POUNDING DONE)|^(SMALL INGOT)
		var temp $1
		if "%temp" = "SMALL INGOT" then gosub small.mat ingot
		unvar temp
		if %grind = 1 then gosub grind
	}
	if "%discipline" = "tailor" then
	{
		if !matchre("%work.room", "\b$roomid\b") then gosub find.room %work.room
		if "$lefthand" != "Empty" then gosub verb put my $lefthandnoun in my %main.storage
		if "$righthand" != "Empty" then gosub verb put my $righthandnoun in my %main.storage
		pause 2
		if "%order.pref" != "knitted" then
		{
			gosub gather.material %order.pref
			send count my %order.pref
			waitforre You count out (\d+) yard.*of material there
			if %volume > $1 then gosub small.mat %order.pref
			gosub verb get my %discipline book
			send study my book
			if $MC_DIFFICULTY < 3 then
				{
				put put %work.material %order.pref in my %main.storage
				goto new.order
				}
			pause .5
			gosub verb put my book in my %main.storage
			pause .5
			send .sew
			waitforre ^SEWING DONE
		}
		if "%order.pref" = "knitted" then
		{
			gosub gather.material yarn
			send count my yarn
			waitforre You count out (\d+) yards of material there
			if %volume > $1 then gosub small.mat yarn
			gosub verb get my %discipline book
			send study my book
			pause .5
			if $MC_DIFFICULTY < 3 then 
				{
				put put %work.material yarn in my %main.storage
				goto new.order
				}
			pause .5
			gosub verb put my book in my %main.storage
			pause .5
			send .knit
			waitforre ^KNITTING DONE
		}
	}
	if "%discipline" = "carving" then
	{
		if !matchre("%work.room", "\b$roomid\b") then gosub find.room %work.room
		if "$lefthand" != "Empty" then gosub verb put my $lefthandnoun in my %main.storage
		if "$righthand" != "Empty" then gosub verb put my $righthandnoun in my %main.storage
		pause 2
		if "%order.pref" = "bone" then
		{
			gosub gather.material stack
			send count my stack
			waitforre You count out (\d+) (piece|pieces) of material there
			if %volume > $1 then gosub small.mat stack
			gosub verb get my %discipline book
			send study my book
			if $MC_DIFFICULTY < 3 then
				{
				put put %work.material stack in my %main.storage
				goto new.order
				}
			pause .5
			gosub verb put my book in my %main.storage
			pause .5
			send .carve
			waitforre ^CARVING DONE
		}
		if "%order.pref" = "stone" then
		{
			echo NOT ADDED YET
			exit
		}
	}
	gosub bundle.order
	if %order.quantity = 0 then goto order.summary
	goto process.order
	
bundle.order:
	action (analyze) on
	math order.quantity subtract 1
	send analyze $MC.order.noun
	waitforre ^You.*analyze
	pause .5
	action (analyze) off
	if contains("$MC.order.quality.fail", "%item.quality") then
	{
		gosub fail
		return
	}
	if "%deed.order" != "on" then
	{
		gosub verb get my %society.type logbook from my %main.storage
		pause 1
		send bundle my $MC.order.noun with my logbook
	}
	else gosub deed.order
	
	gosub verb put my %society.type logbook in my %main.storage
	pause 1
	if contains("$righthand|$lefthand", "$MC.order.noun") then put put my $MC.order.noun in bucket
	return

grind:
	if matchre("%grind.room", "\b$roomid\b") then
	{
		send .grind
		waitforre ^GRINDING DONE
	}
	else
	{
		var temp.room $roomid
		gosub find.room %grind.room
		send .grind
		waitforre ^GRINDING DONE
		gosub automove %temp.room
		if (("$roomplayers" != "") && (%order.quantity > 1)) then gosub find.room %work.room
	}
	return

gather.material:
	var get.mat $0
#	if "%get.mat" = "stone" then {}
	send get %work.material %get.mat from my %main.storage
	waitforre (^You get|^What were)
	var temp $1
	if "%temp" = "You get" then return
	if "%temp" = "What were" then
	{
		send get %work.material deed from my %main.storage
		waitforre (^You get|^What were)
		var temp $1
		if "%temp" = "You get" then
		{
			send tap my deed
			pause 1
			if "$lefthand" = "Empty" && "$righthand" = "Empty" then gosub verb get %get.mat
			pause .5
			if !contains("$righthandnoun", "%get.mat") then send swap
			pause .5
			return
		}
	}
	goto lack.material

small.mat:
    var temp $0
    pause 1
    send open my %remnant.storage
    pause 1
    gosub combine.check "%remnant.storage" %temp
    if "$righthand" != "Empty" then gosub verb put my %temp in my %main.storage
    
    if (("%discipline" = "weapon")||("%discipline" = "armor")||("%discipline" = "blacksmith")) then
	{
	if %volume > 5 then gosub smelt
	}
    pause 1
    send close my %remnant.storage
    unvar temp
    gosub clear
    goto process.order
   
combine.check:
	var combine.storage $1
	var combine.temp $2
    if (("%discipline" = "weapon")||("%discipline" = "armor")||("%discipline" = "blacksmith")) then
        {
        gosub verb put my %combine.temp in my %combine.storage
        return
        }
    var combine.parts 0
    action (combine) math combine.parts add 1 when %combine.temp
    send inv %combine.storage
    pause
    action (combine) off
    if %combine.parts > 1 then 
	{
	if contains("$righthand|$lefthand", "book") then put put book in %combine.storage
	gosub combine
	}
        else gosub verb put my %combine.temp in my %combine.storage
    return

smelt:
	if !matchre("%smelt.room", "\b$roomid\b") then gosub find.room %smelt.room
	matchre smelt_1 You get
	matchre smelt_2 ^What were|I could not find
	send get %work.material ingot from my %remnant.storage
	matchwait
smelt_1:
	put put ingot in %main.storage
	goto smelt

smelt_2:
	put .smelt %work.material
	waitfor SMELTING DONE
	return


combine:
    if !contains("$righthand|$lefthand", "%combine.temp") then
	{
	put get %combine.temp
	math combine.parts subtract 1
	}
    if %combine.parts < 1 then goto combine.end
    pause 0.5
    send get %combine.temp from %combine.storage
    pause 0.5
    send combine %combine.temp with %combine.temp
    pause 0.5
    math combine.parts subtract 1
    goto combine

combine.end:
    put put %combine.temp in %combine.storage
    pause 0.5
    put put %combine.temp in %combine.storage
    var mat.item.count 0
    action (partsinv) on 
    send inv %combine.storage
    waitforre INVENTORY HELP
    pause 2
    action (partsinv) off
    var temp %mat.item.count
    send get book from %combine.storage
    unvar combine.temp
    unvar combine.storage
    return
   
fail:
    pause 1
    send open my %remnant.storage
    pause .5
    if contains("$roomobjs", "bucket") then gosub verb put my $MC.order.noun in bucket
        else gosub verb put my $MC.order.noun in my %remnant.storage
    send close my %remnant.storage
    pause .5
    math fail add 1
    if %fail = 1 then gosub check.tools
    if %fail > 1 then gosub diff.change
    return

diff.change:
	if %fail2 = 1 then
	{
		echo ***  Work orders are too hard for you right now!
		echo ***  Get some new tools, techniques, or easier materials and try again!
		exit
	}
	var fail2 1
	var diff.change 1
	if "%work.difficulty" = "easy" then return
	if "%work.difficulty" = "challenging" then var work.difficulty easy
	if "%work.difficulty" = "hard" then var work.difficulty challenging
	return

order.summary:
	pause 1
	gosub verb get my %society.type logbook from my %main.storage
	pause 1
	send read my %society.type logbook
	pause 1
	if %order.quantity > 0 then goto turn.page
	else goto turn.in

turn.in:
	gosub find.master
	matchre turn.in1 ^You hand .* your logbook
	matchre turn.in ^You can't give it to someone who's not here
	send give my logbook to %master
	matchwait
turn.in1:
	pause .5
	math orders.completed add 1
	math repeat subtract 1
	echo ***  Order Complete!
	echo Total orders completed: %orders.completed
	echo Total coin intake: %coin.intake
	pause 3
	if %repeat > 0 then
	{
		echo ***  Doing another order!
		goto new.order
	}
	send put my logbook in my %main.storage
	put #parse MASTERCRAFT DONE
	exit

deed.order:
	gosub verb get my packet
	send push $MC.order.noun with packet
	waitforre you record it on a deed for your records\.$
	gosub verb stow packet
	gosub verb get my %society.type logbook from my %main.storage
	send bundle deed with logbook
	waitforre ^you record it on a deed for your records\.$|^You notate the deed in
	return


#################################
#
#  Commonly referenced Gosubs
#
#################################

check.tools:
	var temp 0
	eval temp.max count("%work.tools","|")
check.tools2:
	gosub verb get my %work.tools(%temp) from my %main.storage
	gosub repair.tool %work.tools(%temp)
	unvar repair.temp
	gosub verb put my %work.tools(%temp) in my %main.storage
	math temp add 1
	if %temp > %temp.max then
	{
		unvar temp
		unvar temp.max
		return
	}
	gosub check.tools2
	if $MC.Mark = "on" then
	{
		gosub verb get my stamp from my %main.storage
		gosub repair.tool stamp
		gosub verb put my stamp in my %main.storage
	}
	return

repair.tool:
	var repair.temp $0
	if %tool.gone = 1 then gosub new.tool
	send analyze my %repair.temp
	pause 1
	if "%tool.repair" = "in pristine condition" || "%tool.repair" = "practically in mint condition" then return
	pause .1
	if "%auto.repair" = "off" then
	{
		if "%repair.room" = "" then return 
		var temp.room $roomid
		gosub automove %repair.room
		gosub RepairAllItems
		gosub ReturnAllItems
		gosub automove %temp.room
		return
	}
	if contains("hammer|tongs|shovel|pliers|needles|scissors|awl|chisel|riffler|rasp|saw", "%repair.temp") then
	{
	send craft blacksmith
	waitforre ^From the blacksmithing crafting discipline you have been trained in (.*)\.$
	var repair.techs $0
	pause .5
	if (contains("%repair.techs", "Basic Tool Repair") || contains("%repair.techs", "Advanced Tool Repair")) then
	{
		pause .5
		gosub verb get my wire brush
		gosub verb rub my %repair.temp with my brush
		gosub verb put my wire brush in my %main.storage
		gosub verb get my oil
		gosub verb pour my oil on my %repair.temp
		gosub verb put my oil in my %main.storage
		return
	}
	else
	{
		echo ***  Pausing script for you to get %repair.temp repaired!
		echo ***  You should probably repair all of your relevant tools while you're there.
		echo ***  Type GOGO in your original crafting hall to resume script...
		waitforre /gogo/i
		return
		#Code for moving to individual repair places according to society, zone, etc.
	}
	}
	if (("%repair.temp" = "bellows")||("%repair.temp" = "slickstone")) then
	{
		echo ***  Pausing script for you to get %repair.temp repaired!
		echo ***  Type GOGO in your original crafting hall to resume script
		waitforre /gogo/i
		return
	}
	return

RepairAllItems:
	if "$righthand" != "Empty" then gosub RepairItem $righthandnoun
	gosub RepairItem hammer
	gosub RepairItem tongs
	gosub RepairItem leather bellows
	gosub RepairItem sewing needles
	gosub RepairItem rod
	gosub RepairItem shovel
	gosub RepairItem bone saw
	gosub RepairItem scissors
	gosub RepairItem rifflers
	gosub RepairItem rasp
	gosub RepairItem slickstone
	gosub RepairItem detailed yardstick
	return

RepairItem:
	var item $0
	put get my %item
	wait
	pause .2
	if "$righthand $lefthand" == "Empty Empty" then return
	put give %repair.clerk
	put give %repair.clerk
	waitforre ^You hand|"There isn't a scratch on that|"I don't repair those here\."
	pause .3
	if matchre("$righthand", "awl|yardstick|slickstone|needles|scissors") then put put $righthandnoun in my $MC_OUTFITTING.STORAGE
	if matchre("$righthand", "hammer|tongs|bellows|shovel|rod") then put put $righthandnoun in my $MC_FORGING.STORAGE
	if matchre("$righthand", "rasp|rifflers|saw") then put put $righthandnoun in my $MC_ENGINEERING.STORAGE
	put stow
	wait
	pause .2
	return

ReturnAllItems:
	match ticket You get
	match return I could not find
	match return What were you referring to
	put get my ticket
	matchwait

Ticket:
	match tool.store You hand
	match tool.store What is it
	put give ticket to %repair.clerk
	matchwait 15

ticket.pause:
	pause 60
	goto ticket

tool.store:
	if matchre("$righthand", "awl|yardstick|slickstone|needles|scissors") then put put $righthandnoun in my $MC_OUTFITTING.STORAGE
	if matchre("$righthand", "hammer|tongs|bellows|shovel|rod") then put put $righthandnoun in my $MC_FORGING.STORAGE
	if matchre("$righthand", "rasp|rifflers|saw") then put put $righthandnoun in my $MC_ENGINEERING.STORAGE
	goto ReturnAllItems
	

new.tool:
	var temp.room $roomid
	gosub check.location
	if "%society" = "Crossing.Engineering" then
	{
		gosub automove 1
		gosub automove forging society
		gosub check.location
		var soc.temp Engineering
	}
	if "%society" = "Crossing.Outfitting" then
	{
		gosub automove 24
		gosub automove forging society
		gosub check.location
		var soc.temp Outfitting
	}
	gosub automove %tool.room
	action (order) on
	send order
	waitfor You may purchase
	action (order) off
	if %oil.gone = 1 then
	{
		gosub purchase order %oil.order
		gosub verb put my oil in my %main.storage
		var oil.gone 0
	}
	if %brush.gone = 1 then
	{
		gosub purchase order %brush.order
		gosub verb put my brush in my %main.storage
		var brush.gone 0
	}
	if "%society" = "Crossing.Forging" && (("%soc.temp" = "Engineering") || ("%soc.temp" = "Outfitting")) then
	{
		gosub automove 11
		gosub automove %soc.temp
		unvar soc.temp
	}
	gosub automove %temp.room
	unvar temp.room
	var tool.gone 0
	return

verb:
	var verb $0
	goto verb.a
verb.p:
	pause 0.5
verb.a:
	match verb.p type ahead
	match verb.p ...wait
	matchre verb.d (You get|You put|You pick up|Roundtime|STOW HELP|completely undamaged and does not need repair|cannot figure out how to do that|not damaged enough to warrant repair|bundle them with your logbook and then give|you just received a work order|You turn your book|You notate|You hand|You slide|You place|You have no idea how to craft|The book is already turned|What were you referring|You realize you have items bundled with the logbook)
	send %verb
	matchwait
verb.d:
    return

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

lack.material:
	if "%reorder" = "off" then goto lack.material.exit
	if (("%discipline" = "weapon")||("%discipline" = "armor")||("%discipline" = "blacksmith")) then
		{
		if "%work.material" = "bronze" then var order.num 11
		if "%work.material" = "steel" then var order.num 9
		if !contains("bronze|steel", "%work.material") then goto lack.material.exit
		evalmath reqd.order %reqd.volume/5
		evalmath reqd.order ceiling(%reqd.order)
		var main.storage $MC_FORGING.STORAGE
		var order.type ingot
		goto purchase.material
		}
	if "%discipline" = "carving" then
		{
		if "%order.pref" = "bone" then
			{
			if "%work.material" = "deer-bone" then var order.num 7
			if "%work.material" = "wolf-bone" then var order.num 8
			var order.type stack
			}
		if "%work.material" = "alabaster" then
			{
			if "%deed.size" = "rock" then var order.num 1
			if "%deed.size" = "boulder" then var order.num 2
			var order.type deed
			}
		if "%work.material" = "granite" then
			{
			if "%deed.size" = "rock" then var order.num 3
			if "%deed.size" = "boulder" then var order.num 4
			var order.type deed
			}
		if "%work.material" = "marble" then
			{
			if "%deed.size" = "rock" then var order.num 5
			if "%deed.size" = "boulder" then var order.num 6
			var order.type deed
			}
		if !contains("deer-bone|wolf-bone|alabaster|granite|marble", "%work.material") then goto lack.material.exit
		evalmath reqd.order %mass.volume/10
		evalmath reqd.order ceiling(%reqd.order)
		var main.storage $MC_ENGINEERING.STORAGE
		goto purchase.material
		}
	if "%discipline" = "tailor" then
		{
		if "%order.pref" = "leather" then
			{
			if "%work.material" = "rat-pelt" then var order.num 14
			if "%work.material" = "cougar-pelt" then var order.num 15
			var order.type leather
			}
		if "%order.pref" = "cloth" then
			{
			if "%work.material" = "linen" then var order.num 7
			if "%work.material" = "burlap" then var order.num 8
			if "%work.material" = "wool" then var order.num 9
			if "%work.material" = "silk" then var order.num 10
			var order.type cloth
			}
		if !contains("rat-pelt|cougar-pelt|linen|burlap|wool|silk", "%work.material") then goto lack.material.exit
		evalmath reqd.order %mass.volume/10
		evalmath reqd.order ceiling(%reqd.order)
		var main.storage $MC_OUTFITTING.STORAGE
		goto purchase.material
		}
	goto lack.material.exit

purchase.material:
    var purchaselabel purchase.material
    action var need.coin 1 when ^The attendant shrugs and says, "Ugh, you don't have enough
    if $roomid != %supply.room then gosub automove %supply.room
first.order:
    if (("%discipline" = "carving")||("%discipline" = "tailor"))  then
        {
        if "$righthand $lefthand" != "Empty Empty" then send stow right;stow left
        if %reqd.order > 1 then    
            {
            gosub order.material
            gosub order.material
	    gosub combine.order
            math reqd.order subtract 2
            goto second.order
            }
        }
    if (("%discipline" = "weapon")||("%discipline" = "armor")||("%discipline" = "blacksmith")) then
        {
        gosub order.material
        math reqd.order subtract 1
        send put my %order.type in my %main.storage
        if %reqd.order < 1 then goto calc.material
        goto first.order
        }
second.order:
    gosub order.material       
    gosub combine.order
    math reqd.order subtract 1
    if %reqd.order < 1 then
        {
        send put my %order.type in my %main.storage
        goto calc.material
        }
    goto second.order

combine.order:
	match return You combine
	match switch too large
	match return You must be holding
	put comb %order.type with %order.type
	matchwait

switch:
 send put %order.type in %main.storage
 send put get second %order.type from %main.storage
 goto combine.order
       
lack.material.exit:
    echo Not Enough Material To Make %order.quantity $MC.order.noun !
    put #parse Need material
    exit

order.material:
    send order %order.num
    pause 0.5
    if %need.coin = 1 then
        {
        var temp.room $roomid
        gosub lack.coin
        goto order.material
        }
    send order %order.num
return

return:
return

