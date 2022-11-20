class Comment < ApplicationRecord
  after_update :create_log, if: Proc.new {|comment|comment.aprove} 
  
  belongs_to :movie

  has_one :log, dependent: :destroy

  validates :content, :movie, presence: true
  scope :not_aproved, -> {where(aprove: false)}
  scope :aproved, -> { where(aprove: true) }

  def create_log
    Log.create(comment:self)
  end
end
