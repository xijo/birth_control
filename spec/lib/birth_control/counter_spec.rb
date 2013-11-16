require 'spec_helper'

describe BirthControl::Counter do

  let(:counter) { BirthControl::Counter.instance }
  after         { counter.reset }

  it 'behaves as singleton' do
    counter.should eq BirthControl::Counter.instance
  end

  describe '#reset' do
    it 'removes all existing results' do
      counter.results = :something
      counter.reset
      counter.results.should eq({})
    end
  end

  describe '#count' do
    it 'groups results by class' do
      counter.count('Foo', 1)
      counter.count('Bar', 1)
      counter.results.should have(2).keys
    end

    it 'counts different ids per class' do
      counter.count 'Foo', 1
      counter.count 'Foo', 2
      counter.results['Foo'].should have(2).keys
    end

    it 'groups multiple occurencies of the same id' do
      counter.count('Foo', 1)
      counter.count('Foo', 1)
      counter.results['Foo'][1].should have(2).entries
    end
  end

end
