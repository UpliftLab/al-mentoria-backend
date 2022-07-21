class Mentor < ApplicationRecord
  belongs_to :user
  has_many :mentor_topics, dependent: :destroy
  has_many :topics, through: :mentor_topics
  has_many :reservations, through: :mentor_topics, dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }
  validates :bio, presence: true, length: { maximum: 250 }
  validates :photo, presence: true, length: { maximum: 250 }, format: { with: %r{\Ahttps?://.+\z},
                                                                        message: 'only accepts urls' }
end
