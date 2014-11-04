require_dependency 'lib/assets/image_process.rb'

class AlbumArt < ActiveRecord::Base
    def darkened(opacity)
        ImageProcess::darken(self.data, opacity)
    end

end
