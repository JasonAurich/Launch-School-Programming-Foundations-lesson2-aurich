def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  Integer(num) rescue false
end

def float?(num)
  Float(num) rescue false
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def operation_to_msg(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

def integer?(input)

end
# EXECUTION
# —————————————————————————————————————————————————————————————————————————————————————————

puts "\e[H\e[2J"

prompt("Welcome to Calculator! Please enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hello, #{name}!")

loop do # MAIN LOOP
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if integer?(number1)
      break
    else
      prompt("Hmm ... that isn't a valid number. Try again.")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if integer?(number2)
      break
    else
      prompt("Hmm ... that isn't a valid number. Try again.")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1 |   ADD
    2 |   SUBTRACT
    3 |   MULTIPLY
    4 |   DIVIDE
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Please choose only 1, 2, 3 or 4.")
    end
  end

  prompt("#{operation_to_msg(operator)} the two numbers  . . .")

  result =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '3'
              number1.to_i() / number2.to_i()
            end

  prompt("The result is #{result}.")
  prompt("Would you like to perform another calculation (y/n)?")
  again_answer = Kernel.gets().chomp()
  break unless again_answer.downcase().start_with?('y')
end

prompt("Thanks for using calculator. Goodbye!")
