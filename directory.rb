$line_width = 100

def input_students
    puts "Please enter the full name of the students."
    puts "To finish, just hit return twice."
    #create an empty array
    students = []
    cohorts = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    #get the name
    name = gets.chomp
    #while the name isn't empty, repeat this code
    while !name.empty? do
        #add the student hash to the array
        puts "Please enter any hobbies the student my have."
        hobbies = gets.chomp
        puts " Please enter which cohort."
        cohort = gets.chomp.capitalize
        if !cohorts.include?(cohort) == true
            cohort = 'Not known'
        end
        students << {name: name, hobbies: hobbies, cohort: cohort}
        puts "Now we have #{students.count} students"
        #get another name from the user
        name = gets.chomp
    end
    #return the array of students
    students
end

def print_header
    puts 'The students of Villians Academy:'.center($line_width)
    puts '----------------'.center($line_width)
end

def print names
    names.each_with_index do |student, index|
    puts "#{index}: #{student[:name]}, Hobbies: #{student[:hobbies]}, (#{student[:cohort]} cohort)".center($line_width)
end
    
end

def print_footer names
    puts "Overall, we have #{names.count} great students.".center($line_width)
end

def name_select names
    puts "Which letter would you like to search the list of names with?"
    letter = gets.chomp.upcase
    puts "Searching....."
    names.each do |student|
    if student[:name][0] == letter
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
    
    end
end

def sort_by_cohort(students)
   sorted = students.sort_by {|hash| hash[:cohort]}
   sorted.each_with_index do |student, index|
     puts "#{sorted[index][:cohort]}, #{sorted[index][:name]}"
   end
end

students = input_students
print_header
print(students)
print_footer(students)

sort_by_cohort(students)