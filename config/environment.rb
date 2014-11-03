# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
RandomImage::Application.initialize!

LastFM.api_key = ENV["LASTFM_API_KEY"]
LastFM.secret = ENV["LASTFM_SECRET"]
LastFM.client_name = "albumartfetch"