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

require "CGI"
BlueprintScreenCSS = <<-HTML #(fold)
<style>
/* -----------------------------------------------------------------------

   Blueprint CSS Framework 0.7.1
   http://blueprintcss.googlecode.com

   * Copyright (c) 2007-2008. See LICENSE for more info.
   * See README for instructions on how to use Blueprint.
   * For credits and origins, see AUTHORS.
   * This is a compressed file. See the sources in the 'src' directory.

----------------------------------------------------------------------- */

/* reset.css */
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, code, del, dfn, em, img, q, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {margin:0;padding:0;border:0;font-weight:inherit;font-style:inherit;font-size:100%;font-family:inherit;vertical-align:baseline;}
body {line-height:1.5;}
table {border-collapse:separate;border-spacing:0;}
caption, th, td {text-align:left;font-weight:normal;}
table, td, th {vertical-align:middle;}
blockquote:before, blockquote:after, q:before, q:after {content:"";}
blockquote, q {quotes:"" "";}
a img {border:none;}

/* typography.css */
body {font-size:75%;color:#222;background:#fff;font-family:"Helvetica Neue", Helvetica, Arial, sans-serif;}
h1, h2, h3, h4, h5, h6 {font-weight:normal;color:#111;}
h1 {font-size:3em;line-height:1;margin-bottom:0.5em;}
h2 {font-size:2em;margin-bottom:0.75em;}
h3 {font-size:1.5em;line-height:1;margin-bottom:1em;}
h4 {font-size:1.2em;line-height:1.25;margin-bottom:1.25em;height:1.25em;}
h5 {font-size:1em;font-weight:bold;margin-bottom:1.5em;}
h6 {font-size:1em;font-weight:bold;}
h1 img, h2 img, h3 img, h4 img, h5 img, h6 img {margin:0;}
p {margin:0 0 1.5em;}
p img {float:left;margin:1.5em 1.5em 1.5em 0;padding:0;}
p img.right {float:right;margin:1.5em 0 1.5em 1.5em;}
a:focus, a:hover {color:#000;}
a {color:#009;text-decoration:underline;}
blockquote {margin:1.5em;color:#666;font-style:italic;}
strong {font-weight:bold;}
em, dfn {font-style:italic;}
dfn {font-weight:bold;}
sup, sub {line-height:0;}
abbr, acronym {border-bottom:1px dotted #666;}
address {margin:0 0 1.5em;font-style:italic;}
del {color:#666;}
pre, code {margin:1.5em 0;white-space:pre;}
pre, code, tt {font:1em "Bitstream Vera Sans Mono", "Monaco", monospace;line-height:1.5;}
li ul, li ol {margin:0 1.5em;}
ul, ol {margin:0 1.5em 1.5em 1.5em;}
ul {list-style-type:disc;}
ol {list-style-type:decimal;}
dl {margin:0 0 1.5em 0;}
dl dt {font-weight:bold;}
dd {margin-left:1.5em;}
table {margin-bottom:1.4em;width:100%;}
th {font-weight:bold;background:#C3D9FF;}
th, td {padding:4px 10px 4px 5px;}
tr.even td {background:#E5ECF9;}
tfoot {font-style:italic;}
caption {background:#eee;}
.small {font-size:.8em;margin-bottom:1.875em;line-height:1.875em;}
.large {font-size:1.2em;line-height:2.5em;margin-bottom:1.25em;}
.hide {display:none;}
.quiet {color:#666;}
.loud {color:#000;}
.highlight {background:#ff0;}
.added {background:#060;color:#fff;}
.removed {background:#900;color:#fff;}
.first {margin-left:0;padding-left:0;}
.last {margin-right:0;padding-right:0;}
.top {margin-top:0;padding-top:0;}
.bottom {margin-bottom:0;padding-bottom:0;}

/* grid.css */
.container {width:950px;margin:0 auto;}
.showgrid {background:url(src/grid.png);}
body {margin:1.5em 0;}
div.span-1, div.span-2, div.span-3, div.span-4, div.span-5, div.span-6, div.span-7, div.span-8, div.span-9, div.span-10, div.span-11, div.span-12, div.span-13, div.span-14, div.span-15, div.span-16, div.span-17, div.span-18, div.span-19, div.span-20, div.span-21, div.span-22, div.span-23, div.span-24 {float:left;margin-right:10px;}
div.last {margin-right:0;}
.span-1 {width:30px;}
.span-2 {width:70px;}
.span-3 {width:110px;}
.span-4 {width:150px;}
.span-5 {width:190px;}
.span-6 {width:230px;}
.span-7 {width:270px;}
.span-8 {width:310px;}
.span-9 {width:350px;}
.span-10 {width:390px;}
.span-11 {width:430px;}
.span-12 {width:470px;}
.span-13 {width:510px;}
.span-14 {width:550px;}
.span-15 {width:590px;}
.span-16 {width:630px;}
.span-17 {width:670px;}
.span-18 {width:710px;}
.span-19 {width:750px;}
.span-20 {width:790px;}
.span-21 {width:830px;}
.span-22 {width:870px;}
.span-23 {width:910px;}
.span-24, div.span-24 {width:950px;margin:0;}
.append-1 {padding-right:40px;}
.append-2 {padding-right:80px;}
.append-3 {padding-right:120px;}
.append-4 {padding-right:160px;}
.append-5 {padding-right:200px;}
.append-6 {padding-right:240px;}
.append-7 {padding-right:280px;}
.append-8 {padding-right:320px;}
.append-9 {padding-right:360px;}
.append-10 {padding-right:400px;}
.append-11 {padding-right:440px;}
.append-12 {padding-right:480px;}
.append-13 {padding-right:520px;}
.append-14 {padding-right:560px;}
.append-15 {padding-right:600px;}
.append-16 {padding-right:640px;}
.append-17 {padding-right:680px;}
.append-18 {padding-right:720px;}
.append-19 {padding-right:760px;}
.append-20 {padding-right:800px;}
.append-21 {padding-right:840px;}
.append-22 {padding-right:880px;}
.append-23 {padding-right:920px;}
.prepend-1 {padding-left:40px;}
.prepend-2 {padding-left:80px;}
.prepend-3 {padding-left:120px;}
.prepend-4 {padding-left:160px;}
.prepend-5 {padding-left:200px;}
.prepend-6 {padding-left:240px;}
.prepend-7 {padding-left:280px;}
.prepend-8 {padding-left:320px;}
.prepend-9 {padding-left:360px;}
.prepend-10 {padding-left:400px;}
.prepend-11 {padding-left:440px;}
.prepend-12 {padding-left:480px;}
.prepend-13 {padding-left:520px;}
.prepend-14 {padding-left:560px;}
.prepend-15 {padding-left:600px;}
.prepend-16 {padding-left:640px;}
.prepend-17 {padding-left:680px;}
.prepend-18 {padding-left:720px;}
.prepend-19 {padding-left:760px;}
.prepend-20 {padding-left:800px;}
.prepend-21 {padding-left:840px;}
.prepend-22 {padding-left:880px;}
.prepend-23 {padding-left:920px;}
div.border {padding-right:4px;margin-right:5px;border-right:1px solid #eee;}
div.colborder {padding-right:24px;margin-right:25px;border-right:1px solid #eee;}
.pull-1 {margin-left:-40px;}
.pull-2 {margin-left:-80px;}
.pull-3 {margin-left:-120px;}
.pull-4 {margin-left:-160px;}
.pull-5 {margin-left:-200px;}
.pull-6 {margin-left:-240px;}
.pull-7 {margin-left:-280px;}
.pull-8 {margin-left:-320px;}
.pull-9 {margin-left:-360px;}
.pull-10 {margin-left:-400px;}
.pull-11 {margin-left:-440px;}
.pull-12 {margin-left:-480px;}
.pull-13 {margin-left:-520px;}
.pull-14 {margin-left:-560px;}
.pull-15 {margin-left:-600px;}
.pull-16 {margin-left:-640px;}
.pull-17 {margin-left:-680px;}
.pull-18 {margin-left:-720px;}
.pull-19 {margin-left:-760px;}
.pull-20 {margin-left:-800px;}
.pull-21 {margin-left:-840px;}
.pull-22 {margin-left:-880px;}
.pull-23 {margin-left:-920px;}
.pull-24 {margin-left:-960px;}
.pull-1, .pull-2, .pull-3, .pull-4, .pull-5, .pull-6, .pull-7, .pull-8, .pull-9, .pull-10, .pull-11, .pull-12, .pull-13, .pull-14, .pull-15, .pull-16, .pull-17, .pull-18, .pull-19, .pull-20, .pull-21, .pull-22, .pull-23, .pull-24 {float:left;position:relative;}
.push-1 {margin:0 -40px 1.5em 40px;}
.push-2 {margin:0 -80px 1.5em 80px;}
.push-3 {margin:0 -120px 1.5em 120px;}
.push-4 {margin:0 -160px 1.5em 160px;}
.push-5 {margin:0 -200px 1.5em 200px;}
.push-6 {margin:0 -240px 1.5em 240px;}
.push-7 {margin:0 -280px 1.5em 280px;}
.push-8 {margin:0 -320px 1.5em 320px;}
.push-9 {margin:0 -360px 1.5em 360px;}
.push-10 {margin:0 -400px 1.5em 400px;}
.push-11 {margin:0 -440px 1.5em 440px;}
.push-12 {margin:0 -480px 1.5em 480px;}
.push-13 {margin:0 -520px 1.5em 520px;}
.push-14 {margin:0 -560px 1.5em 560px;}
.push-15 {margin:0 -600px 1.5em 600px;}
.push-16 {margin:0 -640px 1.5em 640px;}
.push-17 {margin:0 -680px 1.5em 680px;}
.push-18 {margin:0 -720px 1.5em 720px;}
.push-19 {margin:0 -760px 1.5em 760px;}
.push-20 {margin:0 -800px 1.5em 800px;}
.push-21 {margin:0 -840px 1.5em 840px;}
.push-22 {margin:0 -880px 1.5em 880px;}
.push-23 {margin:0 -920px 1.5em 920px;}
.push-24 {margin:0 -960px 1.5em 960px;}
.push-1, .push-2, .push-3, .push-4, .push-5, .push-6, .push-7, .push-8, .push-9, .push-10, .push-11, .push-12, .push-13, .push-14, .push-15, .push-16, .push-17, .push-18, .push-19, .push-20, .push-21, .push-22, .push-23, .push-24 {float:right;position:relative;}
.box {padding:1.5em;margin-bottom:1.5em;background:#E5ECF9;}
hr {background:#ddd;color:#ddd;clear:both;float:none;width:100%;height:.1em;margin:0 0 1.45em;border:none;}
hr.space {background:#fff;color:#fff;}
.clearfix:after, .container:after {content:".";display:block;height:0;clear:both;visibility:hidden;}
.clearfix, .container {display:inline-block;}
* html .clearfix, * html .container {height:1%;}
.clearfix, .container {display:block;}
.clear {clear:both;}

/* forms.css */
label {font-weight:bold;}
fieldset {padding:1.4em;margin:0 0 1.5em 0;border:1px solid #ccc;}
legend {font-weight:bold;font-size:1.2em;}
input.text, input.title, textarea, select {margin:0.5em 0;border:1px solid #bbb;}
input.text:focus, input.title:focus, textarea:focus, select:focus {border:1px solid #666;}
input.text, input.title {width:300px;padding:5px;}
input.title {font-size:1.5em;}
textarea {width:390px;height:250px;padding:5px;}
.error, .notice, .success {padding:.8em;margin-bottom:1em;border:2px solid #ddd;}
.error {background:#FBE3E4;color:#8a1f11;border-color:#FBC2C4;}
.notice {background:#FFF6BF;color:#514721;border-color:#FFD324;}
.success {background:#E6EFC2;color:#264409;border-color:#C6D880;}
.error a {color:#8a1f11;}
.notice a {color:#514721;}
.success a {color:#264409;}
</style>
HTML
# (end)

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
  puts BlueprintScreenCSS
  puts '<style>body{padding:1em}</style>'
  puts(BlueCloth.new($CONTENTS).to_html)
end

def redcloth
  require "redcloth"
  puts BlueprintScreenCSS
  puts '<style>body{padding:1em}</style>'
  puts(RedCloth.new($CONTENTS).to_html)
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
  puts BlueprintScreenCSS
  puts <<-HTML
  <style type="text/css" media="screen">
  body {
    margin:1em;
  }
  </style>
  
  HTML
  puts "<h1>Live diff</h1>"
  # puts CGI::escapeHTML(`echo -n "$preview_contents"|diff -u "$TM_FILEPATH" -`)
  puts diff_to_html
  # puts diff_to_html('diff -u "$TM_FILEPATH" "$PREVIEW_FILE"')
end

def diff_to_html(command=nil)
  html = <<-HTML
  <style>
  body{background:#eee;}
  pre{padding-left:3em; background:#fff; border: 1px solid #fff;border-bottom:1px solid #ddd;}
  pre:empty {border:none;}
  pre a { text-decoration: none; overflow: hidden; display: block; width: 100%; white-space: nowrap;}
  pre a:hover {background: transparent;}

             pre a {color: #ccc;}
             pre:hover a {color: #333;}
  .bright    pre a {color: #333;}
  .shiny     pre a,
  .dark      pre a {color: #eee;}
  .halloween pre a {color: #eee;}

             pre a.added,
  .bright    pre a.added {color: #00401E;   background: #E5FEF1;}
  .shiny     pre a.added,                   
  .dark      pre a.added,                   
  .halloween pre a.added {color: #40FF9A;   background: #00401E;}
             pre a.removed,                 
  .bright    pre a.removed {color: #400021; background: #FFE5F2;}
  .shiny     pre a.removed,                 
  .dark      pre a.removed,                 
  .halloween pre a.removed {color: #FF40A3; background: #400021;}

             pre:hover a.added,
  .bright    pre:hover a.added {color: #00401E;   background: #40FF9A;}
  .shiny     pre:hover a.added,                   
  .dark      pre:hover a.added,                   
  .halloween pre:hover a.added {color: #40FF9A;   background: #00401E;}
             pre:hover a.removed,                 
  .bright    pre:hover a.removed {color: #400021; background: #FF40A3;}
  .shiny     pre:hover a.removed,                 
  .dark      pre:hover a.removed,                 
  .halloween pre:hover a.removed {color: #FF40A3; background: #400021;}

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

/*  pre {white-space: normal !important;}*/
  pre a span { position: absolute; margin-left: -3em; width: 2.75em; padding-top: 0.4em; color: #ccc; font-size: 9px; display: block; float: left; text-align: right; }
  pre a:hover span {color:#000;}
  
  </style>
  HTML

  svn = ENV['TM_SVN'] || 'svn'
  git = ENV['TM_GIT'] || 'git'

  filepath = ENV['TM_FILEPATH']
  html << <<-HTML
  <!--
    Selected filepath 
    #{filepath}
  -->
  HTML
  
  commands = [nil,command]
  
  commands << ['Diff Unsaved Changes','diff -u "$TM_FILEPATH" "$PREVIEW_FILE"']
  
  if svn?(ENV['TM_PROJECT_DIRECTORY'] || filepath)
    commands << ["Subversion Diff with BASE","#{svn} diff --diff-cmd /usr/bin/diff -x -U0 '#{filepath}'"]
  end
  if git?(ENV['TM_PROJECT_DIRECTORY'] || filepath)
    commands << ['Git Diff',"cd '#{File.dirname filepath}'; #{git} diff '#{filepath}'"]
  end
  
  commands.each do |commandset|
    next unless commandset
    command = commandset.last
    diff_type = commandset.first
    
    html << "<!-- `#{command}` -->\n"
    html << "<h2>#{diff_type}</h2>\n"
    lines = `#{command} 2>&1`.split("\n")
    
    line_number = 0
    filepath = ENV['TM_FILEPATH']
    difflines = []
    
    lines.each do |l|
      l.match(/@@.*?\+(\d+).*? @@/)
      line_number = $1.to_i-1 if $1
      
      l.match(/\+{3} (.*?)\s+\(.*?\)$/)
      filepath = $1 if $1
      
      status = status_map(l[0])
      difflines.push(DiffLine.new(line_number, l, filepath, status))
      
      line_number = line_number +1 unless l.match(/^-/)
      
    end
    
    # filepath = ''
    html << "<pre>"
    blocks||=1
    difflines.each_with_index do |d,i|
      if d.filepath != filepath
        html << "</pre>\n"# if i > 0
        html << "<h3>#{d.filepath.sub(ENV['HOME'],'~').gsub(/\b\//,'&#8203;/')}</h3>\n"
        html << "<pre>"
      end
      filepath = d.filepath
      html << "</pre> <h4>Block #{blocks += 1}</h4> <pre>" if d.link.match(/@@.*?@@/)
      html << d.link
    end
    html << "</pre>\n<hr />"
  end
  
  return html
end

def git?(path)
  return File.exists?(path + '/.git') if File.directory? path
  File.exists?(File.dirname(path) + '/.git')
end

def svn?(path)
  return File.exists?(path + '/.svn') if File.directory? path
  File.exists?(File.dirname(path) + '/.svn')
end

def run_javascript
  # puts %{<script src="#{ENV['TM_SUPPORT_PATH']}/script/prototype.js" type="text/javascript"></script>} if ENV['TM_SCOPE'] =~ /prototype/
  puts <<-HTML
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>Testing MooTools Code</title>
</head>
<body>
	HTML
  puts <<-HTML if ENV['TM_SCOPE'] =~ /mootools/
<script type="text/javascript">
#{File.read(File.dirname(__FILE__)+"/../js/mootools.js")}
</script>
HTML
  puts <<-HTML
<pre>
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
</pre>
HTML
  puts <<-HTML
</body>
</html>
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

def check_syntax_ruby
  filepath='/tmp/run_ruby.rb'
  File.open(filepath,'w'){|file| file.write($CONTENTS) }
  
  ok = `ruby -c '#{filepath}' 2>&1`
  ok.gsub!('Syntax OK','<h1>Syntax OK</h1>')
  ok.gsub!(/#{Regexp.escape filepath}:(\d+):(.*)/m)do|match|
    line    = $1
    context = $2
    
    result = ''
    result << '<h1>Syntax Not OK :\'(</h1>'
    result << '<pre>'
    result << '<a href="'
    result << "txmt://open?url=file://#{ENV['TM_FILEPATH'].gsub(' ','%20').gsub(ENV['HOME'],'~')}&line=#{line}&column=#{ENV['TM_COLUMN_NUMBER']}"
    result << '" class="removed" style="white-space:inherit;padding:1em">'
    result << CGI::escapeHTML(context)
    result << '</a>'
    result << '</pre>'
    result
  end
  print ok
end

def run_ruby
  return false unless ENV['WEB_PREVIEW_RUBY']=='run'
  
  filepath='/tmp/run_ruby.rb'
  File.open(filepath,'w'){|file| file.write($CONTENTS) }
  
  print '<pre>'
  ok = system(%`ruby -c '#{filepath}'`)
  print `ruby '#{filepath}'`.gsub('&','&amp;').gsub('<','&lt;') if ok
  print '</pre>'
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
    redcloth
  when /^\s*text\.html\.markdown/i
    bluecloth
  when /^\s*source\.css/i
    css_preview
  when /^\s*text\.html/i
    set_base
  when /^\s*(source\.js)/i
    run_javascript
  when /source\.ruby/
    check_syntax_ruby
    run_ruby
    live_diff
  when /^\s*(source|text\.xml)/i
    live_diff
  else
    render_normal
  end
end
if __FILE__ == $0
  init()
end
