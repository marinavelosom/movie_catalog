class Comment < ApplicationRecord
  belongs_to :movie

  validates :content, :movie, presence: true
  default_scope { where(aprove: false) }
end
