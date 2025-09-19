# Task: Perform basic arithmetic operations from the command line.

# Execute: ruby simple_calculator.rb [2, 1]


def simple_calculator()
  puts "Welcome to the simple calculator, where you only do math on two numbers at a time. Please enter string to calculate (ex: 1+2, 4/2, 3*7, 9-3):"
  user_input = gets.chomp
  puts "Input: #{user_input}"

  calc_type = user_input.gsub(/\d+/, '')
  unless (['+', '-', '*', '/'].include?(calc_type))
    return "Not a valid calculation"
  end

  # get the numbers
  user_numbers = user_input.split(/\s*[\+\-\*\/]\s*/)
  user_numbers = user_numbers.map { |str| str.to_i }
  puts "Num: #{user_numbers}"

  answer = 0;
  case(calc_type)
    when "+"
      answer = user_numbers.sum
    when "-"
      answer = user_numbers[0] - user_numbers[1]
    when "/"
      answer = user_numbers[0] / user_numbers[1]
    when "*"
      answer = user_numbers[0] * user_numbers[1]
    else
      puts "Not a valid calculation"
  end

  return "Answer: #{answer}"
end

puts simple_calculator
