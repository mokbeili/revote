# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'http'
require 'json'

file_contents = CSV.read("#{Rails.root}/db/seed/RIDINGS-DOS.csv", col_sep: ",", encoding: "ISO8859-1")

file_contents[1..339].each do |row|
  Riding.create(name:row[1], code:row[0], population:row[2], province: row[3], electoral_system: 'Alternative Vote')
end

file_contents[1..339].each do |row|
  Riding.create(name:row[1], code:row[0], population:row[2], province: row[3], electoral_system: 'Mixed Member Proportional')
end

Riding.create(name:"Main", code:999999, population:33000000, province: 'CA', electoral_system: 'List Proportional Representation')

file_contents[340..-1].each do |row|
  Riding.create(name:row[1], code:row[0], population:row[2], province: row[3], electoral_system: 'Single Non-Transferable Vote')
end

# file_contents2 = CSV.read("#{Rails.root}/db/seed/ca_postal_codes-DOS.csv", col_sep: ",", encoding: "ISO8859-1")
#
# file_contents2[1..-1].each do |row|
#   RidingRelationship.create(hypothetical_riding: Riding.find_by_code(row[5]).id, postal_code_prefix: row[0])
# end

file_contents3 = CSV.read("#{Rails.root}/db/seed/Parties-DOS.csv", col_sep: ",", encoding: "ISO8859-1")

file_contents3[1..-1].each do |row|
  Party.create(name:row[1], color:row[0],fr_name:row[2],abbreviation:row[3])
end

file_contents4 = CSV.read("#{Rails.root}/db/seed/candidates.csv", col_sep: ",", encoding: "ISO8859-1")
file_contents4[1..-1].each do |row|
  # byebug
  Candidate.create(name:row[6],last_name:row[5],party_id: Party.find_by_name(row[3])&.id,riding_id: Riding.where(electoral_system: "Alternative Vote").find_by_code(row[0])&.id)
end

file_contents4 = CSV.read("#{Rails.root}/db/seed/candidates.csv", col_sep: ",", encoding: "ISO8859-1")
file_contents4[1..-1].each do |row|
  # byebug
  Candidate.create(name:row[6],last_name:row[5],party_id: Party.find_by_name(row[3])&.id,riding_id: Riding.where(electoral_system: "Mixed Member Proportional").find_by_code(row[0])&.id)
end

Riding.where(electoral_system: 'Mixed Member Proportional').each do |r|
  Party.all.each do |p|
    Candidate.create(name: p.name,party_id: p.id, riding_id: r.id)
  end
end

Party.all.each do |p|
  Candidate.create(name: p.name,party_id: p.id, riding_id: Riding.where(electoral_system:'List Proportional Representation').first.id)
end

# response =  HTTP.get(URI("https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyD36p_EZyszaJoNL1Fq-SqErd0OUYSOIiQ"))
#
# p JSON.parse(response)["results"]

#
# Riding.all.each do |r|
#   r.riding_id = r.id
#   r.save
# end
