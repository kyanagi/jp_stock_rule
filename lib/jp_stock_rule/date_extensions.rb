require 'set'
require 'holiday_jp'
module JpStockRule
  module DateExtensions
    HOLIDAY_WDAYS = Set[0, 6].freeze
    YEAR_END_AND_NEW_YEAR_HOLIDAYS = Set[[1, 1], [1, 2], [1, 3], [12, 31]].freeze

    module InstanceMethods
      # Returns it is a business day or not.
      def jpx_business_day?
        return false if HOLIDAY_WDAYS.include?(wday)
        return false if YEAR_END_AND_NEW_YEAR_HOLIDAYS.include?([month, day])
        return !HolidayJp.holiday?(self)
      end

      # Returns a next business day.
      def next_jpx_business_day(days = 1)
        raise ArgumentError, "days must be >= 0" if days < 0
        next_day = self
        while days > 0
          next_day += 1
          days -= 1 if next_day.jpx_business_day?
        end
        next_day
      end
    end
  end
end
