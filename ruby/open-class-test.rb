class Fixnum
	def foo
		self.times {puts "foo"}
	end

	def even?
		(self.remainder 2)==0
	end
end

3.foo

5.times {|i| puts "#{i} is even" if i.even?}