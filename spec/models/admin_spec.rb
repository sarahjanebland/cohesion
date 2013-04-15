require 'spec_helper'

describe Admin do
  let(:admin) { build(:admin) }

  it { should belong_to :user }

  it "should be valid" do
    admin.should be_valid
  end
end
