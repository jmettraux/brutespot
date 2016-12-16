
range = ENV['RANGE']
fail ArgumentError.new("missing RANGE") unless range

uri = File.read('.uri').strip
email = File.read('.ril').strip

cmd = "cat out/#{range}*.txt | mutt -s \"#{uri} #{range}\" #{email}"

puts
puts(cmd)
system(cmd)
puts

