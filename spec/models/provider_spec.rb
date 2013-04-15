require 'spec_helper'

describe Provider do
  let(:provider) { build(:provider) }

  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { should validate_presence_of :token }

  it "should be valid" do
    provider.should be_valid
  end
end
