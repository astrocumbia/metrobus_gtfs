require './src/models/schedule'
require './src/storage/firestore'
require './src/storage/mongo'
require './src/service/metrobus_gtfs'

ms = MetrobusGTFS.new
schedules = ms.feed.entity.map { |f| Schedule.new f }

firestore = Firestore.new
mongo = Mongodb.new


mongo.saveArray schedules

for schedule in schedules do
  firestore.save schedule
end

puts schedules.count

