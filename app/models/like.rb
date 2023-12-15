class Like < ApplicationRecord
  belongs_to :day
  belongs_to :user
  validates_uniqueness_of :day_id, scope: :user_id
end
