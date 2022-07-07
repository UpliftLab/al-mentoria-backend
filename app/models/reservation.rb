class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :mentor_topic
  has_one :mentor, through: :mentor_topic
  has_one :topic, through: :mentor_topic

  validates :date, presence: true, length: { maximum: 250 },
                   comparison: { greater_than_or_equal_to: Time.now.utc.to_date }
end
