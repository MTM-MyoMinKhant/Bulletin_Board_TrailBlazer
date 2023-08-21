module Post::Operation
  class SoftDelete < Trailblazer::Operation
    step :find_post
    step :soft_delete_post

    def find_post (options , params)
      options['post'] = Post.where(id: options[:params][:id])
    end

    def soft_delete_post(options, params)
      delete = params[:post].first
      delete.deleted_user_id = options[:current_user][:id]
      delete.deleted_at = Time.now
      delete.save

    end
  end
end
