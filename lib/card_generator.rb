class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def cards
    cards = IO.readlines(@filename)
    separated_cards = cards.map do |card|
      splitting_qa = card.chomp.split(",")
      Card.new(splitting_qa[0], splitting_qa[1])
    end
  end
end
