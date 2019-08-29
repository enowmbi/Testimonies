require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have a valid factory" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  describe "Validators" do

  			it "should ensure the presence of email" do
  				user = FactoryBot.build(:user, email: nil)
  				expect(user).not_to be_valid
  				expect(user.errors[:email]).to be_present
  			end

		  		it "should ensure the uniqueness of email" do
		      	user = FactoryBot.create(:user)

            new_user = FactoryBot.build(:user, email: user.email)

		      	expect(new_user).not_to be_valid
		      	expect(new_user.errors[:email]).to be_present
		    	end


  end

	  describe "Associations" do

	  		it "should belong to a country" do
	  			country = FactoryBot.create(:country)
	  			user = FactoryBot.build(:user, country: country)
	  			expect(user.country).to eq country
	  		end

	  end


  # describe "Behavior" do
  	# pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  # end
end
