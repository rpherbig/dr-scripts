require 'yaml'

base = YAML.load_file('./profiles/base.yaml')['lootables']

nonbase = Dir.glob('./profiles/*.yaml')
             .reject { |item| item == '.' }
             .reject { |item| item == '..' }
             .reject { |item| item.include?('base') }
             .map { |item| [item, YAML.load_file(item)] }

nonbase.each do |pair|
  filename, nonbase = pair
  nonbase_lootables = nonbase['lootables']
  next unless nonbase_lootables

  additional = nonbase_lootables - base
  excluded = base - nonbase_lootables

  next unless [additional, excluded].any?(&:any?)

  puts "append the following to #{filename} and remove the lootables key:"

  if additional.any?
    puts 'loot_additions:'
    additional.each do |addition|
      puts "- #{addition}"
    end
  end

  next unless excluded.any?
  puts 'loot_subtractions:'
  excluded.each do |exclusion|
    puts "- #{exclusion}"
  end
end
