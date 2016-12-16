
fetch:
	bundle exec ruby lib/brutespot.rb -until 2015

mail:
	bundle exec ruby lib/brutemail.rb

.PHONY: fetch

