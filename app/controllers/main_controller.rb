class MainController < ApplicationController
  def rand
    doc = Nokogiri::HTML(open( FLICKR_ADDR ))
    photo = (doc.css( FLICKR_PHOTO_CLASS )).first
    p_src = photo.css("img").first.attr("src").gsub(/_m\./, "_b.")
    #redirect_to p_src
    data = Net::HTTP.get URI(p_src)

    params[:opacity] = 0 if params[:opacity].nil?
    blob = ImageProcess::darken(data, params[:opacity].to_f / 100)
    send_data blob, :type => 'image/jpg', :disposition => 'inline'
  end
end
