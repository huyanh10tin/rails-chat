class UsersController < ApplicationController
  before_action :require_login, only: [:index]

  def new
    @user = User.new
  end

  def search
    @users = User.autocomplete_by_name(params[:q])

    respond_to do |format|
      format.json
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Welcome to Railsbook #{@user.name}"
      login(@user)
      UserMailer.welcome_email(@user).deliver_now
      redirect_to root_path
    else
      flash[:success] = "Could not create."
      render 'new'
    end
  end

  def profile
    @user = User.find(params[:id])
    @posts = @user.timeline_posts
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar)
  end
end
