# redmine-ruby

[![Gem Version](https://badge.fury.io/rb/redmine-ruby.png)](http://badge.fury.io/rb/redmine-ruby)
[![Code Climate](https://codeclimate.com/github/GeneralScripting/redmine-ruby.png)](https://codeclimate.com/github/GeneralScripting/redmine-ruby)

## Installation

    gem install redmine-ruby

Or in your Gemfile:

    gem 'redmine-ruby'

## Usage

    require 'redmine-ruby'
    
    client = Redmine::Client.new(URL, TOKEN)
    
    client.projects
    # returns the Her::Model Issue
    # see https://github.com/remiprev/her#usage
    
    client.issues
    # returns the Her::Model Issue
    
    client.issues.all( project_id: 'PROJECT_KEY' )
    # returns a Her::Model::Relation
    
    client.issues.all( project_id: 'PROJECT_KEY' ).map do |issue|
      # do something...
    end
    
That is all for now. Please help creating the other [Redmine API methods](http://www.redmine.org/projects/redmine/wiki/Rest_api).


## Contributing to redmine-ruby
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## License

This gem is released under the [MIT License](http://www.opensource.org/licenses/MIT).
