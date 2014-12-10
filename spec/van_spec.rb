require 'van'

describe Van do 

	it "should only accept a broken bike from the docking station" do
		bike = Bike.new
		station = DockingStation.new
		bike.break!
    	expect(bike).to be_broken
	end
	
end