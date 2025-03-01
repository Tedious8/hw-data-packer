# frozen_string_literal: true

# Packs/Unpacks a String to and from an Integer
module ShortStringPacker
  CHAR_BITS = 5
  CHAR_MASK = 31 # 0b11111

  ALPHABETS = ('a'..'z').each_with_index.to_h { |val, index| [val.to_sym, index + 1] }
  REVERSE_ALPHABETS = ALPHABETS.invert
  ## Packs a short string into a Integer
  # Arguments:
  #   str - String object
  # Returns: a Integer object
  def self.pack(str)
    # IMPLEMENT THIS METHOD
    str.chars.reduce(0) { |acc, char| (acc << CHAR_BITS) | ALPHABETS[char.to_sym] }
  end

  ## Unpacks a Integer from pack() method into a short string
  # Arguments:
  #   packed - a Integer object
  # Returns: a String object
  def self.unpack(packed)
    # IMPLEMENT THIS METHOD
    return '' if packed.zero?

    char = REVERSE_ALPHABETS[packed & CHAR_MASK].to_s
    unpack(packed >> CHAR_BITS) + char
  end
end
