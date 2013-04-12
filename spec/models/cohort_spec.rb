require 'spec_helper'

describe Cohort do

	let(:cohort) { create(:cohort) }

  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:start_date) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:photos_url) }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:secret_url) }

  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:start_date) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:secret_url) }
  
  it { should have_many(:users)}
  
  it "should not allow invalid emails" do
    build(:cohort, email: "@asdf.com").should_not be_valid
    build(:cohort, email: "asdf.com").should_not be_valid
    build(:cohort, email: "asdf@.com").should_not be_valid
    build(:cohort, email: "asdf@asdf.c").should_not be_valid
  end
  
  it "should only accept valid dates" do
    build(:cohort, start_date: "04-12").should_not be_valid
  end
end
