     var container pack
#% Set your container to put loot in above and simply run the script when you enter the labyrinth

     action instant goto top when quickly deciding you're its new owner
     action instant setvariable searchtime 0 when pick them both up, claiming your new pet
     action instant goto end when to be leading you back up to the surface
     action put search when You notice a small rat scurrying around the area
     action goto move when A small rat scurries (\w+)!
     action put look when Something brushes against you, and you spin frantically
     action instant setvariable directions $0 when (Obvious exits: |Obvious paths: )(.+)\.
     action setvariable searchtime 75 when only have about 5 minutes left
     var searching 0
     var starttime $gametime
     var lastdir nil
     var directions $roomexits
     var searchtime 15
top:
     if "$roomname" = "Duskruin, Darkened Antichamber" then goto end
     if %temptime < %searchtime then gosub verb search
     if "$righthand" != "Empty" then gosub verb put $righthandnoun in my %container
     if "$lefthand" != "Empty" then gosub verb put $lefthandnoun in my %container
     var currenttime $gametime
     math currenttime subtract %starttime
     math currenttime divide 60
     var temptime 75
     math temptime subtract %currenttime
     if %searchtime < 1 then put search
     if %searchtime < 1 then pause 5
     if %searchtime < 1 then goto move
     echo . [ Estimated %temptime Min. Remaining ]
     pause 60
     if "$righthand" != "Empty" then gosub verb put $righthandnoun in my %container
     if "$lefthand" != "Empty" then gosub verb put $lefthandnoun in my %container
     goto top
move:
     if $standing != 1 then gosub verb stand
     eval directions replace("%directions", "Obvious exits: ", ", ")
     eval directions replace("%directions", "Obvious paths: ", ", ")
     eval directions replace("%directions", ".", "")
     eval directions replace("%directions", ", ", "|")
     eval directions replace("%directions", " and "")
     eval DirCount count("%directions","|")
     random 1 %DirCount
     eval movement element("%directions", %r)
     if "%lastdir" = "%movement" then if %DirCount > 1 then goto move
     if "%movement" = "north" then var lastdir south
     if "%movement" = "south" then var lastdir north
     if "%movement" = "east" then var lastdir west
     if "%movement" = "west" then var lastdir east
     if "%movement" = "up" then var lastdir down
     if "%movement" = "down" then var lastdir up
     if "%movement" = "southwest" then var lastdir northeast
     if "%movement" = "northeast" then var lastdir southwest
     if "%movement" = "southeast" then var lastdir northwest
     if "%movement" = "northwest" then var lastdir southeast
     move %movement
     var directions $roomexits
     goto top

verb:
     setvariable verb $0
     goto verb.a
verb.p:
     pause 0.5
verb.a:
     if $webbed = 1 then goto verb.p
     if $stunned = 1 then goto verb.p
     pause 0.1
put %verb
     match verb.p your bindings make it impossible to hide
     match verb.p type ahead
     match verb.p ...wait
     match verb.p still stunned
     match verb.p you don't feel like fighting
     match verb.p can't do that while entangled in a web
     matchre verb.d (skin briefly withers and tightens|fluid and stealthy movements|lick the tip of your finger and trace|Having no further use|You focus on infusing|You secure|You focus on manipulating|You lack the necessary|You release an accompaniment|The first gentle notes|You let your voice fade|You begin to chant a mesmerizing|With a rising crescendo in your voice|You begin your enchante|The air gradually stills|With a sharp cut to your voice|A few fleeting|You begin to hum the soothing|marches off and become gradually quieter|With a resounding|As your rendition of|You release an accompaniment|You begin to sing|flick of your wrist you stealthily unsheathe|Praying for|eyes darken to black as a starless night|release an accompaniment of elemental air|begin to chant a mesmerizing cadence designed|into your bundle|You release an accompaniment of elemental fire|you begin to chant the rhythm that heralds|trace a careful sigil|You raise your arms skyward|mutter a foul-sounding phrase to yourself|trace a curving sigil|that is already in your inventory|determine anything about this creature|mutter blasphemies to yourself|already dead|mutter incoherently to yourself while preparing|wailing of lost souls accompanies|has already been arranged|blue frost crackles up your arms|you can't arrange|Your heart skips a beat|newfound fluidity of your mind|orange flames blaze between your fingertips|You deftly|You strap|You stuff|With calm movements|You attach|You remove|You can also|Smiling slyly|not ready|You clench your hands|You hold out your arms to either side as|You fade in|You whisper the final word of your spell so that none may notice your effort|too cluttered|Stalk what|You clap|You speak|Arrange what|With rigid movements|You close yours eyes|With tense movements|You let your concentration|You make a holy gesture|cannot be skinned|You find yourself unable to hunt|could not find what|You clap your hands|You easily strap|That area is not bleeding|You take a step back|could not find what|You strain, but cannot focus your mind|You attempt to relax your mind|You get|You put|STOW HELP|You push|think pushing that would have any effect|You move|You're already using the Sight|You have not recovered from your previous use|careful focus, you adjust your eyes to see in shadow as they|You close your eyes|You're not ready to do that again|was just recently mined by someone else|Roundtime|area has already been tended to|work carefully at tending your wound|The spell pattern collapses|You are unable to control|not damaged enough to warrant repair|cannot figure out how to do that|You're not ready to do that|Drink what|What were you referring|You eat|You drink|You stand|Your analysis has revealed no additional resources|You look around, but can't see any place to hide yourself|stalking|following|already hidden|You pick up|You cannot|You gesture|You trace a hasty sigil in the air|is now set at|You detach|You snuff|You sling|You begin chanting|You bend|You are already|Quietly touching|You recite| turns up fruitless|You pour|You sprinkle|already stand|You grind|You feel warmth|already empty|You recall|You struggle|You open|You raise|You reach for its center and forge a magical link to it|You trace an angular sigil|cannot produce|You drop|already been skinned|before you arrange|inherently stealthy endeavor|try being out of sight|cannot muster enough energy to vocalize|cannot collect anything|Setting your|You trace a geometric sigil|don't have a spell prepared|already preparing|already fully prepared|preparing a spell|harnessing any mana|You aren't preparing|You slip|no matter how you arrange it|There isn't any more room|With meditative movements)
     matchwait
verb.d:
     return
end:
