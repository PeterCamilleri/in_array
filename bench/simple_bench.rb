require "benchmark/ips"
require 'in_array'

class Object
  def slow_in_array
    if self.is_a? Array
      self
    else
      [ self ]
    end
  end
end

Test1 = (1..100).to_a
Test2 = Array(100) { |i| [ i ] }

def use_in_array
  a1 = Test1.map {|e| e.in_array  }
  a2 = Test2.map {|e| e.in_array  }
end

def use_slow_in_array
  a1 = Test1.map {|e| e.slow_in_array  }
  a2 = Test2.map {|e| e.slow_in_array  }
end

Benchmark.ips do |x|
  x.report("Process with in_array") { use_in_array }
  x.report("Process with is_a?   ") { use_slow_in_array }
  x.compare!
end
