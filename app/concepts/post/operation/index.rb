module Post::Operation
  class Index < Trailblazer::Operation
    step :get_posts_list

    def get_posts_list(options, params)
      @q = options[:q]
      @user = params[:current_user]    
      if @user.role == 0
        options['posts'] = @q.result.where(deleted_at: nil).paginate(:page => params[:params][:page], :per_page => 5)
        options['for_csv'] = Post.where(deleted_at: nil)
      elsif @user.role == 1
        options['posts'] = @q.result.where(create_user_id: @user.id , deleted_at: nil).paginate(:page => params[:page], :per_page => 5)
      end
    end

  end
end
