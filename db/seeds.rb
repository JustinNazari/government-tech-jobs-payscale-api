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
