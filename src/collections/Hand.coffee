class window.Hand extends Backbone.Collection
  model: Card

  #set's initial properties for cards in hand(array), this deck instance, whether it's a dealer or not
  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if @deck.length == 1
      @deck = new Deck()
      console.log "Shuffling new deck"
    nextCard = @deck.pop()
    @add(nextCard)

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  stand: ->
    console.log "hand triggered stand()"
    @trigger('stand', @)
  #need to add stand() called from AppView click event