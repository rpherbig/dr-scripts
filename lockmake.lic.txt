###start####

custom_require.call(%w[common common-arcana common-items common-money common-travel drinfomon equipmanager events spellmonitor])

class PetTracker
  include DRC
  include DRCT
end
password = get_settings.shard_thief_password
DRCT.walk_to(9817)
lockcount = 0
ring:
bput("say order iron lockpick ring")
bput('offer 2000')
if "kilam says" bput('offer 2000')
else lockcount = lockcount+1, bput('stow right'), goto "check"

check:
if lockcount = 5 goto "lockpick"
else goto "ring"

fput('knock')
fput("say #{password}")
move 'go door'
