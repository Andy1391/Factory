class Factory
	def self.new *variables, &block
		instance_class = Class.new do

			attr_accessor *variables

			define_method :initialize do |*values|

				if values.length > variables.length
					raise ArgumentError
				end

				values.each_with_index do |value, arg|
					instance_variable_set("@#{variables[arg]}", value)
				end
			end

			def iv_set
				instance_variable_set("@#{variables[arg]}", value)
			end
			
			define_method :[] do |arg|
				if arg.instance_of? Integer
					instance_variable_get("@#{variables[arg]}")
				else
					instance_variable_get("@#{arg}")
				end
			end

			define_method :[]= do |arg, value|
				if arg.instance_of? Integer
					iv_set
				else
					instance_variable_set("@#{arg}", value)
				end
			end

			define_method :== do |other|
				return false unless self.class == other.class 
					variables.each do |var| 
				return false unless instance_variable_get("@#{var}") == other.instance_variable_get("@#{var}")
					end
				return true
			end   

			class_eval(&block) if block_given?


		end		
	end
end
# --------------------------------------------------

