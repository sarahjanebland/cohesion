require 'spec_helper'

feature "user authentication" do
  scenario "github button should display on homepage" do
    visit root_path
    expect(page).to have_link("Github")
  end
end