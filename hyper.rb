# frozen_string_literal: true
require 'hyperresource'

api = HyperResource.new(root: 'http://localhost:8080/artist/1',
                        headers: {
                          'Accept' => 'application/hal+json'
                        })

artist = api.get
print 'Artist: ' + artist.self.href + ' - ' + artist.artist + "\n"

album = api.get.links.albums[0].get

print 'Album: ' + album.self.href + ' - ' + album.album + "\n"

track = album.links.tracks[0].get

print 'Track: ' + track.self.href + ' - ' + track.track + "\n"

artist = track.links.artists[0].get

print 'And... back to the artist: ' + artist.self.href + ' - ' + artist.artist + "\n"
