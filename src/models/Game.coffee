class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer() #creates new player hand via deck
    console.log " original playerHand", @get 'playerHand'
    @set 'dealerHand', deck.dealDealer() #creates new dealer hand via deck
    console.log " original dealerHand", @get 'dealerHand'

    @get('playerHand').on("stand", =>
      console.log 'stand'
      @automateDealer())

    @get('playerHand').on("hit", =>
      if @bust @get('playerHand')
        alert 'Player Bust, Dealer Win. Press okay to deal'
        @newHand())

  #Automate dealer moves will be fn
  automateDealer: ->
    console.log 'automateDealer'
    dealer = @get('dealerHand')
    if !dealer.models[0].get('revealed') then dealer.models[0].flip()
    #if dealer is greater than 17, automatically determine outcome
    if dealer.scores()[1] > 17 then dealerScore = dealer.scores()[1] else dealerScore = dealer.scores()[0]
    if dealerScore >= 17
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


    if @bust dealer
      alert 'Dealer Bust, Player Wins! Press okay to deal'
      @newHand()
    else if @tie(player, dealer)
      alert 'Push! Press okay to deal'
      @newHand()
    else @determineWinner(player, dealer)

  bust: (hand) ->
    if hand.scores()[0] > 21 then true
    else false

  determineWinner: (player, dealer) ->
    if player.scores()[1] > 21 then playerScore = player.scores()[0] else playerScore = player.scores()[1]
    if dealer.scores()[1] > 21 then dealerScore = dealer.scores()[0] else dealerScore = dealer.scores()[1]
    if playerScore > dealerScore
      alert "Player Wins! Press okay to deal"
      @newHand()
    else
      console.log playerScore, dealerScore
      alert "You have lost. Press okay to deal"
      @newHand()

  tie: (player, dealer) ->
    if player.scores()[0] == dealer.scores()[0] then return true

  newHand: ->
    if @get('deck').length < 10
      @set 'deck', new Deck()

    @set 'playerHand', @get('deck').dealPlayer() #creates new player hand via deck
    @set 'dealerHand', @get('deck').dealDealer() #creates new dealer hand via deck
    @trigger('newHand',@)

    @get('playerHand').on("stand", =>
      @automateDealer())

    @get('playerHand').on("hit", =>
      if @bust @get('playerHand')
        alert 'Player Bust, Dealer Win. Press okay to deal'
        @newHand())

  #blackJack: ->

