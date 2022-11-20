class Comment < ApplicationRecord
  belongs_to :movie
  has_one :movie

  validates :content, :movie, presence: true
end
