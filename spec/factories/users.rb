FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    name "Jon Snow"
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

#   factory :admin_user class: "site_admin" do
#     name "Admin User"
#     email { generate :email }
#     password "asdfasdf"
#     password_confirmation "asdfasdf"
#     roles "site_admin"
#   end

#   factory :non_authorized_user, class: "User" do
#     name "Non Authorized"
#     email { generate :email }
#     password "asdfasdf"
#     password_confirmation "asdfasdf"
#     roles
#   end
end