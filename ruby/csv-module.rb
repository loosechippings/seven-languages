module ActsAsCsv

	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods

		def read
			@csv_contents=[]
			filename=self.class.to_s.downcase+'.csv'
			file=File.new(filename)
			@headers=file.gets.chomp.split(',')

			file.each do |row|
				@csv_contents << row.chomp.split(',')
			end
		end

		def each
			@csv_contents.each {|row| yield row}
		end

		attr_accessor :headers, :csv_contents

		def initialize
			read
		end

	end

end

class RubyCsv
	include ActsAsCsv
	acts_as_csv
end

r=RubyCsv.new

r.each {|row| puts row.inspect}