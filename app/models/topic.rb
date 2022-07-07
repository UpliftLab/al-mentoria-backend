class Topic < ApplicationRecord
  has_many :mentor_topics, dependent: :destroy
  has_many :mentors, through: :mentor_topics
end
