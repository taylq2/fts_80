class UsersController < Devise::RegistrationsController
  attr_reader :user, :users

  before_action :authenticate_user!, only: %i(index edit update destroy)
  before_action :find_user, only: %i(show edit update destroy)

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    user = User.new user_params
    if user.save
      flash[:info] = t "controller.welcome"
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if user.update_attributes user_params
      flash[:success] = t "controller.updated"
      redirect_to user
    else
      render :edit
    end
  end

  def destroy
    user.destroy
    flash[:success] = t "controller.deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def find_user
    @user = User.find_by id: params[:id]

    return if user
    flash[:danger] = t "controller.invalid"
    redirect_to users_url
  end
end
