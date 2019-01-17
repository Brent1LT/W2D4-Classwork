 list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
  def my_min(list)

    list.each do |el1|
      smallest = true 
        list.each do |el2|
          smallest = false if el2 < el1

        end
        return el1 if smallest  
    end

  end 

#  puts my_min(list)

def my_min2(list)
  smallest = list.first
  list.each {|el| smallest = el if el < smallest}
  smallest
end 

# puts my_min2(list)

def sub_sum(list)
  subsets = []
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      subsets << list[i..j] 
    end 
  end 

  largest_sum = 0
  subsets.each do |arr|
    sum = arr.inject(:+)
    largest_sum = sum if sum > largest_sum
  end

  largest_sum 
end

list2 = [5,3,-7]

puts sub_sum(list)

def sub_sum2(list)
  lcs = 0
  cs = 0
  list.each do |el|
    cs += el
    cs = 0 if cs < 0
    lcs = cs if lcs < cs
  end
  lcs
end

puts sub_sum2(list2)