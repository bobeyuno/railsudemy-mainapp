require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "Jack", email: "testaccount@example.com")  
  end
  
  test "chef should be valid" do 
    assert @chef.valid?
  end
  
  test "chefname should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "Chef name should be less than 41 " do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
    
  end
  
  test "Chef name should be more than 3 characters" do
    @chef.chefname = "a" * 2
    assert_not @chef.valid?
  end
  
  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email should be within bounds  of 105 characters" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    @chef.email = " "
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_email = %w[user@eee.com RWW_RTW@tete.co.uk hello@example.com first.last@ewd.asd.asd]
    valid_email.each do |va|
      @chef.email = va
      assert @chef.valid?, '{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid addresses" do
   invalid_email = %w[user@eee,com RWW_RTWtete.co.uk hello@examp++le.com first.last@ewd__asd.asd]
    invalid_email.each do |iva|
      @chef.email = iva
      assert_not @chef.valid?, '{iva.inspect} should be invalid'
    end
  end
end