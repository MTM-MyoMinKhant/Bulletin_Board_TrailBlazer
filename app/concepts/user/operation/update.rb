module User::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :find_by)
      step Contract::Build(constant: User::Contract::Update)
    end
    step Nested(Present)
    step Contract::Validate(key: :user)
    step :assign_create_user!
    step Contract::Persist()

    def assign_create_user!(options , **)
      options[:params][:user][:updated_user_id] = options[:current_user][:id]
    end
  end
end
