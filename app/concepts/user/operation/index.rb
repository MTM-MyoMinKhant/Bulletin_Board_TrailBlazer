module User::Operation
  class Index < Trailblazer::Operation
    step :get_users_list

    def get_users_list(options , params)
      @q = options[:q]
      @user = params[:current_user]
      options['users'] = @q.result.where(deleted_at: nil).paginate(:page => params[:params][:page], :per_page => 5)
    end 
  end
end
