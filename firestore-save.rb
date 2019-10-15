require './src/storage/firestore'

f  = Firestore.new
p f

# require "google/cloud/firestore"


# project_id = 'metrobus-dev'
# key_file = '/Users/positr0nix/Repos/ruby/metrobus_gtfs/key/metrobus-dev-firebase-adminsdk-qq3u0-b97e5efe14.json'

# firestore = Google::Cloud::Firestore.new project_id: project_id, keyfile: key_file

# puts "Created Cloud Firestore client with given project ID."

# doc_ref = firestore.doc "users/alovelace"

# doc_ref.set(
#   first: "Ada",
#   last:  "Lovelace",
#   born:  1815
# )

# puts "Added data to the alovelace document in the users collection."
