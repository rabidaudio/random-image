class LastfmController < ApplicationController
  def albumart

    params[:size] = "mega" if params[:size].nil?

    a = AlbumArt.find_by(artist: params[:artist], album: params[:album], size: params[:size])

    if a.nil? then #need to get from lastfm

        result = LastFM::Album.get_info(artist: params[:artist], album: params[:album])
        if not result['error'].nil?
            render :nothing => true, :status => 404
            return
        end

        img_url = result['album']['image'].select { |i| i['size']==params[:size] }.first['#text']
        if img_url.nil? then
            render :nothing => true, :status => 404
            return
        end
        #download image
        begin
            data = Net::HTTP.get URI(img_url)
            AlbumArt.create(artist: params[:artist], album: params[:album], size: params[:size], url: img_url, data: data)
            send_data data, :type => 'image/png', :disposition => 'inline'
        rescue
            render :nothing => true, :status => 404
            return
        end
    else
        #return a.data
        send_data a.data, :type => 'image/png', :disposition => 'inline'
    end
  end
end
