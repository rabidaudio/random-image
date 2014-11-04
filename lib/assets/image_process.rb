module ImageProcess

    module_function
    def darken(blob, opacity)
        return blob if opacity == 0

        img = Magick::Image.from_blob(blob).first
        mask = Magick::Image.new(img.columns, img.rows)
        p = Magick::Pixel.new(0,0,0)
        brightness = 0
        
        #get a brightness factor by converting the image to grayscale and summing the magnitudes of all pixels
        img.quantize(256, Magick::GRAYColorspace).color_histogram.each { |p,count| brightness += count*p.red }

        #we then need to divide by the number of pixels to get the average level. Then divide by the max level for a %
        percent = (brightness.to_f / (img.rows*img.columns)) / Magick::QuantumRange

        #scale the given opacity by the brightness levels. e.g. if opacity=0.1, then a white image should have a pixel
        #  opacity of .9 (10% less than transparent) and a black image of 1 (fully transparent)
        p.opacity = (1.0 - opacity*percent)*(Magick::TransparentOpacity-Magick::OpaqueOpacity).abs
        #fill the mask with these pixels
        mask.color_reset! p
        #then flatten the mask over the image
        Magick::ImageList.new.push(img).push(mask).flatten_images.to_blob
    end
end
