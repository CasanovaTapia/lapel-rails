FactoryGirl.define do
  factory :item do |f|
    f.name "test string"
    f.price 10.5
    f.cost 1.5
    f.brand "test brand"
    f.desc "test description"
    f.category "shirt"
    f.order nil
  end

end
