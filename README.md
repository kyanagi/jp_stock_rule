# JpStockRule

[![Build Status](https://travis-ci.org/kyanagi/jp_stock_rule.svg?branch=master)](https://travis-ci.org/kyanagi/jp_stock_rule)

JpStockRule is a utility for stock markets in Japan.

You can get price limits and tick size of stocks.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jp_stock_rule'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jp_stock_rule

## Usage

Getting price limits:

```ruby
JpStockRule.price_limit(300) # => 80
```

Getting tick size:

```ruby
JpStockRule.tick_size(7000) # => 10
```

For TOPIX100 stocks:

```ruby
JpStockRule.tick_size(7000, topix100: true) # => 1
```

Is the market open today?:

```ruby
Date.today.jpx_business_day?
```

Getting the next market-open day:

```ruby
Date.today.next_jpx_business_day
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kyanagi/jp_stock_rule.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
