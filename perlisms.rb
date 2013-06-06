# Quotes from Alan Perlis

# Allows us to pull a random quote from an array parsed from a list found on
# the internet

module Perlisms

  extend self

  # source: http://www.cs.yale.edu/quotes.html
  PERLISMS = File.read('perlisisms.txt').
    # split into lines
    lines.
    # remove extra trailing newlines
    map(&:chomp).
    # remove blank lines
    reject(&:empty?).
    # remove the number and dot at the start of the line
    map { |s| s[/\d+\.\s+(.+)/,1] }

  def random_quote
    PERLISMS.sample
  end

  def full_name
    "Alan Perlis"
  end

end
