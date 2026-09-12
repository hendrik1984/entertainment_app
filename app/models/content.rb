class Content < ApplicationRecord
  has_one_attached :video

  validates :title, presence: true
  validates :description, presence: true
end
