def print_line
  puts '=' * 50
end

def clear_console
  puts '\e[H\e[2J'
end

def main
  print_line

  puts 'Welcome to guess the number!'
  puts 'What do you want to do?'
  puts '1. Play the game'
  puts '2. Quit'
  puts 'Enter 1 or 2: '
 
  menu_item = gets.chomp.to_i
  show_menu(menu_item)
end

def show_menu(menu_item)
  print_line

  # while ![1, 2].include?(menu_item)
  #   puts 'Invalid option entered! Please enter 1 or 2 only: '
  #   menu_item = gets.chomp.to_i
  # end

  while menu_item != 1 && menu_item != 2
    puts 'Invalid option entered! Please enter 1 or 2 only: '
    menu_item = gets.chomp.to_i
  end

  if menu_item == 1
    puts 'What is your name?'
    name = gets.chomp

    response = 'y'
    play_game(name, response)
  else
    say_bye
  end
end

def play_game(name, response)
  print_line

  if response == 'y'
    min_number = 1
    max_number = 50
    number_to_guess = rand(min_number..max_number)
    max_guess = 7

    guesses = 0
    puts "Hey #{name}, I am thinking of a number between #{min_number} and #{max_number}. Take a guess."
    guess = gets.chomp.to_i

    guesses += 1
    while ((guess != number_to_guess) && (guesses < max_guess))
      if guess > number_to_guess
        puts 'Your guess is too high. Go lower.'
      else
        puts 'Your guess is too low. Go higher.'
      end
      guess = gets.chomp.to_i
      guesses += 1
    end

    if guesses == max_guess
      puts 'Sorry, you lose. You ran out of guess!'
      puts "I was thinking of number #{number_to_guess}. Better luck next time!"
    else
      puts "Well done #{name}! You have guessed my number in #{guesses} guesses!"
    end

    puts "Play another game? Enter 'y' to play another game as #{name}, 'n' to start a new game as another player or 'x' to go back to main menu!"
    puts "Enter other than the above alphabet to exit the game"
    response = gets.chomp.downcase

    if response == 'n'
      menu_item = 1
      show_menu(menu_item)
    elsif response == 'y'
      play_game(name, response)
    elsif response == 'x'
      main
    else
      say_bye
    end
  end
end

def say_bye
  puts 'Goodbye :)'
end

main