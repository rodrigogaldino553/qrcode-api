require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'


require_relative './controllers/qrcodes_controller'
require './routes'
# require './views/index.erb'


# views configs
set :views, File.join(File.dirname(__FILE__), 'views')
set :views_folder, File.join(File.dirname(__FILE__), 'public')
