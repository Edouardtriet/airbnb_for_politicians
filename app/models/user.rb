class User < ApplicationRecord
  has_many :listings, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :profile_picture
  attr_accessor :remove_profile_picture
  validates :name, presence: true

  before_save :check_remove_profile_picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def check_remove_profile_picture
    self.profile_picture.purge if self.remove_profile_picture == '1'
  end
end
