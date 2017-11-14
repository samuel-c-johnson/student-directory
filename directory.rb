$line_width = 100
@students = [] # an empty array accessible to all methods

def interactive_menu
    loop do
        print_menu                       #1. print the menu and ask the user what to do.
        process(gets.chomp)              #2. Read the input and save it to a variable.
        end                              #3. Do what the user has asked
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list
    print_footer
end

def process(selection)
    case selection
     when "1"
        input_students
     when "2"
        show_students
     when "3"
        save_students
     when "4"
        load_students 
     when "9"
        exit
     else
        puts "I don't know what you meant, try again"
    end
end
      
    

def input_students
    puts "Please enter the full name of the students."
    puts "To finish, just hit return twice."
    #create an empty array
    
    cohorts = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    #get the name
    name = gets.strip
    #while the name isn't empty, repeat this code
    while !name.empty? do
        #add the student hash to the array
        puts "Please enter any hobbies the student may have."
        hobbies = gets.chomp
        puts "Please enter which cohort."
        cohort = gets.chomp.capitalize
        if !cohorts.include?(cohort) == true
            cohort = 'Not known'
        end
        @students << {name: name, hobbies: hobbies, cohort: cohort}
        
        if @students.count <= 1       
            puts "Now we have #{@students.count} student"
        else
            puts "Now we have #{@students.count} students"
        end
        #get another name from the user
        name = gets.chomp
    end
    #return the array of students
    @students
end

def print_header
    puts 'The students of Villians Academy:'.center($line_width)
    puts '----------------'.center($line_width)
end

def print_students_list
    if @students.count >= 1
        @students.each_with_index do |student, index|
        puts "#{index}: #{student[:name]}, Hobbies: #{student[:hobbies]}, (#{student[:cohort]} cohort)".center($line_width)
        end
    else
        puts "No student information has been entered.".center($line_width)
    end
end
    


def print_footer 
    if @students.count < 1
        puts ''
    elsif    
        @students.count == 1
        puts "Overall, we have #{@students.count} great student.".center($line_width)
    else
        puts "Overall, we have #{@students.count} great students.".center($line_width)
    end
end

def save_students
    #open file for writing
    file = File.open("students.csv", "w")
    #iterate over the students array
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(", ")
        file.puts csv_line
    end
    file.close
end

def load_students
    file = File.open("students.csv", "r")
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu


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
  