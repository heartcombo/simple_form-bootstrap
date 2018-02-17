class User < ApplicationRecord
  validates_presence_of :email, :password
end
