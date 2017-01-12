#trying out ruby

This repo is created to test out ruby

#start
````
docker-compose up -d --build
````


#Example that it works with hyperresource
````
docker exec containername ruby hyper.rb
````

GET /track/1
result:
````
{
	"id": 1,
	"track": "Hello",
	"_links": {
		"self": {
			"href": "track/1"
		},
		"albums": [{
			"href": "album/1",
			"album": "Hello"
		}],
		"artists": [{
			"href": "artist/1",
			"track": "Adele"
		}]
	}
}
````

GET /album/1
result:
````
{
	"id": 1,
	"album": "Hello",
	"_links": {
		"self": {
			"href": "album/1"
		},
		"tracks": [{
			"href": "track/1",
			"track": "Hello"
		}, {
			"href": "track/2",
			"track": "And bye"
		}],
		"artists": [{
			"href": "artist/1",
			"artist": "Adele"
		}]
	}
}
````

GET /artist/1
````
{
	"id": 1,
	"artist": "Adele",
	"_links": {
		"self": {
			"href": "artist/1"
		},
		"albums": [{
			"href": "album/1",
			"album": "Hello"
		}]
	}
}
````

POST /artist
````
{
	"artist": "Adele"
}
````

DELETE /artist/1