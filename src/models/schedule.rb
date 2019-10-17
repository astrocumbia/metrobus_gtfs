require './src/models/vehicle'

class Schedule
    def initialize(entity)
        @id = entity.id
        @is_deleted = entity.is_deleted

        @vehicle = Vehicle.new(entity.vehicle)
    end

    def key
        return "schedule-#{@id}"
    end

    def vehicle
        @vehicle
    end

    def hash
        {
            id: @id,
            is_deleted: @is_deleted,
            vehicle: @vehicle.hash
        }
    end
end