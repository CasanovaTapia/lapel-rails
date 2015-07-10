FactoryGirl.define do
  factory :user do |f|
    f.name        "test user"
    f.email       "test@example.com"
    f.password    "helloworld"
    f.phone       "0000000000"
    f.address     "test address"
    f.role        nil
  end

  factory :liaison do |f|
    f.name        "liaison"
    f.email       "liaison@example.com"
    f.password    "helloworld"
    f.phone       "0000000000"
    f.address     "test address"
    f.role        "liaison"
  end

  factory :client do |f|
    f.name        "client"
    f.email       "test@example.com"
    f.password    "helloworld"
    f.phone       "0000000000"
    f.address     "test address"
    f.role        "client"
  end
end
