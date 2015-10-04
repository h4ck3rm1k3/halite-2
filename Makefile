all :
	#bundle install
	#rake package
	gem build *.gemspec
	gem install *.gem

