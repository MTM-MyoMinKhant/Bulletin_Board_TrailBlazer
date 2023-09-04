module User::Operation
  class SoftDelete < Trailblazer::Operation
    step Model(User , :find_by)
    step :delete_user

    def delete_user(options , params) 
      options[:model][:deleted_user_id] = options[:params][:deleted_user_id]
      options[:model][:deleted_at] = Time.now
      options[:model].save
    end
  end
end
