require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "should have a valid factory" do
    tag = FactoryBot.build(:tag)
    expect(tag).to be_valid
  end

  describe "Validators" do

    it "should ensure the presence of name" do
      tag = FactoryBot.build(:tag, name: nil)
      expect(tag).not_to be_valid
      expect(tag.errors[:name]).to be_present
    end

    it "should ensure the uniqueness of name" do
      tag = FactoryBot.create(:tag)

      new_tag = FactoryBot.build(:tag, name: tag.name)

      expect(new_tag).not_to be_valid
      expect(new_tag.errors[:name]).to be_present
    end

  end



  describe "Associations" do

    it "should allow multiple assignments" do
      tag = FactoryBot.create(:tag)

      3.times.each do |n|
        assignment = FactoryBot.create(:assignment)
        tag.assignments << assignment
        tag_assignments = tag.assignments
        expect(tag_assignments.count).to eq n.next
        expect(tag_assignments).to include assignment
      end
    end


    it "should allow multiple testimonies" do
      tag = FactoryBot.create(:tag)

      3.times.each do |n|
        testimony = FactoryBot.create(:testimony)
        tag.testimonies << testimony
        tag_testimonies = tag.testimonies
        expect(tag_testimonies.count).to eq n.next
        expect(tag_testimonies).to include testimony
      end
    end

  end



  describe "Graceful Destroyal" do

    it "should destroy the associated assignments when deleted" do
      tag = FactoryBot.create(:tag)
      assignment = FactoryBot.create(:assignment,tag: tag)
  
      expect{ tag.destroy }.to change(Assignment, :count).by(-1)
    end

  end


  # describe "Behavior" do
    # pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  # end
end
