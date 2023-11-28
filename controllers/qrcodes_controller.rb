class QrcodeController

    def generate(params)
        puts params
        @content = params
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

        "<div width='100%' height='100%' bakground='gray'><img src='data:image/jpeg;base64,#{encoded_qrcode}'></div>"
    end

end
