require "jp_stock_rule/version"
require "jp_stock_rule/core_ext/date"

module JpStockRule
  # http://www.jpx.co.jp/equities/trading/domestic/06.html
  PRICE_LIMITS = [
    [100, 30],
    [200, 50],
    [500, 80],
    [700, 100],
    [1_000, 150],
    [1_500, 300],
    [2_000, 400],
    [3_000, 500],
    [5_000, 700],
    [7_000, 1_000],
    [10_000, 1_500],
    [15_000, 3_000],
    [20_000, 4_000],
    [30_000, 5_000],
    [50_000, 7_000],
    [70_000, 10_000],
    [100_000, 15_000],
    [150_000, 30_000],
    [200_000, 40_000],
    [300_000, 50_000],
    [500_000, 70_000],
    [700_000, 100_000],
    [1_000_000, 150_000],
    [1_500_000, 300_000],
    [2_000_000, 400_000],
    [3_000_000, 500_000],
    [5_000_000, 700_000],
    [7_000_000, 1_000_000],
    [10_000_000, 1_500_000],
    [15_000_000, 3_000_000],
    [20_000_000, 4_000_000],
    [30_000_000, 5_000_000],
    [50_000_000, 7_000_000],
    [Float::INFINITY, 10_000_000],
  ].freeze

  # Returns the limit of price change in a day.
  def self.price_limit(base_price)
    PRICE_LIMITS.detect { |upper_limit, | base_price < upper_limit }[1]
  end

  # http://www.jpx.co.jp/equities/trading/domestic/07.html
  TICK_SIZES = [
    [1_000, 1/10r, 1],
    [3_000, 1/2r, 1],
    [5_000, 1, 5],
    [10_000, 1, 10],
    [30_000, 5, 10],
    [50_000, 10, 50],
    [100_000, 10, 100],
    [300_000, 50, 100],
    [500_000, 100, 500],
    [1_000_000, 100, 1_000],
    [3_000_000, 500, 1_000],
    [5_000_000, 1_000, 5_000],
    [10_000_000, 1_000, 10_000],
    [30_000_000, 5_000, 10_000],
    [50_000_000, 10_000, 50_000],
    [Float::INFINITY, 10_000, 100_000],
  ].freeze

  # Returns the tick size.
  def self.tick_size(base_price, topix100: false)
    TICK_SIZES.detect { |upper_limit, | base_price <= upper_limit }[topix100 ? 1 : 2]
  end

  # Rounds the price to the tick.
  #
  #   JpStockRule.round_price(3001) # => 3000
  def self.round_price(price, topix100: false)
    tick = tick_size(price, topix100: topix100)
    (price / tick).to_i * tick
  end
end
