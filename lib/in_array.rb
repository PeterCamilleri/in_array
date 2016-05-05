#Add support for the in_array method to ruby.

require_relative 'in_array/version'

#Extend everything with in_array.
class BasicObject
  #Return the object in an array.
  def in_array
    [self]
  end
end

#A mixin module to be included in any class that already holds data in_array.
module InArrayAlready
  #Return the object in an array. Already is!
  def in_array
    self
  end
end

#Arrays already have their data in_array.
class Array
  include InArrayAlready
end
