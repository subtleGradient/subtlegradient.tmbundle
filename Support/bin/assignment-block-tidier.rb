#!/usr/bin/ruby

# Assignment block tidier, version 0.1.
#
# Copyright Chris Poirier 2006.
# Licensed under the Academic Free License version 3.0.
# 
# MODIFIED BY Thomas Aylott of subtleGradient.com
# I added the ability to align by more than just an '='
# 
#                 ,
#  tAy           $$          
#               $$$|          
#       $$     $$ $$          
#    ss$$ss,  $$ss|$ `$$   $$` 
#     $$,    $$    $| '$b,$|'      
#     º$$º’ $$     $$  '$$     
#         •           ,$$
#                  `º$P 
#
# It's been WAY too long since i've done ASCii ;) 
#              
# You must cause the Source Code for any Derivative Works that You
# create to carry a prominent Attribution Notice reasonably calculated
# to inform recipients that You have modified the Original Work.
#
# This script can be used as a command for TextMate to align all 
# of the equal signs within a block of text.  When using it with
# TextMate, set the command input to "Selected Text" or "Document",
# and the output to "Replace Selected Text".  Map it to a key 
# equivalent, and any time you want to tidy up a block, either 
# select it, or put your cursor somewhere within it; then hit the
# key equivalent.  Voila.
#
# Note that this is the first version of the script, and it hasn't
# been heavily tested.  You might encounter a bug or two. 
#
# Per the license, use of this script is ENTIRELY at your own risk.
# See the license for full details (they override anything I've 
# said here).

lines         = STDIN.readlines()
selected_text = ENV.member?("TM_SELECTED_TEXT")

thinggies = ['=']
thinggies_stuff = {
  :default => {
    :space_before => true,
    :space_after  => true,
    :align_after  => false
  }
}

case ENV['TM_SCOPE']
when /.*ruby.*/
  thinggies    = ['=','=>','=~','#']
  thinggies_stuff.merge!({
    :'#' => {
      :space_before => true,
      :space_after  => false,
      :align_after  => false
    }
  })
when /.*css.*/
  thinggies    = ['{',';',':']
  thinggies_stuff.merge!({
    :default => {
      :space_before => false,
      :space_after  => true,
      :align_after  => true
    },
    :'{' => {
      :align_after => false
    }
  })
end

# ENV Version
if ENV.member?('ALIGN_TO')
  ALIGN_TO      = ENV['ALIGN_TO']
  thinggies     = ALIGN_TO.split
  space_before  = (true if ALIGN_TO.match(/^\s/) || false) 
  space_after   = (true if ALIGN_TO.match(/\s$/) || false) 
  space_before  = true  if ENV.member?('ALIGN_SPACE_BEFORE')
  space_after   = true  if ENV.member?('ALIGN_SPACE_AFTER')
  if ENV.member?('ALIGN_AFTER')
    align_after = true
  else
    align_after = false
  end
  
  # Set defaults 
  thinggies_stuff.merge!({
    :default => {
      :space_before => space_before,
      :space_after  => space_after,
      :align_after  => align_after
    }
  })
end


thinggies.each do |thinggy|
  align_after  = thinggies_stuff[thinggy.to_sym][:align_after]  rescue thinggies_stuff[:default][:align_after]
  space_before = thinggies_stuff[thinggy.to_sym][:space_before] rescue thinggies_stuff[:default][:space_before]
  space_after  = thinggies_stuff[thinggy.to_sym][:space_after]  rescue thinggies_stuff[:default][:space_after]
  
  replacement_thinggy   = "#{' ' if space_before}#{thinggy}#{' ' if space_after}"
  thinggy = Regexp.escape(thinggy) #Yes, they have to be in this order
  relevant_line_pattern = /^[^#{thinggy}]+#{thinggy}#{' ' if space_after}/
  column_search_pattern = /#{' *' if space_before}#{thinggy}#{' ' if space_after}/


  #
  # If called on a selection, every assignment statement
  # is in the block.  If called on the document, we start on the 
  # current line and look up and down for the start and end of the
  # block.

  if selected_text then
     block_top    = 1
     block_bottom = lines.length
  else
 
     #
     # We start looking on the current line.  However, if the
     # current line doesn't match the pattern, we may be just
     # after or just before a block, and we should check.  If
     # neither, we are done.

     start_on      = ENV["TM_LINE_NUMBER"].to_i
     block_top     = lines.length + 1
     block_bottom  = 0
     search_top    = 1
     search_bottom = lines.length
     search_failed = false

     if lines[start_on - 1] !~ relevant_line_pattern then
        if lines[start_on - 2] =~ relevant_line_pattern then
           search_bottom = start_on = start_on - 1
        elsif lines[start_on] =~ relevant_line_pattern then
           search_top = start_on = start_on
        else
           search_failed = true
        end 
     end

     #
     # Now with the search boundaries set, start looking for
     # the block top and bottom.
   
     unless search_failed
        start_on.downto(search_top) do |number|
           if lines[number-1] =~ relevant_line_pattern then
              block_top = number
           else
              break
           end
        end
      
        start_on.upto(search_bottom) do |number|
           if lines[number-1] =~ relevant_line_pattern then
              block_bottom = number
           else
              break
           end
        end
     end
  end


  #
  # Now, iterate over the block and find the best column number
  # for the = sign.  The pattern will tell us the position of the
  # first bit of whitespace before the equal sign.  We put the
  # equals sign to the right of the furthest-right one.  Note that
  # we cannot assume every line in the block is relevant.

  best_column = 0
  block_top.upto(block_bottom) do |number|
     line = lines[number - 1]
     if line =~ relevant_line_pattern then
        m = column_search_pattern.match(line)
        best_column = m.begin(0) if m.begin(0) > best_column
     end
  end

   
  #
  # Reformat the block.  Again, we cannot assume all lines in the 
  # block are relevant.

  block_top.upto(block_bottom) do |number|
     if lines[number-1] =~ relevant_line_pattern then
        before, after = lines[number-1].split(column_search_pattern, 2)
        if align_after
          lines[number-1] = (before.ljust(best_column) + replacement_thinggy).gsub(/(\s*)(#{Regexp.escape(replacement_thinggy)})/,'\2\1') + after
        else
          lines[number-1] = before.ljust(best_column) + replacement_thinggy + after
        end
     end
  end
end


#
# Output the replacement text
lines.each do |line|
   puts line
end
