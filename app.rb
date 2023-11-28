require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'


require_relative './controllers/qrcodes_controller'
require './routes'
# require './views/index.erb'



# APP CONFIGURATIONS

# port config
set :port, ENV['PORT'] || 4567


# views configs
set :views, File.join(File.dirname(__FILE__), 'views')
set :views_folder, File.join(File.dirname(__FILE__), 'public')
