class Mentor < ApplicationRecord
  belongs_to :User
  has_many :mentor_topics, dependent: :destroy
  has_many :topics, through: :mentor_topics

  validates :name, presence: true, length: { maximum: 250 }
  validates :bio, presence: true, length: { maximum: 250 }
  validates :photo, presence: true, length: { maximum: 250 }, format: { with: %r{\Ahttps?://.+\z},
                                                                        message: 'only accepts urls' }
end
