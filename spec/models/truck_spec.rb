require 'spec_helper'

describe Truck do
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }
end
