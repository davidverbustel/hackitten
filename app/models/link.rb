class Link < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  validates :url, :format => URI::regexp(%w(http https))
  validates :title, presence: true
end
