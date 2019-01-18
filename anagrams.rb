  def first_anagram?(word1, word2)
    anagram_arr = rec_anagrams(word1)
    anagram_arr.include?(word2)
  end 

  def rec_anagrams(word)
    anagram_arr = []
    return [word] if word.length == 1

    word.chars.each_with_index do |char, i|
      rec_anagrams(word[0...i] + word[i+1..-1]).each do |el|
        anagram_arr << char + el 
      end 
    end 
    anagram_arr
  end 
  

  def second_anagram?(word1, word2)
    word1.each_char do |char|
      idx = word2.index(char)
      return false if idx == nil
      word2 = word2[0...idx] + word2[idx + 1..-1]
    end
    word2.length == 0
  end

  def third_anagram?(word1, word2)
    word1.chars.sort == word2.chars.sort
  end

  def fourth_anagram?(word1, word2)
    anagrams = Hash.new(0)
    word1.chars.each { |char| anagrams[char] += 1}
    word2.chars.each { |char| anagrams[char] -= 1}
    anagrams.values.all? { |val| val == 0}
  end
  
  puts "now the file is loaded!"
  puts first_anagram?("elvis", "lives")
  puts second_anagram?("aeebcfghde", "efbdgcheea")
  puts third_anagram?("abcdefeeeegh", "ehbfeeeedcga")
  puts fourth_anagram?("abcdefeeeegh", "ehbfeeeedcga")