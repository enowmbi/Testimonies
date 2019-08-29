FactoryBot.define do 
  factory :testimony do 
    sequence(:title) {|n| "Testimony Title #{n}"}
    description {"Description of #{title}"}
    user
  end
end
