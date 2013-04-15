require 'spec_helper'

feature "Unauthenticated users" do
  scenario "should see a login button" do
    visit root_path
    expect(page).to have_link("Github")
  end

  scenario "should not be allowed to get past the index page" do
    visit users_path
    current_path.should eq(root_path)
  end
end

feature "Authenticated users" do
  scenario "should see a logout button" do
    user = create(:user)
    login(user)
    visit root_path
    expect(page).to have_link("Sign Out")
  end

  scenario "should be allowed to get passed the index page" do
    user = create(:user)
    login(user)
    visit users_path
    current_path.should eq(users_path)
  end
end
