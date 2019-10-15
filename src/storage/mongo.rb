require 'mongo'

class Mongodb
    def initialize
        @host = '127.0.0.1:27017'
        @db_name = 'metrobus_dev'

        @client = Mongo::Client.new("mongodb://#{@host}/metrobus#{@db_name}")
        @collection = @client[:schedules]
    end

    def save(schedule)
        @collection.insert_one schedule.hash        
    end
end