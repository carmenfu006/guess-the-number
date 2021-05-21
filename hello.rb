def get_name
  puts "What is your name?"
  name = gets.chomp

  get_age(name)
end

def get_age(name)
  puts "Hello " + name + ", how old are you?"
  age = gets.chomp.to_i

  if age >= 50
    puts "You are too old to be my friend."
  else
    puts "Nice to meet you!"
  end
end

get_name