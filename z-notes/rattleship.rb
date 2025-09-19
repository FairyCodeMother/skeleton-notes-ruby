# Task: Place rattleship boats on the game's Board.

=begin
    1. The game board is 10 x 10.
    2. Exactly one of each type of marker must be on the board.
    3. A marker must not go off of the board.
    4. A marker must not overlap with another marker.
    5. Markers must be randomly arranged each time the api is called.

Example empty board:
    . . . . . . . . . .
    . . . . . . . . . .
    . . . . . . . . . .
    . . . . . . . . . .
    . . . . . . . . . .
    . . . . . . . . . .
    . . . . . . . . . .
    . . . . . . . . . .
    . . . . . . . . . .
    . . . . . . . . . .


Example filled board:
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 S S 0 0 0 0 0 0
    0 0 0 0 0 0 0 M 0 0
    0 0 0 0 0 0 0 M 0 0
    0 0 0 0 0 0 0 M 0 0
    L 0 0 0 0 0 0 0 0 0
    L 0 X X X X X 0 0 0
    L 0 0 0 0 0 0 0 0 0
    L 0 0 0 0 0 0 0 0 0


Example display board:
    . . . . . . . . . .
    . . . . . . . . . .
    . . S S . . . . . .
    . . . . . . . M . .
    . . . . . . . M . .
    . . . . . . . M . .
    L . . . . . . . . .
    L . X X X X X . . .
    L . . . . . . . . .
    L . . . . . . . . .

=end


# Execute: ruby rattleship.rb



# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================


SQUARE_SIZE = 10

ALL_MARKERS = {
    "Small" => { "size" => 2, "name" => "S" },
    "Medium" => { "size" => 3, "name" => "M" },
    "Large" => { "size" => 4, "name" => "L" },
    "XLarge" => { "size" => 5, "name" => "X" },
}.freeze
COL_MAX = SQUARE_SIZE
ROW_MAX = SQUARE_SIZE
@board


# Game piece
class Marker
    attr_accessor :name, :size

    # Create empty Marker
    def initialize(name = '', size = 0)
        @name = name
        @size = size
    end

    # Fill Marker with provided values
    def fill_marker(markerValue)
        @name = markerValue["name"]
        @size = markerValue["size"]
        self
    end

end


# Game Board
#   Col: x-axis is the horizontal axis =  <---->
#   Row: y-axis is the vertical axis =   ^v
class Board < Array

    # Fill "empty" 2D array with 0
    def initialize(rows, cols)
        super(rows) {
            Array.new(cols, 0)
        }
    end


    # Check marker will be on the board
    def in_bounds(marker_size, random_placement)
        is_horizontal = random_placement["is_horizontal"]
        start_row = random_placement["row_start"]
        start_col = random_placement["col_start"]
        end_row = is_horizontal ? start_row : start_row + marker_size
        end_col = is_horizontal ? start_col + marker_size - 1 : start_col
        valid = true

        # check if marker's start is in-bounds
        if ( start_row < 0 || start_col < 0 || start_row >= ROW_MAX || start_col >= COL_MAX )
            valid = false
        end

        # check if marker's end is in-bounds
        if ( end_row < 0 || end_col < 0 || end_row >= ROW_MAX || end_col >= COL_MAX )
            valid = false
        end

        return valid
    end

    # Check marker does not overlap with another marker
    def has_overlap(marker, random_placement)
        marker_size = marker.size
        is_horizontal = random_placement["is_horizontal"]
        start_row = random_placement["row_start"]
        start_col = random_placement["col_start"]
        end_row = is_horizontal ? start_row : start_row + marker_size
        end_col = is_horizontal ? start_col + marker_size- 1 : start_col
        valid = true

        # puts
        # puts " Has Overlap"
        # puts "    Marker #{marker.name} (#{marker_size})"
        # puts "    Start: Row: #{start_row} and col: #{start_col}."
        # puts "    End: Row: #{end_row} and col: #{end_col}."

        marker_size.times do |segment|
            # puts "Segment: #{segment}"

            if(is_horizontal)
                col = start_col + segment
                # puts "  Row #{start_row}, col: #{col}"
                cell_value = self[start_row][col]
                # puts "      (H) Contains: #{cell_value}\n"

                if (cell_value != 0)
                    return false
                end

            else
                row = start_row + segment
                # puts "  Col #{start_col}, row: #{row}"
                cell_value = self[row][start_col]
                # puts "      (V) Contains: #{cell_value}\n"

                if (cell_value != 0)
                    return false
                end

            end
        end

        return valid
    end


    # NOT COMPLETE
    def place_marker(random_placement, marker)
        # puts
        # puts "Place Marker"
        # print_board("Current board:")

        name = marker.name
        size = marker.size
        is_horizontal= random_placement["is_horizontal"]
        col_start= random_placement["col_start"]
        row_start= random_placement["row_start"]
        # puts "Placement: is_horizontal: #{is_horizontal} | col_start: #{col_start} | row_start: #{row_start}"

        placed = false
        # Fill Row
        if (is_horizontal)
            # puts "Placing  #{size} x '#{name}' in row #{row_start} at cols: #{col_start}-#{col_start+size-1}.\n"

            size.times do |count|
                col = col_start + count
                # puts "Count: #{count} in col: #{col}."
                # puts "    Before: #{self[row_start][col]}"
                self[row_start][col] = name
                # puts "    After: #{self[row_start][col]}"

                placed = true

            end
            # puts

        # Fill Col
        else
            # puts "Placing  #{size} x '#{name}' in col #{col_start} at row: #{row_start}-#{row_start+size-1}.\n"

            size.times do |count|
                row = row_start + count
                # puts "Count: #{count} in row: #{row}."
                # puts "    Before: #{self[row][col_start]}"
                self[row][col_start] = name
                # puts "    After: #{self[row][col_start]}"

                placed = true

            end
            # puts

        end

        # print_board("Updated board:")

        return placed

    end


    def print_board(title)
        puts title
        each do |row|
            row.each do |cell|
                print cell == 0 ? ". " : "#{cell} "
            end
            puts
        end
        puts
    end

