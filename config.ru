require './app'


run Sinatra::Application

# for development through gitpod only
if development?
  configure do
    set :protection, :except => [:json_csrf]
  end
end
