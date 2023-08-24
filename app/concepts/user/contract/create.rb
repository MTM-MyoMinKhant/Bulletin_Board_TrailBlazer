module User::Contract
  class Create < Reform::Form
    property :name
    property :email
    property :password
    property :role
    property :phone
    property :address
    property :avatar
    property :dob
    property :create_user_id
    property :updated_user_id

    validates :name, presence: true 
    validates :email, presence: true
    validates :password , presence: true 
    validates :phone, presence: true
    validates :dob, presence: true 
    validates :address, presence: true 
  end
end
