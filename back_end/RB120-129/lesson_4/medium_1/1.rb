# Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."

# "Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

# Who is right, Ben or Alyssa, and why?

# Ben is right. The attr_reader gives us a getter method for 'balance', therefore the 'positive_balance' method uses that to retrieve the instance variable balance to do its check.
# Alyssa would be right if it was attr_accessor. That gives us the setter method and instance variable also, which we can use to get the value of balance. 