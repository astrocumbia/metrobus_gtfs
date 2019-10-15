require './src/models/schedule'
require './src/storage/firestore'
require './src/storage/mongo'
require './src/service/metrobus_gtfs'

puts 'Script started'
puts 'Polling data from Metrobus service'

ms = MetrobusGTFS.new
schedules = ms.feed.entity.map { |f| Schedule.new f }

puts "Received #{schedules.count} schedules from Metrobus service"

firestore = Firestore.new
mongo = Mongodb.new

puts "Saving data into MongoDB"
mongo.saveArray schedules

puts "Saving data into Firestore"
for schedule in schedules do
  firestore.save schedule
end

puts "Done"

