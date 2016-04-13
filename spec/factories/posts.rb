FactoryGirl.define do
  factory :post do
    content "MyText"
    owner {User.new(name: "owner")}
  end

end
