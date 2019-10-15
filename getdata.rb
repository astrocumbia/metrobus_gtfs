require './src/models/schedule'
require './src/storage/firestore'
require './src/storage/mongo'
require './src/service/metrobus_gtfs'

ms = MetrobusGTFS.new
feed = ms.feed

#  for entity in feed.entity do
#    p entity
#  end

p feed.entity.count

# schedule = Schedule.new(feed.entity[0])

# f = Firestore.new
# f.save(schedule)

# m = Mongodb.new
# m.save schedule

