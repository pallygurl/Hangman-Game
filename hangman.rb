class Hangman
  attr_reader :word
  attr_accessor :correct_guesses, :guessed_letters, :tries

  def initialize(word)
    @word = word
    # @correct_guesses = " " * word.length
    @guessed_letters = []
    @tries = 6
    @correct_guesses = Array.new(word.length, " ")
  end

  def word_include?(guess) # this method determines if the guessed letter is in the word
    word.include?(guess)
  end

  def update_correct_guesses(guess) # this method determines that letters that are part of the word are correctly updated
    i = 0 # sets a counter to 0
    word.length.times do # iterates through the word
      if word[i] == guess # looks at the index value of the word & if the guessed letter is in the right spot
        @correct_guesses [i] = guess # makes the space at that index value equal to the guessed letter
      end
      i += 1 # increments the counter
    end
  end

  def update_tries(guess) # this method decrements the chances by 1
    if word.include?(guess)
      @tries
    else  
      @tries = @tries -= 1
    end  
  end

  def update_guessed_letters(guess) # this method looks to see if guessed letters are already in the guessed letters array
    @guessed_letters << guess
  end

  def make_guess(guess) # this method determines that letters go into the guessed letters array
    update_guessed_letters(guess)
    if word_include?(guess)
      update_correct_guesses(guess)
    else
      update_tries(guess)
    end
  end

  def game_over?
    word == @correct_guesses || @tries.zero? # spaces holds the correct letters that form the word. when equal to the word, the game is over
  end

  def winner?
    word == @correct_guesses # spaces holds the correct letters that form the word. when equal to the word, the game is over
  end

  def loser?
    @tries.zero?
  end

end
