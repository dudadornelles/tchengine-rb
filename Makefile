lint:
	bundle exec rubocop -lx

install:
	bundle config set --local path 'vendor/bundle'
	bundle install

test:
	bundle exec ruby -r debug tests/*
