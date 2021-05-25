class Article < ApplicationRecord
  
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  scope :search_by_starts_with, -> (title) { where("title like ?", "#{title}%")}
end