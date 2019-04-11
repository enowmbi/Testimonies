require 'rails_helper'

RSpec.describe "testimonies/new", type: :view do
  before(:each) do
    assign(:testimony, Testimony.new(
      :title => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders new testimony form" do
    render

    assert_select "form[action=?][method=?]", testimonies_path, "post" do

      assert_select "input[name=?]", "testimony[title]"

      assert_select "textarea[name=?]", "testimony[description]"

      assert_select "input[name=?]", "testimony[user_id]"
    end
  end
end
