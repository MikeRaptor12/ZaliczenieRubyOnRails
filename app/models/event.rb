class Event < ApplicationRecord
  belongs_to :movie, optional: true  # Opcjonalne tylko wtedy, gdy nie ma filmu
  has_and_belongs_to_many :performers
  has_many :event_users
  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :date, presence: true
  validates :event_type, presence: true

  # Walidacja, żeby movie_id było wymagane tylko dla Filmów
  validates :movie_id, presence: true, if: :film_event?

  # Sprawdzamy, czy wydarzenie jest typu 'Film'
  def film_event?
    event_type == 'Film'
  end
end
