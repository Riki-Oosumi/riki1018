class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :days, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_days, through: :likes, source: :day
  has_many :comments, dependent: :destroy
  def already_liked?(day)
    self.likes.exists?(day_id: day.id)
  end
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
end
