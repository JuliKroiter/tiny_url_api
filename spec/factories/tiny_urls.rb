FactoryBot.define do
  factory :tiny_url do
    url { 'MyString' }
    short_url { 'MyString' }
    clicked { 0 }
  end
end
