module Post::Contract
  class Update < Reform::Form
    property :title
    property :description
    property :status
    property :create_user_id
    property :updated_user_id

    validates :title, presence: true
    validates :description, presence: true
  end
end
