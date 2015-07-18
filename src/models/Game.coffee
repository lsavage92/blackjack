class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer() #creates new player hand via deck
    @set 'dealerHand', deck.dealDealer() #creates new dealer hand via deck

    @get('playerHand').on("stand", =>
      console.log 'stand'
      @automateDealer())

  #Automate dealer moves will be fn
  automateDealer: ->
    console.log 'automateDealer'
    dealer = @get('dealerHand')
    if !dealer.models[0].get('revealed') then dealer.models[0].flip()
    #if dealer is greater than 17, automatically determine outcome
    if dealer.scores()[0] >= 17
      @outcome()
    #if dealer is less than 17, dealer.hit()
    else
      dealer.hit()
      @automateDealer()
  #what to do when player stands
  #Determine outcome of game will be fn

  outcome: ->
    console.log 'determine'
    dealer = @get('dealerHand')
    player = @get('playerHand')

    if @bust player then console.log 'Player Bust'
    if @bust dealer then console.log 'Dealer bust, player win'

    if player.scores()[0] > dealer.scores()[0]
      console.log 'You have won!'
    else if player.scores()[0] == dealer.scores()[0]
      console.log 'Push!'
    else
      console.log 'You have lost!'

  bust: (hand) ->
    if hand.scores()[0] > 21 then true
    else false

