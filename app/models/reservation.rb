class Reservation < ApplicationRecord
  belongs_to :user
  has_one :mentor_topic
  has_one :mentor, through: :mentor_topic
  has_one :topic, through: :mentor_topic
end
