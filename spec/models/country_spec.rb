require 'rails_helper'

RSpec.describe Country, type: :model do
  it "should have a valid factory" do
    country = FactoryBot.build(:country)
    expect(country).to be_valid
  end

  describe "Validators" do
    it "ensures the presence of name" do 
      country = FactoryBot.build(:country,name: nil)
      expect(country).not_to be_valid
    end
  end

  describe "Associations" do
    it "should allow multiple users" do
      country = FactoryBot.create(:country)

      3.times.each do |n|
        user = FactoryBot.create(:user)
        country.users << user
        country_users = country.users
        expect(country_users.count).to eq n.next
        expect(country_users).to include user
      end
    end

  end

  describe "Graceful Destroyal" do

    it "should destroy the associated users when deleted" do
      country = FactoryBot.create(:country)
      country.users.create(FactoryBot.attributes_for(:user))

      expect{ country.destroy }.to change(User, :count).by(-1)

    end

  end


  # describe "Behavior" do
    # pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  # end
end
