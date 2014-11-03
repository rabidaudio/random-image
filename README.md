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