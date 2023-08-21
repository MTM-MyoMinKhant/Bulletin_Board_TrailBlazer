module Post::Contract
  class SoftDelete < Reform::Form
    property :deleted_user_id
    property :deleted_at
  end
end
