require 'yaml'

MESSAGES_FILE = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'es'

# def language_selector
#
#   lang = ''
#   message("language_options")
#
#   loop do
#     lang = gets.chomp
#     %w(1 2 3).include?(lang) ? break : message("invalid_language")
#   end
#
#   @language = case lang
#               when '1'
#                 'en'
#               when '2'
#                 'es'
#               when '3'
#                 'hb'
#               end
# end

def messages(message, lang)
  MESSAGES_FILE[lang][message]
end

def message(key)
  # message = messages(key, @language)
  message = messages(key, LANGUAGE)
  puts("#{message}")
  puts ''
end

def integer?(num)
  num % 1 == 0 ? true : false
end

def float?(num)
  num % 1 != 0 ? true : false
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def verbalize(op)
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
    %w(1 2 3 4).include?(@operation) ? break : message('invalid_operator')
  end
  puts('',"#{verbalize(@operation)} the two numbers  . . .")
end

# EXECUTION —————————————————————————————————————————————————————

puts "\e[H\e[2J"          # clear screen

message("welcome")

name = ''
loop do
  name = gets.chomp
  name.empty?() ? message("valid_name") : break
end

puts('',"Hello, #{name}!",'')
# MESSAGES['greeting'] % { name: name }

# MAIN LOOP —————————————————————————————————————————————————————

loop do

  number1 = ''
  loop do
    message("number1")
    number1 = gets.chomp
    valid_number?(number1) ? break : message("invalid_number")
  end

  number2 = ''
  loop do
    message("number2")
    number2 = gets.chomp
    valid_number?(number2) ? break : message("invalid_number")
  end

  message("operation_options")
  # puts(operation_options)

  operation_input

  number1 = number1.to_f
  number2 = number2.to_f

  result =  case @operation
            when '1'
              number1 + number2
            when '2'
              number1 - number2
            when '3'
              number1 * number2
            when '4'
              number1 / number2
            end

  puts ''
  if integer?(result)
    puts("The result is #{result.truncate}.")
  else
    puts("The result is #{result}.")
  end

  message('again?')
  case LANGUAGE
  when 'en'
    gets.chomp.casecmp('y') == 0 ? nil : break
  when 'es'
    gets.chomp.casecmp('s') == 0 ? nil : break
  when 'hb'
    gets.chomp.casecmp('y') == 0 ? nil : break
  end
end

message('goodbye')
