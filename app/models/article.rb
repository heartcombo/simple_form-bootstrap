class Article < ActiveRecord::Base
  attr_accessible :name, :content, :'content_type'

  has_many :comments

  validates_presence_of :name
end
