FactoryGirl.define do
  factory :admin_user do
    email 'adminuser@example.com'
    password "password"
    password_confirmation "password"
    first_name "Jon"
    last_name "Snow"
    username "adminuser"
  end
end