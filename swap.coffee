Should detect 21


Hand.coffee
stand() should be a function
  -should pass turn to dealer










Blackjack Rules to implement
Players turn (in order):
  -If first hand is 21
    -Check if dealers first hand is 21, if so wash/tie
    -Else autowin
  -hits until bust or stand()


Dealers turn (in order):
  -Flips hidden card
  -Draws until at least a hand of 17 or greater
    -dealer stands even if soft 17

After both turns:
  -compare totals and decide winner

Deciding winner:
  -Blackjack (only 2 cards) beats everything except another Blackjack
  -Otherwise closest to 21 w/o going over