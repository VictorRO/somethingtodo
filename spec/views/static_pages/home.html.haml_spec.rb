require 'rails_helper'

RSpec.describe "static_pages/home.html.haml", type: :view do
  it "renders the 'Something TO-DO' as title" do
    render template: "static_pages/home.html.haml", layout: "layouts/application.html.haml"
    expect(rendered).to have_selector("title", text: "Something TO-DO", visible: false)
  end
end
