class Topic < ApplicationRecord
  has_many :mentor_topics, dependant: :destroy
  has_many :mentors, through: :mentor_topics
end
