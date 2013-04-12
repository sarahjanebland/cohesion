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
end
