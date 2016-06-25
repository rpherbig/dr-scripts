require 'yaml'
require 'firebase'

firebase = Firebase::Client.new('https://dr-scripts.firebaseio.com/')

stealing = firebase.get('stealing-options').body

File.open('./profiles/base-stealing.yaml', 'w'){|f| f.print(stealing.to_yaml) }
