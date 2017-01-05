require 'rails_helper'

RSpec.describe "websites/show", type: :view do
  before(:each) do
    @website = assign(:website, Website.create!(
      :title => "Title",
      :image_name => "MyText",
      :version => "Version"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Version/)
  end
end
