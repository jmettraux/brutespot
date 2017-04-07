
range = ENV['RANGE']
fail ArgumentError.new("missing RANGE") unless range

uri = File.read('.uri').strip
email = File.read('.ril').strip

if range.length < 5 # months of a year
  (1..12).each do |m|
    sm = "%02i" % m
    next if Dir["out/#{range}#{sm}*.txt"].empty?
    cmd = "cat out/#{range}#{sm}*.txt | mutt -s \"#{uri} #{range}-#{sm}\" #{email}"
    puts cmd
    system cmd
  end
else # month
  cmd = "cat out/#{range}*.txt | mutt -s \"#{uri} #{range}\" #{email}"
  puts cmd
  system cmd
end

