class Hangman
    attr_reader :word, 
    attr_accessor :spaces, :guessed_letters, :chances

    def initialize(word)
         @word = word
         @spaces = "_" * word.length
         @guessed_letters = []
         @chances = 6
    end

    def word_include?(guess)
      word.include?(guess)
    end

    def make_guess(guess)
      @guessed_letters << guess
    end

    def update_spaces(guess)
      # spaces_array = @spaces.split("")
      i = 0
      word.length.times do
        if word[i] == guess
          @spaces [i] = guess
        end
        i += i
      end

    end

    def update_chances
      @chances -= 1
    end
end
