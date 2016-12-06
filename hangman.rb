class Hangman
    attr_reader :word
    attr_accessor :correct_guesses, :guessed_letters, :tries

    def initialize(word)
         @word = word
         @correct_guesses = " " * word.length
         @guessed_letters = []
         @tries = 6
    end

    def guess(letter)
      letter.upcase!
      unless @guessed_letters.include?(letter)
        @guessed_letters << letter
      end
      if word.include?(letter)
        @correct_guesses << letter
      else
        @tries -=1
      end
    end

    def word_include?(letter)  #this method determines if the guessed letter is in the word
      word.include?(letter)
    end

    def make_guess(letter) #this method determines that letters go into the guessed letters array
      @guessed_letters << letter
      puts "#{guessed_letters}"
    end

    def update_correct_guesses(letter) #this method determines that letters that are part of the word are correctly updated
      i = 0 #sets a counter to 0
      word.length.times do #iterates through the word
        if word[i] == letter #looks at the index value of the word & if the guessed letter is in the right spot
          @correct_guesses [i] = letter #makes the space at that index value equal to the guessed letter
        end
        # puts"\n"
        i += 1 #increments the counter
      end

    end

    def update_tries(letter) #this method decrements the chances by 1
      if word.include?(letter)
      @tries
      else
      @tries -= 1
      end
    end

    def already_guessed?(letter) #this method looks to see if guessed letters are already in the guessed letters array
      @guessed_letters.include?(letter)
    end


    def game_over?
      word == @correct_guesses || @tries == 0 #spaces holds the correct letters that form the word. when equal to the word, the game is over
    end

    def winner
      word == @correct_guesses && @tries > 0 #spaces holds the correct letters that form the word. when equal to the word, the game is over
    end

    def loser
      @tries ==0
    end
      
end
