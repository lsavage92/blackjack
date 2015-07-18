class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    #App Model
    'click .hit-button': ->
      @model.get('game').get('playerHand').hit()
      if @model.get('game').bust(@model.get('game').get('playerHand'))
        console.log "You have busted!"
    'click .stand-button': ->
      @model.get('game').get('playerHand').stand()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    #Creates HandView by getting properties playerHand & dealerHand from AppModel containing "Hands Collection"
    #created from Deck Collection
    @$('.player-hand-container').html new HandView(collection: @model.get('game').get('playerHand')).el
    @$('.dealer-hand-container').html new HandView(collection: @model.get('game').get('dealerHand')).el

