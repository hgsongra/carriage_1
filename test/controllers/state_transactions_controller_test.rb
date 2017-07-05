require 'test_helper'

class StateTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @state_transaction = state_transactions(:one)
  end

  test "should get index" do
    get state_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_state_transaction_url
    assert_response :success
  end

  test "should create state_transaction" do
    assert_difference('StateTransaction.count') do
      post state_transactions_url, params: { state_transaction: { baths: @state_transaction.baths, beds: @state_transaction.beds, city: @state_transaction.city, latitude: @state_transaction.latitude, longitude: @state_transaction.longitude, price: @state_transaction.price, prop_type: @state_transaction.prop_type, sale_date: @state_transaction.sale_date, sq_feet: @state_transaction.sq_feet, state: @state_transaction.state, street: @state_transaction.street, zip: @state_transaction.zip } }
    end

    assert_redirected_to state_transaction_url(StateTransaction.last)
  end

  test "should show state_transaction" do
    get state_transaction_url(@state_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_state_transaction_url(@state_transaction)
    assert_response :success
  end

  test "should update state_transaction" do
    patch state_transaction_url(@state_transaction), params: { state_transaction: { baths: @state_transaction.baths, beds: @state_transaction.beds, city: @state_transaction.city, latitude: @state_transaction.latitude, longitude: @state_transaction.longitude, price: @state_transaction.price, prop_type: @state_transaction.prop_type, sale_date: @state_transaction.sale_date, sq_feet: @state_transaction.sq_feet, state: @state_transaction.state, street: @state_transaction.street, zip: @state_transaction.zip } }
    assert_redirected_to state_transaction_url(@state_transaction)
  end

  test "should destroy state_transaction" do
    assert_difference('StateTransaction.count', -1) do
      delete state_transaction_url(@state_transaction)
    end

    assert_redirected_to state_transactions_url
  end
end
