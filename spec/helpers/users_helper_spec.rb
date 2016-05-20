require 'rails_helper'

RSpec.describe UsersHelper, "#gravatar_for" do
  it "displays the gravatar image for a user" do
    user = build(:user, name: 'John Doe', email: 'john@doe.com')
    options = { size: 150 }
    image = Nokogiri::HTML(helper.gravatar_for(user, options)).css('img')[0]

    expect(image.attributes['src'].value).to eq 'https://secure.gravatar.com/avatar/6a6c19fea4a3676970167ce51f39e6ee?s=150'
    expect(image.attributes['alt'].value).to eq user.name
    expect(image.attributes['class'].value).to eq 'gravatar'
  end
end
