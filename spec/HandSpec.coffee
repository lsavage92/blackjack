assert = chai.assert

describe 'Hand', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should be a function', ->
     assert.strictEqual typeof hand.hit, 'function'