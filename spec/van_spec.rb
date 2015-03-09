require 'van'

describe Van do

  let(:bike) { Bike.new }
  let(:van) { Van.new }
  let(:station) { DockingStation.new}
  let(:garage) {Garage.new}

def fill_van(van)
	10.times {van.dock(bike)} 
end

	it "should only accept a broken bike from the docking station" do
		bike.break!
    	expect(bike).to be_broken
	end
	
	it "should know when it's full" do
		fill_van(van)
		expect(lambda{ van.spot(bike)}).to raise_error(RuntimeError,'Van is full')
	end

  it "should transfer all bikes to the docking station" do
    10.times { van.dock(bike) }
    station.take_available_bikes(van)
    expect(station.bike_count).to eq (10)
    expect(van.bike_count).to eq (0)
  end

  it "should be able to take fixed bikes from the garage" do
    1.times { van.dock(bike) }
    van.available_bikes
    expect(garage.bike_count).to eq (0)
    expect(van.bike_count).to eq(1)
  end

end