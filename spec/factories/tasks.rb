FactoryBot.define do
  factory :task do
    employee { nil }
    team { nil }
    type { "" }
    title { "MyString" }
  end
end
