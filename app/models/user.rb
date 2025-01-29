class User < ApplicationRecord
  has_many :event_users
  has_many :events, through: :event_users
  has_and_belongs_to_many :events
end
