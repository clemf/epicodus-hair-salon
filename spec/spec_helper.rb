require 'rspec'
require 'client'
require 'stylist'
require 'pg'

DB = PG.connect({:dbname => 'hair_salon'})