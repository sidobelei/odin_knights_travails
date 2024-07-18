def knight_moves(start_point, end_point)
  return puts "Invalid Coordinate(s)" unless valid?(start_point) && valid?(end_point)
  list = create_adjacency_list
  routes = Array.new([[start_point]])
  end_route = nil
  until end_route
    if routes.length == 1
      children_queue = list[routes[0][0]]
    else
      children_queue = list[routes[0].last]
    end
    children_queue.each do |position|
      route = routes[0].dup.push(position)
      routes.push(route)
      break if route.last == end_point
    end
    routes.each_with_index do |route, index|
      if !route.find_index(end_point).nil?
        end_route = routes[index]
        break
      end
    end
    routes.shift
  end
  puts "You made it in #{end_route.length - 1} moves! Here's your path:"
  end_route.each {|point| print "#{point}\n"}
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