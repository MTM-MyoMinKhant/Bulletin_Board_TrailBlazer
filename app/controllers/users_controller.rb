class UsersController < ApplicationController

  def index
    @auth = current_user
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
    @auth = current_user
    @result = run User::Operation::Create , current_user: current_user
    if @result.success?
      redirect_to confirm_users_path(user: result[:model][:id])
    else
      if params[:user][:dob].present?
        @test = Date.parse(params[:user][:dob]) 
      elsif params[:user][:dob] == ""
        @test = "mm/dd/yy"
      else 
        @test = nil
      end
      render :new, status: :unprocessable_entity
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
    @result = run User::Operation::Delete
    if @result.success?
      redirect_to users_path
    end
  end

  def show
    @auth = current_user
    @user = User.find(params[:id])
  end

  def edit
    @auth = current_user
    run User::Operation::Update::Present
  end

  def update
    @auth = current_user
    @result = run User::Operation::Update , current_user: current_user

    if @result.success?
      redirect_to users_path, flash: {success: "User Successfully Updated"}
    else
      if params[:user][:dob].present?
        @test = Date.parse(params[:user][:dob]) 
      elsif params[:user][:dob] == ""
        @test = "mm/dd/yy"
      else 
        @test = nil
      end 
      render :edit, status: :unprocessable_entity
    end
  end
  
  def password_change
    @auth = current_user
    run User::Operation::UpdatePassword::Present
  end

  def password_upload
    @auth = current_user
    @result = run User::Operation::UpdatePassword  

    if @result.success?
      redirect_to users_path, flash: {success: "Account Password Sucessful changes"}
    else
      render :password_change, status: :unprocessable_entity
    end
  end

  def soft_delete
    @result = run User::Operation::SoftDelete, current_user: current_user
    if @result.success?
      return redirect_to users_path, flash: {success: "User Successfully Deleted"}
    end
  end
end
