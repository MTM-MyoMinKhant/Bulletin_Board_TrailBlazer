# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
User.create ([
  { 
    name: "user4",
    email: "user4@gmail.com",
    password: "1234qwer",
    role: 1,
    phone: 9455886734,
    address: "China Town",
    dob: "4.12.2000", 
    create_user_id: 2,
    updated_user_id: 2
  }
])

Post.create ([
  {
    title: "Title 4",
    description: "This is the description for Title 4",
    status: "active",
    create_user_id: 2,
    updated_user_id: 2
  }
])
