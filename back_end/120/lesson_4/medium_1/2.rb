# Alan created the following code to keep track of items for a shopping cart application he's writing:

class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

# or

def update_quantity(updated_count)
  # prevent negative quantities from being set
  @quantity = updated_count if updated_count >= 0
end

# Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

# Can you spot the mistake and how to address it?

# He needs to change attr_reader to attr_accessor to allow the change to 'quantity'.
# That gives us setter method and instance variable. Since we need to change 'quantity', that means we need to set it to a different value, which is the work for a setter method.
# Or change the variable quantity to the instance variable @quantity