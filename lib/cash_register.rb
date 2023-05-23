class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = {}
    end
  
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      quantity.times { @items << title }
      @last_transaction = { title: title, price: price, quantity: quantity }
    end
  
    def apply_discount
        if @discount > 0
          discount_amount = @total * (@discount.to_f / 100)
          @total -= discount_amount
          "After the discount, the total comes to $#{@total.to_i}."
        else
          "There is no discount to apply."
        end
    end
      
  
    def void_last_transaction
      last_title = @last_transaction[:title]
      last_price = @last_transaction[:price]
      last_quantity = @last_transaction[:quantity]
      @total -= last_price * last_quantity
      @items.slice!(-last_quantity..-1)
      @last_transaction = {}
    end
  end
  