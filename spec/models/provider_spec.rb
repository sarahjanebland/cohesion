require 'spec_helper'

describe Provider do
  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { should validate_presence_of :token }
end
