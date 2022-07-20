class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :mentors, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }
  validates :email, presence: true, length: { maximum: 250 }

  def generate_jwt
    JWT.encode({ id:, exp: 1.month.from_now.to_i }, Rails.application.secret_key_base)
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
end
