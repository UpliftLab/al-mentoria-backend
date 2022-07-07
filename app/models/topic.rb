class Topic < ApplicationRecord
  has_many :mentor_topics, dependent: :destroy
  has_many :mentors, through: :mentor_topics

  validates :label, presence: true, length: { maximum: 250 }
  validates :icon, presence: true, length: { maximum: 250 }, format: { with: %r{\Ahttps?://.+\z},
                                                                       message: 'only accepts urls' }
end
