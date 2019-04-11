require 'rails_helper'

RSpec.describe "assignments/edit", type: :view do
  before(:each) do
    @assignment = assign(:assignment, Assignment.create!(
      :tag => nil,
      :testimony => nil
    ))
  end

  it "renders the edit assignment form" do
    render

    assert_select "form[action=?][method=?]", assignment_path(@assignment), "post" do

      assert_select "input[name=?]", "assignment[tag_id]"

      assert_select "input[name=?]", "assignment[testimony_id]"
    end
  end
end
