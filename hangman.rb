class Hangman
    attr_reader :word
    attr_accessor :spaces, :guessed_letters, :tries

    def initialize(word)
         @word = word
         @spaces = " " * word.length
         @guessed_letters = []
         @tries = 6
    end

    def word_include?(guess)  #this method determines if the guessed letter is in the word
      word.include?(guess)
    end

    def make_guess(guess) #this method determines that letters goes into the guessed letters array
      @guessed_letters << guess
    end

    def update_spaces(guess) #this method determines that letters that are part of the word are correctly updated
      i = 0 #sets a counter to 0
      word.length.times do #iterates through the word
        if word[i] == guess #looks at the index value of the word & if the guessed letter is in the right spot
          @spaces [i] = guess #makes the space at that index value equal to the guessed letter
        end
        i += 1 #increments the counter
      end

    end

    def update_tries #this method decrements the chances by 1
      @tries -= 1
    end

    def already_guessed?(guess)
      @guessed_letters.include?(guess)
    end

    def game_over?
      word == @spaces || @tries == 0
      #   true
      # end
    end

end
