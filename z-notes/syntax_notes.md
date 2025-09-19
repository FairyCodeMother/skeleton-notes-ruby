# Basics

### Wireframe Class
```rb
class HelloWorld
  def run
    puts "Hello, World!"
  end
end

# Instantiate and execute
hello = HelloWorld.new
```

### New Object
```ruby
# Instantiate with: obj = MyClass.new("Gina")
class MyClass
    # Example accessors
    attr_accessor :name # getter/setter for MyClass.name
    attr_reader :age # getter only for MyClass.age
    attr_writer location # setter only for MyClass.location

    def initialize(name)
        @name = name
    end
  
    def self.class_method
        "I'm a class method"
    end
  
    def instance_method
        "I'm an instance method"
    end
end
```

### New Function
```ruby
def my_method(arg1, arg2)
    # method body
    return arg1 + arg2
end
```

### New Hashes/Dictionaries
```ruby
my_hash = { "key" => "value", :symbol_key => 42 }
my_hash["key"]      # => "value"
my_hash[:symbol_key] # => 42
```



## Instantiating data
```ruby
arr = []
str = ""
num = 0
obj = MyClass.new("Gina")
```

## Arrays

### Array methods
```ruby
arr = [1, 2, 3]
arr.push(4)      # => [1, 2, 3, 4]
arr.pop          # => 4
arr.map { |x| x*2 } # => [2, 4, 6]
arr.select { |x| x.even? } # => [2]
```


---


### Basic loops

#### FOR loop
```ruby
for i in 0..4
    puts i
end
```

#### EACH loop
```ruby
arr.each do |item|
    puts item
end
```

#### TIMES loop
```ruby
5.times do |item|
    print item, " "
end
# 0 1 2 3 4
```

#### EACH_WITH_INDEX loop
```rb
two_d_array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

two_d_array.each_with_index do |sub_array, row_index|
  sub_array.each_with_index do |element, col_index|
    puts "Element at [#{row_index}, #{col_index}]: #{element}"
  end
end
```

#### WHILE loop
```ruby
i = 0
while i < 5
    puts i
    i += 1
end
```

---

# How-To

### String tricks
```ruby
str = "string"

new_string = str << "word"

other_string = str.concat("word")

some_string = str + "word"

new_string += "word"

# Interpolation
"Hello, #{name}!"
```



### Accept and pass an arg
```ruby
input=ARGV[0]
function_name(input)
```


### Check if variable is defined
```ruby
apple = 1
defined?(apple)
# "local-variable"

defined?("apple")
# "local-variable"

# also checks methods
defined?(puts)
# "method"
```



### Exception handling

```ruby
begin
    # risky code

rescue StandardError => e
    puts "Error: #{e.message}"
end
```




```ruby

```



```ruby

```