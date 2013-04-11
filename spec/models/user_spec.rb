require 'spec_helper'

describe User do

	it { should allow_mass_assignment_of(:first_name) }
	
  it { should belong_to(:cohort) }

end
