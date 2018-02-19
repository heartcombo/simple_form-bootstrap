class Examples::BaseController < ApplicationController

  TYPES = [:vertical, :horizontal, :inline]

  private

    def user_params
      params.require(:user).permit(:email, :password, :file, :active, :sex, choises: [])
    end
end
