# frozen_string_literal: true

require 'json'
require 'rqrcode'
require 'base64'


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

get '/generate/:content' do
  #content_type :json

# build qrcode img
  @content = params[:content]
  rqrcode = RQRCode::QRCode.new(@content)

    qrcode = rqrcode.as_png(
      bit_depth: 1,
      border_modules: 1,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 300
    )

    encoded_qrcode = Base64.strict_encode64(qrcode.to_s)

# build response json
  # data = {
  #   message: 'VERY COOL!',
  #   your_content: params[:content],
    "<div width='100%' height='100%' bakground='gray'><img src='data:image/jpeg;base64,#{encoded_qrcode}'></div>"
  #}

# render response
  #JSON.generate(data)
end

# get '/documentation' do
#   render './public/views/home.html'
# end

