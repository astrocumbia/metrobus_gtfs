require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'uri'

require './src/models/schedule'
require './src/storage/firestore'
require './src/storage/mongo'

data = Net::HTTP.get(URI.parse("http://app.citi-mb.mx/GTFS-RT/vehiculosPosicion"))
feed = Transit_realtime::FeedMessage.decode(data)

#  for entity in feed.entity do
#    p entity
#  end

# p feed.entity[0].vehicle.position
p feed.entity.count

schedule = Schedule.new(feed.entity[0])

# f = Firestore.new
# f.save(schedule)

m = Mongodb.new
m.save schedule

