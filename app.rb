require 'sinatra'
require 'sinatra/reloader'
also_reload('./lib/**/*.rb')
require 'pg'
require './lib/client'
require './lib/stylist'

DB = PG.connect({:dbname => 'hair_salon'})

get '/' do
  @stylists = Stylist.all
  @clients = Client.all
  erb :index
end

post '/addstylist' do
  Stylist.new(params.fetch("name"), nil).save
  redirect '/'
end

post '/addclient' do
  Client.new(params.fetch("name"), nil, nil).save
  redirect '/'
end

get '/clients/:id' do
  @client = Client.find(params.fetch("id"))
  erb :client
end