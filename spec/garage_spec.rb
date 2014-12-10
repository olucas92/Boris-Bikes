require 'garage'

describe Garage do
	
	it "should accept a broken bike" do
	bike = Bike.new
	van = Van.new
	garage = Garage.new
	bike.break!
	expect(garage.bike_count).to eq (0)
	end

end