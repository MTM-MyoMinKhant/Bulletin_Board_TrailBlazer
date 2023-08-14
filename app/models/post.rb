class Post < ApplicationRecord
  belongs_to :create_user, class_name: 'User', optional: true
  belongs_to :updated_user, class_name: 'User', optional: true
  belongs_to :deleted_user, class_name: 'User', optional: true

  validates :title, presence: true
  validates :description, presence: true

  
end
