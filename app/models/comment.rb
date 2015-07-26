class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  # validates :comment, length: { maximum: 500 }
end
