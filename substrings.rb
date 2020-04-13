class Substring
  def initialize(sentence, dictionary)
    @sentence = sentence
    @dictionary = dictionary
  end

  def count
    dictionary.each_with_object(Hash.new(0)) do |substring, hash|
      words.map { |word| hash[substring] += 1 if word.include?(substring)}
    end
  end

  private

  attr_accessor :sentence, :dictionary

  MATCH_WORDS = /\b[\w']+\b/

  def words
    sentence.downcase.scan(MATCH_WORDS)
  end
end

if $PROGRAM_NAME == __FILE__
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  complexDictionary = ["can't", "couldn't", "wouldn't", "will", "not"]
  p Substring.new("below", dictionary).count
  p Substring.new("Howdy partner, sit down! How's it going?", dictionary).count
  p Substring.new("How polite but I simply couldn't. In fact I simply can't. No I wouldn't. Please I insit. But I will not. I must not", complexDictionary).count
  p Substring.new("Can we tell the difference between 'can't' and can't? Why yes we can. But why?", complexDictionary).count
end
