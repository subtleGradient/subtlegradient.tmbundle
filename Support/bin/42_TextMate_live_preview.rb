#!/usr/bin/env ruby
# 
# This command is for filtering your document through in the Web Preview window.
# Check the Pipe text through box and then enter the path to this file in the box.
# Test it with Refresh Now
# Enjoy
# 
# Thomas Aylott
# subtleGradient
# 

def css_preview
  # @border_thing = `cat /tmp/42_tm_border_thing.stupid_way_to_save_info`
  # @live_preview_urls = []
  # @live_preview_urls += [ENV['TM_CSS_PREVIEW_URL']]
  # @live_preview_urls += [File.open('/tmp/42_tm_css_live_preview_url.stupid_way_to_save_info').read]
  # @live_preview_urls += $CONTENTS.scan %r<(?:https?|file):/(?:/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?>
  # p @live_preview_urls
  # @live_preview_url = @live_preview_urls.first
  @live_preview_url = ENV['TM_CSS_PREVIEW_URL'] || File.open('/tmp/42_tm_css_live_preview_url.stupid_way_to_save_info').read.chomp
  
  the_page = `curl --silent "#{@live_preview_url}"`
  
  # the_page.gsub!(/<base[^>]*>/,'')
  the_page.gsub!(/<\/head>/,"<base href='#{@live_preview_url}' /></head>") unless the_page =~ /<base[^>]*>/
  
  the_page.gsub!(/<link[^>]*>/,'')
  the_page.gsub!(/<style.*?\/style>/,'')
  the_page.sub!(/<body[^>]*?class="/,'\0debug ')
  the_page.sub!(/<body/,'\0 class="debug"') unless the_page =~ /<body[^>]*?class="/
  the_page.sub!(/<\/body>/,"
  <style>
  #{$CONTENTS}
  </style>
  <div id='debug000'></div>
  </body>")
  puts the_page
rescue Exception => e
  puts e
  puts "Put your preview url in this file: <br/><b><a href='txmt://open/?url=file:///tmp/42_tm_css_live_preview_url.stupid_way_to_save_info'>/tmp/42_tm_css_live_preview_url.stupid_way_to_save_info</a></b><br/><br/>No, this is not the best way to accomplish this, duh."
end

def set_base
  uniquify_urls!
  if ENV['TM_PROJECT_SITEURL'] and !($CONTENTS =~ /<base[^>]*>/)
    $CONTENTS.gsub!(/(<head[^>]*>)/,"\\1<base href='#{ENV['TM_PROJECT_SITEURL'] || "file://#{ENV['TM_DIRECTORY']}"}' /><!-- TM_PROJECT_SITEURL -->")
    $CONTENTS.gsub!(/(?=<\/head)/, <<-HTML)
<style>
/*body > :hover                                                                                                                                                       {-webkit-box-shadow:1px 1px 15px #d40000; outline:1px solid #d40000;}
body > :hover > :hover                                                                                                                                              {-webkit-box-shadow:1px 1px 15px #e16000; outline:1px solid #e16000;}
body > :hover > :hover > :hover                                                                                                                                     {-webkit-box-shadow:1px 1px 15px #db9700; outline:1px solid #db9700;}
body > :hover > :hover > :hover > :hover                                                                                                                            {-webkit-box-shadow:1px 1px 15px #dabf00; outline:1px solid #dabf00;}
body > :hover > :hover > :hover > :hover > :hover                                                                                                                   {-webkit-box-shadow:1px 1px 15px #c1db00; outline:1px solid #c1db00;}
body > :hover > :hover > :hover > :hover > :hover > :hover                                                                                                          {-webkit-box-shadow:1px 1px 15px #9cdd00; outline:1px solid #9cdd00;}
body > :hover > :hover > :hover > :hover > :hover > :hover > :hover                                                                                                 {-webkit-box-shadow:1px 1px 15px #64d800; outline:1px solid #64d800;}
body > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover                                                                                        {-webkit-box-shadow:1px 1px 15px #28d600; outline:1px solid #28d600;}
body > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover                                                                               {-webkit-box-shadow:1px 1px 15px #00d824; outline:1px solid #00d824;}
body > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover                                                                      {-webkit-box-shadow:1px 1px 15px #00d869; outline:1px solid #00d869;}
body > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover                                                             {-webkit-box-shadow:1px 1px 15px #00cf95; outline:1px solid #00cf95;}
body > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover                                                    {-webkit-box-shadow:1px 1px 15px #00cfc1; outline:1px solid #00cfc1;}
body > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover                                           {-webkit-box-shadow:1px 1px 15px #00acd1; outline:1px solid #00acd1;}
body > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover                                  {-webkit-box-shadow:1px 1px 15px #1582d8; outline:1px solid #1582d8;}
body > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover                         {-webkit-box-shadow:1px 1px 15px #116ee8; outline:1px solid #116ee8;}
body > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover > :hover :hover                  {-webkit-box-shadow:1px 1px 15px #167cf0; outline:1px solid #167cf0;}
*/
/*body > :active                                                                                                                                                      {-webkit-box-shadow:1px 1px 15px #167cf0; outline:1px solid #167cf0;}
body > :active > :active                                                                                                                                            {-webkit-box-shadow:1px 1px 15px #116ee8; outline:1px solid #116ee8;}
body > :active > :active > :active                                                                                                                                  {-webkit-box-shadow:1px 1px 15px #1582d8; outline:1px solid #1582d8;}
body > :active > :active > :active > :active                                                                                                                        {-webkit-box-shadow:1px 1px 15px #00acd1; outline:1px solid #00acd1;}
body > :active > :active > :active > :active > :active                                                                                                              {-webkit-box-shadow:1px 1px 15px #00cfc1; outline:1px solid #00cfc1;}
body > :active > :active > :active > :active > :active > :active                                                                                                    {-webkit-box-shadow:1px 1px 15px #00cf95; outline:1px solid #00cf95;}
body > :active > :active > :active > :active > :active > :active > :active                                                                                          {-webkit-box-shadow:1px 1px 15px #00d869; outline:1px solid #00d869;}
body > :active > :active > :active > :active > :active > :active > :active > :active                                                                                {-webkit-box-shadow:1px 1px 15px #00d824; outline:1px solid #00d824;}
body > :active > :active > :active > :active > :active > :active > :active > :active > :active                                                                      {-webkit-box-shadow:1px 1px 15px #28d600; outline:1px solid #28d600;}
body > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active                                                            {-webkit-box-shadow:1px 1px 15px #64d800; outline:1px solid #64d800;}
body > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active                                                  {-webkit-box-shadow:1px 1px 15px #9cdd00; outline:1px solid #9cdd00;}
body > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active                                        {-webkit-box-shadow:1px 1px 15px #c1db00; outline:1px solid #c1db00;}
body > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active                              {-webkit-box-shadow:1px 1px 15px #dabf00; outline:1px solid #dabf00;}
body > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active                    {-webkit-box-shadow:1px 1px 15px #db9700; outline:1px solid #db9700;}
body > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active          {-webkit-box-shadow:1px 1px 15px #e16000; outline:1px solid #e16000;}
body > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active > :active :active  {-webkit-box-shadow:1px 1px 15px #d40000; outline:1px solid #d40000;}
*/</style>
		HTML
    puts $CONTENTS
  else
    puts $CONTENTS
  end
end

def uniquify_urls!
  $CONTENTS.gsub!(/\.(css|js)"/, (%{.\\1?#{ rand(999999) }"}))
end

def test_variables
  puts <<-HTML
  <pre>
    #{`set\n`}
  </pre>
  HTML
end

def render_normal
  puts "<!-- #{ENV['TM_SCOPE']} -->"
  puts $CONTENTS
end

def bluecloth
  require "bluecloth"
  puts '<link rel="stylesheet" href="http://tripledoubleyou.subtlegradient.com/c/blueprint/screen.css" type="text/css" media="screen" charset="utf-8" />'
  puts '<style>body{padding:1em}</style>'
  puts(BlueCloth.new($CONTENTS).to_html)
end

def previewstyle
  return <<-HTML
<style>
.textmate_preview_goto_file_marker {
  padding: 0.1em;
  position: absolute;
  display: block;
  background: black;
  color: white;
  border-bottom: 1px solid #666;
  margin-top: -1.2em;
  opacity: 0.5;
}
.textmate_preview_goto_file_marker:hover { background: blue; opacity: 0.9999999;}
.textmate_preview_goto_file_marker:active { background: blue; opacity: 0.5;}
.textmate_preview_goto_file_marker {display: none;}
:hover>.textmate_preview_goto_file_marker {display: block !important;}
</style>
HTML
end

def textmate_preview_goto_file_marker_onclick(line_number)
  return %{document.location="txmt://open?url=file://#{(ENV['TM_FILEPATH']||'').gsub(' ','%20')}&line=#{line_number||ENV['TM_LINE_NUMBER']}&column=9999999"}
end

# def mark_down
#   ENV['preview_contents'] = $CONTENTS
#   puts `echo "$preview_contents"|Markdown.pl`
# end

def live_diff
  preview_file = (ENV['PREVIEW_FILE'] = "/tmp/preview_#{ENV['TM_FILENAME']}")
  File.open(preview_file,'w') { |file|
    file << $CONTENTS
  }
  puts <<-HTML
  <style type="text/css" media="screen">
  * {
    margin: 0;
    padding: 0;
  }
  body {
    padding:10px;
  }
  </style>
  
  HTML
  puts "<h1 title='by thomas Aylott / subtleGradient'>Live Preview (<i>diff mode</i>)</h1><pre style='font: 10px \"Lucida Grande\", \"Trebuchet MS\", Verdana, sans-serif;'>"
  # require "CGI"
  # puts CGI::escapeHTML(`echo -n "$preview_contents"|diff -u "$TM_FILEPATH" -`)
  puts diff_to_html('diff -u "$TM_FILEPATH" "$PREVIEW_FILE"')
end

def diff_to_html(command)
  html = <<-HTML
  <style>
  pre a { text-decoration: none; overflow: hidden; display: block; width: 100%; white-space: nowrap;}
  pre a:hover {background: transparent;}

             pre a {color: #000;}
  .bright    pre a {color: #333;}
  .shiny     pre a,
  .dark      pre a {color: #eee;}
  .halloween pre a {color: #eee;}

             pre a.added,
  .bright    pre a.added {color: #00401E;   background: #40FF9A;}
  .shiny     pre a.added,                   
  .dark      pre a.added,                   
  .halloween pre a.added {color: #40FF9A;   background: #00401E;}
             pre a.removed,                 
  .bright    pre a.removed {color: #400021; background: #FF40A3;}
  .shiny     pre a.removed,                 
  .dark      pre a.removed,                 
  .halloween pre a.removed {color: #FF40A3; background: #400021;}

             pre a:hover.added,
  .bright    pre a:hover.added {background: #00401E;   color: #40FF9A;}
  .shiny     pre a:hover.added,                        
  .dark      pre a:hover.added,                        
  .halloween pre a:hover.added {background: #40FF9A;   color: #00401E;}
             pre a:hover.removed,                      
  .bright    pre a:hover.removed {background: #400021; color: #FF40A3;}
  .shiny     pre a:hover.removed,                      
  .dark      pre a:hover.removed,                      
  .halloween pre a:hover.removed {background: #FF40A3; color: #400021;}

  pre {white-space: normal !important;}
  pre a span { position: absolute; margin-left: -3em; width: 2.75em; padding-top: 0.4em; color: #999; font-size: 70%; display: block; float: left; text-align: right; }
  </style>
  HTML

  svn = ENV['TM_SVN'] || 'svn'

  files = ENV['TM_SELECTED_FILES']
  html << <<-HTML
  <!--
    Selected files 
    #{files}
  -->
  HTML

  command = "#{svn} diff --diff-cmd /usr/bin/diff -x -U0 #{files}" unless command
  html << "<!-- `#{command}` -->"
  lines = `#{command}`.split("\n")

  line_number = 0
  filepath = ENV['TM_FILEPATH']
  difflines = []

  lines.each do |l|
    l.match(/@@.*?\+(\d+).*? @@/)
    line_number = $1.to_i-1 if $1

    l.match(/\+{3} (.*?)\s+\(.*?\)$/)
    filepath = $1 if $1

    status = status_map(l[0])
    difflines.push(DiffLine.new(line_number, l, filepath, status)) if l.match(/^(\+|-)/) unless l.match(/^(\+|-){3}/)

    line_number = line_number +1 unless l.match(/^-/)
  end

  filepath = ''
  difflines.each_with_index do |d,i|
    html << '</pre>' if i > 0 and d.filepath != filepath
    html << "<h3>#{d.filepath.gsub(/\b\//,'&#8203;/')}</h3><pre>" if d.filepath != filepath
    filepath = d.filepath
    html << d.link
  end
  html << '</pre>'
  
  return html
end

def run_javascript
puts %{<script src="#{ENV['TM_SUPPORT_PATH']}/script/prototype.js" type="text/javascript"></script>} if ENV['TM_SCOPE'] =~ /prototype/
  puts <<-HTML
<script type="text/javascript" charset="utf-8">
try{
//YOUR STUFF//
//YOUR STUFF//
//YOUR STUFF//

#{$CONTENTS}

//YOUR STUFF//
//YOUR STUFF//
//YOUR STUFF//
}catch(e){ document.write(e) };
</script>
HTML
end


StatusMap = {'+' => 'added',
             '-' => 'removed'}

def status_map(status)
  StatusMap[status.chr]
rescue
  nil
end

class DiffLine
  attr :line_number , true
  attr :code        , true
  attr :status      , true
  attr :filepath    , true
  def initialize(line_number , code , filepath , status)
    self.line_number = line_number
    self.code        = code
    self.filepath    = filepath
    self.status      = status
  end
  def link
    %{<a class="#{status}" href="txmt://open?url=file:///#{filepath}&amp;line=#{line_number}"><span>#{line_number}</span> #{hcode}</a>}
  end
  def hcode
    require "CGI"
    CGI::escapeHTML(self.code).gsub(' ','&nbsp;')
  end
end

def rails_view(file_name = ENV['TM_FILENAME'])
  ###	CONFIG OPTION:: Set the TM_PROJECT_SITEURL in your TM Project Window Info Button in the following form: 
  ### [ http://your.site.ext/ ]
  
  if ENV['TM_PROJECT_SITEURL']
    tm_subdirs = ENV['TM_FILEPATH'].gsub(/^#{ENV['TM_PROJECT_DIRECTORY']}\/(.*)#{file_name}$/,'\1')
    ENV['activeURL'] = "#{ENV['TM_PROJECT_SITEURL']}#{tm_subdirs}#{file_name}".gsub(/\/app\/views/,'').gsub(/\.rhtml/,'').gsub(/\/public/,'')
    puts "<script>window.location='#{ENV['activeURL']}'</script>"
  else
    # ENV['activeURL'] = "file://#{ENV['TM_FILEPATH']}"
    set_base
  end
  
  rescue
    puts "<h1>Error :P</h1>\n<br/>\nTry saving the file. Unless it's already saved, then email me about it <a href='mailto:oblivious@subtlegradient.com'>Thomas Aylott</a>"
end

def init
  #INPUT SETUP
  $CONTENTS = ""; $stdin.each_line() { |line| $CONTENTS << line }
  
  # test_variables
  case ENV['TM_SCOPE']
  when /\s*source\.ruby\.rails.* meta\.rails\.controller declaration\.function\.method\.without-arguments/
    rails_view(ENV['TM_SELECTED_TEXT'] || ENV['TM_CURREND_WORD'])
  when /^\s*text\.html\.ruby/i
    rails_view
  when /^\s*text\.(html|blog)\.textile/i
    bluecloth
  when /^\s*text\.html\.markdown/i
    bluecloth
  when /^\s*source\.css/i
    css_preview
  when /^\s*text\.html/i
    set_base
  when /^\s*(source\.js)/i
    run_javascript
  when /^\s*(source|text\.xml)/i
    live_diff
  else
    render_normal
  end
end
if __FILE__ == $0
  init()
end
