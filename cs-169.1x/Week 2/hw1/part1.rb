#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
  scrub_str = str.gsub(/[^a-zA-Z]/, "").downcase
  scrub_str.reverse == scrub_str
end

def count_words(str)
  word_count = Hash.new(0)
  scrub_str = str.gsub(/[^a-zA-Z ]/, "").downcase
  scrub_str.split(" ").each { |word| word_count[word] += 1  }
  word_count
end
