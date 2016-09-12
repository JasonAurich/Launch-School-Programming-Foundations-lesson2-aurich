require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

def integer?(num)
  num % 1 == 0 ? true : false
end

def float?(num)
  num % 1 != 0 ? true : false
end

def valid_number?(num)
  integer?(num) || float?(num)
end

# def convert_number(num)
#   if integer?(num)
#     num = num.to_i
#   elsif float?(num)
#     num = num.to_f
#   else
#     false
#   end
# end

def operation_verb(op)
  op_verb = case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end

  # additional lines of code
  # puts(MESSAGES['operation_to_msg'])
  op_verb
end

def operation_input
  @operation = ''

  loop do
    @operation = gets.chomp
    %w(1 2 3 4).include?(@operation) ? break : puts('',MESSAGES['invalid_operator'])
  end
  puts('',"#{operation_verb(@operation)} the two numbers  . . .")
end

# EXECUTION ———————————————————————————————————————————————————————————————————————————

puts "\e[H\e[2J"    # clear screen

puts(MESSAGES['welcome'],'')

name = ''

loop do
  name = gets.chomp
  name.empty?() ? puts(MESSAGES['valid_name']) : break
end

puts('',"Hello, #{name}!")
# MESSAGES['greeting'] % { name: name }

# MAIN LOOP ———————————————————————————————————————————————————————————————————————————

loop do

  @number1 = ''
  loop do
    puts('',MESSAGES['number1'])
    @number1 = gets.chomp
    valid_number?(@number1) ? break : puts('',MESSAGES['invalid_number'])
  end

  @number2 = ''
  loop do
    puts('',MESSAGES['number2'])
    @number2 = gets.chomp
    valid_number?(@number2) ? break : puts('',MESSAGES['invalid_number'])
  end

  puts('',MESSAGES['operation_options'],'')
  # puts(operation_options)

  operation_input

  @number1 = @number1.to_f
  @number2 = @number2.to_f

  result =  case @operation
            when '1'
              @number1 + @number2
            when '2'
              @number1 - @number2
            when '3'
              @number1 * @number2
            when '4'
              @number1 / @number2
            end

  if integer?(result)
    puts("The result is #{result.truncate}.")
  else
    puts("The result is #{result}.")
  end

  puts('',MESSAGES['again?'])
  gets.chomp.casecmp('y') == 0 ? nil : break
end

puts('',MESSAGES['goodbye'])




def convert_number(num)
  case num
  when num.to_i.to_s == num
    num = num.to_i
  when num.to_f.to_s == num
    num = num.to_f
  end
end
