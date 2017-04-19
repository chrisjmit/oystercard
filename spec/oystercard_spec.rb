require './lib/oystercard'

describe Oystercard do

  describe '#balance' do
    it { is_expected.to respond_to(:balance)}

    it "#balance" do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it "#top_up" do
      expect{ subject.top_up(5) }.to change{ subject.balance }.by 5
    end
    
    it "Raises an error if the balance exceeds 90" do
      expect { subject.top_up(100) }.to raise_error 'You cannot exceed a balance of 90'
    end
  end
  
  describe '#deduct' do
    it 'should deduct a specified amount from the oystercard' do
      expect { subject.deduct(5) }.to change{ subject.balance }.by (-5)
    end
  end

  describe '#touch_in' do
    it 'should let us touch_in a card' do
      is_expected.to respond_to(:touch_in)
    end

    it "should return true when we touch_in" do
      subject.top_up(1)
      subject.touch_in
      expect(subject).to be_in_journey
    end
    
    it "should raise an error if we try to touch in with a balance of less than 1" do
      expect { subject.touch_in }.to raise_error 'Your balance is below 1 so you cannot travel'
    end
      
  end

  describe '#touch_out' do
    it 'should let us touch_out a card' do
      is_expected.to respond_to(:touch_out)
    end

    it "should return false when we touch_out" do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

  describe '#in_use' do
    it "should return false if we haven't touched_in before" do
      subject.in_use.should be false
    end
  end

  describe '#in_journey?' do
    it 'should be a method' do
      is_expected.to respond_to(:in_journey?)
    end
    
    it "should tell us if we have touched in but not touched out" do
      subject.top_up(1)
      subject.touch_in
      subject.in_journey?.should be true
    end
    it "should tell us if we have touched in and touched out" do
      subject.top_up(1)
      subject.touch_in
      subject.touch_out
      subject.in_journey?.should be false
    end
  end

end
