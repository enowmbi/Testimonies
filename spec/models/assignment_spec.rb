








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe Assignment, type: :model do
  it "should have a valid factory" do
    assignment = FactoryGirl.build(:assignment)
    expect(assignment).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of tag" do
  				assignment = FactoryGirl.build(:assignment, tag: nil)
  				expect(assignment).not_to be_valid
  				expect(assignment.errors[:tag]).to be_present
  			end
  		
  	

  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a tag" do
	  			tag = FactoryGirl.create(:tag)
	  			assignment = FactoryGirl.build(:assignment, tag: tag)
	  			expect(assignment.tag).to eq tag
	  		end
	  	
	  		it "should belong to a testimony" do
	  			testimony = FactoryGirl.create(:testimony)
	  			assignment = FactoryGirl.build(:assignment, testimony: testimony)
	  			expect(assignment.testimony).to eq testimony
	  		end
	  	

	  	
	  end
	

		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
