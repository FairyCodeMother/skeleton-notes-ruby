# Task: Let the user choose which string manipulation tool to use and then pass their submitted string as an arg to the correct function

# TO RUN:  ruby string_manipulation.rb


# Task: Capitalize the first letter of each word using pure Ruby and array.each
def capitalize_string(input)
  input_stripped = input.strip
  puts "Received: #{input_stripped}"

  # Break words into array using " " as delimiter
  input_split = input_stripped.split(" ")

  new_string = ""
  # Capitalize the first letter of each word
  input_split.each do |substring|
    # Preserve spaces between words; this way is low effort and cleanup is n(1)
    new_string << substring.capitalize << " "
  end

  # Strip artifact trailing whitespaces
  new_string.strip
end



# Task: Reverse a string using pure Ruby and while loops
def reverse_string(input)
  # strip out trailing/preceding whitespace
  input_stripped = input.strip
  puts "Received: #{input_stripped}"

  index = input_stripped.length
  puts "this:#{input_stripped}. (#{index})"

  # reverse the string
  new_string = ""
  while index > 0
    # handle fencepost while decrementing
    index -= 1
    # puts "#{input_stripped[index]}: #{index}"

    new_string << input_stripped[index]

  end

  # return the transformed string
  new_string
end



# Task: Check whether a string is a palindrome (same in reverse) using pure Ruby and for loop
def check_palindrome(input)
  input_stripped = input.strip
  puts "Received: #{input_stripped}"

  for index in 0...input_stripped.length
    reversed_index = input_stripped.length - index - 1
    # puts "#{index}:#{reversed_index}"
    # puts "#{input_stripped[index]}:#{input_stripped[reversed_index]}"
    if (input_stripped[index] != input_stripped[reversed_index])
      return "False"
    end
  end
  return "True"
end



# Task: Count the number of vowels using pure Ruby and for loop
# Do not use regex
def count_vowels(input)
  input_stripped = input.strip
  puts "Received: #{input_stripped}"

  input_length = input_stripped.length

  all_vowels = "aeiouyAEIOUY"
  vowel_count = 0
  for index in 0...input_length
    letter = input_stripped[index]
    if(all_vowels.include? letter)
      vowel_count += 1
    end
  end
  return vowel_count
end


def string_manipulation
  puts "Welcome to the string manipulator. Please choose which tool to use:"
  puts "1. Capitalize words"
  puts "2. Reverse string"
  puts "3. Check if palindrome"
  puts "4. Count vowels"
  user_choice = gets.chomp

  puts "Enter your string:"
  input = gets.chomp

  case user_choice
    when "1"
      return capitalize_string(input)
    when "2"
      return reverse_string(input)
    when "3"
      return check_palindrome(input)
    when "4"
      return count_vowels(input)
    else
      return "Invalid choice"
  end
end

puts string_manipulation
