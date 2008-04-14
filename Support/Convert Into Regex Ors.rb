def convert_into_regex_ors(lines)
  lines = lines.split(/[\n ]/) unless lines.kind_of?(Array)
  return lines.collect{|a| Regexp::escape(a)+"|" unless a == '' }.to_s.gsub(/\|$/,'')
end

print convert_into_regex_ors(STDIN.read)

# TEST #

# puts convert_into_regex_ors(%w{a b c d e f g h i j k l}) == 'a|b|c|d|e|f|g|h|i|j|k|l' ? 'PASSED' : 'FAILED'
# puts convert_into_regex_ors("a b c d e f g h i j k l")   == 'a|b|c|d|e|f|g|h|i|j|k|l' ? 'PASSED' : 'FAILED'
# puts convert_into_regex_ors('
#   a
# b$%
#     c% e
# g
# +++
# *
# 67(*&^87)`3o419 87qw
# h 
# ') == 'a|b\$%|c%|e|g|\+\+\+|\*|67\(\*&\^87\)`3o419|87qw|h' ? 'PASSED' : 'FAILED'
