FactoryBot.define do
  factory :listing do
    name { "MyString" }
    type { "" }
    price { "9.99" }
    location { "MyString" }
    availability_start { "2025-02-27 12:55:52" }
    availability_end { "2025-02-27 12:55:52" }
    picture { "MyString" }
    user { nil }
  end
end
