require 'rails_helper'

RSpec.describe "websites/index", type: :view do
  before(:each) do
    assign(:websites, [
      Website.create!(
        :title => "Title",
        :image_name => "MyText",
        :version => "Version"
      ),
      Website.create!(
        :title => "Title",
        :image_name => "MyText",
        :version => "Version"
      )
    ])
  end

  it "renders a list of websites" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Version".to_s, :count => 2
  end
end
