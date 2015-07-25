class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :format => URI::regexp(%w(http https))
  validates :title, presence: true
end
