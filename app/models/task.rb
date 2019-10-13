class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 30 }
  validates :details, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true
end
