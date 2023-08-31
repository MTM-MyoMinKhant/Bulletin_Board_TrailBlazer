module User::Operation
  class UpdatePassword < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User , :find_by)
      step Contract::Build(constant: User::Contract::UpdatePassword)

    end
    step Nested(Present)
    step :compare_old!
    fail :output_error
    step Contract::Validate(key: :user)
    step Contract::Persist()

    def compare_old!(options , **)
      @user = options[:model]
      @compare = options[:params][:user][:old_password]
      @user.valid_password?(@compare)
    end

    def output_error(options , errors: , **)
      errors[:old_password] = ["This account should be match with your acc password"]
    end
    
  end
end
