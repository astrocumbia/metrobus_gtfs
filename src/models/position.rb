class Position

    def initialize(positionPF)
        @latitude = positionPF.latitude
        @longitude = positionPF.longitude
        @bearing = positionPF.bearing
        @odometer = positionPF.odometer
        @speed = positionPF.speed
    end

    def to_s
        "#{@latitude},#{@longitude}"
    end

    def hash
        {
            latitude: @latitude,
            longitude: @longitude,
            bearing: @bearing,
            odometro: @odometer,
            speed: @speed
        }
    end

end