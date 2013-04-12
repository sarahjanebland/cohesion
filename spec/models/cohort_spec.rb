require 'spec_helper'

describe Cohort do

	let(:cohort) { FactoryGirl.create(:cohort) }

	subject { cohort }

  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:start_date) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:dropbox_url) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:secret_url) }
  it { should have_many(:users)}

	it "should have secret_url 12 chars long" do
		cohort.secret_url = "dfdsll34kfds"
		cohort.should be_valid
	end
end
