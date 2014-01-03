require 'open-uri'
require 'nokogiri'

addr = "http://www.flickr.com/explore/interesting/7days/"
ptag = ".Photo"

doc = Nokogiri::HTML(open( addr ))

photo = (doc.css( ptag )).first

p_src = photo.css("img").first.attr("src")

p p_src
