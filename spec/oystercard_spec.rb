require './lib/oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:balance)}

  it "#balance" do
    expect(subject.balance).to eq(0)
  end

  it "#top_up" do
    expect{ subject.top_up(5) }.to change{ subject.balance }.by 5
  end
  
  it "Raises an error if the balance exceeds 90" do
    expect { subject.top_up(100) }.to raise_error 'You cannot exceed a balance of 90'
  end
  
  describe '#deduct' do
    it 'should deduct a specified amount from the oystercard' do
      expect { subject.deduct(5) }.to change{ subject.balance }.by (-5)
    end
  end


end
