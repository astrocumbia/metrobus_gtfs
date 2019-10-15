class Trip
    def initialize(tripPF)
        @id = tripPF.trip_id
        @start_time = tripPF.start_time
        @start_date = tripPF.start_date
        @route_id = tripPF.route_id
        @direction_id = tripPF.direction_id
    end

    def hash
        {
            id: @id,
            start_time: @start_time,
            start_date: @start_date,
            route_id: @route_id,
            direction_id: @direction_id
        }
    end
end