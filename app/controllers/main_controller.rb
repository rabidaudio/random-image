class MainController < ApplicationController
  def rand
    doc = Nokogiri::HTML(open( FLICKR_ADDR ))
    photo = (doc.css( FLICKR_PHOTO_CLASS )).first
    p_src = photo.css("img").first.attr("src").gsub(/_m\./, "_b.")
    redirect_to p_src
  end
end
