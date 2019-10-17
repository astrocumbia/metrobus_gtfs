require 'dotenv/load'
require 'mongo'

class Mongodb
    def initialize
        @host = ENV['MONGO_HOST']
        @db_name = ENV['MONGO_DB_NAME']

        @client = Mongo::Client.new("mongodb://#{@host}/#{@db_name}")
        @collection = @client[:schedules]
    end

    def save(schedule)
        @collection.insert_one schedule.hash        
    end

    def save_array(schedules)
        arr = schedules.map { |s| s.hash }
        @collection.insert_many(arr)
    end
end