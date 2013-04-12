require 'spec_helper'

describe Cohort do

	let(:cohort) { create(:cohort) }

  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:start_date) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:photos_url) }

  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:start_date) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:secret_url) }
  
  it { should have_many(:users)}
  
  it "should be valid" do
    cohort.should be_valid
  end
  
  it "should not allow invalid emails" do
    build(:cohort, email: "asdf@asdf.c").should_not be_valid
  end
  
  it "should only accept valid dates" do
    build(:cohort, start_date: "04-12").should_not be_valid
  end
  
  it "should list current cohorts" do
    old_cohort = create(:cohort, start_date: DateTime.now - 7 * 13)
    Cohort.current.should include(cohort)
    Cohort.current.should_not include(old_cohort)
  end
  
  it "should have valid seeds" do
    build(:cohort, name: 'Sea Lions', start_date: DateTime.new(2013, 01, 28), 
    email: 'lions@devbootcamp.com', photos_url: "https://www.dropbox.com/sh/ewwqlhbkzbusxn2/3kDbRe3Ekc").should be_valid
  end
end
