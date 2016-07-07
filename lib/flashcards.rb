class Card
  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def question
    @question
  end

  def answer
    @answer
  end

end

class Guess
  def initialize(response, card)
    @response = response
    @card = card
  end

  def response
    @response
  end

  def card
    @card
  end

  def correct?
    @response == card.answer
  end

  def feedback
    if correct? == true
      return "Correct!"
    else
      return "Incorrect."
    end
  end
end

class Deck
  def initialize(deck)
    @deck = deck
  end

  def cards
    @deck
  end

  def count
    @deck.count
  end
end

class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def guesses
    []
  end

  def current_card
    @deck[0]
  end



end
