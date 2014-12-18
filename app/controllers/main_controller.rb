class MainController < ApplicationController
  def rand
    p_src = _get_img()[:src]
    #redirect_to p_src
    data = Net::HTTP.get URI(p_src)

    params[:opacity] = 0 if params[:opacity].nil?
    blob = ImageProcess::darken(data, params[:opacity].to_f / 100)
    send_data blob, :type => 'image/jpg', :disposition => 'inline'
  end
  
  def _get_img
    doc = Nokogiri::HTML(open( FLICKR_ADDR ))
    photo = (doc.css( FLICKR_PHOTO_CLASS )).first
    p_src = photo.css("img").first.attr("src").gsub(/_m\./, "_b.")
    p_link = FLICKR_DOMAIN + photo.css("a").first.attr("href")
    p_title = photo.css("a").first.attr("title")
    { src: p_src, link: p_link, title: p_title}
  end
end
