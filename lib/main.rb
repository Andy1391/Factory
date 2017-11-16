require_relative 'factory'

User = Factory.new :name, :age do
	public
	def say
		puts "Hi all, I am #{self.name}"
	 end
end

user = User.new "Den", "15"
otherUser = User.new "Den", "15"
puts user
puts user.name
puts user.age


Customer = Factory.new(:name, :address) do
	def greeting
		"Hello #{name}!"
	end
end

customer = Customer.new "Den", "15"
puts customer
puts customer.greeting

puts user == otherUser ? 'equal' : 'not equal' 
puts user == customer ? 'equal' : 'not equal' 


Factory.new('Customer', :name, :address)

customer = Factory::Customer.new('Dave', '123 Main')

puts customer.greeting
puts customer.methods.grep(/greeting/)