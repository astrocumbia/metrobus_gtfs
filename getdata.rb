require './src/models/schedule'
require './src/storage/cache'
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
cache = Cache.new

# preguntar por elementos con cambios
schedules_to_update = schedules.select{ |s| cache.require_update?(s) }
puts "#{schedules_to_update.count} schedules require update"

puts "Saving data into Redis"
cache.update_array schedules_to_update

puts "Saving data into MongoDB"
mongo.save_array schedules_to_update

puts "Saving data into Firestore"
for schedule in schedules_to_update do
  firestore.save schedule
end

puts "Done"

