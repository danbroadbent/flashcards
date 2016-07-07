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
