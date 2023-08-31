module User::Contract
  class Update < Reform::Form
    property :name
    property :email
    property :phone
    property :address
    property :avatar
    property :dob, format: :date  
    property :updated_user_id

    validates :name, presence: true 
    validates :email, presence: true
    validates :phone, presence: true
    validates :dob, presence: true 
    validates :address, presence: true 
  end
end
