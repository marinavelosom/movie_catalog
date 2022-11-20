json.extract! movie, :id, :title, :releaseDate, :created_at, :updated_at
json.url movie_url(movie, format: :json)
