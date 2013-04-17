require 'spec_helper'

describe User do

  let(:user) { build(:user) }

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
  it { should allow_mass_assignment_of(:linkedin_url)}
  
  xit { should validate_presence_of :cohort_id }
  it { should validate_presence_of :github_uid }
  it { should validate_presence_of :github_token }
  
  it { should validate_uniqueness_of :github_uid }
  
  it { should belong_to(:cohort) }
  it { should have_one(:admin) }

  it "should be valid" do
    user.should be_valid
  end
  
  xit "should not allow invalid emails" do
    build(:user, email: "asdf@asdf.c").should_not be_valid
  end

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

  it "should not be an admin" do
    user.admin?.should be_false
  end

  it "should adminify!" do
    expect{ user.adminify! }.to change{ user.admin? }
  end

end
