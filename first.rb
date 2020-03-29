# Hello World

puts "Hello World"


# Comments

=begin

Block comments

=end


## Number

#Type
i = 0
puts i.class #Integer
f = 0.1
puts f.class #Float

# Before and after incrementation
i = 0
puts "before incrementation i=#{i}" #before incrementation i=0
i += 1
puts "after incrementation i=#{i}" #after incrementation i=1

# equation
i = 5
puts "5x5 = #{i*5}" # 5x5=25


## String

# escape sign
hoge = "Hello\nWorld"
puts hoge   #Hello
            #World

# Shell commands
puts `pwd` #/Users/makotonakai/Introduction_to_Ruby

# Regular expression
puts /\d{3}-\d{4}/ =~ "Postal code:192-0041" # 12

if /(\d{3}-\d{4})/ =~ "Postal code:192-0041" # 192-0041, if not nil
    puts $1
end

# a fragment of a string
s = "sos"
puts s[1] # o

# Change in a string
s = "SOS"
s[1] = "N"
puts s # SNS

# Slicing
str = "hoge"
p str[0,1] #"h"
p str[0,2] #"ho"

# Addition
puts "Hello" + "World" #HelloWorld

# Repeat
puts "No!" * 3  #No!No!No!

# Split
p "a,b,c,d".split(/,/) #["a", "b", "c", "d"]

# Comparison

"abc" == "abc"  # true

"a" < "b"       # true

"a" > "b"       # false


# Properties

"abc".length # 3

"abc".class # String

"".empty?   # true

"5".to_i    # 5

"5".to_i.class # Fixnum

"abcdefg".index("c") # 2

"box".gsub(/[a-z]{2}(x)/) do
    "Fi#{$1}"
end                 # Fix

" ab c ".strip      # "ab c"


## Symbol
str1 = "a"
str2 = "a"

p str1 == str2      # true
p str1.equal? str2   # false (違うオブジェクトだから）

p str1.object_id    # 60
p str2.object_id    # 80

sym1 = :a
sym2 = :a
p sym1.equal? sym2  # true


## Array

arr = ['a','b','c']
p arr               #['a','b','c']

arr1 = [5,'abc',{'key' => 'value'}]
p arr1               #[5,'abc',{'key' => 'value'}]

# multiple demension

wey = [1, 2, 3]
hey = [wey, wey, wey]
p hey                #[[1, 2, 3], [1, 2, 3], [1, 2, 3]]

# Index
p arr[2]             # "c"

p arr[-1]            # "c"

p arr[1,2]           #["b", "c"]

p arr[1..2]          #["b", "c"]

newArr = arr[1..2]
newArr[0] = "d"
p newArr             #["d", "c"]

# Other properties

arr = [5,4,3,2,2,1]

p arr.length          # 6

p arr.size            # 6

p arr.include? 3      # true

p arr.sort            # [1, 2, 2, 3, 4, 5]

p arr.uniq            # [5, 4, 3, 2, 1]

a = arr.shift
p a                   # 5

a = arr.pop
p a                   # 1

arr.push("hoge")
p arr                 # [4, 3, 2, 2, "hoge"]


## Hash

user = {name: "chrowa3", age:16}
p user                 # {:name=>"chrowa3", :age=>16}
p user[:name]          # "chrowa3"

user[:name] = "Peropero"
p user                 # {:name=>"Peropero", :age=>16}

user[:blood] = :b
p user                 # {:name=>"Peropero", :age=>16, :blood=>:b}


# Properties

p user.size             # 3

p user.keys             # [:name, :age, :blood]

p user.values           # ["Peropero", 16, :b]

p user.key?(:job)       # false

user.delete("age")
p user                  # {:name=>"Peropero", :age=>16, :blood=>:b}

user.clear
p user                  # {}


## Conditional statement

num = 2

if num > 1 then
    p "num is bigger than 1"  # "num is bigger than 1"
    
elsif num == 1 then
    p "num is 1"
    
else 
    p "num is smaller than 1"
    
end



## Iteration

# infinite loop
# loop do 
#     p "hoge"
# end

# times
# 3.times do |i|
#     p "hoge" + i.to_s
# end

# "hoge0"
# "hoge1"
# "hoge2"

# Specifying the object

# 3.upto(5) do |i|
#     p i
# end

# 3
# 4
# 5

# break

# i = 0
# loop do
#     i += 1
#     p i
#     if i == 5 then
#         break
#     end
# end
# p "complete!"

# 1
# 2
# 3
# 4
# 5
# "complete!"

# error handling

# begin 
#     p "in begin"
#     raise
# rescue
#     p "in rescue"
# ensure
#     p "in ensure"
# end
# 
# p "end"

# "in begin"
# "in rescue"
# "in ensure"
# "end"


# error handling 2

# begin
#     p "in begin"
#     raise Exception, "raise Exception,"
# rescue Exception => e
#     p "in rescue"
#     p e.message
# ensure
#     p "in ensure"
# end
# p "end"

# "in begin"
# "in rescue"
# "raise Exception,"
# "in ensure"
# "end"


## function

def func
    p "Makoto is called Dave"
end

# argument

def func name
    p " Makoto is called " + name
end
    
# func "Makochan"                # " Makoto is called Makochan"

def func age,name
    p "I'm " + name + ", " + "%d"%age + " years old."
end

# func 21,"Makoto"              # "I'm Makoto, 21 years old."


## Class

# class Car
#     def run
#         p "run"
#     end
# end


# static method

# class Car
#     def self.run
#         p "Run"
#     end
# end


# Constructer

# class Car
#     
#     def initialize carName
#         @carName = carName
#     end
#     
#     def self.run
#         p "Run"
#     end
#     
#     def getCarName
#         @carname
#     end
#     
# end


# Instance variable

# class Car
# 
#     def initialize carName
#         @carName = carName
#     end
#     
#     def self.run
#         p "Run"
#     end
#     
#     def carName
#         @carName
#     end
#     
#     def carName=(name)
#         @carName = name
#     end
#     
# end


# Accessor

# class Car
#     
#     attr_accessor :carName
#     
#     def initialize(carName)
#         @carName = carName
#     end
#     
#     def self.run
#         p "Run"
#     end
#     
# end

# Class variable

class Car

    attr_accessor :carName, :carNumber
    
    def initialize(carName, carNumber)
        @carName = carName
        @carNumber = carNumber
    end
    
    def self.run
        p "Run"
    end
    
    def getName
        return @carName
    end
    
    def getNumber
        return @carNumber
    end
    
end

myCar = Car.new('Benz', '8888')                                # "Run"
p myCar.getName                 # Benz
p myCar.getNumber               # "8888"


# Superclass

class Vehicle

    attr_reader :otherName
    
    def initialize otherName
    
        @otherName = otherName
        
    end
    
end


class Car2 < Vehicle

    attr_reader :carName
    
    def initialize carName, otherName
        super otherName
        @carName = carName
    end
    
    def run
        p "Run"
    end
    
end

myCar = Car2.new "Benz", "myBenz"
p myCar.carName
myCar.run
