require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

VALID_CHOICES = %w(rock paper scissors lizard spock)

player_choice = Hash[choice: 'test', victory: 'test2']
computer_choice = ''

player_score = 0
computer_score = 0

def messages(message, category)
  MESSAGES[category][message]
end

def prompt(key, category)
  message = messages(key, category)
  puts "=> #{message}"
end

def display_greeting
  prompt('greeting', 'game')
end

def display_instructions
  prompt('instructions', 'game')
  prompt('instructions2', 'game')
  prompt('instructions3', 'game')
  prompt('instructions4', 'game')
  prompt('instructions5', 'game')
  prompt('instructions6', 'game')
  prompt('instructions7', 'game')
end

def display_choice_error
  prompt('choice_error', 'game')
end

def display_choose_one
  prompt('choose_one', 'game')
end

def display_choices(player, computer)
  puts format(messages('display_choices', 'game'),
              player: player, computer: computer)
end

def display_score(player, computer)
  puts format(messages('display_score', 'game'),
              pscore: player, cscore: computer)
end

def display_choice_relationship(choice1, choice2, winner)
  puts format(messages(choice2, choice1), winner: winner)
end

def display_tie
  prompt('no_win', 'tie')
end

def display_win_round(player, computer)
  display_choice_relationship(player, computer, 'Player')
end

def display_lose_round(player, computer)
  display_choice_relationship(computer, player, 'Computer')
end

def display_win_match
  prompt('match_win', 'game')
end

def display_lose_match
  prompt('match_loss', 'game')
end

def increment_score(winner_score)
  winner_score + 1
end

def display_another_round
  prompt('another_round', 'game')
end

def display_another_match
  prompt('another_match', 'game')
end

def display_goodbye
  prompt('goodbye', 'game')
end

def check_for_match_win(player, computer)
  if player == 5
    display_win_match
    true
  elsif computer == 5
    display_lose_match
    true
  else
    false
  end
end

def get_player_choice
  loop do
    display_choose_one
    case gets.chomp.downcase
    when 'r', 'rock' then return 'rock'
    when 'p', 'paper' then return 'paper'
    when 'sc', 'scissors' then return 'scissors'
    when 'l', 'lizard' then return 'lizard'
    when 'sp', 'spock' then return 'spock'
    else
      display_choice_error
    end
  end
end

def get_computer_choice
  VALID_CHOICES.sample
end

def find_victory_conditions(choice)
  case choice
  when 'rock'
    %w(lizard scissors)
  when 'paper'
    %w(rock spock)
  when 'scissors'
    %w(paper lizard)
  when 'lizard'
    %w(spock paper)
  when 'spock'
    %w(scissors rock)
  end
end

def check_for_round_winner(player, computer)
  if player[:choice] == computer
    'tie'
  elsif player[:victory].include?(computer)
    'player'
  else
    'computer'
  end
end

def play_another_round
  loop do
    display_another_round
    go_again = gets.chomp
    if go_again.downcase == 'y'
      return true
    elsif go_again.downcase == 'n'
      return false
    else
      display_choice_error
    end
  end
end

def play_another_match
  loop do
    display_another_match
    go_again = gets.chomp
    if go_again.downcase == 'y'
      return true
    elsif go_again.downcase == 'n'
      return false
    else
      display_choice_error
    end
  end
end

system('clear') || system('cls')
display_greeting
loop do
  display_instructions
  player_score = 0
  computer_score = 0
  loop do
    player_choice[:choice] = get_player_choice
    player_choice[:victory] = find_victory_conditions(player_choice[:choice])
    computer_choice = get_computer_choice
    display_choices(player_choice[:choice], computer_choice)
    case check_for_round_winner(player_choice, computer_choice)
    when 'player'
      display_win_round(player_choice[:choice], computer_choice)
      player_score = increment_score(player_score)
    when 'computer'
      display_lose_round(player_choice[:choice], computer_choice)
      computer_score = increment_score(computer_score)
    when 'tie'
      display_tie
    end
    display_score(player_score, computer_score)
    break if check_for_match_win(player_score, computer_score)
    break unless play_another_round
    system('clear') || system('cls')
  end
  break unless play_another_match
  system('clear') || system('cls')
end
display_goodbye
