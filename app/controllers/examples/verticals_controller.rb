class Examples::VerticalsController < Examples::BaseController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      redirect_to new_examples_vertical_path, flash: { success: 'Form is valid' }
    else
      render :new
    end
  end
end
