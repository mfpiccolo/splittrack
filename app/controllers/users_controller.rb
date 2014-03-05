class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:autocomplete_user_name]
  before_action :correct_user?, except: [:index, :autocomplete_user_name]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to(@user)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def autocomplete_user_name
    users = User.select([:name]).where("name LIKE ?", "%#{params[:name]}%")
    result = users.collect do |u|
      { value: u.name }
    end
    render json: result
  end

  private

  def user_params
    params.require(:user).permit(
      :provider, :uid, :name, :email
    )
  end
end
