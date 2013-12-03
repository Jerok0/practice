require 'test/unit'
load "book.rb"

class Mytest < Test::Unit::TestCase
  def test1
    obj1 = BookInStock.new("9987767656", 98.99)
    #obj2 = BookInStock.new("8898989665", "99.65")
    #obj3 = BookInStock.new(9989898988, 97.34)

    assert_equal(obj1.isbn, "9987767656")
    assert_equal(obj1.price, 98.99)
    assert_equal(obj1.to_s, "ISBN: 9987767656 for $98.99")
    #assert_equal(obj1.disprice, 96.53)
    obj1.price = 100
    assert_equal(obj1.price, 100)
    obj1.price = 99.78
    assert_equal(obj1.price_in_cents, 9978)
  end
end