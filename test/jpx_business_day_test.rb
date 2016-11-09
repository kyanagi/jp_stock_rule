require 'test_helper'

class JpxBusinessDayTest < Minitest::Test
  def test_jpx_business_day_normal_days
    assert { (17..23).map { |day| Date.new(2016, 10, day).jpx_business_day? } == [[true] * 5, [false] * 2].flatten }
  end

  def test_jpx_business_day_year_end_and_new_year
    refute { Date.new(2015, 1, 1).jpx_business_day? }
    refute { Date.new(2015, 1, 2).jpx_business_day? }
    refute { Date.new(2015, 1, 3).jpx_business_day? }
    refute { Date.new(2015, 12, 31).jpx_business_day? }
  end

  def test_jpx_business_day_holiday
    refute { Date.new(2015, 10, 12).jpx_business_day? }
    assert { Date.new(2016, 10, 12).jpx_business_day? }
  end

  def test_next_jpx_business_day
    assert { Date.new(2016, 10, 13).next_jpx_business_day == Date.new(2016, 10, 14) }
    assert { Date.new(2016, 10, 13).next_jpx_business_day(2) == Date.new(2016, 10, 17) }
    assert { Date.new(2016, 10, 13).next_jpx_business_day(0) == Date.new(2016, 10, 13) }
  end
end
