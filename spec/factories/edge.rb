FactoryGirl.define do
  factory :edge do
    sequence :name do |n|
      "edge #{n}"
    end
    sequence :description do |n|
      "desc #{n}"
    end

    category

    after(:create) do |edge, evaluator|
      create_list(:requirement, 2, edge: edge)
    end
  end

  factory :category do
    name 'category'
  end

  factory :requirement do
    name 'req'
    value 'val'
    mode 'mode'

    edge
  end
end
