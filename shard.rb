####start####

custom_require.call(%w[common common-arcana common-items common-money common-travel drinfomon equipmanager events spellmonitor])

class PetTracker
  include DRC
  include DRCT
end
password = get_settings.shard_thief_password
  def shard_thief_guild
    unless [13920].include?(Room.current.id)
      echo 'You are not at the Guild door'
      return
    end

    case bput('go gate', 'You pass', 'KNOCK', 'errant shadow')
    when 'KNOCK'
      release_invisibility
      bput('knock gate', 'You knock')
    end
  end