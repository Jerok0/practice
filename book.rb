
class BookInStock
  attr_accessor :isbn, :price
  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end

  def to_s
    "ISBN: #{@isbn} for $#{@price}"
  end
  def disprice
    @price - (@price*1.5)/100
  end
  def price_in_cents
    Integer(@price*100+0.5)
  end
  def setprice=(cents)
    @price = cents/100
  end
end
