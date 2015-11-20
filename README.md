# Capistrano Remote

Every so often you need to look at your production data or otherwise run some manual maintenance tasks in your production Rails application.

Sure, you could SSH to the server, find the proper path, and remember the correct invocation for your rails console, but we already have an SSH automation tool; Capistrano.

This gem adds tasks to Capistrano that lets you start a Rails console or dbconsole on your servers without manually SSH'ing:

## Examples

### Rails console

    $ cap production remote:console
    Loading production environment (Rails 4.2.4)
    irb(main):001:0>

### Rails database console

    $ cap production remote:dbconsole
    psql (9.3.5)
    SSL connection (cipher: DHE-RSA-AES256-SHA, bits: 256)
    Type "help" for help.
    
    example_production=>


## Installation

Add this line to your application's Gemfile:

```ruby
gem "capistrano-remote", :require => false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-remote


## Usage

Add to Capfile:

    require "capistrano/remote"


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/substancelab/capistrano-remote. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
