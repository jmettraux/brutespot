
fetch:
	bundle exec ruby lib/brutespot.rb -until 2015

# `RANGE=201702 make mail`
mail:
	bundle exec ruby lib/brutemail.rb

.PHONY: fetch

