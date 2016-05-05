require_relative '../lib/in_array'
gem              'minitest'
require          'minitest/autorun'
require          'minitest_visible'

class MyArray
  include InArrayAlready
  #Balance of class omitted.
end

class NotAnArray
  #Balance of class omitted.
end

class InArrayTester < Minitest::Test
  #Track mini-test progress.
  include MinitestVisible

  def test_the_basics
    assert(InArray, "The module InArray should exist.")
    assert(InArrayAlready, "The module InArrayAlready should exist.")

    assert_equal(String, InArray::VERSION.class)
  end

  def test_that_it_encapsulates_in_arrays
    assert_equal(nil.in_array, [nil])
    assert_equal('Hello'.in_array, ['Hello'])
    assert_equal(:Hello.in_array, [:Hello])
  end

  def test_that_it_leaves_arrays_alone
    assert_equal([1,2,3].in_array, [1,2,3])
  end

  def test_with_custom_classes
    foo = MyArray.new
    assert_equal(foo, foo.in_array)

    bar = NotAnArray.new
    assert_equal([bar], bar.in_array)
  end
end