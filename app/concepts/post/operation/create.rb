module Post::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Post , :new)
      step Contract::Build(constant: Post::Contract::Create)
    end
    step Nested(Present)
    step :add_new_data!
    step Contract::Validate(key: :post)
    step Contract::Persist()
    step :fetch_id

    def add_new_data! (options , **)
      options[:params][:post][:status] = 1 
      options[:params][:post][:create_user_id] = options[:current_user][:id]
      options[:params][:post][:updated_user_id] = options[:current_user][:id]
    end

    def fetch_id(options , **)
      byebug
      @test = 'success'
    end
  end
end
