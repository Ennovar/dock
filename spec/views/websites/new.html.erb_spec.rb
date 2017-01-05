require 'rails_helper'

RSpec.describe "websites/new", type: :view do
  before(:each) do
    assign(:website, Website.new(
      :title => "MyString",
      :image_name => "MyText",
      :version => "MyString"
    ))
  end

  it "renders new website form" do
    render

    assert_select "form[action=?][method=?]", websites_path, "post" do

      assert_select "input#website_title[name=?]", "website[title]"

      assert_select "textarea#website_image_name[name=?]", "website[image_name]"

      assert_select "input#website_version[name=?]", "website[version]"
    end
  end
end
