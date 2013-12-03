require 'csv'
require_relative 'book.rb'
class Csvreader
  attr_accessor :books_in_stock
  def initialize
    @books_in_stock = []
  end

  def read(csvfile)
    CSV.foreach(csvfile, headers: true) do |row|
      @books_in_stock << BookInStock.new(row['ISBN'], row['Price'])
    end
  end
  def total_value
    sum = 0.0
    @books_in_stock.each {|book| sum += book.price}
    sum
  end
end
