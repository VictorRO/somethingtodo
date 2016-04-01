require 'rails_helper'

RSpec.describe 'common/_calendar.html.haml' do
  it 'renders the current day week from 2 days ago to 2 days forward' do
    current_date = Date.new(2016, 4, 1)

    render partial: "common/calendar.html.haml", locals: { current_date: current_date }

    expect(rendered).to have_content 'Wednesday'
    expect(rendered).to have_content 'March 30'
    expect(rendered).to have_content 'Thursday'
    expect(rendered).to have_content 'March 30'
    within '.current' do
      expect(rendered).to have_content 'Friday'
      expect(rendered).to have_content 'April 1'
    end
    expect(rendered).to have_content 'Sunday'
    expect(rendered).to have_content 'April 2'
    expect(rendered).to have_content 'Sunday'
    expect(rendered).to have_content 'April 3'
  end
end
