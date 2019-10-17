require 'redis'

class Cache
    def initialize
        @redis = Redis.new
    end

    def require_update?(schedule)
        value = @redis.get(schedule.key)
        coordinates = schedule.vehicle.position.to_s

        if value == nil || value == "" || value == coordinates
            return true
        end

        return false
    end

    def update(schedule)
        coordinates = schedule.vehicle.position.to_s
        @redis.set(schedule.key, coordinates)
    end

    def update_array(schedules) 
        schedules.each do |s|
            update(s)
        end
    end
end

c = Cache.new
