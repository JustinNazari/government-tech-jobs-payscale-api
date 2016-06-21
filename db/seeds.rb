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

csv_text = File.read('Locality percentages.csv')
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

def public_base_pay
  csv_text_GS = File.read('GS2016.csv')
  csv_GS = CSV.parse(csv_text_GS, :headers => true)
  csv_GS.each do |row|
    PublicSectorJob.create!(row.to_hash)
  end
end

def parse_public_special_pay
  csv_text = File.read('Special Pay by Location 2016.csv')
  csv = CSV.parse(csv_text, :headers => true)
  results = []
  csv.each do |row|
    arrayRow = row.to_a
    results_hash ||= {
      grade: arrayRow[0][1],
      city: arrayRow[4][1].split(",")[0],
      state: arrayRow[4][1].split(",")[1].strip!,
      min: arrayRow[1][1].to_d,
      max: arrayRow[2][1].to_d,
      supplement_coefficient: (arrayRow[3][1].to_f * 100 + 100).to_d }
    results << results_hash
  end
  results
end

def compare_pub_coefficients(locality_pay, salary, location, result) # for same grades
  if salary < locality_pay
    location.public_sector_coefficient
  else
    result[:supplement_coefficient]
  end
end

def create_public_salaries(result)
  public_locations = Location.all.where("public_sector_coefficient IS NOT NULL")
  location = public_locations.find_by(city: result[:city])
  grade = 5
  if location
    while grade < 16
      record = CombinedPublicSalary.find_or_create_by(location: location, grade: grade)
      record.city = location.city
      record.state = location.state
      base_pay = PublicSectorJob.find_by(grade: grade)
      if result[:grade].to_i == grade
        record.min = result[:min]
        record.max = result[:max]
      else
        record.min = base_pay.min * (location.public_sector_coefficient/100)
        record.max = base_pay.max * (location.public_sector_coefficient/100)
      end
      record.save
      grade+=1
    end
  end
end


# call methods to create seeds

public_base_pay
results = parse_public_special_pay
PublicSectorJob.all.each do |job|
  results.each do |result|
    create_public_salaries(result)
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
    skill_coefficient = 1.0 + (str.pop.tr("%", "").to_f)/100.00
    name = str.join(" ")
    Skill.create(name: name, skill_coefficient: skill_coefficient, section_id: current_section.id)
  end
end
