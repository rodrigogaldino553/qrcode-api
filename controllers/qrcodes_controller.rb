require './services/qrcode_service'


class QrcodesController < Sinatra::Base
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
    encoded_qrcode = generate_qrcode(params[:content])
    "<div width='100%' height='100%' bakground='gray'><img src='data:image/jpeg;base64,#{encoded_qrcode}'></div>"
  end
  
  post '/generate' do
    content_type :json
  # build qrcode img
    content = params[:content]
    start = Time.now

    encoded_qrcode = generate_qrcode(content)

    finish = Time.now
    time = finish - start
  # build response json
    data = {
      content: content,
      qrcode: "<div width='100%' height='100%' bakground='gray'><img src='data:image/jpeg;base64,#{encoded_qrcode}'></div>",
      generated_at: Time.now,
      time: "generated in #{time} seconds"
    }
  
  # render response
    JSON.generate(data)
  end
  
  # get '/documentation' do
  #   render './public/views/home.html'
  # end

  private

  def generate_qrcode(content)
    QrcodeService.build_qrcode(content)
  end
end
