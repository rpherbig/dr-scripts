require 'yaml'
require 'firebase'

firebase = Firebase::Client.new('https://dr-scripts.firebaseio.com/')

stealing = firebase.get('stealing-options').body

stealing_data = YAML.load_file('./profiles/base-stealing.yaml')
stealing_data[:stealing_options].compact.each do |data|
  update = stealing.compact.find { |x| x['id'] == data['id'] }
  data.merge!(update)
  stealing.delete(update)
end

stealing.compact.each { |x| stealing_data[:stealing_options] << x }

File.open('./profiles/base-stealing.yaml', 'w') { |file| file.print(stealing_data.to_yaml) }
