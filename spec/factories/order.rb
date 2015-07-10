FactoryGirl.define do
  factory :order do |f|
    f.status      "requested"
    f.delivery    "test address"
    f.notes       "notes"
    f.user_id     "1"
  end
end
