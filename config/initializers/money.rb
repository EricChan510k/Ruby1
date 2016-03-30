# http://pivotallabs.com/creating-user-friendly-validation-messages-with-the-money-gem/

Money.default_currency = Money::Currency.new("USD")

Money.class_eval do
  attr_accessor :original_value
end

module SmartMoney
  def smart_money(*cols)
    cols.each do |column|
      composed_of column,
                  :class_name => "Money",
                  :mapping => ["#{column}_cents", "cents"],
                  :converter => proc { |value|
                    money = value.to_money
                    money.original_value = value
                    money
                  }
      end
  end
end