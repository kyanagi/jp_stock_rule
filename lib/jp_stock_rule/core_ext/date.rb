require 'date'
require 'jp_stock_rule/date_extensions'

class Date
  include JpStockRule::DateExtensions::InstanceMethods
end
