require 'bike'

describe Bike do
	it "should not be broken after we create it" do
		bike = Bike.new
		bike.break!
		expect(bike).to be_broken
	end

end