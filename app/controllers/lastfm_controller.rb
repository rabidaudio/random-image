class LastfmController < ApplicationController
  def albumart
    result = LastFM::Album.get_info(artist: params[:artist], album: params[:album])
    if not result['error'].nil?
        render :nothing => true, :status => 404
        return
    end
    params[:size] = "mega" if params[:size].nil?
    img = result['album']['image'].select { |i| i['size']==params[:size] }.first['#text']
    if not img.nil? then redirect_to img else render :nothing => true, :status => 404 end
  end
end
