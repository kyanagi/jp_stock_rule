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
end
