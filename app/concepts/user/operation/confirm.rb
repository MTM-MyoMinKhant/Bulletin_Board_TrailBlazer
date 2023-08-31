module User::Operation
  class Confirm < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step :find_data

      def find_data(options , params)
        options['user'] = User.where(id: options[:id])
      end
    end
  end
end
