# MaybeYouShouldnt

For those that don't want to #try anymore.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'maybe_you_shouldnt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install maybe_you_shouldnt

## Usage

The usage is really simple ... Don't call `#try` on your objects.

If you find you _absolutely must_ call `#try`, append the option `force: true`
to the call.

```ruby
orion = Object.new
orion.try(:wut?, force: true)
```

This even works with lots of args and blocks. Give it a whirl and bask in the
joy that is actually thinking about your `nil`s.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/maybe_you_shouldnt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

