# coding: utf-8
# An IRB + in_array bed

require 'irb'

puts "Starting an IRB console with in_array loaded."

if ARGV[0] == 'local'
  require_relative 'lib/in_array'
  puts "in_array loaded locally: #{InArray::VERSION}"

  ARGV.shift
else
  require 'in_array'
  puts "in_array loaded from gem: #{InArray::VERSION}"
end

IRB.start
