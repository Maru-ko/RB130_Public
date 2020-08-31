**TRINARY INVESTIGATION**
刑事マルコス

From the minitest file, we are able to see that the class must be defined as `Trinary` and the file must be named `trinary.rb` in keeping with convention.


we will skip ahead and look at the bottom test cases.
1. `Trinary.new('0a1b2c').to_decimal`
2. `Trinary.new('carrot').to_decimal`
3. `Trinary.new('1122000120').to_decimal`


• One seems to treat the whole input as `'0'` rather than just `'012'` after removing the non alpha characters.

From this we can see that **2** is the same, we treat it as `'0'` or plaingly `0`.

We should have a way to verify the input is a `String` object regardless of what is passed in.

Constructor method `initialize` must accept an argument, therefor must have a paramenter.


Lets build a guard clause, verifies and datta formatter with our private method `verify`

Lets make a way to format the maximum index we can reach.

We could attempt to use fancy methods, more advanced iterators however let's use this case to display basic logic, in case we switch this to another programming language.

Use the each method to interact with the available indexes, and display to the next programmer that we are indeed accessing the element via index in each `@string_num` array of values.

upon seeing the edge cases, we are able to use ruby's built in operators **`*`** and **`**`** for multiplication, and to **power it** to the index.

after texsting out in irb ` 1*3**5` gives us `243`, as well as `2*3**0` == 2 (thank you current zshell for copy paste)




`initialize(arg1)` will take a value and before becoming state we will verify this input.

`raise TypeError, 'Must string representation(s) of Integer(s) 0-2' ` unless input value `.class == String` or better yet lets use what we just learned and use methdo `#instance_of?`.

