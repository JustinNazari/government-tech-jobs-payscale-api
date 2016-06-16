require 'csv'

lines = IO.readlines('jobs.txt')
lines.each_with_index do |line, index|
  if line.include?("Title")
    name = lines[index+2].lstrip.split(" ").reject {|word| word.include?("(")}.join(" ")
    Section.create(name: name)
  elsif line.include?("$")
    arr = line.split(" ")
    name = []
    arr.each do |phrase|
      if !phrase.include?("$") && !phrase.include?(".") && !phrase.include?("(")
        name.push(phrase)
      end
    pay_range = arr[arr.length - 2]
    min = pay_range.split("-").first.tr("$","").tr(",","").to_i
    max = pay_range.split("-").last.tr("$","").tr(",","").to_i
    PrivateSectorJob.create(title: name.join(" "), min: min, max: max, section_id: Section.last.id)
  end
end
end

<<<<<<< HEAD
csv_text = File.read('Locations.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Location.create!(row.to_hash)
end

csv_text_GS = File.read('GS2016.csv')
csv_GS = CSV.parse(csv_text_GS, :headers => true)
csv_GS.each do |row|
  PublicSectorJob.create!(row.to_hash)
end

# Location.find_by(city: "Boston, MA").id == location_id
=======
locations = IO.readlines('locations.txt')
current_state = ""
locations.each do |line|
  arr = line.split(" ")
  if !arr.empty? && arr.first == arr.first.upcase
    current_state = arr.join(" ").titleize
  elsif !arr.empty?
    city = arr.reject {|word| word.include?(".")}.join(" ")
    Location.create(city: city, private_sector_coefficient: arr.last.to_f, state: current_state)
  end
end
>>>>>>> 7db0a110319c0c8c67c1a0f27e9cd9b3a702d8f8
