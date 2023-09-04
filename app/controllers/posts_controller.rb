class PostsController < ApplicationController 
  require 'csv'
  def index
    run Post::Operation::Index , current_user: current_user , q: Post.ransack(params[:q]) do |result|
      @auth = result[:current_user]
      @post_lists = result[:posts]
      @for_csv = result[:for_csv]
      @q = Post.ransack(params[:q])
      
      respond_to do |format|
        format.html
        format.csv { send_data Post.to_csv , filename: "custom.csv"}
      end
    end
  end

  def new
    @auth = current_user
    run Post::Operation::Create::Present
  end

  def create 
    @auth = current_user
    @result = run Post::Operation::Create , current_user: current_user
    
    if @result.success?
      redirect_to posts_path , flash: {success: "Post Successfully Created"}
    else
      render :new , status: :unprocessable_entity
    end
  end

  def edit
    @auth = current_user
    run Post::Operation::Update::Present
  end

  def update
    @auth = current_user
    @result = run Post::Operation::Update , current_user: current_user

    if @result.success?
      redirect_to edit_confirm_post_path(post: {id: params[:id] , title: params[:post][:title] , description: params[:post][:description] , status: params[:post][:status]})
    else
      render :edit , status: :unprocessable_entity
    end
  end

  def edit_confirm
    @data = params[:post]
    @status = @data[:status]
    if @status.to_i == 1 
      @check = true
    else 
      @check = false
    end
    @post = Post.find(params[:id])
    @auth = current_user

  end

  def edit_data
    @auth = current_user
    run Post::Operation::Update::Confirm , current_user: current_user do |result|
      redirect_to posts_path , flash: {success: "Post Successfully Updated"}
    end
  end

  def csv
    @auth = current_user   
  end

  def csv_upload
    @file = params[:file]  
    @test = 'Success'
    if @file == nil
       redirect_to csv_posts_path, notice: "Need to add CSV File"
    elsif @file.content_type == "text/csv"
      file = File.open(@file)
      csv = CSV.parse(file , headers: true)
      if csv.headers == ["title", "description", "status", "create_user_id", "updated_user_id"]
        csv.each do |row|
          post_hash = Hash.new
          post_hash[:title] = row["title"]  
          post_hash[:description] = row["description"]
          post_hash[:status] = row["status"]
          post_hash[:create_user_id] = row["create_user_id"]
          post_hash[:updated_user_id] = row["updated_user_id"] 
          Post.create(post_hash)
        end
        redirect_to posts_path, flash: {success: "File Upload Successfully"}
      else 
        redirect_to csv_posts_path, notice: "Columns are not the same"
      end
    else
      redirect_to csv_posts_path, notice: "Only CSV file stupid"
    end
  end

  def soft_delete
    @result = Post::Operation::SoftDelete.wtf?(current_user: current_user , params: {id: params[:id] })
    if @result.success?
       redirect_to posts_path , flash: {success: "Post Successfully Deleted"}
    end
  end
end
