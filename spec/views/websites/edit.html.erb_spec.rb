require 'rails_helper'

RSpec.describe "websites/edit", type: :view do
  before(:each) do
    @website = assign(:website, Website.create!(
      :title => "MyString",
      :image_name => "ruby",
      :version => "MyString"
    ))
  end

  it "renders the edit website form" do
    render

    assert_select "form[action=?][method=?]", website_path(@website), "post" do

      assert_select "input#website_title[name=?]", "website[title]"

      assert_select "textarea#website_image_name[name=?]", "website[image_name]"

      assert_select "input#website_version[name=?]", "website[version]"
    end
  end
end
