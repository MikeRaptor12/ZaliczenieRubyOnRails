json.extract! event, :id, :name, :date, :movie_id, :created_at, :updated_at
json.url event_url(event, format: :json)
