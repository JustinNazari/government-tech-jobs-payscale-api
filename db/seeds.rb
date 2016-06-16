# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
