require 'csv'
require 'pry-rails'

lines = IO.readlines('jobs.txt')
  lines.each_with_index do |line, index|
    if line.include?("Title")
      name = lines[index+2].lstrip.split(" ").reject {|word| word.include?("(")}.join(" ")
      Section.create(name: name)
    elsif line.include?("$")
      arr = line.split(" ")
      name = []
      arr.each do |phrase|
        if !phrase.include?("$") && !phrase.include?(".") && !phrase.include?("(") && !phrase.include?(",")
          name.push(phrase)
        end
      end
      pay_range = arr[arr.length - 2]
      min = pay_range.split("-").first.tr("$","").tr(",","").to_i
      max = pay_range.split("-").last.tr("$","").tr(",","").to_i
      PrivateSectorJob.create(title: name.join(" "), min: min, max: max, section_id: Section.last.id)
  end
end

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

csv_text = File.read('Public locality.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  arrayRow = row.to_a
  city_and_state = arrayRow[0].split(",")
  city = city_and_state[0][1].split(",")[0]
  if Location.find_by(city: city)
    location = Location.find_by(city: city)
    location.public_sector_coefficient = arrayRow[1][1].to_d
    location.save
  end
end

csv_text_GS = File.read('GS2016.csv')
csv_GS = CSV.parse(csv_text_GS, :headers => true)
csv_GS.each do |row|
  PublicSectorJob.create!(row.to_hash)
end

csv_text = File.read('Special Pay by Location 2016.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  arrayRow = row.to_a
  city_and_state = arrayRow[4].split(",")
  city = city_and_state[0][1].split(",")[0]
  if Location.find_by(city: city)
    id = Location.find_by(city: city).id
    attributes = {grade: arrayRow[0][1],
      min: arrayRow[1][1].to_d,
      max: arrayRow[2][1].to_d,
      supplement_coefficient: (arrayRow[3][1].to_f * 100 + 100).to_d,
      location_id: id}
    PublicSectorSpecialPayJob.create(attributes)
  end
end

skills = IO.readlines('skills.txt')
current_section = ""
skills.each do |line|
  arr = line.split(" ")
  if !arr.empty? && arr.last.include?("(")
    arr.pop
    current_section = Section.find_by(name: arr.join(" "))
  elsif !arr.empty?
    str = line.tr(".","").split(" ")
    skill_coefficient = 1 + (str.pop.tr("%", "").to_i)/100
    name = str.join(" ")
    Skill.create(name: name, skill_coefficient: skill_coefficient, section_id: current_section.id)
  end
end
