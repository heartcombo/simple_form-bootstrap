class Comment < ActiveRecord::Base
  attr_accessible :name, :body

  belongs_to :article

  validates_presence_of :name, :body, :article
end
