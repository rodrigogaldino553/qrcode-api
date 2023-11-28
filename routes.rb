# frozen_string_literal: true

require 'json'
require 'rqrcode'
require 'base64'


get '/' do 
  erb :index
  #content_type :json

  #data = {
  #  message: 'Hello world!',
  #  time: Time.now,
  #  author: '@me'
  #}

  #JSON.generate(data)
end

get '/hello' do 
  'Yeah! it works'
end

get '/generate/:content' do
  #content_type :json

# build qrcode img
  #QrcodeController.new(params[:content])
  qrcodes_controller = QrcodeController.new
  qrcodes_controller.generate(params[:content])
  # @content = params[:content]
  

# render response
  #JSON.generate(data)
end

# get '/documentation' do
#   render './public/views/home.html'
# end

