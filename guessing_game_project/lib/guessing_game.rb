class GuessingGame

    # attr_reader :num_attempts, :game_over?

    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        @game_over = @secret_num == num
        if @secret_num == num
            print "you win"
        elsif @secret_num < num
            print "too big" 
        else
            print "too small"
        end
    end

    def ask_user
        print "enter a number: "
        num = gets.chomp.to_i
        self.check_num(num)
    end
end
