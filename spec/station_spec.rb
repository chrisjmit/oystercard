require "station"

describe Station do

  let(:name) { double(:name)}
  let(:zone) { double(:zone)}
  let(:station) { Station.new(:name, :zone) }

  describe "Station exists" do

    it "Station name exists" do
      expect(station.name).to eq :name
    end
    it "Zone name exists" do
      expect(station.zone).to eq :zone
    end
  end
end
