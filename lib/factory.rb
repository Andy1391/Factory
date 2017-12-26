class Factory

  def self.new *variables, &block

    class_name = if variables.first.is_a? String
      unless variables.first.match(/^[A-Z]/)
        raise(NameError, "#{variables.first} it must be a constant")
      end
      variables.shift
    end

    example_class = Class.new do

    attr_accessor *variables

      define_method :initialize do |*values|
        if values.length > variables.length
        raise ArgumentError
        end
        values.each_with_index do |value, arg|
        instance_variable_set("@#{variables[arg]}", value)
        end
      end

      define_method :[] do |arg|
        if arg.is_a? Numeric
        raise IndexError unless instance_variables[arg]
        instance_variable_get("@#{variables[arg]}")
        else
        raise NameError unless instance_variable_get("@#{arg}")
        instance_variable_get("@#{arg}")
        end
      end

      define_method :[]= do |arg, value|
        if arg.instance_of? Integer
        raise IndexError unless instance_variables[arg]
        instance_variable_set("@#{variables[arg]}", value)
        else
        raise NameError unless instance_variable_get("@#{arg}")
        instance_variable_set("@#{arg}", value)
        end
      end      

      define_method :== do |other|
        return false unless self.class == other.class 
        variables.map do |arg| 
        return false unless instance_variable_get("@#{arg}") == other.instance_variable_get("@#{arg}")
        end
        return true
      end   

      define_method :members do
        variables
      end

      define_method :each do |&block|
        values.each(&block)
      end

      define_method :each_pair do |&block|
        to_h.each_pair(&block)
      end

      define_method :values do
        members.map { |arg| instance_variable_get("@#{arg}") }
      end     

      define_method :values_at do |*arg|
        arg.map do |i|
        raise IndexError unless instance_variables[i]
        to_a[i]
        end
      end

      define_method :dig do |*key|
        to_h.dig(*key)
      end

       define_method :to_h do
        hash = Hash.new
        variables.each_index do |i|
        hash[:"#{variables[i]}"] = instance_variable_get("@#{variables[i]}")
        end
        hash
      end

      define_method :length do
        members.length
      end 

      define_method :select do |&block|
        to_a.select(&block)
      end

      alias_method :size, :length
      alias_method :to_a, :values

      class_eval(&block) if block_given?  
    end 
    class_name ? const_set(class_name, example_class) : example_class      
  end
end
# --------------------------------------------------

