require 'mongo'

# client = Mongo::Client.new(['127.0.0.1:27017'], :database => 'metrobus_dev')
client = Mongo::Client.new('mongodb://127.0.0.1:27017/metrobus_dev')
db = client.database

collection = client[:items]

trip = { id: 123, date: "12/10/2019", name: "metrobus"}
doc = { name: 'Steve', hobbies: ['hiking', 'tenis', 'fly fishing'], trip: trip }

result = collection.insert_one(doc)

p result