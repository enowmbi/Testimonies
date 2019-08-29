








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe Testimony, type: :model do
  it "should have a valid factory" do
    testimony = FactoryGirl.build(:testimony)
    expect(testimony).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of user" do
  				testimony = FactoryGirl.build(:testimony, user: nil)
  				expect(testimony).not_to be_valid
  				expect(testimony.errors[:user]).to be_present
  			end
  		
  	

  	
  		
  			
	  		
		  		it "should ensure the uniqueness of title" do
		      	testimony = FactoryGirl.create(:testimony)
						
		      		new_testimony = FactoryGirl.build(:testimony, title: testimony.title)
		      	
		      	expect(new_testimony).not_to be_valid
		      	expect(new_testimony.errors[:title]).to be_present
		    	end
		    
		  
  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a user" do
	  			user = FactoryGirl.create(:user)
	  			testimony = FactoryGirl.build(:testimony, user: user)
	  			expect(testimony.user).to eq user
	  		end
	  	

	  	
	  		it "should allow multiple assignments" do
	  			testimony = FactoryGirl.create(:testimony)

	  			3.times.each do |n|
	  				assignment = FactoryGirl.create(:assignment)
	  				testimony.assignments << assignment
	  				testimony_assignments = testimony.assignments
	  				expect(testimony_assignments.count).to eq n.next
	  				expect(testimony_assignments).to include assignment
	  			end
	  		end

	  	
	  		it "should allow multiple tags" do
	  			testimony = FactoryGirl.create(:testimony)

	  			3.times.each do |n|
	  				tag = FactoryGirl.create(:tag)
	  				testimony.tags << tag
	  				testimony_tags = testimony.tags
	  				expect(testimony_tags.count).to eq n.next
	  				expect(testimony_tags).to include tag
	  			end
	  		end

	  	
	  end
	

	
		describe "Graceful Destroyal" do
			

			
				
				it "should destroy the associated assignments when deleted" do
					testimony = FactoryGirl.create(:testimony)
					testimony.assignments.create(FactoryGirl.attributes_for(:assignment))

					expect{ testimony.destroy }.to change(Assignment, :count).by -1
				end
			
				
		end
		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
