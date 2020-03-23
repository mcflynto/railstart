class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :activate]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to(root_path, notice: 'Registration successfull. Check your email for activation instructions.')
    else
      render action: 'new'
    end
  end

  def update
    @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to(@user, notice: 'User was successfully updated.')
      else
        render action: 'edit'
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(root_path)
  end

  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      redirect_to(login_path, notice: 'User was successfully activated.')
    else
      not_authenticated
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
