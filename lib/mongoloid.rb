#A Simple wrapper for the Ruby Mongo Driver

require 'uri'

class Mongoloid
  def self.connect
    env = ENV['MONGO_URI']
    raise ArgumentError.new('must have a MONGO_URI in your envrioment variables') if env.nil?

    uri = URI.parse(env)
    raise InvalidScheme.new('must be mongodb') unless uri.scheme == 'mongodb'

    @client = Mongo::MongoClient.new(uri.host, uri.port).db(uri.path.gsub(/^\//, ''))
    @client.authenticate(uri.user, uri.password)
  end

  def self.method_missing(meth)
    @client.collection(meth)
  end
end
