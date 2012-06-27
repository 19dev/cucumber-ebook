FactoryGirl.define do
  factory :message do |f|
    f.association :user
    f.content 'Test message content'
  end
end


