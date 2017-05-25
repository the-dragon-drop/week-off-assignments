class Board

  def initialize
    @board_data = Array.new(3) { Array.new(3) {' '} }
  end

  def get_board
    @board_data
  end

  def update_square row, column, player
    @board_data[row][column] = player
  end

  def check_for_winner
    return check_rows if check_rows
    return check_columns if check_columns
    return check_diagonals if check_diagonals
  end

  private

  def check_rows board = @board_data
    board.each do |row|
      return row.first if row.uniq.length == 1 && row.first != ' '
    end
    false
  end

  def check_columns
    check_rows @board_data.transpose
  end

  def check_diagonals
    diagonal1 = @board_data.map.with_index { |row, i| row[i] }
    diagonal2 = @board_data.map.with_index { |row, i| row[@board_data.length - 1 - i] }
    check_rows [diagonal1, diagonal2]
  end
end
