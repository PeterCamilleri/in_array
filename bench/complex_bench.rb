require "benchmark/ips"
require 'in_array'

class MyArray
  #Pretend that this class behaves like an array.
  include InArrayAlready
end

class Object
  def slow_in_array
    if [Array, MyArray].include? self.class
      self
    else
      [ self ]
    end
  end

  ARRAY_CLUB = {Array => true, MyArray => true }

  def accel_in_array
    if ARRAY_CLUB[self.class]
      self
    else
      [ self ]
    end
  end
end

Test1 = (1..100).to_a
Test2 = Array(100) { MyArray.new }

def use_in_array
  a1 = Test1.map {|e| e.in_array  }
  a2 = Test2.map {|e| e.in_array  }
end

def use_accel_in_array
  a1 = Test1.map {|e| e.accel_in_array  }
  a2 = Test2.map {|e| e.accel_in_array  }
end

def use_slow_in_array
  a1 = Test1.map {|e| e.slow_in_array  }
  a2 = Test2.map {|e| e.slow_in_array  }
end

Benchmark.ips do |x|
  x.report("Process with in_array") { use_in_array }
  x.report("Process with hash[]  ") { use_accel_in_array }
  x.report("Process with include?") { use_slow_in_array }
  x.compare!
end
