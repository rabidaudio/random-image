This is a stupid simple Rails app to return a random image from Flickr's http://www.flickr.com/explore/interesting/7days/ feed.

There was absolutely no need to do this in Rails since the meat of the code is all of 4 lines, but I happend to be in a ruby mood and not a javascript one.

Running on Heroku, try it out: http://random-flickr-image.herokuapp.com

What little code that is mine is [WTFPL](http://www.wtfpl.net/). Technically, this is a web scrapper and may or may not violate Flickr's TOS, so please use this only for good. :)

Album Art
=========

This app now also returns album art from lastfm, at the endpoint `/albumart`. Simply `GET` with `album` and `artist` parameters,
and an optional `size` parameter which is one of

    small
    medium
    large
    extralarge
    mega

By default it will return the largest available. It caches art too, so after the first request it should be really fast. Please don't
abuse this, it is on a free Heroku instance. :)

Opacity
=======

Both endpoints now have an optional `opacity` parameter, an integer from 0 to 100. This adds darkens the image by that factor (0 for none, 100 for a lot).
The actual amount applied is scaled by the brightness of the image, so all images should expect about the same average brightness for a given `opacity`.
Uses RMagick. It's pretty snappy, too. If these images are being used as wallpapers behind white text, this should improve readiblity.