end



# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================



class Rattleship

    # Creates a new game board with one of each game piece (marker).
    # Markers are
    #   1. Completely on the game board
    #   2. Randomly places
    #   3. Do not overlap
    def initialize
        # Create 2D array game board
        @board = Board.new(ROW_MAX, COL_MAX)

        # Create game pieces from marker types
        game_pieces = create_game_pieces()

        puts "Creating empty board and game pieces."
        puts "Placing game pieces."

        # Randomly place game pieces on the boar.d
        populate_board(game_pieces)
        puts "Finished placing game pieces."
    end

    def create_game_pieces
        @game_pieces = []
        ALL_MARKERS.each do |key, value|
            marker = Marker.new
            marker.fill_marker(value)

            @game_pieces << marker
        end
        @game_pieces
    end

    # DO HORIZONTAL FIRST: ROWS ARE EASIER
    def generate_placement
        {
            "is_horizontal" => [true, false].sample,
            "col_start" => rand(COL_MAX),
            "row_start" => rand(ROW_MAX),
        }
    end


    def populate_board(game_pieces)
        # puts "\nPopulating board."
        # puts
        # puts game_pieces.to_s
        # puts

        game_pieces.each do | marker |
            placed = false
            size = marker.size
            name = marker.name
            # puts "Placing marker: #{name} (#{size})"

            while(!placed)
                random_placement = generate_placement
                is_horizontal= random_placement["is_horizontal"]
                col_start= random_placement["col_start"]
                row_start= random_placement["row_start"]

                # puts "    Random Row: #{row_start}"
                # puts "    Random Col: #{col_start}"
                # puts "    Random is_horizontal: #{is_horizontal}"
                # puts

                # Check target placement is in the game board bounds
                valid = @board.in_bounds(size, random_placement)
                # puts "In bounds: #{valid}"
                if (!valid)
                    # puts "Next..."
                    next
                end

                # Check that marker doesn't intersect other markers
                valid = @board.has_overlap(marker, random_placement)
                # puts "Has overlap: #{valid}"
                if (!valid)
                    # puts "Next..."
                    next
                end

                # place the marker
                placed = @board.place_marker(random_placement, marker)

                # message = "\nIs placed? #{placed}.\n\n"
                # abort(message)
                # puts message

            end
            # puts "Next game piece..."

        end


    end

    def run
        puts "=========================== PRINTING END RESULT ==========================="
        @board.print_board("")
    end

end


# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================
# ==============================================================================



puts "\n\n==============================================\n STARTING RATTLESHIP"
puts "------------------------------------------------\n"

rattleship = Rattleship.new

rattleship.run

puts "\n------------------------------------------------\n ENDING RATTLESHIP"
puts "==============================================\n"
