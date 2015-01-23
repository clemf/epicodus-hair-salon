require 'spec_helper'

describe '.new' do
  it 'takes in name, nil id, and creates a client object' do
    test_client = Client.new('Sally', nil, nil)
    expect(test_client.name).to eq 'Sally'
  end
end

describe '#save' do
  it 'saves a client to the database' do
    test_client = Client.new('Sally', nil, nil)
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
    test_client = Client.new('Sally', nil, nil)
    test_client2 = Client.new('Sally', nil, nil)
    expect(test_client).to eq test_client2
  end
end