require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'


require './routes'
# require './views/index.erb'


set :views, File.join(File.dirname(__FILE__), 'views')
set :views_folder, File.join(File.dirname(__FILE__), 'public')
