class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end
  

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    (0...@secret_word.length).select {|i| @secret_word[i].eql?(char)}
  end

  def fill_indices(char, inds)
    inds.each {|i| @guess_word[i] = char}
  end

  def try_guess(char)
    if self.already_attempted?(char)
      print "that was already attempted"
      return false
    end
    indices = self.get_matching_indices(char)
    if indices.empty?
      @remaining_incorrect_guesses -= 1
    else 
      self.fill_indices(char, indices)
    end
    @attempted_chars << char
    true
  end

  def ask_user_for_guess
    print "Enter a char: "
    char = gets.chomp
    return self.try_guess(char)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "WIN"
      return true
    end

    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end

    false
  end

  def game_over?
    if self.win? || self.lose?
      puts "\nWord was #{@secret_word}\n\n"
      return true
    end

    false
  end

end
