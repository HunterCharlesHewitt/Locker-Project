require 'test_helper'

class LockerTest < ActiveSupport::TestCase
   def setup
      @locker = Locker.new(number: "1", size: "m", student: "Hunter_Hewitt", UIN: "825004503", instrument: "Bass")
   end
   
   test "locker should be valid" do
      assert @locker.valid?
   end
   
   test "locker number should be present" do
      @locker.number = "  " #number is invalid empty string
      assert_not @locker.valid?
   end
   
   test "enforce that locker has a corresponding size" do
      @locker.size = "   " #student is invalid empty string
      assert_not @locker.valid?
   end
  # test "the truth" do
  #   assert true
  # end
end
