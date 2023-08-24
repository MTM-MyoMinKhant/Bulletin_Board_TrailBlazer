module User::Operation
  class Confirm < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step :find_data

      def find_data(options , params)
        byebug
        options['user'] = User.where(id: options[:id])
        @test = "success"
      end
    end
  end
end
