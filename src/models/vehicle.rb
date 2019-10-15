require './src/models/position'
require './src/models/trip'

class Vehicle
    def initialize(vehiclePF)
        @id = vehiclePF.vehicle.id
        @label = vehiclePF.vehicle.label
        @license_plate =  vehiclePF.vehicle.license_plate
        @stop_id = vehiclePF.stop_id
        @current_stop_sequence = vehiclePF.current_stop_sequence
        @current_status = vehiclePF.current_status.to_s
        @timestamp = vehiclePF.timestamp

        @trip = Trip.new(vehiclePF.trip)
        @position = Position.new(vehiclePF.position)
    end

    def id
        @id
    end

    def hash
        {
            id: @id,
            label: @label,
            license_plate: @license_plate,
            stop_id: @stop_id,
            current_stop_sequence: @current_stop_sequence,
            current_status: @current_status,
            timestamp: @timestamp,
            trip: @trip.hash,
            position: @position.hash
        }
    end
end