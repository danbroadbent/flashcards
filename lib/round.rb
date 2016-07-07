class Round
  attr_reader :deck, :current_card
  attr_accessor :guesses, :number_correct, :card_counter

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
    @card_counter = 0
    @current_card = deck.cards[0]
  end

  def current_card
    @current_card = deck.cards[@card_counter]
  end

  def record_guess(guess)
    @card_counter += 1
    @guesses << guess
    if guess.feedback == "Correct!"
      @number_correct += 1
    end
  end

  def percent_correct
    percent_correct = (@number_correct.to_f / @card_counter.to_f) * 100
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards.\n-------------------------------------------------"
    until @card_counter == deck.count
      puts "This is card #{card_counter + 1} out of #{deck.count}"
      puts "#{current_card.question}"
      guess = Guess.new(gets.chomp, current_card)
      record_guess(guess)
      puts guess.feedback
    end
    puts "****** Game over! ******"
    puts "You had #{@number_correct} correct guesses out of #{guesses.count} for a score of #{percent_correct}%."
  end

end
