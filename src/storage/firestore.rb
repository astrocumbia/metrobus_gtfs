require 'dotenv/load'
require "google/cloud/firestore"

class Firestore
    def initialize
        @project_id = ENV['FIREBASE_PROJECT_ID']
        @key_file = ENV['FIREBASE_KEY_FILE']

        @firestore = Google::Cloud::Firestore.new project_id: @project_id, keyfile: @key_file 
    end

    def save(schedule)
        vehicle = schedule.vehicle
        vehicle_id = vehicle.id
        
        doc_ref = @firestore.doc "vehicles/#{vehicle_id}"
        doc_ref.set vehicle.hash
    end
end