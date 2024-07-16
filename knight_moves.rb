def knight_moves(start_point, end_point)
  #check if start_point is valid
  #check if end_point is valid
  #return error message if not
  return nil unless valid?(start_point) && valid?(end_point)
  #build adjacency list for possible moves
  list = create_adjacency_list
  #search list keep count of moves
  #return moves and message
  return true
end

def valid?(coordinates)
  if coordinates[0] < 0 || coordinates[0] > 7
    return false
  end
  if coordinates[1] < 0 || coordinates[1] > 7
    return false
  end
  return true
end

def create_adjacency_list
  list = {}
  positions = [0, 1, 2, 3, 4, 5, 6, 7]
  positions.repeated_permutation(2) {|position| list[position] = []}
  list.each {|key, value| list[key] = possible_moves(key)}
  return list
end

def possible_moves(coordinates)
  moves = []
  shifts = [[-1, 2], [1, 2], [2, 1], [2, -1], [-1, -2], [1, -2], [-2, 1], [-2, -1]]
  shifts.each do |shift| 
    horizontal = shift[0] + coordinates[0]
    vertical = shift[1] + coordinates[1]
    move = [horizontal, vertical]
    if valid?(move)
      moves.push(move) 
    end
  end 
  return moves
end