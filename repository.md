## dr-scripts variables list

A Work in Progress

### bare bones
No matter if only use lich for go2 travel magic or have customized every possible option, these fields are universally helpful.
script | yaml_field | explanation
------------ | ------------ | -------------
many | hometown | Some possible options: Crossing, Leth Deriel, Riverhaven, Therenborough, Rossman's Landing, Langenfirth, Throne City, Shard, Hibarnhvidar, Boar Clan, Ain Ghazal, Fang Cove, Ratha, Aesry, Mer'Kresh, Muspar'i, Hara'jaal
many | safe_room | A room number of your choosing. Best practice is a quiet room outside justice and _never_ a public room where people try to socialize.  It is extremely annoying to watch and bad manners to spam.
go2/bescort | footwear | If defined, go2 will remove shoes before wearing ice skates when traveling the Forfedhar ice road.  Skates are available at the pond in Crossing during Winter or from players during the other seasons.  Highly recommended for saving time and your character's life.
go2/bescort | bescort_fare_handling | Defaults to false.  If true, will attempt to pull money from the nearest bank if you have no money for fares.  Can snag if you still have no funds at that bank but very useful if you remember to deposit a few plat in the usual places like Lang, Haven, or Leth.
go2/bescort | bescort_hide | Defaults to true.  If false, your character will not hide when on the ferries and suchlike.
go2/bescort | shard_thief_password | Optional field only useful to thieves in Shard who know their password.


### universal magic settings
Magic is sprinkled in many places through the lich dependency set of scripts and the majority use these common fields.
yaml_field | explanation
------------ | -------------
cambrinth | The exact adjective and noun of your cambrinth item.
cambrinth_cap | Numerical value your cambrinth holds such as 16.  It is important to get this number exact so the system can use while worn when applicable.  Formula to use cambrinth while worn is `(capacity * 2) + 100` so an incorrect cap can cause trouble.
stored_cambrinth | Defaults to false.  Should your cambrinth be worn or stored?
check_discern_timer_in_hours | How often to discern mana/cambrinth values.  Default value 24 checks once every 24 hours. For use with auto mana only. 
prep_scaling_factor | What percent of the max discern to cast.  Default value of 0.85 would use a combination of prepare and harness/cambrinth charges to cast a total of 85 mana on a spell that discerns at 100 mana.  Formula:  Max Discern x prep_scaling_factor = safe casting without backfire.  For use with auto mana only.
symbiosis_learning_threshold | Default is 2.  When using auto mana and symbiosis, it will keep increasing mana until each cast shows a 2 mindstate gain.
cambrinth_num_charges | Number of times to charge cambrinth or harness mana with auto mana only.  Default is 4.
use_harness_when_arcana_locked | Defaults to false.  When set to true, combat-trainer will alternate harness/attunement and cambrinth/arcana in order to keep mindstates even.  Despite the name, it alternates always and not just when arcana locked.
waggle_force_cambrinth | Defaults to true.  When set to false allows the buff script waggles (used in many places) to utilitize `use_harness_when_arcana_locked: true` listed above.
combat_trainer_buffs_force_cambrinth | Defaults to true.  When set to false allows combat-trainer's `buff_spells` to utilitize `use_harness_when_arcana_locked: true` listed above.
crossing_training_force_cambrinth | Defaults to false.  When set to true blocks crossing-training's `training_spells` from using `use_harness_when_arcana_locked: true` listed above.
dedicated_camb_use | Optional field for use with dedicated cambrinth feat.  Ex: spell
cambrinth_invoke_exact_amount | Defaults to false.  True invokes the exact amount you need from cambrinth.  Helps avoid backfire caused by previously charged mana.  Takes still to master.  Very helpful for traders with Avtalia Array.

#### Multiple Cambrinth
Multiple cambrinth pieces can be used almost everywhere magic can be used.  Does not work well with auto mana and adds extra roundtime as more pieces require more invoking.  Preference would be to use a single large worn cambrinth but in cases where that is not possible, this will work.
```yaml
cambrinth_items:
- name: cambrinth.ring
  cap: 4
  stored:
- name: cambrinth.armband
  cap: 32
  stored: true
```
