module Grocery
  class Order
    attr_reader :id, :products

    def initialize(id, products)
      @id = id
      @products = products
    end

    def total
      total = 0
      if @products.empty? do
        return 0
      end
      else
        @products.each do | name, value|
          sum = value + (value * 0.075).round(2)
          total = total + sum
        end
      end
      return total
    end

    def add_product(product_name, product_price)
      product_collection = {}
      count = product_collection.length
      unless product_collection.include?(product_name)
        product_collection[:product_name] = product_price
        count += 1
      else
        return false
      end
      return count
    end
  end
end
