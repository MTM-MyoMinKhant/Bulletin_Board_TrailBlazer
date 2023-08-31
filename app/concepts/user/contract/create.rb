require 'reform/form/validation/unique_validator'
module User::Contract
  class Create < Reform::Form
    property :name
    property :email
    property :password
    property :password_confirmation
    property :role
    property :phone
    property :address
    property :avatar
    property :dob, format: :date
    property :create_user_id
    property :updated_user_id

    validates :name, presence: true 
    validates :email, presence: true , unique: true
    validates :password , presence: true , confirmation: true 
    validates :password_confirmation, presence: true
    validates :phone, presence: true
    validates :dob, presence: true 
    validates :address, presence: true 
  end
end
