FactoryGirl.define do
  factory :user do |f|
    f.name        "Test User"
    f.email       "test@example.com"
    f.password    "helloworld"
    f.phone       "0000000000"
    f.address     "Test Address"
  end
end
