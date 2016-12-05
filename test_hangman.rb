require "minitest/autorun"
require_relative "hangman.rb"

class TestHangman < Minitest::Test

	def test_create_new_game
		game = Hangman.new("beer")
		assert_equal("beer", game.word)
	end

	def test_number_of_spaces
		game = Hangman.new("beer")
		assert_equal("    ", game.correct_guesses)
	end

	def test_if_guessed_letter_is_in_word
		game = Hangman.new("beer")
		assert_equal(true, game.word_include?("b"))
		assert_equal(false, game.word_include?("z"))
	end

	def test_at_beginning_of_game_guessed_letters_array_is_empty_array
		game = Hangman.new("beer")
		assert_equal([], game.guessed_letters)
	end

	def test_guessed_letter_goes_into_array
		game = Hangman.new("beer")
		game.make_guess("e")
		game.make_guess("z")
		assert_equal(["e", "z"], game.guessed_letters)
	end

	def test_update_spaces
		game = Hangman.new("beer")
		game.update_correct_guesses("b")
		assert_equal("b   ", game.correct_guesses)
	end

	def test_update_spaces_2
		game = Hangman.new("beer")
		game.update_correct_guesses("e")
		assert_equal(" ee ", game.correct_guesses)
	end

	def test_update_spaces_3
		game = Hangman.new("beer")
		game.update_correct_guesses("r")
		assert_equal("   r", game.correct_guesses)
	end

	def test_number_of_tries_decreases_with_incorrect_guess
		game = Hangman.new("beer")
		letter = "j"
		game.tries = 4
		assert_equal(3, game.update_tries(letter))
	end

	def test_number_of_tries_does_not_decrease_with_correct_guess
		game = Hangman.new("beer")
		letter = "b"
		game.tries = 5
		assert_equal(5, game.update_tries(letter))
	end

	def test_for_letter_already_been_guessed_is_true
		game = Hangman.new("beer")
		letter = "b"
		game.guessed_letters = ["b"]
		assert_equal(true, game.already_guessed?(letter))
	end

	def test_for_letter_already_been_guessed_is_false
		game = Hangman.new("beer")
		letter = "b"
		game.guessed_letters = ["q", "h", "e"]
		assert_equal(false, game.already_guessed?(letter))
	end

	def test_for_game_over
		game = Hangman.new("beer")
		game.tries = 0
		assert_equal(true, game.game_over?)
	end

	def test_for_game_over
		game = Hangman.new("beer")
		game.tries = 1
		assert_equal(false, game.game_over?)
	end

	def test_for_game_over
		game = Hangman.new("beer")
		game.correct_guesses = "bee "
		assert_equal(false, game.game_over?)
	end

	def test_for_game_over
		game = Hangman.new("beer")
		game.correct_guesses = "beer"
		assert_equal(true, game.game_over?)
	end

	# def test_for_winner
	# 	game = Hangman.new("beer")

end
