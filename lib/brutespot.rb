
require 'open-uri'
require 'nokogiri'

opts = Hash[*ARGV]
maxy = opts['-until'].to_i

uri = File.read('.uri').strip

t = Time.now
y = t.year
m = t.month

#y = 2014
#m = 12

loop do

  break if y == maxy
  #break if y == 2013

  sm = '%02i' % m

  puts "#{y}-#{sm}..."

  sleep (rand * 7)

  html = open("#{uri}/#{y}_#{sm}_01_archive.html")
  doc = Nokogiri::HTML(html)

  doc.css('div.date-outer').each do |douter|

    date = douter.css('.date-header span').inner_text.strip
    title = douter.css('.post-title a').inner_text.strip
    text = douter.css('.post-body').inner_text.strip

    dd = date.split('/')
    jdate = "#{dd[2]}#{dd[0]}#{dd[1]}"
    atitle = title.downcase.gsub(/[^a-z0-9]+/, '_')

    fname = "out/#{jdate}__#{atitle}.txt"
    puts "... " + fname

    exit(0) if File.exist?(fname)

    File.open(fname, 'wb') do |f|
      f.puts(date)
      f.puts(title)
      f.puts(text)
    end
  end

  m = m - 1
  if m == 0; y = y - 1; m = 12; end
end

