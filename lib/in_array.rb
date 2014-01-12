#Add support for the in_array method to ruby.

#Extend everything with in_array.
class BasicObject
  #Return the object in an array.
  def in_array
    [self]
  end
end

#A mixinable module to be included in class that already holds data in_array.
module InArrayable
  #Return the object in an array. Already is!
  def in_array
    self
  end
end

#Arrays already have their data in_array.
class Array
  include InArrayable
end
