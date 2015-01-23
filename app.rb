require 'sinatra'
require 'sinatra/reloader'
also_reload('./lib/**/*.rb')
require 'pg'
require './lib/client'
require './lib/stylist'

DB = PG.connect({:dbname => 'hair_salon'})

get '/' do
  stylists = Stylist.all
  erb :index
end