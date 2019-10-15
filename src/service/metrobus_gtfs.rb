require 'dotenv/load'
require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'uri'

class MetrobusGTFS
    def initialize
        @url_service = ENV['METROBUS_URL']
        @uri = URI.parse(@url_service)
        @data = Net::HTTP.get(@uri)
    end

    def feed
        Transit_realtime::FeedMessage.decode(@data)
    end
end