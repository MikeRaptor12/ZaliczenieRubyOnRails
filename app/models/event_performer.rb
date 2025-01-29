class EventPerformer < ApplicationRecord
  belongs_to :event
  belongs_to :performer
end
