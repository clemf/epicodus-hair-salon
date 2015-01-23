require 'spec_helper'

describe '.new' do
	it 'takes in name, nil id, and creates a stylist object' do
		test_stylist = Stylist.new('Sally', nil)
		expect(test_stylist.name).to eq 'Sally'
  end
end

describe '#save' do
  it 'saves a stylist to the database' do
    test_stylist = Stylist.new('Sally', nil)
    test_stylist.save
    expect(Stylist.all).to eq [test_stylist]
  end
end

describe '.all' do
  it 'returns an empty array when no stylists are present' do
    expect(Stylist.all).to eq []
  end
end

describe '#==' do
  it 'returns true when two stlyists have the same name' do
    test_stylist = Stylist.new('Sally', nil)
    test_stylist2 = Stylist.new('Sally', nil)
    expect(test_stylist).to eq test_stylist2
  end
end