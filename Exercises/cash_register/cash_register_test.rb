# cash_register_test.rb

require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(10_0000)

    @transaction = Transaction.new(100)
    @transaction.amount_paid = 100

    @previous_amount = @register.total_money
    @register.accept_money(@transaction)
    @current_amount = @register.total_money
  end

  def test_accept_money
    expected = @previous_amount + 100

    assert_equal(expected, @current_amount)
  end

  def test_change
    @transaction.amount_paid = 150
    result = @register.change(@transaction)

    assert_equal(50, result)
  end

  def test_give_receipt
    actual = @register.give_receipt(@transaction)

    assert_nil(nil, actual)

    cost = @transaction.item_cost
    assert_output("You've paid $#{cost}.\n") do
      @register.give_receipt(@transaction)
    end
  end
end


class TransactionTest < MiniTest::Test
  def setup
    @new_transaction = Transaction.new(100)
    @input = StringIO.new('130\n')
    @output = StringIO.new
  end

  def test_prompt_for_payment
    @new_transaction.prompt_for_payment(input: @input, output: @output)
    assert_equal(130, @new_transaction.amount_paid)
  end
end