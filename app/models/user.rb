class User < ActiveRecord::Base
  has_many :itineraries

  has_many :itineraries_users, dependent: :destroy
  has_many :invitations, through: :itineraries_users, source: :itinerary

  has_many :users_waypoints, dependent: :destroy
  has_many :waypoints, through: :users_waypoints

  has_many :reviews, as: :reviewable

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
