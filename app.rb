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
  Client.new(params.fetch("name"), 0, nil).save
  redirect '/'
end

get '/clients/:id' do
  @client = Client.find(params.fetch("id"))
  @stylists = Stylist.all
  erb :client
end

get '/stylists/:id' do
  @stylist = Stylist.find(params.fetch("id"))
  @clients = @stylist.list_clients
  erb :stylist
end

patch '/associate-stylist' do
  stylist = params.fetch("stylist_id").to_i
  client = params.fetch("client_id").to_i
  Client.find(client).associate_stylist(stylist)
  redirect back
end