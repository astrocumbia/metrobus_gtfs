require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'uri'

require 'mongo'

require './src/models/schedule'

data = Net::HTTP.get(URI.parse("http://app.citi-mb.mx/GTFS-RT/vehiculosPosicion"))
feed = Transit_realtime::FeedMessage.decode(data)

#  for entity in feed.entity do
#    p entity
#  end

# p feed.entity[0].vehicle.position
p feed.entity.count

schedule = Schedule.new(feed.entity[0])

p schedule.hash

client = Mongo::Client.new('mongodb://127.0.0.1:27017/metrobus_dev')
db = client.database

collection = client[:schedules]

collection.insert_one(schedule.hash)
