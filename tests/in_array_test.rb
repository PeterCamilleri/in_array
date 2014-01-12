require_relative '../lib/in_array'
require          'minitest/autorun'

class InArrayTester < MiniTest::Unit::TestCase
  $do_this_only_one_time = "" unless defined? $do_this_only_one_time
  
  def initialize(*all)
    if $do_this_only_one_time != __FILE__
      puts
      puts "Running test file: #{File.split(__FILE__)[1]}" 
      $do_this_only_one_time = __FILE__
    end
    
    super(*all)
  end
  
  def test_that_it_encapsulates_in_arrays
    assert_equal(nil.in_array, [nil])
    assert_equal('Hello'.in_array, ['Hello'])
    assert_equal(:Hello.in_array, [:Hello])
  end

  def test_that_it_leaves_arrays_alone
    assert_equal([1,2,3].in_array, [1,2,3])
  end
end