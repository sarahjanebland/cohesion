require 'spec_helper'

describe User do

	it { should allow_mass_assignment_of(:first_name) }
	it { should allow_mass_assignment_of(:last_name) }
	it { should allow_mass_assignment_of(:email) }
	it { should allow_mass_assignment_of(:nickname) }
	it { should allow_mass_assignment_of(:phone) }
	it { should allow_mass_assignment_of(:company) }
	it { should allow_mass_assignment_of(:location) }
	it { should allow_mass_assignment_of(:advice) }
	it { should allow_mass_assignment_of(:restaurant) }
	it { should allow_mass_assignment_of(:website_url) }
	it { should allow_mass_assignment_of(:cohort_id) }
	it { should allow_mass_assignment_of(:photo_url) }
	it { should allow_mass_assignment_of(:github_uid) }
	it { should allow_mass_assignment_of(:provider) }
	it { should allow_mass_assignment_of(:github_token) }
	it { should allow_mass_assignment_of(:facebook_url) }
	it { should allow_mass_assignment_of(:twitter_url) }
  it { should belong_to(:cohort) }


  let(:user) { User.new }

  describe "#format_urls" do
  	it "gives me just the twitter username" do
  		user.twitter_url = "http://twitter.com/juliantai"
  		user.save
  		user.twitter_url.should eq("juliantai")
  	end 

  	it "gives me just the facebook username" do
  		user.facebook_url = "http://twitter.com/juliantai"
  		user.save
  		user.facebook_url.should eq("juliantai")
  	end
  end


end
