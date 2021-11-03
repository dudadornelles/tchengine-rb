lint:
	bundle exec rubocop -lx

install:
	bundle config set --local path 'vendor/bundle'
	bundle install

test:
	bundle exec ruby -Isrc/ -I${PWD} -e "Dir['tests/**/test_*.rb'].each {|file| require file }"
