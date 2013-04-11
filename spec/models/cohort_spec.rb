require 'spec_helper'

describe Cohort do
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:start_date) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:dropbox_url) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:email) }
end
