# frozen_string_literal: true

require 'json'


get '/' do 
  content_type :json

  data = {
    message: 'Hello world!',
    time: Time.now
  }

  JSON.generate(data)
end

get '/hello' do 
  'Yeah! it works'
end

# get '/documentation' do
#   render './public/views/home.html'
# end

