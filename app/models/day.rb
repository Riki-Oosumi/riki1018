class Day < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    validates :start_time, presence: true
    mount_uploader :image, ImageUploader
end
