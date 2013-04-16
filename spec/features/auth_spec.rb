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
  before(:each) do
    user = create(:user)
    login(user)
  end

  scenario "should see a logout button" do
    visit root_path
    expect(page).to have_link("Sign Out")
  end

  scenario "should be allowed to get passed the index page" do
    visit users_path
    current_path.should eq(users_path)
  end

  scenario "should not see an admin link" do
    visit root_path
    expect(page).to_not have_link("Admin")
  end

  context "who is an admin" do
    before(:each) do
      user = create(:user)
      user.adminify!
      login(user)
    end

    scenario "should see an admin link" do
      visit root_path
      expect(page).to have_link("Admin")
    end
  end
end
