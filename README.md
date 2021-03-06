# GithubSniffer

Simple command line tool with github api to display github users most used languages.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'github_sniffer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install github_sniffer
## Usage
To display users most used languages from the repositories type:
`github_sniffer [dl, dominant_language] USERNAME`

## Development

run `bundle exec bin/github_sniffer dominant_language USERNAME` to display users preferred language.
`dl` is an alias for `dominant_language`.

run `bin/console` for an interactive prompt.
run `rspec spec` and `cucumber` for tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rails-kung-foo/github_sniffer.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
