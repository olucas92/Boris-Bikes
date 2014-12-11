require 'garage'

describe Garage do

  let(:bike){double :bike}
	let(:van) {double :van, bikes: [bike]}

  let(:garage) {Garage.new}
	
	it "should accept a broken bike from a van" do
	 
	 #garage = Garage.new

   broken_bike           = double :bike, broken?: true
   another_broken_bike   = double :bike, broken?: true
   van_with_broken_bikes = double :van, bikes: [broken_bike, another_broken_bike]

	 expect(garage.bike_count).to eq(0)
   expect(van_with_broken_bikes).to receive(:release).with(another_broken_bike)
   expect(van_with_broken_bikes).to receive(:release).with(broken_bike)

	 garage.accept_bikes_from_van(van_with_broken_bikes)
	 expect(garage.bikes).to eq([another_broken_bike, broken_bike])
  end



  it "should be able to fix broken bikes" do
    #expect(garage.accept(bike)).to eq(0)
  end

end