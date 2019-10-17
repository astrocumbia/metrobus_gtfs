require 'redis'

class Cache
    def initialize
        @redis = Redis.new
    end

    def require_update?(schedule)
        value = @redis.get(schedule.key)
        timestamp = schedule.vehicle.timestamp

        if value == nil || value == "" || value == timestamp
            return true
        end

        return false
    end

    def update(schedule)
        timestamp = schedule.vehicle.timestamp
        @redis.set(schedule.key, timestamp)
    end

    def update_array(schedules) 
        schedules.each do |s|
            update(s)
        end
    end
end

c = Cache.new
