require File.expand_path('../boot', __FILE__)

use Rack::Deflater
use Rack::MethodOverride

if ENV['GUARD_NOTIFY'] && ENV['RACK_ENV'] == 'development'
  # Serve the assets need for live reload to work during development
  require 'rack-livereload'
  use Rack::LiveReload
end

map '/' do
  run App
end

map '/assets' do
  assets = Sprockets::Environment.new
  assets.append_path 'assets/scripts'
  assets.append_path 'assets/styles'
  run assets
end
