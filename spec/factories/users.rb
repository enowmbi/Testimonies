FactoryBot.define do 
  factory :user do 
    sequence(:email){|n| "john_doe#{n}@example.com"}
    password {"password"}
    name {"John Doe"}
    address {"address 1,city 1,Chicago,USA"}
    city {"Chicago"}
    state {"Ilinois"}
    country
    phone {"237 677941484"}
    is_admin { true}
  end
end
