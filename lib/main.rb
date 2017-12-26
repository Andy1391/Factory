require_relative 'factory'

# User = Factory.new :name, :age do
# 	public
# 	def say
# 		puts "Hi all, I am #{self.name}"
# 	 end
# end

# user = User.new "Den", "15"
# otherUser = User.new "Den", "15"
# puts user
# puts user.name
# puts user.age


# Customer = Factory.new(:name, :address) do
# 	def greeting
# 		"Hello #{name}!"
# 	end
# end

# customer = Customer.new "Den", "15"
# puts customer
# puts customer.greeting

# puts user == otherUser ? 'equal' : 'not equal' 
# puts user == customer ? 'equal' : 'not equal' 


# Factory.new('Customer', :name, :address)

# customer = Factory::Customer.new('Dave', '123 Main')

# puts customer.greeting
# puts customer.methods.grep(/greeting/)

# Customer = Factory.new(:name, :address, :zip)
# joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
# joe.each {|x| puts(x) }

# Lots = Struct.new(:a, :b, :c, :d, :e, :f)
# l = Lots.new(11, 22, 33, 44, 55, 66)
# l.select {|v| (v % 2).zero? }

# puts l   

Customer = Struct.new(:name, :address, :zip)
joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)

# joe["name"] 
# puts joe
# joe[:name]
