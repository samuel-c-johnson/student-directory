

def input_students
    puts "Please enter the full names of the students."
    puts "To finish, just hit return twice."
    #create an empty array
    students = []
    #get the name
    name = gets.chomp
    #while the name isn't empty, repeat this code
    while !name.empty? do
        #add the student hash to the array
        students << {name: name, cohort: :November}
        puts "Now we have #{students.count} students"
        #get another name from the user
        name = gets.chomp
    end
    #return the array of students
    students
end

def print_header
    puts 'The students of Villians Academy:'
    puts '----------------'
end

def print names
    names.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer names
    puts "Overall, we have #{names.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)