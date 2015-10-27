class Board
  attr_accessor :queens
  BOARD_LENGTH = 4
  QUEENS = 2

  def initialize
    @queens, @valid_moves = [], generate_valid_moves_array
  end

  def select_move
    result = nil

    @valid_moves.each do |move|
      temp_queens = @queens.dup
      temp_queens << move
    end
  end

  def remove_invalid_moves
    @valid_moves.delete_if { |move| !valid_placement?(*move) }
  end

  def generate_valid_moves_array
    valid_moves = []

    (0..BOARD_LENGTH).to_a.each do |x|
      (0..BOARD_LENGTH).to_a.each do |y|
        valid_moves << [x,y]
      end
    end

    valid_moves
  end

  def valid_placement?(row, col)
    rows_invalid = @queens.any? { |pos| pos[0] == row }
    cols_invalid = @queens.any? { |pos| pos[1] == col }
    diagonals_invalid = on_diagonal?(row, col)
    ![rows_invalid, cols_invalid, diagonals_invalid].any?
  end

  def on_diagonal?(x, y)
    @queens.any? do |queen|
      queen_x = queen[0]
      queen_y = queen[1]
      (x - y) == (queen_x - queen_y) || (x - y) == (queen_y - queen_x)
    end
  end
end
