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
      if !@products.include?(product_name)
        @products[product_name] = product_price
        return true
      else
        return false
      end
    end

    def remove_product(product_name)
      @products.delete(product_name)
      if !@products.include?(product_name)
        return true
      else
        return false
      end
    end
  end
end
