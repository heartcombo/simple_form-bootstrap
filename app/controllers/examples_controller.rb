class ExamplesController < ApplicationController
  def index
    @user_basic = User.new
    @user_horizontal = User.new
    @user_inline = User.new
  end

  def create_basic
    @user_basic = User.new(user_basic_params)

    if @user_basic.valid?
      redirect_to root_url, notice: 'User is valid'
    else
      @user_horizontal = User.new
      @user_inline = User.new

      render :index
    end
  end

  def create_horizontal
    @user_horizontal = User.new(user_horizontal_params)

    if @user_horizontal.valid?
      redirect_to root_url, notice: 'User is valid'
    else
      @user_basic = User.new
      @user_inline = User.new

      render :index
    end
  end

  def create_inline
    @user_inline = User.new(user_inline_params)

    if @user_inline.valid?
      redirect_to root_url, notice: 'User is valid'
    else
      @user_basic = User.new
      @user_horizontal = User.new

      render :index
    end
  end

  private

  def user_basic_params
    params.require(:user_basic).permit(:email, :password, :file, :active, :sex, choises: [])
  end

  def user_horizontal_params
    params.require(:user_horizontal).permit(:email, :password, :file, :active, :sex, choises: [])
  end

  def user_inline_params
    params.require(:user_inline).permit(:email, :password, :file, :active, :sex, choises: [])
  end
end
