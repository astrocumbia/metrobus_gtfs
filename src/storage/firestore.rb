require "google/cloud/firestore"

class Firestore
    def initialize
        @project_id = 'metrobus-dev'
        @key_file = '/Users/positr0nix/Repos/ruby/metrobus_gtfs/key/metrobus-dev-firebase-adminsdk-qq3u0-b97e5efe14.json'

        @firestore = Google::Cloud::Firestore.new project_id: @project_id, keyfile: @key_file 
    end

    def save(schedule)
        vehicle = schedule.vehicle
        vehicle_id = vehicle.id
        
        doc_ref = @firestore.doc "vehicles/#{vehicle_id}"
        doc_ref.set vehicle.hash
    end
end