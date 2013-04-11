require 'spec_helper'

describe User do

	it { should allow_mass_assignment_of(:first_name) }
	it { should allow_mass_assignment_of(:last_name) }
	it { should allow_mass_assignment_of(:email) }
	it { should allow_mass_assignment_of(:nickname) }
	it { should allow_mass_assignment_of(:phone) }
	it { should allow_mass_assignment_of(:job) }
	it { should allow_mass_assignment_of(:location) }
	it { should allow_mass_assignment_of(:advice_tweet) }
	it { should allow_mass_assignment_of(:fav_restaurant) }
	it { should allow_mass_assignment_of(:url) }
	it { should allow_mass_assignment_of(:cohort_id) }
	it { should allow_mass_assignment_of(:photo_url) }
	it { should allow_mass_assignment_of(:uid) }
	it { should allow_mass_assignment_of(:provider) }
	it { should allow_mass_assignment_of(:github_token) }
	it { should allow_mass_assignment_of(:facebook) }
	it { should allow_mass_assignment_of(:twitter) }
  it { should belong_to(:cohort) }

end
