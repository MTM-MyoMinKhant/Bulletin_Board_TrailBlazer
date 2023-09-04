module User::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User , :new)
      step Contract::Build(constant: User::Contract::Create)
    end

    class Confirm < Trailblazer::Operation
      step :find_data

      def find_data(options , params)
        options['user'] = User.where(id: options[:id])
      end
    end

    step Nested(Present)
    step :assign_create_user!
    step Contract::Validate(key: :user)
    step Contract::Persist()

    def assign_create_user!(options , **)
      options[:params][:user][:role] = 1
      options[:params][:user][:create_user_id] = options[:current_user][:id]
      options[:params][:user][:updated_user_id] = options[:current_user][:id]
    end
  end
end
