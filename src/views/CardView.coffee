class window.CardView extends Backbone.View
  className: 'card'

  template: _.template ''

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    cardRank = @model.get("rankName").toString()
    cardType = @model.get("suitName").toString()
    card = cardRank.toLowerCase() + "-" + cardType.toLowerCase()
    @$el.css("background-image", "url(./img/cards/"+card+".png)")
    @$el.addClass 'covered' unless @model.get 'revealed'

