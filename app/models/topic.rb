class Topic < ApplicationRecord
  has_many :mentor_topics
  has_many :mentors, through: :mentor_topics
end
