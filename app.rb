require "pry"
require "sqlite3"
require "csv"

require_relative "database/database_setup.rb"
require_relative "models/phonetic.rb"


original = CSV.read('arpagem.csv')

hash_array = []

original.each do |array| #["AABERG", "AA1 B ER0 G"]
  hash_array << {"word"=>"#{array[0]}", "arpabet"=>"#{array[1]}"}
end


hash_array.each do |hash|
  a = Phonetic.new(hash)
  a.insert
end


binding.pry