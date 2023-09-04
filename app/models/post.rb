class Post < ApplicationRecord
  belongs_to :create_user, class_name: 'User', optional: true
  belongs_to :updated_user, class_name: 'User', optional: true
  belongs_to :deleted_user, class_name: 'User', optional: true

  validates :title, presence: true
  validates :description, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["title", "description"] # Add any other attributes you want to make searchable
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |post|
        csv << post.attributes.values_at(*column_names)
      end
    end
  end
end
