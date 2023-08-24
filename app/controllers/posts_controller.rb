class PostsController < ApplicationController 
  require 'csv'
  def index
    run Post::Operation::Index , current_user: current_user , q: Post.ransack(params[:q]) do |result|
      @auth = result[:current_user]
      @post_lists = result[:posts]
      @for_csv = result[:for_csv]
      @q = Post.ransack(params[:q])
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
      redirect_to posts_path
    else
      render :new , status: :unprocessable_entity
    end
  end

  def edit
    @auth = current_user
    @post = Post.find(params[:id])
  end

  def edit_confirm
    @auth = current_user
  end

  def csv
    @auth = current_user   
  end

  def csv_upload
    byebug
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
        redirect_to posts_path, notice: "File Upload Successfully"
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
       redirect_to posts_path
    end
  end
end
