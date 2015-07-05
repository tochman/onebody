FactoryGirl.define do
  factory :prayer do
    person
    prayer_request
    comment 'Will pray for you'
    created_at Date.today
  end
end