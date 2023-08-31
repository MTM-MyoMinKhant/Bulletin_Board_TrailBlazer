module Post::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Post, :find_by)
      step Contract::Build(constant: Post::Contract::Update)
    end

    class Confirm < Trailblazer::Operation
      step Model(Post , :find_by)
      step Contract::Build(constant: Post::Contract::Update)
      step Contract::Validate(key: :post)
      step :assign_update_post!
      step Contract::Persist()

      def assign_update_post!(options , **)
        options[:params][:post][:updated_user_id] = options[:current_user][:id]
      end
    end

    step Nested(Present)
    step Contract::Validate(key: :post)
    
  end
end
