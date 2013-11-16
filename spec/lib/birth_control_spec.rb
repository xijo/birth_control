require 'spec_helper'

describe BirthControl do

  it '#enable= works as intended' do
    BirthControl.enable = false
    BirthControl.should_not be_enabled
    BirthControl.enable = true
    BirthControl.should be_enabled
  end

end
