install:
	bundle install
lint:
	rubocop -A

test:
	bundle exec rspec