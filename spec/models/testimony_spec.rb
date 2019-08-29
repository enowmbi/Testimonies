require 'rails_helper'

RSpec.describe Testimony, type: :model do
  it "should have a valid factory" do
    testimony = FactoryBot.build(:testimony)
    expect(testimony).to be_valid
  end

  describe "Validators" do

    it "should ensure the presence of user" do
      testimony = FactoryBot.build(:testimony, user: nil)
      expect(testimony).not_to be_valid
      expect(testimony.errors[:user]).to be_present
    end

    it "should ensure the uniqueness of title" do
      testimony = FactoryBot.create(:testimony)

      new_testimony = FactoryBot.build(:testimony, title: testimony.title)

      expect(new_testimony).not_to be_valid
      expect(new_testimony.errors[:title]).to be_present
    end

  end



  describe "Associations" do

    it "should belong to a user" do
      user = FactoryBot.create(:user)
      testimony = FactoryBot.build(:testimony, user: user)
      expect(testimony.user).to eq user
    end



    it "should allow multiple assignments" do
      testimony = FactoryBot.create(:testimony)

      3.times.each do |n|
        assignment = FactoryBot.create(:assignment)
        testimony.assignments << assignment
        testimony_assignments = testimony.assignments
        expect(testimony_assignments.count).to eq n.next
        expect(testimony_assignments).to include assignment
      end
    end


    it "should allow multiple tags" do
      testimony = FactoryBot.create(:testimony)

      3.times.each do |n|
        tag = FactoryBot.create(:tag)
        testimony.tags << tag
        testimony_tags = testimony.tags
        expect(testimony_tags.count).to eq n.next
        expect(testimony_tags).to include tag
      end
    end

  end



  describe "Graceful Destroyal" do

    it "should destroy the associated assignments when deleted" do
      user = FactoryBot.create(:user)
      testimony = FactoryBot.create(:testimony,user: user)
      FactoryBot.create(:assignment,testimony: testimony)
      expect{ testimony.destroy }.to change(Assignment, :count).by(-1)
    end

  end


  # describe "Behavior" do
    # pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  # end
end
