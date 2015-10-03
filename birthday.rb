#  Birthdays allows the user to find out a persons
#  upcoming birthday by searching through an external file.
#
#  This program returns how many days until a persons birthay, 
#  their date of birth, and how old they will turn.
#
filename = 'birthdays.txt'
birth_hash = {}

File.open filename do |f| 
  f.each_line do |line|
    line = line.chomp
    comma = 0
    
    while line[comma] != ',' && comma < line.length
      comma += 1
    end
  	
    puts name = line[0..comma-1]
    date = line[-13..-1]
    birth_hash[name] = date
  end
end

puts 
puts "Who's birthday would you like to look up?"
name = gets.chomp.capitalize
puts

date = birth_hash[name]
year = date[-5..-1].to_i
day = date[-9,3].to_i

month_string = date[-12, 3]

if month_string == 'Jan'
  month = 1
elsif month_string == 'Feb'
  month = 2
elsif month_string == 'Mar'
  month = 3
elsif month_string == 'Apr'
  month = 4
elsif month_string == 'May'
  month = 5
elsif month_string == 'Jun'
  month = 6
elsif month_string == 'Jul'
  month = 7
elsif month_string == 'Aug'
  month = 8
elsif month_string == 'Sep'
  month = 9
elsif month_string == 'Oct'
  month = 10
elsif month_string == 'Nov'
  month = 11
elsif month_string == 'Dec'
  month = 12
end

today = Time.now
current_year = Time.now.strftime("%Y")
next_year = current_year.to_i + 1

birthdate = Time.mktime(year, month, day)
birthday = Time.mktime(current_year, month, day)

if birthday < today
  next_birthday = Time.mktime(next_year, month, day)
  age = (next_birthday - birthdate) / (60*60*24*365)
  age = age.floor
  days_away = (next_birthday  - today ) / (60*60*24)
  days_away = days_away.ceil

  puts "#{name.capitalize}'s next birthday is #{days_away} days away on #{month_string} #{day}."
  puts "#{name.capitalize} will be #{age} years old!"
else
  age = (birthday - birthdate) / (60*60*24*365)
  age = age.floor
  days_away = (birthday  - today ) / (60*60*24)
  days_away = days_away.ceil
	
  if days_away != 1
    puts "#{name.capitalize}'s next birthday is #{days_away} days away on #{month_string} #{day}."
  else
    puts "#{name.capitalize}'s next birthday is #{days_away} day away on #{month_string} #{day}."	
  end
  puts "#{name.capitalize} will be #{age} years old!"
end

