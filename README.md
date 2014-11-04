# The in_array gem.

This project contains the Ruby in_array gem. This is perhaps the tiniest gem
ever created. It allows all objects to respond to the :in_array method that
encapsulates the object in an array unless it is already an array. So

    'Hello'.in_array    ====> ['Hello']
    ['Hello'].in_array  ====> ['Hello']
    my_object.in_array  ====> [my_object]
    [1,2,3].in_array    ====> [1,2,3]

While not a terribly useful gem, it does demonstrate the use of inheritance
and true as opposed to simulated polymorphism.

## Usage

    require 'in_array'

then, in those places where array-ness was problematic, use:

    my_object.in_array.each do |option| #etc, etc, etc...

instead of

    my_object = [my_object] unless my_object.is_a?(Array)
    my_object.each do |option| #etc, etc, etc...
