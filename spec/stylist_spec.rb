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

describe '.find' do
  it 'takes an id and returns the stylist from the database' do
    test_stylist = Stylist.new('Sally', nil)
    test_stylist.save
    test_stylist2 = Stylist.new('Sally', nil)
    test_stylist2.save
    expect(Stylist.find(test_stylist.id)).to eq test_stylist
  end
end

describe '#list_clients' do
  it 'returns an array of all clients for the stylist' do
    test_stylist = Stylist.new('Sally', nil)
    test_stylist.save
    test_client = Client.new('Frank', 0, nil)
    test_client.save
    test_client.associate_stylist(test_stylist.id)
    test_client2 = Client.new('Frank', 0, nil)
    test_client2.save
    test_client2.associate_stylist(test_stylist.id)
    expect(test_stylist.list_clients).to eq [test_client.id, test_client2.id]
  end
end