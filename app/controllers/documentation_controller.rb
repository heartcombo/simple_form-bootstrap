class DocumentationController < ApplicationController
  def index
    @user_basic = User.new
  end
end
