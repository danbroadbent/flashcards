gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'

class FlashcardsTest < Minitest::Test

  def test_cards_have_questions_and_answers
    card = Card.new("question", "answer")
    assert_equal card.question, "question"
    assert_equal card.answer, "answer"
  end

  def test_cards_have_different_questions_and_answers
    card = Card.new("different question", "different answer")
    assert_equal card.question, "different question"
    assert_equal card.answer, "different answer"
  end
end
