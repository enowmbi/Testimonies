require 'rails_helper'

RSpec.describe "testimonies/index", type: :view do
  before(:each) do
    assign(:testimonies, [
      Testimony.create!(
        :title => "Title",
        :description => "MyText",
        :user => nil
      ),
      Testimony.create!(
        :title => "Title",
        :description => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of testimonies" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
