require './lib/oystercard'

describe Oystercard do
  it { is_expected.to respond_to(:balance)}
  
  it "#balance" do
    expect(subject.balance).to eq(0)
  end
  
  it "Has a balance of zero when Oystercard is instantiated" do
    oyster = subject
    expect(oyster::balance).to eq(0)
    
  end
  
  it { is_expected.to have_attributes(:balance => 0) }

end
