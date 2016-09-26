require 'test_helper'

class JpStockRuleTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::JpStockRule::VERSION
  end

  def test_price_limit
    assert_equal 30, JpStockRule.price_limit(1)
    assert_equal 30, JpStockRule.price_limit(99)
    assert_equal 50, JpStockRule.price_limit(100)
    assert_equal 80, JpStockRule.price_limit(300)
    assert_equal 7000000, JpStockRule.price_limit(49999999)
    assert_equal 10000000, JpStockRule.price_limit(50000000)
    assert_equal 10000000, JpStockRule.price_limit(500000000)
  end

  def test_tick_size
    assert_equal 1, JpStockRule.tick_size(1)
    assert_equal 1, JpStockRule.tick_size(3000)
    assert_equal 5, JpStockRule.tick_size(3001)
    assert_equal 5, JpStockRule.tick_size(5000)
    assert_equal 10, JpStockRule.tick_size(5001)
    assert_equal 50000, JpStockRule.tick_size(50000000)
    assert_equal 100000, JpStockRule.tick_size(50000001)
  end

  def test_tick_size_topix100
    assert_equal 1/10r, JpStockRule.tick_size(1, topix100: true)
    assert_equal 1/2r, JpStockRule.tick_size(3000, topix100: true)
    assert_equal 1, JpStockRule.tick_size(3001, topix100: true)
    assert_equal 1, JpStockRule.tick_size(5000, topix100: true)
    assert_equal 1, JpStockRule.tick_size(5001, topix100: true)
    assert_equal 10, JpStockRule.tick_size(100000, topix100: true)
    assert_equal 50, JpStockRule.tick_size(100001, topix100: true)
    assert_equal 10000, JpStockRule.tick_size(50000000, topix100: true)
    assert_equal 10000, JpStockRule.tick_size(100000000, topix100: true)
  end

  def test_round_price
    assert_equal 1, JpStockRule.round_price(1)
    assert_equal 101, JpStockRule.round_price(101)
    assert_equal 3000, JpStockRule.round_price(3000)
    assert_equal 3000, JpStockRule.round_price(3001)
    assert_equal 3005, JpStockRule.round_price(3005)
    assert_equal 3005, JpStockRule.round_price(3006)
    assert_equal 10010, JpStockRule.round_price(10015)
    assert_equal 49950, JpStockRule.round_price(49999)
  end

  def test_round_price_topix100
    assert_equal 500, JpStockRule.round_price(500, topix100: true)
    assert_equal 500 + 5/10r, JpStockRule.round_price(500.55, topix100: true)
    assert_equal 1000, JpStockRule.round_price(1000.1, topix100: true)
    assert_equal 1000 + 1/2r, JpStockRule.round_price(1000.6, topix100: true)
    assert_equal 9999, JpStockRule.round_price(9999, topix100: true)
    assert_equal 10000, JpStockRule.round_price(10001, topix100: true)
    assert_equal 10005, JpStockRule.round_price(10006, topix100: true)
  end
end
