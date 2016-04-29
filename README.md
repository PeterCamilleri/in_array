# The in_array gem.

This project contains the Ruby in_array gem. This is perhaps the tiniest gem
ever created. It allows all objects to respond to the :in_array method that
encapsulates the object in an array unless it is already an array. So
```ruby
'Hello'.in_array    # ['Hello']
['Hello'].in_array  # ['Hello']
my_object.in_array  # [my_object]
[1,2,3].in_array    # [1,2,3]
```
This very simple gem accomplishes a very simple task that is nonetheless useful.
For example a method can now easily accept a single object or an array of
objects:

```ruby
def my_method(args, other)
  args.in_array.each{|arg| process(arg, other) }
end
```
Now all of the following will work correctly:
```ruby
my_method 12, 11
my_method 42, 11
my_method [12, 42], 11
```
From an instructive view point, this gem also demonstrates the use of
inheritance as opposed to simulated polymorphism.

## Installation

Add this line to your application's Gemfile:

    gem 'in_array'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install in_array


## Usage
This is as simple as:
```ruby
require 'in_array'
```

then, in those places where array-ness was problematic, use:
```ruby
my_object.in_array.each do |option| #etc, etc, etc...
```

instead of
```ruby
    my_object = [my_object] unless my_object.is_a?(Array)
    my_object.each do |option| #etc, etc, etc...
```

#### Extending the Protocol

The in_array gem sets up a simple protocol that permits its behavior to be
easily added to user defined classes that behave (aka duck type) as arrays. The
following snippet shows how this is done:
```ruby
class MyArray
  #This class behaves like an array.
  include InArrayAlready

  #Rest of the class omitted.
end

```

## Performance

All other aspects aside, good code should not exact a significant speed
penalty. The benchmark tests that follow show that the in_array gem should be
expected to improve performance when compared with the simulated polymorphism
alternative.

The first test assumes a simple scenario with only the Array class. Polymorphism
is simulated using the is_a? method:

    C:\Sites\in_array>ruby bench\simple_bench.rb
    Warming up --------------------------------------
    Process with in_array
                             5.178k i/100ms
    Process with is_a?
                             4.037k i/100ms
    Calculating -------------------------------------
    Process with in_array
                             54.001k (± 5.4%) i/s -    274.434k
    Process with is_a?
                             41.897k (± 5.3%) i/s -    209.924k

    Comparison:
    Process with in_array:    54000.9 i/s
    Process with is_a?   :    41897.1 i/s - 1.29x slower

The second scenario adds a user defined array like class. In this case, two
methods of simulated polymorphism are tested, based on include? and a hash
of allowed array classes. Here are those results.

    C:\Sites\in_array>ruby bench\complex_bench.rb
    Warming up --------------------------------------
    Process with in_array
                             5.163k i/100ms
    Process with hash[]
                             1.779k i/100ms
    Process with include?
                             1.895k i/100ms
    Calculating -------------------------------------
    Process with in_array
                             54.239k (± 5.3%) i/s -    273.639k
    Process with hash[]
                             17.924k (± 3.2%) i/s -     90.729k
    Process with include?
                             19.232k (± 3.8%) i/s -     96.645k

    Comparison:
    Process with in_array:    54238.6 i/s
    Process with include?:    19231.7 i/s - 2.82x slower
    Process with hash[]  :    17923.9 i/s - 3.03x slower

## Contributing

#### Plan A

1. Fork it ( https://github.com/PeterCamilleri/in_array/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

#### Plan B

Go to the GitHub repository and raise an issue calling attention to some
aspect that could use some TLC or a suggestion or an idea.

