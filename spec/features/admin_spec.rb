require 'spec_helper'

feature "Non Admin users" do
  before(:each) do
    @user = create(:user)
    login(@user)
  end

  scenario "should not be able to edit a cohort" do
    visit cohort_path(@user.cohort)
    expect(page.find_by_id("top_container")).to_not have_link("Edit")
  end

  scenario "should not be able to delete a user" do
    visit user_path(@user)
    expect(page).to_not have_link("Delete")
  end
end

feature "Admin users" do
  before(:each) do
    @user = create(:user)
    @user.adminify!
    login(@user)
  end

  scenario "should be able to edit a cohort" do
    visit cohort_path(@user.cohort)
    expect(page.find_by_id("top_container")).to have_link("Edit")
  end

  scenario "should be able to delete a user" do
    visit user_path(@user)
    expect(page).to have_link("Delete")
  end
end
