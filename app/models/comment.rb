class Comment < ApplicationRecord
  belongs_to :movie

  validates :content, :movie, presence: true
  scope :not_aproved, -> {where(aprove: false)}
  scope :aproved, -> { where(aprove: true) }
end
