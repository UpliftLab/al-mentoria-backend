class Mentor < ApplicationRecord
  belongs_to :User
  has_many :mentor_topics
  has_many :topics, through: :mentor_topics
end
