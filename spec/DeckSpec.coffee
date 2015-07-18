assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should be a function', ->
      assert.strictEqual typeof hand.hit, 'function'

  describe 'last', ->
    it 'should be a function', ->
      assert.strictEqual typeof deck.last, 'function'

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      #added .last() to the hit invocation to get a card
      assert.strictEqual deck.last(), hand.hit().last()
      assert.strictEqual deck.length, 49
