require 'spec_helper'

describe '.new' do
  it 'takes in name, 0 stylist_id, nil id, and creates a client object' do
    test_client = Client.new('Sally', 0, nil)
    expect(test_client.name).to eq 'Sally'
  end
end

describe '#save' do
  it 'saves a client to the database' do
    test_client = Client.new('Sally', 0, nil)
    test_client.save
    expect(Client.all).to eq [test_client]
  end
end

describe '.all' do
  it 'returns an empty array when no clients are present' do
    expect(Client.all).to eq []
  end
end

describe '#==' do
  it 'returns true when two stlyists have the same name' do
    test_client = Client.new('Sally', 0, nil)
    test_client2 = Client.new('Sally', 0, nil)
    expect(test_client).to eq test_client2
  end
end

describe '.find' do
  it 'takes an id and returns the client from the database' do
    test_client = Client.new('Sally', 0, nil)
    test_client.save
    test_client2 = Client.new('Sally', 0, nil)
    test_client2.save
    expect(Client.find(test_client.id)).to eq test_client
  end
end

describe '#associate_stylist' do
  it 'takes a stylist id and associates client with a stylist in the database' do
    test_client = Client.new('Sally', 0, nil)
    test_client.save
    test_stylist = Stylist.new('Edward', nil)
    test_stylist.save
    test_client.associate_stylist(test_stylist.id)
    expect(test_client.stylist_id).to equal test_stylist.id
  end
end