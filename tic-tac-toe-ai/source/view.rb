class View

  def welcome_player
    reset_screen!
    puts 'Wecome to Tic Tac Toe!'
    puts ''
    puts 'Choose X or O'
    get_user_input
  end

  def get_it_together
    puts ''
    puts 'You lose...'
  end

  def player_order
    puts ''
    puts 'Do you want to go first?'
    get_user_input
  end

  def print_board board, player
    reset_screen!
    puts "#{player}'s turn"
    puts ''

    board.each.with_index do |row, r_i|
      row.each.with_index do |column, c_i|
        unless c_i == row.length - 1
          print " #{column} |"
        else
          puts " #{column} "
        end
      end
      puts '-' * 11 unless r_i == board.length - 1
    end
  end

  def choose_square
    puts ''
    puts '(Select 1-3)'
    print 'Choose a row: '
    row = get_user_input
    print 'Choose a column: '
    column = get_user_input
    [row, column]
  end

  def congratulate_winner board
    winner = board.check_for_winner
    print_board board.get_board, winner
    puts ''
    puts "#{winner} wins!!"
    puts ''
  end

  private

  def get_user_input
    gets.chomp
  end

  def reset_screen!
    clear_screen!
    move_to_home!
  end

  def clear_screen!
    print "\e[2J"
  end

  def move_to_home!
    print "\e[H"
  end
end
