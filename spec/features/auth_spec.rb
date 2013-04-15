require 'spec_helper'

feature "User wanders to the homepage" do
  scenario "and is a stranger" do
    visit root_path
    expect(page).to have_link("Github")
  end
end
