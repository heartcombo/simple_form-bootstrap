class Article < ActiveRecord::Base
  has_many :comments
  serialize :content_type

  validates_presence_of :name
end
