module User::Operation
  class Delete < Trailblazer::Operation
    step :destroy

    def destroy(options , **)
      @id = options[:params][:id]
      @user = User.find(@id)
      @user.destroy
    end
  end
end
