# m = monthly payment
# p = loan amount
# i = monthly interest rate
# n = loan duration in months

require 'yaml'

MESSAGES_FILE = YAML.load_file('loan_messages.yml')

def message(key)
  # message = messages(key, @language)
  message = MESSAGES_FILE[key]
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

# def verbalize(op)
# end

# def operation_input
# end

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

  p = ''
  loop do
    message("principal")
    p = gets.chomp.to_f
    valid_number?(p) ? break : message("invalid_number")
  end

  i = ''
  loop do
    message("interest_rate")
    i = gets.chomp.to_f / 100
    valid_number?(i) ? break : message("invalid_number")
  end

  n = ''
  loop do
    message("loan_term")
    n = gets.chomp
    valid_number?(n) ? break : message("invalid_number")
  end

  # message("operation_options")
  # operation_input

  p = p.to_f
  i = i.to_f
  n = n.to_f

  m = p * (i / (1 - (1 + i)**-n))

  puts ''
  if integer?(m)
    puts("The result is $#{m.truncate}.")
  else
    puts("The result is $#{m}.")
  end

  message('again?')
  gets.chomp.casecmp('y') == 0 ? nil : break
end

message('goodbye')
