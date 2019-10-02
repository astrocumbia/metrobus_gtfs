require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'uri'

data = Net::HTTP.get(URI.parse("http://app.citi-mb.mx/GTFS-RT/vehiculosPosicion"))
feed = Transit_realtime::FeedMessage.decode(data)

 for entity in feed.entity do
   p entity.vehicle.occupancy_status
 end

#p feed.entity[0]
p feed.entity.count
