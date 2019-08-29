FactoryBot.define do 
  factory :tag do 
    sequence(:name){|n| "Tag #{n}"}
    description {"Description of #{name}"}
  end
end
