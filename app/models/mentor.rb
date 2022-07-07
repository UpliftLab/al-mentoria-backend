class Mentor < ApplicationRecord
  belongs_to :User
  has_many :mentor_topics, dependent: :destroy
  has_many :topics, through: :mentor_topics
end
