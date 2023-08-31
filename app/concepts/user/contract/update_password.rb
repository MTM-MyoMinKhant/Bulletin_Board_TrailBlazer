module User::Contract
  class UpdatePassword < Reform::Form
    property :old_password, virtual: true
    property :password
    property :password_confirmation
    
    validates :old_password, presence: true
    validates :password, presence: true , confirmation: true
    validates :password_confirmation, presence: true
  end
end
