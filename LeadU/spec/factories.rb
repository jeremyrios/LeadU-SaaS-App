FactoryGirl.define do
    factory :user do
      first_name 'Rios'
      last_name  'Isdick'
      email 'riosisdick@example.com'
      password '1234567'
      password_confirmation '1234567'
    end
    
    factory :admin do
      admin true
    end
end 