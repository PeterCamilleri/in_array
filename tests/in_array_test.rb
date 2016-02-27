require_relative '../lib/in_array'
gem              'minitest'
require          'minitest/autorun'
require          'minitest_visible'

class InArrayTester < Minitest::Test
  #Track mini-test progress.
  include MinitestVisible

  def test_that_it_encapsulates_in_arrays
    assert_equal(nil.in_array, [nil])
    assert_equal('Hello'.in_array, ['Hello'])
    assert_equal(:Hello.in_array, [:Hello])
  end

  def test_that_it_leaves_arrays_alone
    assert_equal([1,2,3].in_array, [1,2,3])
  end
end