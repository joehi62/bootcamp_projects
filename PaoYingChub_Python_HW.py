# -*- coding: utf-8 -*-

# -- Sheet --

import random

def play_game(player_name, score):
  # List of possible choices
  choices = ['h', 's', 'p']
  
  # Get player's choice
  player_choice = input('Enter your choice (h)ammer, (s)cissors, (p)aper : ')
  
  # Validate player's choice
  if player_choice not in choices:
    print('Invalid choice!')
    return score
  
  # Generate computer's choice
  computer_choice = random.choice(choices)
  
  # Determine the winner
  if player_choice == computer_choice:
    print(f"{player_name} chose {player_choice} and the computer chose {computer_choice}.")
    print(f'It\'s a tie! {player_name} has {score} points.')
  elif (player_choice == 'h' and computer_choice == 's') or \
       (player_choice == 'p' and computer_choice == 'h') or \
       (player_choice == 's' and computer_choice == 'p'):
    print(f"{player_name} chose {player_choice} and the computer chose {computer_choice}.")
    print(f'You win! {player_name} has {score + 1} points.')
    score += 1
  else:
    print(f"{player_name} chose {player_choice} and the computer chose {computer_choice}.")
    print(f'Computer wins! {player_name} has {score} points.')
  
  return score

# Main program
print('Welcome to Pao Ying Chub Game.')
player_name = input("What's your name? ")
score = 0
total_plays = 0

# Play the game
while True:
  score = play_game(player_name, score)
  total_plays += 1
  play_again = input('Do you want to play again (y/n)? ')
  if play_again != 'y':
    break

print(f'Thanks for playing, {player_name}!')
print(f'You Play {total_plays} and Your final score is {score}.')

