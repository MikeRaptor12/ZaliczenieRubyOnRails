rails generate scaffold Performer name:string bio:text
json.extract! user, :id, :name, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
