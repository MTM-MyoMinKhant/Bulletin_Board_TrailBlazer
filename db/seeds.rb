# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
User.create ([
  { 
    name: "admin",
    email: "admin@gmail.com",
    password: "1234qwer",
    role: 0,
    phone: 912343567890,
    address: "East Blue",
    dob: "3.6.1999", 
    create_user_id: 1,
    updated_user_id: 1
  },
  { 
    name: "user",
    email: "user@gmail.com",
    password: "1234qwer",
    role: 1,
    phone: 9556666640,
    address: "China Town",
    dob: "4.12.2000", 
    create_user_id: 1,
    updated_user_id: 1
  }
])

Post.create ([
  {
    title: "Title",
    description: "This is the description for Title",
    status: "active",
    create_user_id: 1,
    updated_user_id: 1
  },
  {
    title: "Title 1",
    description: "This is the description for Title 1",
    status: "active",
    create_user_id: 1,
    updated_user_id: 1
  },
  {
    title: "Title 2",
    description: "This is the description for Title 2",
    status: "active",
    create_user_id: 2,
    updated_user_id: 2
  }
])
