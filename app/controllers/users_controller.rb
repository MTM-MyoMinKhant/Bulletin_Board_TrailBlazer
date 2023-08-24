class UsersController < ApplicationController

  def index
    run User::Operation::Index , current_user: current_user , q: User.ransack(params[:q]) do |result|
      @auth = result[:current_user]
      @user_lists = result[:users]
      @q = User.ransack(params[:q])
    end
	end 

  def new
    @auth = current_user
    run User::Operation::Create::Present , user: params[:user]
  end
  
  def create_user
    byebug
    @test = "success"
    run User::Operation::Create , current_user: current_user do |result|
      byebug
      redirect_to confirm_users_path(user: result[:model][:id])
    end
  end

  def new_confirm
    @auth = current_user 
    run User::Operation::Confirm::Present, id: params[:user] do |result|
      @result = result[:user]
      @user = @result[0]
    end
  end 

  def delete
    byebug
    run User::Operation::Delete
    @test = "success"
  end

  def show
    @auth = current_user
    @user = User.find(params[:id])
  end

  def edit
    @auth = current_user
    @user = User.find(params[:id])
  end
  
  def password_change
    @auth = current_user
  end

  def soft_deletew
    @result = run User::Operation::SoftDelete, current_user: current_user
    if @result.success?
      return redirect_to users_path
    end
  end
end
