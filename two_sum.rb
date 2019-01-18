  # BIG O(n^2)
  def bad_two_sum?(arr, target)
    arr.each_with_index do |el, idx|
      (idx+1...arr.length).each do |i2|
        return true if el + arr[i2] == target
      end 
    end   
    false
  end 
  arr = [1,2,3,4,5]
  # puts bad_two_sum?(arr, 8)

  
  def bsearch(arr, target)
    return false if arr.length <= 1 && arr[0] != target
    mid = arr.length / 2
    left = arr[0...mid]
    right = arr[mid..-1]
    if arr[mid] < target
      right_search = bsearch(right, target)
      return true if right_search
    elsif arr[mid] == target
      return true
    else
      left_search = bsearch(left, target)
      return true if left_search
    end
    false
  end
  
  def okay_two_sum?(arr, target)
    arr.sort!
    arr.each_with_index do |el, i|
      return false if el > target
      return true if bsearch(arr[i + 1..-1], target - el)
    end   
    false
  end 

  def hash_map?(arr, target)
    map = {0 => [], 1 => [], 2 => [], 3 => []}
    arr.each{ |num| map[num % 4] << num}

    
    arr.each do |num|
      difference = target - num
      return true if map[difference % 4].include?(difference)
    end
    false

  end

  puts okay_two_sum?(arr, 8)