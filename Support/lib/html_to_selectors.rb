#!/usr/bin/env ruby
require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'pp'

class HTMLDoc
  attr_reader :html
  attr_reader :doc
  
  def initialize(html)
    @html=html
    @doc = Hpricot(html)
  end
  
  def self.selectors(doc,depth=0,dad='')
    selectors = []
    
    nodes = (doc/'>*').each do |n|
      next unless n.elem?
      
      # Filter the dad
      dad = '' if n['id'] # IDs should always be the root element
      
      has_kids = (n/'>*').reject{|node|!node.elem?}.length > 0
      
      # Create the selector
      s = [
        dad+' ',
        n.name,
        ('#'+n['id'] if n['id']),
        ('.'+n['class'].split(' ').join('.') if n['class']),
      ].join('')
      
      # Write out the selector
      selectors << "\t" * depth +  s
      selectors << "\t" * depth + "/** #{s}  */" if has_kids
      if n.name == 'a'
        selectors << "\t" * depth + s + ':link'
        selectors << "\t" * depth + s + ':visited'
        selectors << "\t" * depth + s + ':hover'
      end
      
      # Setup the children
      dad = '#'+n['id'] if n['id']
      
      selectors += HTMLDoc.selectors(n, depth+1, dad)
      
      selectors << "\t" * depth + "/*  #{s} **/" + "\n" + "\t" * depth if has_kids
    end
    
    selectors.flatten.compact
  end
  
  def to_css
    html = ''
    root = @doc/'body'
    root = @doc unless root and root.length > 0
    
    HTMLDoc.selectors(root).each do |selector|
      html << selector
      html << " {}" unless selector =~ /\/$/ or selector =~ /^\s+$/
      html << "\n"
    end
    html.gsub(/div#/,'#')
  end
end

unless ENV['TM_TEST']
  
  puts HTMLDoc.new(STDIN.read).to_css
  
else
  require "test/unit"
  # require "html_to_selectors"
  
  class TestHtmlToSelectors < Test::Unit::TestCase
    def setup
      @data=DATA.read
    end
    
    def test_should_prepend_id_for_children_of_it
      doc = HTMLDoc.new(@data)
      print doc.to_css
      assert doc.to_css =~ /#discuss div.discussion/
      assert doc.to_css =~ /#m cite/
    end
  end
  
end

__END__
<div id="discuss">
	<div class="discussion doc">
		<div class="mike" id="m">
			<cite>Mike</cite>
			<q>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</q>
		</div>
		<div class="laura">
			<cite>Laura</cite>
			<q>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</q>
		</div>
		<div class="mike">
			<cite>Mike</cite>
			<q>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</q>
		</div>
	</div>
	<div class="bottom">
		<a href="#fpo-url" class="button btn_send">Send</a>
		<a href="#fpo-url" class="button btn_selete">Delete</a>
		<a href="#fpo-url" class="button btn_cancel">Cancel</a>
	</div>
</div>
