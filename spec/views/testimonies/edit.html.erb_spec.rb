require 'rails_helper'

RSpec.describe "testimonies/edit", type: :view do
  before(:each) do
    @testimony = assign(:testimony, Testimony.create!(
      :title => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit testimony form" do
    render

    assert_select "form[action=?][method=?]", testimony_path(@testimony), "post" do

      assert_select "input[name=?]", "testimony[title]"

      assert_select "textarea[name=?]", "testimony[description]"

      assert_select "input[name=?]", "testimony[user_id]"
    end
  end
end
