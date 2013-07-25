def combine_anagrams(words)
  keys = {}
  words.each do |word|
    key = word.downcase.chars.sort.join
    if keys[key].nil?
      keys[key] = [word]
    else
      keys[key] << word
    end
  end
  keys.values
end