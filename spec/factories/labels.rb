include RandomData

FactoryGirl.define do
    factory :label do
        name RandomData.random_sentence
        labelable_id
        labelable_type
    end
end