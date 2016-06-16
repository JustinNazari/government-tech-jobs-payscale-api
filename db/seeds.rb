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
