require 'yaml'
require 'firebase'

firebase = Firebase::Client.new('https://dr-scripts.firebaseio.com/')

stealing = firebase.get('stealing-options').body

stealing_data = YAML.load_file('./data/base-stealing.yaml')

stealing_data[:stealing_options].compact.each do |data|
  data['id'] = data['id'].to_s
  update = stealing.find { |key, _val| key == data['id'] }
  next unless update
  update.last['id'] = update.last['id'].to_s if update.last['id']
  data.merge!(update.last)
  stealing.delete(update.first)
end

stealing.each do |id, body|
  body['id'] = id.to_s
  stealing_data[:stealing_options] << body
end

File.open('./data/base-stealing.yaml', 'w') { |file| file.print(stealing_data.to_yaml) }
