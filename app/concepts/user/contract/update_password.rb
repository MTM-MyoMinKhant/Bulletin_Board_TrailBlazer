module User::Contract
  class UpdatePassword < Reform::Form
    property :old_password, virtual: true
    property :password
    property :password_confirmation
    
    validates :old_password, presence: true
    validate :compare_old?
    validates :password, presence: true , confirmation: true
    validates :password_confirmation, presence: true

    private
      def compare_old?
        @compare = @fields["old_password"]
        unless @model.valid_password?(@compare)
          errors.add(:old_password , "Comparison failed")
        end
      end
  end
end
