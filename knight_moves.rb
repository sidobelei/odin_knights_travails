def knight_moves(start_point, end_point)
  #check if start_point is valid
  #check if end_point is valid
  return nil unless valid?(start_point) && valid?(end_point)
  #return error message if not
  #build tree for possible moves
  #search tree keep count of moves
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