require "minitest/autorun"
require_relative "hangman.rb"

class TestHangman < Minitest::Test

	def test_create_new_game
		game = Hangman.new("beer")
		assert_equal("beer", game.word)
	end

	def test_number_of_spaces
		game = Hangman.new("beer")
		assert_equal("    ", game.spaces)
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
		game.update_spaces("b")
		assert_equal("b   ", game.spaces)
	end

	def test_update_spaces_2
		game = Hangman.new("beer")
		game.update_spaces("e")
		assert_equal(" ee ", game.spaces)
	end

	def test_update_spaces_2
		game = Hangman.new("beer")
		game.update_spaces("r")
		assert_equal("   r", game.spaces)
	end

	def test_for_number_of_allowed_guesses
		game = Hangman.new("beer")
		game.update_tries
		assert_equal(5, game.tries)
	end

	def test_for_letter_already_been_guessed_is_true
		game = Hangman.new("beer")
		guess = "b"
		game.guessed_letters = ["b"]
		assert_equal(true, game.already_guessed?(guess))
	end

	def test_for_letter_already_been_guessed_is_false
		game = Hangman.new("beer")
		guess = "b"
		game.guessed_letters = ["q", "h", "e"]
		assert_equal(false, game.already_guessed?(guess))
	end










end
